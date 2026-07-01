using Grocery.Filters;
using Grocery.DAL;
using Grocery.Models;
using Grocery.Repository;
using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace  Grocery.Controllers
{
    [AuthorizeUser(Roles = "Admin,SuperAdmin")]
    public class MasterController : Controller
    {
        #region Other Class references ...
        // Instance on Unit of Work
        private GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        #endregion


        /// <summary>
        /// Categories
        /// </summary>
        /// <returns></returns>
        #region Manage Categories ...
        public ActionResult Cities()
        {
            var allCities = _unitOfWork.GetRepositoryInstance<Tbl_City>()
                .GetAllRecordsIQueryable().Include(x=>x.Tbl_State)
                .Where(i => i.IsDelete == false)
                .Select(c => new CityViewModel
                {
                    CityId = c.CityId,
                    StateId = c.StateId,
                    CityName = c.CityName,
                    IsActive = c.IsActive,
                    IsDelete = c.IsDelete,
                    CreatedDate = c.CreatedDate,
                    StateName = c.Tbl_State.StateName,
                })
                .ToList();

            return View(allCities);
        }


        /// <summary>
        /// Add Category
        /// </summary>
        /// <returns></returns>
        public ActionResult AddCity()
        {
            return UpdateCity(0);
        }

        /// <summary>
        /// Update Category
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public ActionResult UpdateCity(int cityId)
        {
            var states = _unitOfWork
           .GetRepositoryInstance<Tbl_State>()
           .GetAllRecordsIQueryable()
           .Where(x => x.IsActive && !x.IsDelete)
           .Select(x => new SelectListItem
           {
               Value = x.StateId.ToString(),
               Text = x.StateName
           })
           .ToList();
            var countries = _unitOfWork
           .GetRepositoryInstance<Tbl_Country>()
           .GetAllRecordsIQueryable()
           .Where(x => x.IsActive && !x.IsDelete)
           .Select(x => new SelectListItem
           {
               Value = x.CountryId.ToString(),
               Text = x.CountryName
           })
           .ToList();
            CityViewModel cd;
            if (cityId != 0)
            {
                var category = _unitOfWork
                    .GetRepositoryInstance<Grocery.DAL.Tbl_City>()
                    .GetFirstOrDefault(cityId);

                cd = new CityViewModel
                {
                    CityId = category.CityId,
                    CityName = category.CityName,
                    StateId = category.StateId,
                    IsActive = category.IsActive,
                    States = states,
                    Countries = countries
                };
            }
            else
            {
                cd = new CityViewModel
                {
                    States = states,
                    Countries = countries
                };
            }

            return View("UpdateCity", cd);
        }


        /// <summary>
        /// Update Category
        /// </summary>
        /// <param name="cd"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateCity(CityViewModel cd)
        {
            if (ModelState.IsValid)
            {
                // Fetch existing city
                Tbl_City city = _unitOfWork
                    .GetRepositoryInstance<Tbl_City>()
                    .GetFirstOrDefault(cd.CityId);
                // If not found, create new
                if (city == null)
                {
                    city = new Tbl_City
                    {
                        CreatedDate = DateTime.Now,
                        IsActive = true,
                        IsDelete = false,
                    };
                }

                // Update fields
                city.CityName = cd.CityName;
                city.StateId = cd.StateId;
                city.IsActive = cd.IsActive;
                city.IsDelete = cd.IsDelete;
                if (city.CityId==0)
                {
                    _unitOfWork.GetRepositoryInstance<Tbl_City>().Add(city);
                }
                else
                {
                    _unitOfWork.GetRepositoryInstance<Tbl_City>().Update(city);
                }
                // Save changes
                _unitOfWork.SaveChanges();

                return RedirectToAction("Cities");
            }

            // If validation fails, return to view
            return View("UpdateCity", cd);
        }

        #endregion


        #region Disposing UnitOfWork Context ...
        protected override void Dispose(bool disposing)
        {
            _unitOfWork.Dispose();
            base.Dispose(disposing);
        }
        #endregion
    }
}
