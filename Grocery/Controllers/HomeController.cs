using Grocery.Filters;
using Grocery.Repository;
using Grocery.Services;
using Grocery.Utility;
using System;
using System.Web.Mvc;

namespace  Grocery.Controllers
{
    [FrontPageActionFilter]
    public class HomeController : Controller
    {
        #region Other Class references ...
        // Instance on Unit of Work
        private GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        UploadContent uc = new UploadContent();
        #endregion
        private readonly HomeService _homeService;

        public HomeController()
        {
            // Explicitly specify which constructor to use to resolve ambiguity
            _homeService = new HomeService(_unitOfWork);
        }

        public ActionResult Index()
        {
            int memberId = Convert.ToInt32(Session["MemberId"]);
            var result =_homeService.GetProductAndCategoryList();
            //ViewBag.FeaturedProducts = _homeService.GetFeaturedProducts();
            //ViewBag.CategoryList = _homeService.GetActiveCategories();
            ViewBag.CategoryList = _homeService.GetActiveCategories();
            return View(result);
        }
    }
}