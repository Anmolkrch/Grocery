using Grocery.Filters;
using Grocery.Models;
using Grocery.Repository;
using Grocery.Services;
using Grocery.Utility;
using System;
using System.Web.Mvc;
namespace  Grocery.Controllers
{
    [FrontPageActionFilter]
    public class SearchController : Controller
    {
        #region Other Class references ...
        // Instance on Unit of Work
        private GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        UploadContent uc = new UploadContent();
        private readonly HomeService _homeService;
        public SearchController()
        {
            _homeService = new HomeService(new GenericUnitOfWork());
        }
        private int _memberId;
        public int memberId
        {
            get { return Convert.ToInt32(Session["MemberId"]); }
            set { _memberId = Convert.ToInt32(Session["MemberId"]); }
        }
        #endregion  
        /// <summary>
        /// Search Result Page
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public ActionResult Index(string searchKey = "")
        {
            ViewBag.searchKey = searchKey;
            HomeProductViewModel homeProductViewModel = new HomeProductViewModel();
            homeProductViewModel.searchResultViewModels = _homeService.GetSearchResult(searchKey);
            ViewBag.CategoryList = _homeService.GetActiveCategories();
            return View(homeProductViewModel);
        }

        /// <summary>
        /// Product Detail
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public ActionResult ProductDetail(int pId)
        {
            HomeProductViewModel homeProductViewModel = new HomeProductViewModel();
            homeProductViewModel = _homeService.GetSimilarProduct(pId);
            ViewBag.SimilarProducts = homeProductViewModel.ProductList;
            ViewBag.CategoryList = _homeService.GetActiveCategories();
            return View(homeProductViewModel);
        }
        
    }
}