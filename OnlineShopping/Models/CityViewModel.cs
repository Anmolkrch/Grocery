using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShopping.Models
{
    public class CityViewModel
    {
        public int CityId { get; set; }

        public int StateId { get; set; }
        public string StateName { get; set; }

        public string CityName { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public System.DateTime CreatedDate { get; set; }

        public IEnumerable<SelectListItem> Countries { get; set; }
        public IEnumerable<SelectListItem> States { get; set; }

    }
    public class StateViewModel
    {


        public int StateId { get; set; }

        public int CountryId { get; set; }

        public string StateName { get; set; }

        public string StateCode { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public System.DateTime CreatedDate { get; set; }

        public IEnumerable<SelectListItem> Countries { get; set; }
    }
    public class CountryViewModel
    {
        public int CountryId { get; set; }

        public string CountryName { get; set; }

        public string CountryCode { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public System.DateTime CreatedDate { get; set; }
    }

}