using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DAParcelStatus : DAMASTER<ENParcelStatus>
    {
        #region SQL Methods

        public IEnumerable<ENParcelStatus> GetAll()
        {
            string sql = "sprocSelectParcelStatuses";
            return this.SelectAll(sql);
        }

        public ENParcelStatus GetById(int call)
        {
            string sql = "sprocSelectParcelStatus";
            return this.Select(sql, call);
        }

        public int Add(ENParcelStatus info)
        {
            return this.ExecuteQuery("sprocInsertParcelStatus", info);
        }

        public int Edit(ENParcelStatus info)
        {
            return this.ExecuteQuery("sprocEditParcelStatus", info);
        }
        
        #endregion
    }
}