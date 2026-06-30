using Microsoft.Ajax.Utilities;
using OnlineShopping.DAL;
using OnlineShopping.Models;
using OnlineShopping.Repository;
using OnlineShopping.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
namespace OnlineShopping.Services
{
    public class HomeService
    {
        private readonly GenericUnitOfWork _unitOfWork;

        public HomeService(GenericUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Tbl_Product> GetFeaturedProducts()
        {
            return _unitOfWork.GetRepositoryInstance<Tbl_Product>()
                .GetListByParameter(i => i.IsFeatured == true && i.IsDelete == false).ToList();
        }

        public IEnumerable<Tbl_Category> GetActiveCategories()
        {
            return _unitOfWork.GetRepositoryInstance<Tbl_Category>()
                .GetListByParameter(i => i.IsDelete == false && i.IsActive == true).ToList();
        }
        public HomeProductViewModel GetProductAndCategoryList()
        {
            HomeProductViewModel homeProductViewModel = new HomeProductViewModel
            {
                ProductList = GetFeaturedProducts().Select(p => new ProductViewModel
                {
                    ProductId = p.ProductId,
                    ProductName = p.ProductName,
                    Description = p.Description,
                    Price = p.Price,
                    ProductImage = p.ProductImage,
                    SellingPrice=p.SellingPrice,
                    DiscountPercent =p.DiscountPercent
                    
                }).ToList(),
                CategoryList = GetActiveCategories().Select(c => new CategoryViewModel
                {
                    CategoryId = c.CategoryId,
                    CategoryName = c.CategoryName,
                    CategoryDescription = c.CategoryDescription,
                    CategoryImage =c.CategoryImage 
                }).ToList()
            };
            return homeProductViewModel;
        }
        public List<SearchResultViewModel> GetSearchResult(string searchKey)
        {
            List<SearchResultViewModel> sr =
                _unitOfWork.GetRepositoryInstance<SearchResultViewModel>().
                GetResultBySqlProcedure("USP_Search @searchKey",
                new SqlParameter("searchKey", SqlDbType.VarChar) { Value = searchKey }).ToList();
            return  sr;
        }

        public HomeProductViewModel GetSimilarProduct(int Id)
        {
            Tbl_Product pd = _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetFirstOrDefault(Id);
            var result = _unitOfWork.GetRepositoryInstance<Tbl_Product>()
                .GetListByParameter(i => i.CategoryId == pd.CategoryId).ToList();
            // Map to ProductViewModel list
            HomeProductViewModel homeProductViewModel = new HomeProductViewModel();
            ProductViewModel model = new ProductViewModel();
            List<ProductViewModel> productViewModel = result.Select(p => new ProductViewModel
            {
                ProductId = p.ProductId,
                ProductName = p.ProductName,
                CategoryId = p.CategoryId,
                Price = p.Price,
                Description = p.Description,
                IsFeatured = p.IsFeatured,
                ProductImage = p.ProductImage,
                SellingPrice = pd.SellingPrice,
                DiscountPercent = pd.DiscountPercent,
                CategoryName = _unitOfWork.GetRepositoryInstance<Tbl_Category>().GetFirstOrDefault(pd.CategoryId ?? 0)?.CategoryName
                // add other fields from Tbl_Product as needed
            }).ToList();
            if (pd!=null)
            {
                model = new ProductViewModel
                {
                    ProductId = pd.ProductId,
                    ProductName = pd.ProductName,
                    CategoryId = pd.CategoryId ?? 0,
                    SellingPrice = pd.SellingPrice,
                    DiscountPercent = pd.DiscountPercent,
                    Price=pd.Price,
                    Description = pd.Description,
                    ProductImage = pd.ProductImage,
                    IsFeatured = pd.IsFeatured ?? false,
                    CategoryName = _unitOfWork.GetRepositoryInstance<Tbl_Category>().GetFirstOrDefault(pd.CategoryId ?? 0)?.CategoryName
                };
            }
            homeProductViewModel.ProductList = productViewModel;
            homeProductViewModel.Product = model;
            return homeProductViewModel;
        }
    }
}