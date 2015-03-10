using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DAWaybill : DAMASTER<ENWaybill>
    {
        #region SQL Methods

        public IEnumerable<ENWaybill> GetAll()
        {
            string sql = "procSelectBooks";
            return this.SelectAll(sql);
        }

        public ENWaybill GetById(string call)
        {
            string sql = "sprocSelectBook";
            return this.Select(sql, call);
        }

        public int AddBook(ENWaybill info)
        {
            return this.ExecuteQuery("sprocAddBook", info);
        }

        public int EditBook(ENWaybill info)
        {
            return this.ExecuteQuery("sprocEditBook", info);
        }

        #endregion        
    }
}