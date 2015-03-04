using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Voicesms : System.Web.UI.Page
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


    protected void rdhelp1_CheckedChanged(object sender, EventArgs e)
    {
        BindData();
    }

    protected void rdexception_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("Lists.aspx");
    }

    public void BindData()
    {
        SqlDataAdapter da = new SqlDataAdapter("select DISTINCT[Username] from VoiceSms", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvvoice.DataSource = ds;
        gvvoice.DataBind();
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvvoice.PageIndex = e.NewPageIndex;
        gvvoice.DataBind();
        BindData();
    }
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string name;
            GridView gv = (GridView)e.Row.FindControl("gvview");
            Label l1 = e.Row.FindControl("lbluname") as Label;
            name = l1.Text;
            SqlDataAdapter da = new SqlDataAdapter("select * from VoiceSms where Username='" + name + "'", sqlConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gv.DataSource = ds;
            gv.DataBind();
        }
    }
}