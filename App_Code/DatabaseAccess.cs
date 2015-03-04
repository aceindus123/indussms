using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
/// <summary>
/// Summary description for DatabaseAccess
/// </summary>
/// 
namespace Indussms.DataAccessLayer
{
    public sealed class DBOperations
    {

        //private void DBOperations() { }


        private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
        {
            foreach (SqlParameter p in commandParameters)
            {

                if ((p.Direction == ParameterDirection.InputOutput) && (p.Value == null))
                {
                    p.Value = DBNull.Value;
                }

                command.Parameters.Add(p);
            }
        }

        private static void AssignParameterValues(SqlParameter[] commandParameters, object[] parameterValues)
        {
            if ((commandParameters == null) || (parameterValues == null))
            {
                return;
            }

            if (commandParameters.Length != parameterValues.Length)
            {
                    throw new ArgumentException("Parameter count does not match Parameter Value count.");
            }

            for (int i = 0, j = commandParameters.Length; i < j; i++)
            {
                commandParameters[i].Value = parameterValues[i];
            }
        }




        private static void PrepareCommand(SqlCommand command, SqlConnection connection, SqlTransaction transaction, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {

            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }
            command.Connection = connection;
            command.CommandText = commandText;
            if (transaction != null)
            {
                command.Transaction = transaction;
            }
            command.CommandType = commandType;
            if (commandParameters != null)
            {
                AttachParameters(command, commandParameters);
            }
            return;
        }

        private static void PrepareCommand(SqlCommand command, SqlConnection connection, SqlTransaction transaction, CommandType commandType, string commandText, SqlParameter[] commandParameters, out bool mustCloseConnection)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

            // If the provided connection is not open, we will open it
            if (connection.State != ConnectionState.Open)
            {
                mustCloseConnection = true;
                connection.Open();
            }
            else
            {
                mustCloseConnection = false;
            }

            // Associate the connection with the command
            command.Connection = connection;

            // Set the command text (stored procedure name or SQL statement)
            command.CommandText = commandText;

            // If we were provided a transaction, assign it
            if (transaction != null)
            {
                if (transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");
                command.Transaction = transaction;
            }

            // Set the command type
            command.CommandType = commandType;

            // Attach the command parameters if they are provided
            if (commandParameters != null)
            {
                AttachParameters(command, commandParameters);
            }
            return;
        }

        public static int ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                cn.Open();
                return ExecuteNonQuery(cn, commandType, commandText, commandParameters);
            }
        }

        public static int ExecuteNonQuery(string connectionString, string spName, params object[] parameterValues)
        {
            if ((parameterValues != null) && (parameterValues.Length > 0))
            {

                SqlParameter[] commandParameters = SqlHelperParameterCache.GetSpParameterSet(connectionString, spName);
                AssignParameterValues(commandParameters, parameterValues);
                return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, spName, commandParameters);
            }

            else
            {
                return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, spName);
            }
        }

        public static int ExecuteNonQuery(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, connection, (SqlTransaction)null, commandType, commandText, commandParameters);
            int retval = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return retval;
        }

        public static int ExecuteNonQuery(SqlTransaction transaction, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (transaction == null) throw new ArgumentNullException("transaction");
            if (transaction != null && transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");

            // Create a command and prepare it for execution
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, transaction.Connection, transaction, commandType, commandText, commandParameters, out mustCloseConnection);

            // Finally, execute the command
            int retval = cmd.ExecuteNonQuery();

            // Detach the SqlParameters from the command object, so they can be used again
            cmd.Parameters.Clear();
            return retval;
        }

        public static DataSet ExecuteDataset(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                cn.Open();
                return ExecuteDataset(cn, commandType, commandText, commandParameters);
            }
        }

        public static DataSet ExecuteDataset(string connectionString, string spName, params object[] parameterValues)
        {
            if ((parameterValues != null) && (parameterValues.Length > 0))
            {

                SqlParameter[] commandParameters = SqlHelperParameterCache.GetSpParameterSet(connectionString, spName);
                AssignParameterValues(commandParameters, parameterValues);
                return ExecuteDataset(connectionString, CommandType.StoredProcedure, spName, commandParameters);
            }

            else
            {
                return ExecuteDataset(connectionString, CommandType.StoredProcedure, spName);
            }
        }
        public static DataSet ExecuteDataset(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, connection,(SqlTransaction)null, commandType, commandText, commandParameters);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cmd.Parameters.Clear();
            return ds;
        }
        public static object ExecuteScalar(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                cn.Open();

                return ExecuteScalar(cn, commandType, commandText, commandParameters);
            }
        }
        public static object ExecuteScalar(string connectionString, string spName, params object[] parameterValues)
        {
            if ((parameterValues != null) && (parameterValues.Length > 0))
            {
                SqlParameter[] commandParameters = SqlHelperParameterCache.GetSpParameterSet(connectionString, spName);
                AssignParameterValues(commandParameters, parameterValues);
                return ExecuteScalar(connectionString, CommandType.StoredProcedure, spName, commandParameters);
            }
            else
            {
                return ExecuteScalar(connectionString, CommandType.StoredProcedure, spName);
            }
        }
        public static object ExecuteScalar(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, connection, (SqlTransaction)null, commandType, commandText, commandParameters);

            object retval = cmd.ExecuteScalar();

            cmd.Parameters.Clear();
            return retval;
        }
        public DataSet ExcuteQry(String CommandText)
        {
            SqlConnection con =new SqlConnection( ConfigurationManager.AppSettings["ConnectionString"]);
            con.Open();
            SqlCommand cmdObj = new SqlCommand();
            cmdObj.CommandText = CommandText;
            cmdObj.Connection = con;
            SqlDataAdapter daRes = new SqlDataAdapter(cmdObj);
            DataSet dsRes = new DataSet();
            daRes.Fill(dsRes);
            daRes.Dispose();
            cmdObj.Dispose();
            con.Close();
            return (dsRes);
        }

    }
    public sealed class SqlHelperParameterCache
    {
        private SqlHelperParameterCache() { }
        private static Hashtable paramCache = Hashtable.Synchronized(new Hashtable());

        private static SqlParameter[] DiscoverSpParameterSet(string connectionString, string spName, bool includeReturnValueParameter)
        {
            using (SqlConnection cn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(spName, cn))
            {
                cn.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                SqlCommandBuilder.DeriveParameters(cmd);

                if (!includeReturnValueParameter)
                {
                    cmd.Parameters.RemoveAt(0);
                }

                SqlParameter[] discoveredParameters = new SqlParameter[cmd.Parameters.Count];
                cmd.Parameters.CopyTo(discoveredParameters, 0);

                return discoveredParameters;
            }
        }

        private static SqlParameter[] CloneParameters(SqlParameter[] originalParameters)
        {

            SqlParameter[] clonedParameters = new SqlParameter[originalParameters.Length];
            for (int i = 0, j = originalParameters.Length; i < j; i++)
            {
                clonedParameters[i] = (SqlParameter)((ICloneable)originalParameters[i]).Clone();
            }

            return clonedParameters;
        }

        public static void CacheParameterSet(string connectionString, string commandText, params SqlParameter[] commandParameters)
        {
            string hashKey = connectionString + ":" + commandText;
            paramCache[hashKey] = commandParameters;
        }

        public static SqlParameter[] GetCachedParameterSet(string connectionString, string commandText)
        {
            string hashKey = connectionString + ":" + commandText;
            SqlParameter[] cachedParameters = (SqlParameter[])paramCache[hashKey];
            if (cachedParameters == null)
            {
                return null;
            }
            else
            {
                return CloneParameters(cachedParameters);
            }
        }
        public static SqlParameter[] GetSpParameterSet(string connectionString, string spName)
        {
            return GetSpParameterSet(connectionString, spName, false);
        }
        public static SqlParameter[] GetSpParameterSet(string connectionString, string spName, bool includeReturnValueParameter)
        {
            string hashKey = connectionString + ":" + spName + (includeReturnValueParameter ? ":include ReturnValue Parameter" : "");
            SqlParameter[] cachedParameters;
            cachedParameters = (SqlParameter[])paramCache[hashKey];
            if (cachedParameters == null)
            {
                cachedParameters = (SqlParameter[])(paramCache[hashKey] = DiscoverSpParameterSet(connectionString, spName, includeReturnValueParameter));
            }
            return CloneParameters(cachedParameters);
        }

    }
}
