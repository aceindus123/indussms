using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Indussms;
using Indussms.DataAccessLayer;

public partial class Voicereports : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    Registration reg = new Registration();
    protected void Page_Load(object sender, EventArgs e)
    {

        // DateTime date = Convert.ToDateTime(System.DateTime.Now.Date.ToString("yyyy-MM-dd"));
        //txttodate.Text = Convert.ToString(System.DateTime.Now.Date.ToString("yyyy-MM-dd"));
        //txtfromdate.Text = Convert.ToString(System.DateTime.Now.Date.AddDays(-1).ToString("yyyy-MM-dd"));
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

        //string Uname = Convert.ToString(Session["User"]);

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
        if ((txtfromdate.Text != "") && (txttodate.Text != ""))
        {
            string daten = DateTime.Now.ToString("yyyy-MM-dd");
            string datem = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

            DateTime date = Convert.ToDateTime(txtfromdate.Text);

            string date1 = Convert.ToString(date.ToString("MM/dd/yyyy"));

            DateTime date2 = Convert.ToDateTime(txttodate.Text);

            string date3 = Convert.ToString(date2.ToString("MM/dd/yyyy"));

            DateTime date4 = Convert.ToDateTime(txtfromdate.Text);

            DateTime date5 = Convert.ToDateTime(txttodate.Text);

            DateTime date6 = Convert.ToDateTime(date2.ToString());

            DateTime date7 = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(-7).ToString("MM/dd/yyyy"));

            DateTime date8 = Convert.ToDateTime(date2.ToString());

            string date9 = Convert.ToString(date.ToString("yyyy-MM-dd"));

            string date10 = Convert.ToString(date2.ToString("yyyy-MM-dd"));

            if (date7 < date4)
            {
                if (date4 < date2)
                {
                    string uname = Convert.ToString(Session["User"]);
                    DataSet ds = reg.voicereports(uname, date1, date3);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        gvreports.DataSource = ds;
                        gvreports.DataBind();
                        //GridView1.Visible = true;
                        gridview.Visible = true;

                    }
                    else
                    {
                        string str = "alert('No records found.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        gridview.Visible = false;
                    }
                }

                else if (date9 == date10)
                {
                    string name = Convert.ToString(Session["User"]);
                    DataSet ds1 = reg.voicereports1(name, date1);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        gvreports.DataSource = ds1;
                        gvreports.DataBind();
                        gridview.Visible = true;

                        //BindData();
                    }
                    else
                    {
                        string str = "alert('No records found.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        gridview.Visible = false;

                    }
                }

                else
                {
                    string str = "alert('No records found.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            else
            {
                string str = "alert('Please select From Date Before one Week to Current Date .');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
        else
        {
            string str = "alert('Please select From Date and To Date .');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }
}


                
            
        
    

