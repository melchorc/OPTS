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
    public class BSShipmentStatus : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENShipmentStatus> Load()
        {
            DAShipmentStatus daccess = new DAShipmentStatus();
            return daccess.GetAll();
        }

        public ENShipmentStatus LoadById(int Loc_ID)
        {
            DAShipmentStatus daccess = new DAShipmentStatus();
            return daccess.GetById(Loc_ID);
        }

        protected override int enAdd(ENMASTER info)
        {
            DAShipmentStatus daccess = new DAShipmentStatus();
            return daccess.Add((ENShipmentStatus)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DAShipmentStatus daccess = new DAShipmentStatus();
            return daccess.Edit((ENShipmentStatus)info);
        }

        protected override int enDelete(Object ob)
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