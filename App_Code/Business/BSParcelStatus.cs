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
    public class BSParcelStatus : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENParcelStatus> Load()
        {
            DAParcelStatus daccess = new DAParcelStatus();
            return daccess.GetAll();
        }

        public ENParcelStatus LoadById(int Loc_ID)
        {
            DAParcelStatus daccess = new DAParcelStatus();
            return daccess.GetById(Loc_ID);
        }

        protected override int enAdd(ENMASTER info)
        {
            DAParcelStatus daccess = new DAParcelStatus();
            return  daccess.Add((ENParcelStatus)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DAParcelStatus daccess = new DAParcelStatus();
            return daccess.Edit((ENParcelStatus)info);
        }
        protected override int enDelete(object snay)
        {
            return 0;
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