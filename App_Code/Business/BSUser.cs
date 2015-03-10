using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using Three.DataAccess;
using Four.Entity;

namespace Three.Business
{
    /// <summary>
    /// Summary description for blBook
    /// </summary>
    public class BSUser : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENUser> Employees()
        {
            return new DAUser().Employees();
        }

        public IEnumerable<ENUser> Clients()
        {
            return new DAUser().Clients();
        }

        public IEnumerable<ENUser> UsersByAccessLevel(int AccessLevel)
        {
            return new DAUser().UsersByAccessLevel(AccessLevel);
        }

        public ENUser EmployeeById(string UserName)
        {
            return new DAUser().EmployeeById(UserName);
        }
        public ENUser ClientById(string UserName)
        {
            return new DAUser().ClientById(UserName);
        }

        protected override int enAdd(ENMASTER info)
        {
            DAUser daccess = new DAUser();
            return daccess.InsertUser((ENUser)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DAUser daccess = new DAUser();
            return daccess.EditUser((ENUser)info);
        }

        protected override int enDelete(object key)
        {
            DAUser daccess = new DAUser();
            return daccess.DeleteUser(key.ToString());
        }

        protected override bool validated(ENMASTER info)
        {
            return true;
        }

        protected override bool keyVerify(object key)
        {
            return true;
        }
    }
}

/*
            bool isValid = true;

            isValid &= FormatUtil.TryValidate(startDate, true, FormatType.Date);
            isValid &= FormatUtil.TryValidate(endDate, false, FormatType.Date);
            isValid &= FormatUtil.TryValidate(street, false, FormatType.Street);
            isValid &= FormatUtil.TryValidate(city, false, FormatType.City);
            isValid &= FormatUtil.TryValidate(state, false, FormatType.State);
            isValid &= FormatUtil.TryValidate(zipcode, false, FormatType.ZipCode);
            isValid &= FormatUtil.TryValidate(website, false, FormatType.Url);
            isValid &= FormatUtil.TryValidate(phoneNumber, false, FormatType.PhoneNumber);
            isValid &= FormatUtil.TryValidate(mobileNumber, false, FormatType.MobileNumber);
            isValid &= FormatUtil.TryValidate(faxNumber, false, FormatType.PhoneNumber);

            int result = 0;

            if (isValid == true) 
            {

*/