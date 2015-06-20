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
        
    }
    private void BindOrders(string name, GridView gvOrders)
    {
        //Label l1 = e.Row.FindControl("lbluname") as Label;
        name = Convert.ToString(Session["id"]);
        gvOrders.ToolTip = name;
        ModalPopupExtender1.Show();
        gvOrders.DataSource = GetData(string.Format("select * from Lists where username='{0}'", name));
        gvOrders.DataBind();
    }
    protected void gvviewlists_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView gvOrders = (sender as GridView);
        gvOrders.PageIndex = e.NewPageIndex;
        BindOrders(gvOrders.ToolTip, gvOrders);
        
    }
    private static DataTable GetData(string query)
    {
        //string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(constr))
        //{
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = query;
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = sqlConnection;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }
    protected void pandetails(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        Session["id"] = id;
        string qry = "select * from lists where username=" + id;
        SqlCommand cmd = new SqlCommand(qry, sqlConnection);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        gvviewlists.DataSource = ds;
        gvviewlists.DataBind();
        ModalPopupExtender1.Show();
    }
}
