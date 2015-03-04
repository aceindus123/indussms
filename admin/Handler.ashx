<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {

    
    public void ProcessRequest (HttpContext context) {
        string imageid = context.Request.QueryString["ImID"];
        System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand("select data from sendernm where sid=" + imageid, connection);
        System.Data.SqlClient.SqlDataReader dr = command.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((Byte[])dr[0]);
        connection.Close();
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}