using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Indussms;
using Indussms.DataAccessLayer;
using System.IO;
using System.Configuration;

public partial class Notifications : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (DataList1.Items.Count < 0)
            //{
            //    DataList1.Visible = false;
            //    lblmsg.Visible = true;
            //    lblmsg.Text = "No Offers Found.";
            //}
            //else
            {

                binddata();
            }
        }
    }
    protected void binddata()
    {
        string q = "select * from notification where status=1 order by 1 desc";
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        con.Open();
        DataSet ds = new DataSet();
        adp.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        binddata();
    }
}
