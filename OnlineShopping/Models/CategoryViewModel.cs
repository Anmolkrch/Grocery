using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Models
{
    public class CategoryViewModel
    {
        
        public int CategoryId { get; set; }

        public string CategoryName { get; set; }

        public Nullable<bool> IsActive { get; set; }

        public Nullable<bool> IsDelete { get; set; }

        public string CategoryImage { get; set; }

        public string CategoryDescription { get; set; }

    }
}