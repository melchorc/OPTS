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
    public class BSWaybill : BSMASTER
    {
        /// <summary>
        /// Loads data from tblBook
        /// </summary>
        public IEnumerable<ENWaybill> Load()
        {
            DAWaybill daccess = new DAWaybill();
            return daccess.GetAll();
        }

        public ENWaybill LoadById(string callNo)
        {
            DAWaybill daccess = new DAWaybill();
            return daccess.GetById(callNo);
        }

        protected override int enAdd(ENMASTER info)
        {
            DAWaybill daccess = new DAWaybill();
            return daccess.AddBook((ENWaybill)info);
        }

        protected override int enEdit(ENMASTER info)
        {
            DAWaybill daccess = new DAWaybill();
            return daccess.EditBook((ENWaybill)info);
        }

        protected override int enDelete(object ID)
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