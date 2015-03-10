using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DALocation : DAMASTER<ENLocation>
    {
        #region SQL Methods

        public IEnumerable<ENLocation> GetAll(int ProvinceID)
        {
            string sql = "sprocSelectLocations";
            return this.SelectAll(sql, ProvinceID);
        }

        public IEnumerable<ENLocation> SearchBy(string word)
        {
            return this.SelectAll("sprocSearchLocation", word);
        }

        public ENLocation LocationByZipCode(decimal ZipCode)
        {
            return this.Select("sprocLocationByZipCode", ZipCode);
        }

        public ENLocation GetById(int call)
        {
            string sql = "sprocSelectLocation";
            return this.Select(sql, call);
        }

        public int Add(ENLocation info)
        {
            return this.ExecuteQuery("sprocInsertLocation", info);
        }

        public int Edit(ENLocation info)
        {
            return this.ExecuteQuery("sprocEditLocation", info);
        }

        public int Delete(int LocID)
        {
            return this.ExecuteQuery("sprocDeleteLocation",LocID);
        }
        #endregion
    }
}