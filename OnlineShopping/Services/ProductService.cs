using Microsoft.Ajax.Utilities;
using OnlineShopping.DAL;
using OnlineShopping.Models;
using OnlineShopping.Repository;
using OnlineShopping.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShopping.Service
{
    public class ProductService
    {
        private readonly GenericUnitOfWork _unitOfWork;
        UploadContent uc = new UploadContent();
        public ProductService(GenericUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        // Get all products (Admin sees all, Vendor sees own)
        public List<Tbl_Product> GetProducts(int memberId, string roleName)
        {
            if (roleName != "Admin")
            {
                var vendor = _unitOfWork.GetRepositoryInstance<Tbl_Vendors>()
                    .GetAllRecordsIQueryable()
                    .FirstOrDefault(v => v.IsDelete == false && v.MemberId == memberId);

                return _unitOfWork.GetRepositoryInstance<Tbl_Product>()
                    .GetAllRecordsIQueryable()
                    .Where(p => p.IsDelete == false && p.VendorId == vendor.VendorId)
                    .ToList();
            }
            else
            {
                return _unitOfWork.GetRepositoryInstance<Tbl_Product>()
                    .GetAllRecordsIQueryable()
                    .Where(p => p.IsDelete == false)
                    .ToList();
            }
        }

        // Get product by Id
        public ProductDetail GetProductById(int productId)
        {
            ProductDetail pd = _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetListByParameter(i => i.ProductId == productId)
               .Select(j => new ProductDetail
               {
                   CategoryId = j.CategoryId,
                   Description = j.Description,
                   IsActive = j.IsActive ?? default(bool),
                   Price = j.Price ?? default(decimal),
                   ProductId = j.ProductId,
                   ProductImage = j.ProductImage,
                   ProductName = j.ProductName,
                   IsFeatured = j.IsFeatured ?? default(bool),
                   VendorId = j.VendorId,
                   Pincode = j.Pincode,
                   DiscountPercent = j.DiscountPercent,
                   SellingPrice = j.SellingPrice
               }).FirstOrDefault();
            pd = pd != null ? pd : new ProductDetail();
            pd.Categories = new SelectList(_unitOfWork.GetRepositoryInstance<Tbl_Category>().GetAllRecordsIQueryable(), "CategoryId", "CategoryName");
            return  pd;
        }

        // Add or update product
        public void SaveProduct(Tbl_Product product)
        {
            if (product.ProductId == 0)
            {
                product.CreatedDate = DateTime.Now;
                product.IsDelete = false;
                _unitOfWork.GetRepositoryInstance<Tbl_Product>().Add(product);
            }
            else
            {
                product.ModifiedDate = DateTime.Now;
                _unitOfWork.GetRepositoryInstance<Tbl_Product>().Update(product);
                _unitOfWork.SaveChanges();
            }
        }

        // Check product existence
        public bool CheckProductExist(string productName, int productId)
        {
            return !_unitOfWork.GetRepositoryInstance<Tbl_Product>()
                .GetAllRecordsIQueryable()
                .Any(p => p.ProductName == productName
                       && p.ProductId != productId
                       && p.IsActive == true
                       && p.IsDelete == false);
        }
        public bool UpdateProduct(ProductDetail pd, HttpPostedFileBase _ProductImage, HttpServerUtilityBase Server)
        {
            Tbl_Product prod = _unitOfWork.GetRepositoryInstance<Tbl_Product>().GetFirstOrDefault(pd.ProductId);
            prod = prod != null ? prod : new Tbl_Product();
            prod.CategoryId = pd.CategoryId;
            prod.Description = pd.Description;
            prod.IsActive = pd.IsActive;
            prod.IsFeatured = pd.IsFeatured;
            prod.Price = pd.Price;
            prod.ProductImage = _ProductImage != null ? _ProductImage.FileName : prod.ProductImage;
            prod.ProductName = pd.ProductName;
            prod.SellingPrice = pd.SellingPrice;
            prod.DiscountPercent = pd.DiscountPercent;
            prod.VendorId = pd.VendorId;
            prod.Pincode = pd.Pincode;
            if (prod.ProductId == 0)
            {
                prod.CreatedDate = DateTime.Now;
                prod.IsDelete = false;
                _unitOfWork.GetRepositoryInstance<Tbl_Product>().Add(prod);
            }
            else
            {
                prod.ModifiedDate = DateTime.Now;
                _unitOfWork.GetRepositoryInstance<Tbl_Product>().Update(prod);
                _unitOfWork.SaveChanges();
            }
            if (_ProductImage != null)
                uc.UploadImage(_ProductImage, prod.ProductId + "_", "/Content/ProductImage/", Server, _unitOfWork, 0, prod.ProductId, 0);

            return true;
        }
        public void DeleteProduct(int productId)
        {
            if (productId != 0)
            {
                var product = _unitOfWork.GetRepositoryInstance<Tbl_Product>()
                    .GetAllRecordsIQueryable()
                    .FirstOrDefault(v=> v.ProductId == productId);
                product.IsDelete = true;
                product.ModifiedDate = DateTime.Now;
                _unitOfWork.GetRepositoryInstance<Tbl_Product>().Update(product);
                _unitOfWork.SaveChanges();
            }
            else
            {
                
            }
        }
    }
}
