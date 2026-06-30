using OnlineShopping.DAL;
using OnlineShopping.Filters;
using OnlineShopping.Repository;
using OnlineShopping.Service;
using OnlineShopping.Services;
using OnlineShopping.Utility;
using System;
using System.Linq;
using System.Web.ApplicationServices;
using System.Web.Mvc;

namespace OnlineShopping.Controllers
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
            _homeService = new HomeService(new GenericUnitOfWork());
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