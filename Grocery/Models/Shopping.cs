using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace OnlineShopping.Models
{
    public class ShippingDetails
    {
        public string OrderId { get; set; }

        [Required]
        [Display(Name = "Address")]
        public string Address { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int? CountryId { get; set; }

        [Required]
        [Display(Name = "State")]
        public int? StateId { get; set; }

        [Required]
        [Display(Name = "City")]
        public int? CityId { get; set; }

        [Required]
        [Display(Name = "Zip Code")]
        public string ZipCode { get; set; }

        public decimal TotalPrice { get; set; }

        [Required]
        public string PaymentType { get; set; }

        // Dropdowns
        public IEnumerable<SelectListItem> Countries { get; set; }
        public IEnumerable<SelectListItem> States { get; set; }
        public IEnumerable<SelectListItem> Cities { get; set; }
    }
}