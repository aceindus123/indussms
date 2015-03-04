using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Voicereports : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
       // DateTime date = Convert.ToDateTime(System.DateTime.Now.Date.ToString("yyyy-MM-dd"));
        txttodate.Text = Convert.ToString(System.DateTime.Now.Date.ToString("yyyy-MM-dd"));
        txtfromdate.Text = Convert.ToString(System.DateTime.Now.Date.AddMonths(-1).ToString("yyyy-MM-dd"));
        if (Session["User"] != null)
        {
            if (!IsPostBack)
            {
                BindData(); 
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    public void BindData()
    {
        string Uname = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("select * from Voicereports where Senttime between '" + txtfromdate.Text + "' and '" + txttodate.Text + "' and Username='" + Uname + "'", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvreports.DataSource = ds;
        gvreports.DataBind();
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvreports.PageIndex = e.NewPageIndex;
        gvreports.DataBind();
        BindData();
    }
    protected void btngetdate_Click(object sender, EventArgs e)
    {
        BindData();
    }
}