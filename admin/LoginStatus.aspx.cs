using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_LoginStatus : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        BindData();
    }

    protected void BindData()
    {

        string sqlq = "select id,Uname,ipaddress,Datetime,Logoutdate from Loginreport  order by Datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(sqlq, sqlConnection);
        DataSet ds1 = new DataSet();
        da.Fill(ds1);
        GrdLoginUsers.DataSource = ds1;
        GrdLoginUsers.DataBind();
    }
 
    protected void GrdLoginUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdLoginUsers.PageIndex = e.NewPageIndex;
        GrdLoginUsers.DataBind();
        BindData();
    }
}