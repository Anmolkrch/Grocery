using OnlineShopping.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Models
{
    public class CheckoutViewModel
    {
        public List<USP_MemberShoppingCartDetails_Result> CartItems { get; set; }

        public ShippingDetails ShippingDetails { get; set; }
    }
}