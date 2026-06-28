using OnlineShopping.DAL;
using OnlineShopping.Filters;
using OnlineShopping.Models;
using OnlineShopping.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShopping.Content
{
    [AuthorizeUser(Roles = "Admin,SuperAdmin")]
    public class UserController : Controller
    {
        private GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();

        // List all users
        public ActionResult Users()
        {
            var allUsers = _unitOfWork.GetRepositoryInstance<Tbl_Members>()
                .GetAllRecordsIQueryable()
                .Join(_unitOfWork.GetRepositoryInstance<Tbl_MemberRole>().GetAllRecordsIQueryable(),
                      m => m.MemberId,
                      mr => mr.MemberId,
                      (m, mr) => new { m, mr })
                .Join(_unitOfWork.GetRepositoryInstance<Tbl_Roles>().GetAllRecordsIQueryable(),
                      mmr => mmr.mr.RoleId,
                      r => r.RoleId,
                      (mmr, r) => new UserViewModel
                      {
                          MemberId = mmr.m.MemberId,
                          FirstName = mmr.m.FirstName,
                          LastName = mmr.m.LastName,
                          EmailId = mmr.m.EmailId,
                          IsActive = mmr.m.IsActive ?? false,
                          IsDelete = mmr.m.IsDelete ?? false,
                          CreatedOn = mmr.m.CreatedOn,
                          RoleName = r.RoleName
                      })
                .ToList();

            return View(allUsers);
        }

        // Add new user
        public ActionResult AddUser()
        {
            return UpdateUser(0);
        }

        // Update user
        public ActionResult UpdateUser(int memberId)
        {
            var roles = _unitOfWork.GetRepositoryInstance<Tbl_Roles>()
                .GetAllRecordsIQueryable()
                .Select(r => new SelectListItem
                {
                    Value = r.RoleId.ToString(),
                    Text = r.RoleName
                }).ToList();

            UserViewModel uv;
         
            if (memberId != 0)
            {
                var member = _unitOfWork.GetRepositoryInstance<Tbl_Members>().GetFirstOrDefault(memberId);
                var memberRole = _unitOfWork.GetRepositoryInstance<Tbl_MemberRole>()
                                            .GetAllRecordsIQueryable()
                                            .FirstOrDefault(x => x.MemberId == memberId);

                uv = new UserViewModel
                {
                    MemberId = member.MemberId,
                    FirstName = member.FirstName,
                    LastName = member.LastName,
                    EmailId = member.EmailId,
                    IsActive = member.IsActive ?? false,
                    IsDelete = member.IsDelete ?? false,
                    CreatedOn = member.CreatedOn,
                    Roles = roles,
                    RoleName = roles.FirstOrDefault(r => r.Value == memberRole.RoleId.ToString())?.Text,
                    RoleId= memberRole.RoleId.HasValue? memberRole.RoleId.Value :0,
                };
            }
            else
            {
                uv = new UserViewModel
                {
                    Roles = roles
                };
            }

            return View("UpdateUser", uv);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateUser(UserViewModel uv)
        {
            var roles = _unitOfWork.GetRepositoryInstance<Tbl_Roles>()
                .GetAllRecordsIQueryable()
                .Select(r => new SelectListItem
                {
                    Value = r.RoleId.ToString(),
                    Text = r.RoleName
                }).ToList();
            uv.Roles = roles;
            if (ModelState.IsValid)
            {
                var EmailExist = _unitOfWork.GetRepositoryInstance<Tbl_Members>
                    ().GetFirstOrDefaultByParameter(i => i.EmailId == uv.EmailId && i.IsDelete == false);
                if (EmailExist != null)
                {
                    ModelState.AddModelError("EmailId", "Email already exists.");
                    return View(uv);
                }
                Tbl_Members member = _unitOfWork.GetRepositoryInstance<Tbl_Members>().GetFirstOrDefault(uv.MemberId);

                if (member == null)
                {
                    member = new Tbl_Members
                    {
                        CreatedOn = DateTime.Now,
                        IsActive = true,
                        IsDelete = false
                    };
                }

                member.FirstName = uv.FirstName;
                member.LastName = uv.LastName;
                member.EmailId = uv.EmailId;
                member.IsActive = uv.IsActive;
                member.IsDelete = uv.IsDelete;
                member.Pincode = uv.PinCode;
                _unitOfWork.GetRepositoryInstance<Tbl_Members>().Add(member);
                _unitOfWork.SaveChanges();

                // Update role mapping
                var memberRole = _unitOfWork.GetRepositoryInstance<Tbl_MemberRole>()
                                            .GetAllRecordsIQueryable().FirstOrDefault(x => x.MemberId == member.MemberId);
                if (memberRole == null)
                {
                    memberRole = new Tbl_MemberRole
                    {
                        MemberId = member.MemberId,
                        RoleId = int.Parse(uv.Roles.First(r => r.Value == uv.RoleId.ToString()).Value)
                    };
                }
                else
                {
                    memberRole.RoleId = int.Parse(uv.Roles.First(r => r.Value == uv.RoleId.ToString()).Value);
                }

                _unitOfWork.GetRepositoryInstance<Tbl_MemberRole>().Add(memberRole);
                _unitOfWork.SaveChanges();

                return RedirectToAction("Users");
            }

            return View("UpdateUser", uv);
        }
        [HttpPost]
        public ActionResult DeleteUser(int memberId)
        {
            var member = _unitOfWork.GetRepositoryInstance<Tbl_Members>().GetFirstOrDefault(memberId);
            if (member != null)
            {
                // Soft delete
                member.IsDelete = true;
                member.IsActive = false;

                _unitOfWork.SaveChanges();
            }

            return RedirectToAction("Users");
        }

        protected override void Dispose(bool disposing)
        {
            _unitOfWork.Dispose();
            base.Dispose(disposing);
        }
    }

}