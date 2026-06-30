using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Helpers
{
    public class AppEnums
    {
        public enum UserRole
        {
            Admin = 1,
            Vendor = 2,
            User = 3,
            DeliveryPerson = 4
        }

        public enum CartStatus
        {
            Pending = 1,
            Processing = 2,
            Completed = 3,
            Cancelled = 4
        }

        public enum ProductStatus
        {
            Active = 1,
            Inactive = 2,
            Deleted = 3
        }
    }
}