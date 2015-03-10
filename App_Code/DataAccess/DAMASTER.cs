using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.Common;
using System.ComponentModel;
using System.Reflection;


namespace Three.DataAccess
{
    /// <summary>
    /// Summary description for AbstractDb
    /// </summary>
    public abstract class DAMASTER<T> where T : new()
    {
        public DAMASTER() { }

        #region Common Methods

        protected IEnumerable<T> SelectAll(string procedure, params object[] values)
        {
            // set up connection
            DbConnection connection = Factory.CreateConnection();
            connection.ConnectionString = ConnectionSetting.ConnectionString;

            // set up command
            DbCommand command = Factory.CreateCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procedure;

            List<T> list = new List<T>();

            try
            {
                // retrieve data
                connection.Open();

                this.SetCommandParameters(ref command, values);

                // dynamically create instance of T and determine its properties                
                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(new T());

                DbDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    T tmp = new T();

                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        string propertyName = reader.GetName(i);
                        properties[propertyName].SetValue(tmp,
                            (reader.IsDBNull(i) ? null : reader[i]));
                    }
                    list.Add(tmp);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return list;
        }

        /// <summary>
        /// Retrieves a single record of type T
        /// </summary>
        protected T Select(string procedure, params object[] values)
        {
            // set up connection
            DbConnection connection = Factory.CreateConnection();
            connection.ConnectionString = ConnectionSetting.ConnectionString;

            // set up command
            DbCommand command = Factory.CreateCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procedure;

            T obj = new T();

            try
            {
                // retrieve data
                connection.Open();

                this.SetCommandParameters(ref command, values);

                // dynamically create instance of T and determine its properties                
                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(new T());

                DbDataReader reader = command.ExecuteReader(CommandBehavior.SingleRow);

                if (reader.HasRows)
                {
                    reader.Read();

                    // iterate over columns
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        // assume that obj and the result has
                        // same identifier
                        string propertyName = reader.GetName(i);

                        properties[propertyName].SetValue(obj,
                                (reader.IsDBNull(i) ? null : reader[i]));
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return obj;
        }

        /// <summary>
        /// Executes a stored procedure using a data transmission object's
        /// properties. This command is preferred when issuing INSERT and UPDATE
        /// commands.
        /// </summary>
        protected int ExecuteQuery(string procedure, T obj)
        {
            // set up connection
            DbConnection connection = Factory.CreateConnection();
            connection.ConnectionString = ConnectionSetting.ConnectionString;

            // set up command
            DbCommand command = Factory.CreateCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procedure;

            int result = 0;

            try
            {
                connection.Open();

                this.SetCommandParameters(ref command, obj);

                result = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                    throw ex;
            }
            finally
            {
                connection.Close();
            }

            return result;
        }

        /// <summary>
        /// Executes a stored procedure using values as parameters.
        /// The order of the parameters must match the order of the parameters
        /// from the stored procedure or the command may yield unexpected result.
        /// This command is preferred when issuing DELETE procedures which
        /// only requires less parameter compared to INSERT and UPDATE
        /// commands.
        /// </summary>
        protected int ExecuteQuery(string procedure, params object[] values)
        {
            // set up connection
            DbConnection connection = Factory.CreateConnection();
            connection.ConnectionString = ConnectionSetting.ConnectionString;

            // set up command
            DbCommand command = Factory.CreateCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procedure;

            int result = 0;

            try
            {
                connection.Open();

                // retrieve parameters automatically
                this.SetCommandParameters(ref command, values);

                result = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }


            return result;
        }

        private ConnectionStringSettings ConnectionSetting
        {
            get
            {
                return WebConfigurationManager.ConnectionStrings["ApplicationServices"];
            }
        }

        private DbProviderFactory Factory
        {
            get
            {
                string invariantName = ConnectionSetting.ProviderName;

                // Verifies that this provider name is supported
                DataTable providers = DbProviderFactories.GetFactoryClasses();
                DataRow[] foundArray = providers.Select("InvariantName='" + invariantName + "'");

                if (foundArray.Length == 0)
                {
                    string msg = "[AbstractDA] Data Provider " + invariantName + " not found";
                    //DataAccessExceptionHandler.HandleException(msg);
                }

                // Gets appropriate provider factory
                return DbProviderFactories.GetFactory(invariantName);
            }
        }

        #endregion

        #region Helper Methods

        /// <summary>
        /// Retrieve and set the parameters from the stored procedure using 
        /// a data transmission object.
        /// </summary>        
        /// <param name="command"></param>
        /// <param name="obj"></param>
        /// <exception cref="System.InvalidOperationException"></exception>
        /// <exception cref="System.ArgumentException"></exception>
        /// <exception cref="System.NotSupportedException"></exception>
        private void SetCommandParameters(ref DbCommand command, T obj)
        {
            // retrieve parameters
            if (command is System.Data.SqlClient.SqlCommand)
            {
                System.Data.SqlClient.SqlCommandBuilder.DeriveParameters(
                    command as System.Data.SqlClient.SqlCommand);
            }
            //else if (command is System.Data.Odbc.OdbcCommand)
            //{
            //    System.Data.Odbc.OdbcCommandBuilder.DeriveParameters(
            //        command as System.Data.Odbc.OdbcCommand);
            //}
            //else if (command is System.Data.OleDb.OleDbCommand)
            //{
            //    System.Data.OleDb.OleDbCommandBuilder.DeriveParameters(
            //        command as System.Data.OleDb.OleDbCommand);
            //}
            else
            {
                throw new InvalidOperationException("Database Provider not supported");
            }


            // retrieve properties of T
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(obj);

            // set stored procedures parameters
            foreach (DbParameter param in command.Parameters)
            {
                if (param.Direction == ParameterDirection.Input)
                {
                    // assume the property name of T is same
                    // with the procedure's parameter without the @ sign
                    string propertyName = param.ParameterName.Remove(0, 1);

                    // set command parameter values using obj's properties
                    param.Value =
                        (properties[propertyName].GetValue(obj) == null) ?
                        DBNull.Value : properties[propertyName].GetValue(obj);
                }
            }
        }

        /// <summary>
        /// Retrieve and set the parameters from the stored procedure. 
        /// The order of the parameters must match the order of the parameters
        /// from the stored procedure or the query may yield unexpected results.
        /// </summary>        
        /// <param name="command"></param>
        /// <param name="values"></param>
        /// <exception cref="System.InvalidOperationException"></exception>
        /// <exception cref="System.ArgumentException"></exception>
        private void SetCommandParameters(ref DbCommand command, params object[] values)
        {
            // try to retrieve the parameters from the stored procedure  ==== THIS FIRST PART IS NOT NEEDED for Verification
            // by guessing the provider that implemented the this DbCommand
            if (command is System.Data.SqlClient.SqlCommand)
            {
                System.Data.SqlClient.SqlCommandBuilder.DeriveParameters(
                    command as System.Data.SqlClient.SqlCommand);
            }

            //else if (command is System.Data.Odbc.OdbcCommand)
            //{
            //    System.Data.Odbc.OdbcCommandBuilder.DeriveParameters(
            //        command as System.Data.Odbc.OdbcCommand);
            //}
            //else if (command is System.Data.OleDb.OleDbCommand)
            //{
            //    System.Data.OleDb.OleDbCommandBuilder.DeriveParameters(
            //        command as System.Data.OleDb.OleDbCommand);
            //}
            else
            {
                throw new InvalidOperationException("Database Provider not supported");
            }


            // throw an exception if the parameters that were provided doesn't match
            // the parameters on the stored procedure
            if ((command.Parameters.Count - 1) != values.Length)
            {
                throw new ArgumentException("Invalid argument count.");
            }


            int i = 0;
            foreach (DbParameter param in command.Parameters)
            {
                // provide values for the retrieved parameters.
                // ignore parameters if they're for output
                if (param.Direction == ParameterDirection.Input)
                {
                    param.Value = (values[i] == null) ? DBNull.Value : values[i];
                    i++;
                }
            }
        }

        protected DbParameter MakeParameter(string name, object value, DbType paramType)
        {
            DbParameter param = Factory.CreateParameter();
            param.ParameterName = name;
            param.Value = value;
            param.DbType = paramType;
            return param;
        }

        #endregion

    }
}