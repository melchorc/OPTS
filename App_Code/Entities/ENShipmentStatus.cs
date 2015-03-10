using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ENParcelStatus
/// </summary>
namespace Four.Entity
{
    public class ENShipmentStatus : ENMASTER
    {
        public ENShipmentStatus() { }

        #region Properties

        public int ShipmentStatus_ID
        {
            get;
            set;
        }

        public string ShipmentStatus_Desc
        {
            get;
            set;
        }
        #endregion
    }
}