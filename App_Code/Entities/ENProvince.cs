using System;

namespace Four.Entity
{
    public class ENProvince : ENMASTER
    {
        public ENProvince() { }

        #region Properties

        public int Province_ID
        {
            get;
            set;
        }

        public string Province_Desc
        {
            get;
            set;
        }

        #endregion
    } 
}