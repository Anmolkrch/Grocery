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
    public class SearchController : Controller
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
        /// Search Result Page
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public ActionResult Index(string searchKey = "")
        {
            ViewBag.searchKey = searchKey; List<SearchResultViewModel> sr = 
                _unitOfWork.GetRepositoryInstance<SearchResultViewModel>().
                GetResultBySqlProcedure("USP_Search @searchKey", 
                new SqlParameter("searchKey", SqlDbType.VarChar) { Value = searchKey }).ToList();
            return View(sr);
        }

        /// <summary>
        /// Product Detail
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public ActionResult ProductDetail(int pId)
        {
            Tbl_Product pd = _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetFirstOrDefault(pId);
            ViewBag.SimilarProducts = _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetListByParameter(i => i.CategoryId == pd.CategoryId).ToList();
            return View(pd);
        }
        
    }
}