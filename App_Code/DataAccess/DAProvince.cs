using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DAProvince : DAMASTER<ENProvince>
    {
        #region SQL Methods

        public IEnumerable<ENProvince> Provinces()
        {
            return this.SelectAll("sprocSelectProvince");
        }

        public ENProvince Province(string Province)
        {
            return this.Select("sprocSelectProvince", Province);
        }

        public ENProvince ProvinceById(int id)
        {
            return this.Select("sprocSelectProvinceById", id);
        }

        public int ProviceInsert(ENProvince info)
        {
            return this.ExecuteQuery("sprocInsertProvince", info);
        }

        public int ProviceEdit(ENProvince info)
        {
            return this.ExecuteQuery("sprocEditProvince", info);
        }

        public int ProvinceDelete(int ProvinceID)
        {
            return this.ExecuteQuery("sprocDeleteProvince", ProvinceID);
        }
        #endregion        
    }
}