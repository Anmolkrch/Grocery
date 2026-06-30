using OnlineShopping.DAL;
using OnlineShopping.Filters;
using OnlineShopping.Models;
using OnlineShopping.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;

namespace OnlineShopping.Controllers
{
    [FrontPageActionFilter]
    [AuthorizeUser]
    public class ShoppingController : Controller
    {
        #region Other Class references ...         
        // Instance on Unit of Work         
        public GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        private int _memberId;
        public int memberId
        {
            get { return Convert.ToInt32(Session["MemberId"]); }
            set { _memberId = Convert.ToInt32(Session["MemberId"]); }
        }
        #endregion

        /// <summary>
        /// Add Product To Cart
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public ActionResult AddProductToCart(int productId)
        {
            Tbl_Cart c = new Tbl_Cart();
            c.AddedOn = DateTime.Now;
            c.CartStatusId = 1;
            c.MemberId = memberId;
            c.ProductId = productId;
            c.UpdatedOn = DateTime.Now;
            _unitOfWork.GetRepositoryInstance<Tbl_Cart>().Add(c);
            _unitOfWork.SaveChanges();
            TempData["ProductAddedToCart"] = "Product added to cart successfully";
            return RedirectToAction("Index", "Search");
        }

        /// <summary>
        /// MyCart
        /// </summary>
        /// <returns>List of cart items</returns>
        public ActionResult MyCart()
        {
            List<USP_MemberShoppingCartDetails_Result> cd = 
                _unitOfWork.GetRepositoryInstance<USP_MemberShoppingCartDetails_Result>()
                .GetResultBySqlProcedure("USP_MemberShoppingCartDetails @memberId",
                new SqlParameter("memberId", System.Data.SqlDbType.Int) { Value = memberId }).ToList();
            return View(cd);
        }

        /// <summary>
        /// Remove Cart Item
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public ActionResult RemoveCartItem(int productId)
        {
            Tbl_Cart c = _unitOfWork.GetRepositoryInstance<Tbl_Cart>().GetFirstOrDefaultByParameter(i => i.ProductId == productId && i.MemberId == memberId && i.CartStatusId == 1);
            c.CartStatusId = 2;
            c.UpdatedOn = DateTime.Now;
            _unitOfWork.GetRepositoryInstance<Tbl_Cart>().Update(c);
            _unitOfWork.SaveChanges();
            return RedirectToAction("MyCart");
        }

        /// <summary>
        /// CheckOut the Cart items
        /// </summary>
        /// <returns></returns>
        public ActionResult CheckOut()
        {
            CheckoutViewModel checkoutViewModel = new CheckoutViewModel();
            List<USP_MemberShoppingCartDetails_Result> cd = _unitOfWork.GetRepositoryInstance<USP_MemberShoppingCartDetails_Result>().GetResultBySqlProcedure("USP_MemberShoppingCartDetails @memberId",
               new SqlParameter("memberId", System.Data.SqlDbType.Int) { Value = memberId }).ToList();
            ViewBag.TotalPrice = cd.Sum(i => i.Price);
            ViewBag.CartIds = string.Join(",", cd.Select(i => i.CartId).ToList());
            checkoutViewModel.ShippingDetails = GetShippingModel();
            checkoutViewModel.CartItems = cd;
            return View(checkoutViewModel);
        }

        /// <summary>
        /// Payment Success
        /// </summary>
        /// <param name="shippingDetails"></param>
        /// <returns></returns>
        public ActionResult PaymentSuccess(ShippingDetails shippingDetails)
        {
            Tbl_ShippingDetails shd = new Tbl_ShippingDetails();
            shd.MemberId = memberId;
            shd.AddressLine = shippingDetails.Address;
            shd.CityId = shippingDetails.CityId;
            shd.StateId = shippingDetails.StateId;
            shd.CountryId = shippingDetails.CountryId;
            shd.ZipCode = shippingDetails.ZipCode;
            shd.OrderId = Guid.NewGuid().ToString();
            shd.AmountPaid = shippingDetails.TotalPrice;
            shd.PaymentType = shippingDetails.PaymentType;
            shd.CreatedDate = DateTime.Now;
            _unitOfWork.GetRepositoryInstance<Tbl_ShippingDetails>().Add(shd);
            _unitOfWork.GetRepositoryInstance<Tbl_Cart>().UpdateByWhereClause(i => i.MemberId == memberId && i.CartStatusId == 1, (j => j.CartStatusId = 3));
            _unitOfWork.SaveChanges();
            if (!string.IsNullOrEmpty(Request["CartIds"]))
            {
                int[] cartIdsToUpdate = Request["CartIds"].Split(',').Select(Int32.Parse).ToArray();
                _unitOfWork.GetRepositoryInstance<Tbl_Cart>().UpdateByWhereClause(i => cartIdsToUpdate.Contains(i.CartId), (j => j.ShippingDetailId = shd.ShippingDetailId));
                _unitOfWork.SaveChanges();

            }
            var data = from sd in _unitOfWork.GetRepositoryInstance<Tbl_ShippingDetails>().GetAllRecordsIQueryable()
                       join c in _unitOfWork.GetRepositoryInstance<Tbl_Country>().GetAllRecordsIQueryable()
                           on sd.CountryId equals c.CountryId
                       join s in _unitOfWork.GetRepositoryInstance<Tbl_State>().GetAllRecordsIQueryable()
                           on sd.StateId equals s.StateId
                       join ct in _unitOfWork.GetRepositoryInstance<Tbl_City>().GetAllRecordsIQueryable()
                           on sd.CityId equals ct.CityId
                       where sd.MemberId == memberId && !sd.IsDelete
                       select new ShippingDetailsViewModel
                       {
                           ShippingDetailId = sd.ShippingDetailId,
                           MemberId = sd.MemberId,
                           AddressLine = sd.AddressLine,
                           AddressLine2 = sd.AddressLine2,
                           Landmark = sd.Landmark,
                           ZipCode = sd.ZipCode,
                           CountryId = sd.CountryId,
                           CountryName = c.CountryName,
                           StateId = sd.StateId,
                           StateName = s.StateName,
                           CityId = sd.CityId,
                           CityName = ct.CityName,
                           PaymentType = sd.PaymentType,
                           AmountPaid = sd.AmountPaid,
                           OrderId = sd.OrderId
                       };
            return View(data.FirstOrDefault());
        }
        private ShippingDetails GetShippingModel()
        {
            ShippingDetails model = new ShippingDetails();

            model.PaymentType = "Cash On Delivery";

            model.Countries = _unitOfWork
                .GetRepositoryInstance<Tbl_Country>()
                .GetAllRecordsIQueryable()
                .Where(x => x.IsActive && !x.IsDelete)
                .Select(x => new SelectListItem
                {
                    Value = x.CountryId.ToString(),
                    Text = x.CountryName
                })
                .ToList();

            model.States = new List<SelectListItem>();
            model.Cities = new List<SelectListItem>();

            return model;
        }
        public JsonResult GetStates(int countryId)
        {
            var states = _unitOfWork.GetRepositoryInstance<Tbl_State>()
                .GetAllRecordsIQueryable()
                .Where(x => x.CountryId == countryId && x.IsActive && !x.IsDelete)
                .Select(x => new
                {
                    x.StateId,
                    x.StateName
                });

            return Json(states, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCities(int stateId)
        {
            var cities = _unitOfWork.GetRepositoryInstance<Tbl_City>()
                .GetAllRecordsIQueryable()
                .Where(x => x.StateId == stateId && x.IsActive && !x.IsDelete)
                .Select(x => new
                {
                    x.CityId,
                    x.CityName
                });

            return Json(cities, JsonRequestBehavior.AllowGet);
        }
    }
}