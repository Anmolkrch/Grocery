using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace  Grocery.Models
{
    public class MemberDetailViewModel
    {
        // Member info
        public int MemberId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string PhoneNumber { get; set; }
        public int Pincode { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }

        // Role info
        public string RoleName { get; set; }

        // Vendor info (nullable if not vendor)
        // Vendor details (nullable)
        public int? VendorId { get; set; }
        public string  CompanyName { get; set; }
        public string GSTNumber { get; set; }
        public string BusinessLicense { get; set; }
        public string Address { get; set; }
        public int? VendorPincode { get; set; }
        public bool? VendorActive { get; set; }
        public DateTime? VendorCreatedOn { get; set; }

    }
}