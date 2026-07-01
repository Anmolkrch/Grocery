using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace  Grocery.Models
{
    public class UserViewModel
    {
        public int MemberId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }

        public Nullable<System.DateTime> CreatedOn { get; set; }
        public int RoleId { get; set; }   // for binding dropdown
        public string RoleName { get; set; } // for display only
        public IEnumerable<SelectListItem> Roles { get; set; }
        public int PinCode { get; set; }
        public string Phone { get; set; }

    }

}