using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ENParcelStatus
/// </summary>
namespace Four.Entity
{
    public class ENParcelStatus : ENMASTER
    {
        public ENParcelStatus() { }

        #region Properties

        public int ParcelStatus_ID
        {
            get;
            set;
        }

        public string ParcelStatus_Desc
        {
            get;
            set;
        }
        #endregion
    }
}