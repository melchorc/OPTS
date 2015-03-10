using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DAShipmentStatus : DAMASTER<ENShipmentStatus>
    {
        #region SQL Methods

        public IEnumerable<ENShipmentStatus> GetAll()
        {
            string sql = "sprocSelectShipmentStatuses";
            return this.SelectAll(sql);
        }

        public ENShipmentStatus GetById(int call)
        {
            string sql = "sprocSelectShipmentStatus";
            return this.Select(sql, call);
        }

        public int Add(ENShipmentStatus info)
        {
            return this.ExecuteQuery("sprocInsertShipmentStatus", info);
        }

        public int Edit(ENShipmentStatus info)
        {
            return this.ExecuteQuery("sprocEditShipmentStatus", info);
        }
        
        #endregion
    }
}