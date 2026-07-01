using Grocery.Repository;
using System;
using System.Web.Mvc;
using static Grocery.Services.HomeService;

namespace Grocery.Filters
{
    //public class FrontPageActionFilter : FilterAttribute, IActionFilter
    //{
    //    private readonly GenericUnitOfWork _unitOfWork;

    //    public FrontPageActionFilter(GenericUnitOfWork unitOfWork)
    //    {
    //        _unitOfWork = unitOfWork;
    //    }
    //    public void OnActionExecuting(ActionExecutingContext filterContext)
    //    {
    //        dynamic controller;
    //        string controllerName = filterContext.RequestContext.HttpContext.Request.RawUrl.Split('/')[1].ToLower();
    //        switch (controllerName)
    //        {
    //            case "home":
    //                controller = (HomeController)filterContext.Controller;
    //                break;
    //            case "search":
    //                controller = (SearchController)filterContext.Controller;
    //                break;
    //            case "account":
    //                controller = (AccountController)filterContext.Controller;
    //                break;
    //            case "admin":
    //                controller = (AdminController)filterContext.Controller;
    //                break;
    //            case "shopping":
    //                controller = (ShoppingController)filterContext.Controller;
    //                break;
    //            default:
    //                controller = (HomeController)filterContext.Controller;
    //                break;
    //        }

    //        GenericUnitOfWork _unitOfWork = controller._unitOfWork;
    //        filterContext.Controller.ViewBag.CategoryAndSubCategory = _unitOfWork.GetRepositoryInstance<Tbl_Category>().GetAllRecordsIQueryable().ToList();
    //    }

    //    void IActionFilter.OnActionExecuted(ActionExecutedContext filterContext)
    //    {
    //        //  throw new System.NotImplementedException();
    //    }

    public sealed class FrontPageActionFilter : ActionFilterAttribute
    {
        private readonly GenericUnitOfWork _unitOfWork;

        // Parameterless constructor so attribute can be used as [FrontPageActionFilter]
        public FrontPageActionFilter()
            : this(new GenericUnitOfWork())
        {
        }

        // Existing constructor preserved for compatibility
        public FrontPageActionFilter(GenericUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork ?? new GenericUnitOfWork();
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // Minimal, safe placeholder logic.
            // If desired, injection of services or population of ViewBag can be added here
            // using _unitOfWork. Keep behaviour non-breaking.
            try
            {
                // Example: ensure ViewBag keys exist to avoid null reference in views.
                var controller = filterContext.Controller as Controller;
                if (controller != null)
                {
                    //if (controller.ViewBag.FeaturedProducts == null)
                    //{
                    //    controller.ViewBag.FeaturedProducts = null;
                    //}

                    //if (controller.ViewBag.CategoryList == null)
                    //{
                    //    controller.ViewBag.CategoryList = null;
                    //}
                    var categories = CategoryCache.GetCategories(_unitOfWork);
                    controller.ViewBag.CategoryList = categories;
                    base.OnActionExecuting(filterContext);
                }
            }
            catch (Exception)
            {
                // Swallow exceptions to avoid breaking the request pipeline.
            }

            base.OnActionExecuting(filterContext);
        }
    }
}