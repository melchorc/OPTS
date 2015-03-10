using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ENLocation
/// </summary>
namespace Four.Entity
{
    public class ENLocation : ENMASTER
    {
        public ENLocation() { }

        #region Properties

        public int Loc_ID
        {
            get;
            set;
        }

        public string Loc_Desc
        {
            get;
            set;
        }

        public int Loc_Province
        {
            get;
            set;
        }

        public decimal Loc_ZipCode
        {
            get;
            set;
        }
        #endregion
    }
}