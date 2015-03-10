using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DAServices : DAMASTER<ENServices>
    {
        #region SQL Methods

        public IEnumerable<ENServices> GetAll()
        {
            string sql = "sprocSelectServices";
            return this.SelectAll(sql);
        }

        public ENServices GetById(int call)
        {
            string sql = "sprocSelectService";
            return this.Select(sql, call);
        }

        public int AddService(ENServices info)
        {
            return this.ExecuteQuery("sprocInsertService", info);
        }

        public int EditService(ENServices info)
        {
            return this.ExecuteQuery("sprocEditService", info);
        }

        public int DeleteService(int ServiceID)
        {
            return this.ExecuteQuery("sprocDeleteService", ServiceID);
        }

        #endregion
    }
}