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
    public class BSProvince : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENProvince> Provinces()
        {
            return new DAProvince().Provinces();
        }

        public ENProvince Province(string Province)
        {
            return new DAProvince().Province(Province);
        }

        public ENProvince ProvinceByID(int ID)
        {
            return new DAProvince().ProvinceById(ID);
        }
        protected override int enAdd(ENMASTER info)
        {
            DAProvince daccess = new DAProvince();
            return daccess.ProviceInsert((ENProvince)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DAProvince daccess = new DAProvince();
            return daccess.ProviceEdit((ENProvince)info);
        }

        protected override int enDelete(object ProvinceID)
        {

            //validations
            //The Verification will be
            //The System will check the Province ID used in Other Tables
            //If the Province ID is Used on other tables
            //The System will not Allow Deletion of the Province
            DAProvince daccess = new DAProvince();
            return daccess.ProvinceDelete(Convert.ToInt32(ProvinceID));
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