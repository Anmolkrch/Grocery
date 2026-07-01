using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace  Grocery.Models
{
    public class SearchResultViewModel
    {
        public string Description { get; set; }

        public Nullable<decimal> Price { get; set; }

        public int ProductId { get; set; }

        public string ProductImage { get; set; }

        public string ProductName { get; set; }

        public string CategoryName { get; set; }
        public Nullable<decimal> SellingPrice { get; set; }

        public Nullable<decimal> DiscountPercent { get; set; }
    }
}