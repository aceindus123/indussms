using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Contactus : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    public void BindData()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from contactus", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvcontact.DataSource = ds;
        gvcontact.DataBind();
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvcontact.PageIndex = e.NewPageIndex;
        gvcontact.DataBind();
        BindData();
    }
}