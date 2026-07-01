using Grocery.Filters;
using Grocery.DAL;
using Grocery.Models;
using Grocery.Repository;
using Grocery.Services;
using Grocery.Utility;
using System;
using System.IO;
using System.Web.Mvc;

namespace  Grocery.Controllers
{
    [FrontPageActionFilter]
    public class AccountController : Controller
    {
        #region Other class references...
        // Instance on Unit of Work
        public GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();

        #endregion
        private readonly UserService _userService;
        private readonly HomeService _homeService;
        public AccountController()
        {
            _userService = new UserService(new GenericUnitOfWork());
            _homeService = new HomeService(new GenericUnitOfWork());
        }
        #region Member Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult _Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
                return PartialView("_Login", model);

            var member = _userService.Login(model.UserEmailId, model.Password);

            if (member == null)
            {
                ModelState.AddModelError("Password", "Invalid username or password");
                return PartialView("_Login", model);
            }

            if (!member.IsActive)
            {
                ModelState.AddModelError("Password", "Your account is not verified");
                return PartialView("_Login", model);
            }

            // Set session and cookies
            Session["MemberId"] = member.MemberId;
            Response.Cookies["MemberName"].Value = member.FirstName;
            Response.Cookies["MemberRole"].Value = member.RoleName;

            if (model.RememberMe)
            {
                Response.Cookies["RememberMe_UserEmailId"].Value = model.UserEmailId;
                Response.Cookies["RememberMe_Password"].Value = model.Password;
            }
            else
            {
                Response.Cookies["RememberMe_UserEmailId"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["RememberMe_Password"].Expires = DateTime.Now.AddDays(-1);
            }

            // Redirect based on role
            switch (member.RoleName)
            {
                case "Admin":
                    return Redirect(!string.IsNullOrEmpty(returnUrl) ? returnUrl : "/admin/dashboard");

                case "Vendor":
                    Session["VendorId"] = member.VendorId; // vendor-specific session
                    Session["VendorPinCode"] = member.Pincode;
                    return RedirectToAction("dashboard", "vendor");

                case "User":
                    return RedirectToAction("Index", "Home");

                case "DeliveryPerson":
                    return Redirect("/delivery/dashboard");

                default:
                    return Redirect("/");
            }
        }
        #endregion

        #region Member Registration ...         
        [AllowAnonymous]
        public ActionResult Register()
        {
            RegisterViewModel model = new RegisterViewModel();
            model.UserType = 2;
            //ViewBag.CategoryList = _homeService.GetActiveCategories();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Register(RegisterViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {                 // Adding Member                 
                Tbl_Members mem =_userService.Register(model);

                TempData["VerificationLinlMsg"] = "You are registered successfully.";
                Session["MemberId"] = mem.MemberId;
                Response.Cookies["MemberName"].Value = mem.FirstName;
                Response.Cookies["MemberRole"].Value = "User";
                return RedirectToAction("Index", "Home");
            }
            return View("Register", model);
        }


        public JsonResult CheckEmailExist(string UserEmailId)
        {
            int LoginMemberId = Convert.ToInt32(Session["MemberId"]);
            var EmailExist = _unitOfWork.GetRepositoryInstance<Tbl_Members>().GetFirstOrDefaultByParameter(i => i.MemberId != LoginMemberId && i.EmailId == UserEmailId && i.IsDelete == false);
            return EmailExist == null ? Json(true, JsonRequestBehavior.AllowGet) : Json(false, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region Logout ...
        public ActionResult LogOut()
        {
            Session["MemberId"] = null;
            if (Request.Cookies["MemberRole"] != null)
                Response.Cookies["MemberRole"].Expires = DateTime.Now.AddDays(-1);
            return RedirectToAction("Index", "Home");
        }
        #endregion


        #region ForgotPassword ...
        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotPassword(ForgotPasswordViewModel fpm)
        {
            if (_unitOfWork.GetRepositoryInstance<Tbl_Members>().GetFirstOrDefaultByParameter(i => i.EmailId == fpm.EmailId && i.IsActive == true && i.IsDelete == false) != null)
            {
                string body = string.Empty;
                string subject = string.Empty;
                using (var sr = new StreamReader(Server.MapPath("~/EmailTemplates/") + "ForgotPassword.html"))
                {
                    body = sr.ReadToEnd();
                    subject = "Online Shopping : Reset Password";
                }
                body = body.Replace("_ResetPasswordUrl", System.Configuration.ConfigurationManager.AppSettings["ApplicationRootUrl"] + "/Account/ResetPassword?EmailId=" + EncryptDecrypt.Encrypt(fpm.EmailId, true));
                EmailNotification.SendMail(fpm.EmailId, subject, body);
                ViewBag.SendEmailMessage = "Password reset link is sent at your email address. Please check your email";
            }
            else
                ModelState.AddModelError("EmailId", "Email Not Registered");
            return View(fpm);

        }
        #endregion

        #region Reset Password ...
        [HttpGet]
        public ActionResult ResetPassword(string EmailId)
        {
            ResetPasswordViewModel rpm = new ResetPasswordViewModel();
            if (EmailId != null)
            {
                try
                {
                    ModelState.Clear();
                    rpm.EmailId = EncryptDecrypt.Decrypt(EmailId, true);
                }
                catch (Exception e)
                {
                    ModelState.AddModelError("", "Invalid email address");
                }
            }
            else
                ModelState.AddModelError("", "Invalid email address");
            return View(rpm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult ResetPassword(ResetPasswordViewModel rpm)
        {
            var ExistingDetails = _unitOfWork.GetRepositoryInstance<Tbl_Members>().GetFirstOrDefaultByParameter(i => i.EmailId == rpm.EmailId && i.IsActive == true && i.IsDelete == false);
            if (ExistingDetails != null)
            {
                ExistingDetails.Password = EncryptDecrypt.Encrypt(rpm.NewPassword, true);
                ExistingDetails.ModifiedOn = DateTime.UtcNow;
                _unitOfWork.GetRepositoryInstance<Tbl_Members>().Update(ExistingDetails);
                _unitOfWork.SaveChanges();
                ViewBag.PasswordChangeMsg = "Password Changed Successfully";
            }
            else
                ModelState.AddModelError("", "Invalid Email Address");
            return View(rpm);
        }
        #endregion   

        #region Unauthorize View to Page...
        public ActionResult UnauthorizeViewToPage()
        {
            return Redirect("/");
        }
        #endregion
    }
}