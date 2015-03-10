using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ENServices
/// </summary>
namespace Four.Entity
{
    public class ENServices : ENMASTER
    {
        public ENServices() { }

        #region Properties

        public int Service_ID
        {
            get;
            set;
        }

        public string Service_Name
        {
            get;
            set;
        }

        public string Service_Desc
        {
            get;
            set;
        }

        public decimal MinWgt
        {
            get;
            set;
        }

        public decimal MaxWgt
        {
            get;
            set;
        }

        public decimal Price
        {
            get;
            set;
        }

      
        #endregion
    }
}