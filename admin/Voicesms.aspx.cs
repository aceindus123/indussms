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

      
    }
     private void BindOrders(string name, GridView gvOrders)
    {
        //Label l1 = e.Row.FindControl("lbluname") as Label;
        name = Convert.ToString(Session["id"]);
        gvOrders.ToolTip = name;
        gvOrders.DataSource = GetData(string.Format("select * from VoiceSms where Username='{0}'", name));
        gvOrders.DataBind();
        ModalPopupExtender1.Show();
         
        
    }
    protected void gvview_PageIndexChanging(object sender, GridViewPageEventArgs e)
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
        string qry = "select * from Voicesms where Username=" + id;
        SqlCommand cmd = new SqlCommand(qry, sqlConnection);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        gvview.DataSource = ds;
        gvview.DataBind();
        ModalPopupExtender1.Show();
    }
}

