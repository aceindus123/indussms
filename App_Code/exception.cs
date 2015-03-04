using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for exception
/// </summary>
public class exception
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlTransaction myTrans;
    DataSet ds;
	public exception()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void insert_exception(Exception ex, string excep_page)
    {
        string excep1 = ex.StackTrace.ToString();
        string line = excep1.Substring(excep1.LastIndexOf("line"), (excep1.Length - excep1.LastIndexOf("line")));
        string exception_msg = ex.Message;
        DateTime date = Convert.ToDateTime(System.DateTime.Now.ToString());
        string excep_status = "0";
        SqlCommand cmd = new SqlCommand("spexception", sqlConnection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Excep_desc", exception_msg);
        cmd.Parameters.AddWithValue("@Excep_postdate", date);
        cmd.Parameters.AddWithValue("@Excep_status", excep_status);
        cmd.Parameters.AddWithValue("@Excep_page", excep_page);
        cmd.Parameters.AddWithValue("@Linenumber", line);
        // error err = new error();
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
        //return res;
    }
}