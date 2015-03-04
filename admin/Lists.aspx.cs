using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Lists : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select DISTINCT[username] from Lists", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvlists.DataSource = ds;
        gvlists.DataBind();
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvlists.PageIndex = e.NewPageIndex;
        gvlists.DataBind();
        BindData();
    }
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string name;
            GridView gv = (GridView)e.Row.FindControl("gvviewlists");
            Label l1 = e.Row.FindControl("lbluname") as Label;
            name = l1.Text;
            SqlDataAdapter da = new SqlDataAdapter("select * from Lists where username='" + name + "'", sqlConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gv.DataSource = ds;
            gv.DataBind();
        }
    }
}