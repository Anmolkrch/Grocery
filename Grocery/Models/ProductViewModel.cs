using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace  Grocery.Models
{
    public class ProductViewModel
    {

        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public Nullable<int> CategoryId { get; set; }

        public Nullable<bool> IsActive { get; set; }

        public Nullable<bool> IsDelete { get; set; }

        public Nullable<System.DateTime> CreatedDate { get; set; }

        public Nullable<System.DateTime> ModifiedDate { get; set; }

        public string Description { get; set; }

        public string ProductImage { get; set; }

        public Nullable<decimal> Price { get; set; }

        public Nullable<bool> IsFeatured { get; set; }

        public Nullable<int> VendorId { get; set; }

        public Nullable<int> Pincode { get; set; }

        public Nullable<decimal> DiscountPercent { get; set; }

        public Nullable<decimal> SellingPrice { get; set; }
        public string CategoryName { get; set; }

    }
}