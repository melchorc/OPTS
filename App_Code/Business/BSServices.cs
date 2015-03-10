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
    public class BSServices : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENServices> Load()
        {
            DAServices daccess = new DAServices();
            return daccess.GetAll();
        }

        public ENServices LoadById(int Service_ID)
        {
            DAServices daccess = new DAServices();
            return daccess.GetById(Service_ID);
        }

        protected override int enAdd(ENMASTER info)
        {
            DAServices daccess = new DAServices();
            return daccess.AddService((ENServices)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DAServices daccess = new DAServices();
            return daccess.EditService((ENServices)info);
        }
        protected override int enDelete(object ServiceID)
        {
            //This will only validate if the ID is only Valid
            //IF the service Deleted is Used ; System will just Ignore the ServiceID used on other Tables
            DAServices daccess = new DAServices();
            return daccess.DeleteService(Convert.ToInt32(ServiceID));
        }

        protected override bool keyVerify(object key)
        {
            return true;
        }

        protected override bool validated(ENMASTER info)
        {
            return true;
        }
    }
}
