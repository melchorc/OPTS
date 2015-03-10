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
    public class BSLocation : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENLocation> Load(int ProvinceID)
        {
            DALocation daccess = new DALocation();
            return daccess.GetAll(ProvinceID);
        }

        public ENLocation LoadById(int Loc_ID)
        {
            DALocation daccess = new DALocation();
            return daccess.GetById(Loc_ID);
        }

        public IEnumerable<ENLocation> SearchLocation(string searchtxt)
        {
            return new DALocation().SearchBy(searchtxt);
        }

        public ENLocation LocationByZipCode(decimal ZipCode)
        {
            return new DALocation().LocationByZipCode(ZipCode);
        }

        protected override int enAdd(ENMASTER info)
        {
            DALocation daccess = new DALocation();
            return  daccess.Add((ENLocation)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DALocation daccess = new DALocation();
            return daccess.Edit((ENLocation)info);
        }

        protected override int enDelete(object LocationID)
        {
            DALocation daccess = new DALocation();
            return daccess.Delete(Convert.ToInt32(LocationID));
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