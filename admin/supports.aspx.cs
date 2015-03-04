using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_supports : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
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
        SqlDataAdapter da = new SqlDataAdapter("Select * from issue", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvsupports.DataSource = ds;
        gvsupports.DataBind();
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvsupports.PageIndex = e.NewPageIndex;
        gvsupports.DataBind();
        BindData();
    }
}