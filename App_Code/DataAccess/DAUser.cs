using System;
using System.Collections.Generic;
using Four.Entity;

namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for dlBook
    /// </summary>
    public class DAUser : DAMASTER<ENUser>
    {
        #region SQL Methods

        public IEnumerable<ENUser> Employees()
        {
            return this.SelectAll("sprocSelectEmployees");
        }

        public ENUser EmployeeById(string UserName)
        {
            return this.Select("sprocSelectEmployee", UserName);
        }

        public IEnumerable<ENUser> Clients()
        {
            return this.SelectAll("sprocSelectClients");
        }

        public ENUser ClientById(string UserName)
        {
            return this.Select("sprocSelectClient", UserName);
        }

        public IEnumerable<ENUser> UsersByAccessLevel(int AccessLevel)
        {
            return this.SelectAll("sprocSelectUsers", AccessLevel);
        }

        public int InsertUser(ENUser info)
        {
            return this.ExecuteQuery("sprocInsertUser", info);
        }

        public int EditUser(ENUser info)
        {
            return this.ExecuteQuery("sprocEditUser", info);
        }

        public int DeleteUser(string UserName)
        {
            return this.ExecuteQuery("sprocDeleteUser", UserName);
        }

        #endregion        
    }
}