using OnlineShopping.DAL;
using OnlineShopping.Models;
using OnlineShopping.Repository;
using OnlineShopping.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace OnlineShopping.Services
{
    public class UserService
    {
        private readonly GenericUnitOfWork _unitOfWork;
        UploadContent uc = new UploadContent();
        public UserService(GenericUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public MemberDetailViewModel Login(string email, string password)
        {
            string encryptedPassword = EncryptDecrypt.Encrypt(password, true);
            var parameters = new[]
            {
                new SqlParameter("EmailId", SqlDbType.NVarChar) { Value = email },
                new SqlParameter("Password", SqlDbType.NVarChar) { Value = encryptedPassword }
            };
            return _unitOfWork.GetRepositoryInstance<MemberDetailViewModel>()
           .GetResultBySqlProcedureParams<MemberDetailViewModel>(
           "usp_GetMemberDetailsByEmailPassword @EmailId, @Password", parameters).FirstOrDefault();

        }
        public Tbl_Members Register(RegisterViewModel model)
        {
            // Create member
            Tbl_Members mem = new Tbl_Members
            {
                FirstName = model.FirstName,
                LastName = model.LastName,
                EmailId = model.UserEmailId,
                CreatedOn = DateTime.Now,
                ModifiedOn = DateTime.Now,
                Password = EncryptDecrypt.Encrypt(model.Password, true),
                IsActive = true,
                IsDelete = false,
                Pincode = model.PinCode,
                PhoneNumber = model.Phone
            };

            _unitOfWork.GetRepositoryInstance<Tbl_Members>().Add(mem);

            // Assign default role (User)
            Tbl_MemberRole memRole = new Tbl_MemberRole
            {
                MemberId = mem.MemberId,
                RoleId = 2 // User role
            };
            _unitOfWork.GetRepositoryInstance<Tbl_MemberRole>().Add(memRole);

            return mem;
        }
    }
}