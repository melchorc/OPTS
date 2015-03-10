using System;

namespace Four.Entity
{
    public class ENWaybill : ENMASTER
    {
        public ENWaybill() { }

        #region Properties

        public int WBID
        {
            get;
            set;
        }

        public string ShipLName
        {
            get;
            set;
        }

        public string ShipFName
        {
            get;
            set;
        }

        public string ShipAddress
        {
            get;
            set;
        }

        public string OriginID
        {
            get;
            set;
        }

        public int DesID
        {
            get;
            set;
        }

        public String ParcelDesc
        {
            get;
            set;
        }

        public int SID
        {
            get;
            set;
        }

        public double ParcelDecValue 
        {
            get;
            set;
        }

        public double ParcelTotalWgt
        {
            get;
            set;
        }

        public int ParcelTotalPckg
        {
            get;
            set;
        }

        public double ParcelFreightCharge
        {
            get;
            set;
        }
        public int EmpID
        {
            get;
            set;
        }
        #endregion
    } 
}