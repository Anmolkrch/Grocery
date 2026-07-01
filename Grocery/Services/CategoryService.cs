using Grocery.DAL;
using Grocery.Repository;
using System.Collections.Generic;
using System.Linq;

namespace  Grocery.Service
{
    public class CategoryService
    {
        private readonly GenericUnitOfWork _unitOfWork;

        public CategoryService(GenericUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        // Get all active categories
        public List<Tbl_Category> GetCategories()
        {
            return _unitOfWork.GetRepositoryInstance<Tbl_Category>()
                .GetAllRecordsIQueryable()
                .Where(c => c.IsDelete == false)
                .ToList();
        }

        // Get category by Id
        public Tbl_Category GetCategoryById(int categoryId)
        {
            return _unitOfWork.GetRepositoryInstance<Tbl_Category>()
                .GetFirstOrDefault(categoryId);
        }

        // Save (Add or Update) category
        public void SaveCategory(Tbl_Category category)
        {
            if (category.CategoryId == 0)
            {
                category.IsActive = true;
                category.IsDelete = false;
                _unitOfWork.GetRepositoryInstance<Tbl_Category>().Add(category);
            }
            else
            {
                _unitOfWork.GetRepositoryInstance<Tbl_Category>().Update(category);
                _unitOfWork.SaveChanges();
            }
        }

        // Check if category exists
        public bool CheckCategoryExist(string categoryName, int categoryId)
        {
            return !_unitOfWork.GetRepositoryInstance<Tbl_Category>()
                .GetAllRecordsIQueryable()
                .Any(c => c.CategoryName == categoryName
                       && c.CategoryId != categoryId
                       && c.IsActive == true
                       && c.IsDelete == false);
        }
    }
}
