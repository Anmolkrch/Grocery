using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace  Grocery.Models
{
    public class HomeProductViewModel
    {
        public List<ProductViewModel> ProductList { get; set; }

        public List<CategoryViewModel> CategoryList { get; set; }
        public List<SearchResultViewModel> searchResultViewModels { get; set; }
        public ProductViewModel Product { get; set; }
    }
}