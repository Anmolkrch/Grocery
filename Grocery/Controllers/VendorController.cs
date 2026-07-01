using Grocery.Filters;
using OnlineShopping.DAL;
using OnlineShopping.Helpers;
using OnlineShopping.Models;
using OnlineShopping.Repository;
using OnlineShopping.Service;
using OnlineShopping.Utility;
using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShopping.Controllers
{
    [AuthorizeUser(Roles = "Vendor")]
    public class VendorController : Controller
    {
        #region Other Class references ...
        // Instance on Unit of Work
        private GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        UploadContent uc = new UploadContent();
        #endregion
        private readonly ProductService _productService;

        public VendorController()
        {
            _productService = new ProductService(new GenericUnitOfWork());
        }
        // GET: Vendor
        #region Admin Dashboard ...
        /// <summary>
        /// Admin Dashboard
        /// </summary>
        /// <returns></returns>
        public ActionResult Dashboard()
        {
            return View();
        }
        #endregion
        #region Manage Products...
        #region Product Listing...
        /// <summary>
        /// Product Listing
        /// </summary>
        /// <returns></returns>
        public ActionResult Products()
        {
            int memberId = Convert.ToInt32(Session["MemberId"]);
            string role = Request.Cookies["MemberRole"].Value;
            var products = _productService.GetProducts(memberId, role);
            return View(products);
        }
        #endregion

        #region Add/Update Product...
        /// <summary>
        /// Add Product
        /// </summary>
        /// <returns></returns>
        public ActionResult AddProduct()
        {
            return UpdateProduct(0);
        }

        /// <summary>
        /// Update Product
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public ActionResult UpdateProduct(int productId)
        {
            var products = _productService.GetProductById(productId);
            return View("UpdateProduct", products);
        }

        /// <summary>
        /// Updating Product details to DB
        /// </summary>
        /// <param name="pd"></param>
        /// <param name="_ProductImage"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateProduct(ProductDetail pd, HttpPostedFileBase _ProductImage)
        {
            if (ModelState.IsValid)
            {
                int memberId = Convert.ToInt32(Session["MemberId"]);
                int pinCode = Convert.ToInt32(Session["VendorPinCode"]);
               
                string role = Request.Cookies["MemberRole"].Value;
                AppEnums.UserRole userRole = (AppEnums.UserRole)Enum.Parse(typeof(AppEnums.UserRole), role, true);
                if (userRole == AppEnums.UserRole.Vendor)
                {
                    int vendorId = Convert.ToInt32(Session["VendorId"]);
                    pd.Pincode = pinCode;
                    pd.VendorId = vendorId;
                }
                var products = _productService.UpdateProduct(pd, _ProductImage, Server);
                return RedirectToAction("Products");
            }
            pd.Categories = new SelectList(_unitOfWork.GetRepositoryInstance<Tbl_Category>()
                .GetAllRecordsIQueryable(), "CategoryId", "CategoryName");
            return View("UpdateProduct", pd);
        }

        /// <summary>
        /// Check Product Exist
        /// </summary>
        /// <param name="ProductName"></param>
        /// <returns></returns>
        public JsonResult CheckProductExist(string ProductName)
        {
            int productId = 0;
            if (HttpUtility.ParseQueryString(Request.UrlReferrer.Query)["productId"] != null)
                productId = Convert.ToInt32(HttpUtility.ParseQueryString(Request.UrlReferrer.Query)["productId"]);
            var productExist = _unitOfWork.GetRepositoryInstance<OnlineShopping.DAL.Tbl_Product>()
                .GetAllRecordsIQueryable().Where(i => i.ProductName == ProductName && i.ProductId
                != productId && i.IsActive == true && i.IsDelete == false).Count();

            return productExist == 0 ? Json(true, JsonRequestBehavior.AllowGet) : Json(false, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #endregion

        #region Product Details...
        /// <summary>
        /// Product Detail
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public ActionResult ProductDetail(int productId)
        {
            Tbl_Product pd = _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetFirstOrDefault(productId);
            return View(pd);
        }
        [HttpPost]
        public JsonResult DeleteProduct(int itemId)
        {
            try
            {
                _productService.DeleteProduct(itemId);
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // log exception if needed
                return Json(new { success = false, error = ex.Message });
            }
        }

        #endregion
    }
}