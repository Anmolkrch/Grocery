using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Models
{
    public class ShippingDetailsViewModel
    {
        public int ShippingDetailId { get; set; }

        public int? MemberId { get; set; }

        public string FullName { get; set; }

        public string MobileNo { get; set; }

        public string AddressLine { get; set; }

        public string AddressLine2 { get; set; }

        public string Landmark { get; set; }

        public int? CountryId { get; set; }
        public string CountryName { get; set; }

        public int? StateId { get; set; }
        public string StateName { get; set; }

        public int? CityId { get; set; }
        public string CityName { get; set; }

        public string ZipCode { get; set; }

        public string OrderId { get; set; }

        public decimal? AmountPaid { get; set; }

        public string PaymentType { get; set; }

        public bool IsDefault { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}