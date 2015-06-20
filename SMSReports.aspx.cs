using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SMSReports : System.Web.UI.Page
{
    string uname;
    SMSCAPI cs = new SMSCAPI();
    Registration reg = new Registration();
    static string excep_page = "SMSReports.aspx";
    exception err = new exception();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
      
     //   reg.updatevoicereports();
        
        string uname = Convert.ToString(Session["User"]);
        //CalendarExtender1.StartDate = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(-7).ToString("yyyy-MM-dd"));
        //CalendarExtender1.EndDate = Convert.ToDateTime(System.DateTime.Now.Date.ToString("yyyy-MM-dd"));
        //CalendarExtender2.StartDate = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(-7).ToString("yyyy-MM-dd"));
        //CalendarExtender2.EndDate = Convert.ToDateTime(System.DateTime.Now.Date.ToString("yyyy-MM-dd"));
        if (Session["User"] != null)
        {
            if (!IsPostBack)
            {
                past.Visible = false;
                //cal2.SelectedDate = DateTime.Now;
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void lnktoday_Click(object sender, EventArgs e)
    {
        try
        {
            past.Visible = false;
            report.Visible = true;
            lnktoday.ForeColor = System.Drawing.Color.Green;
            lnkpast.ForeColor = System.Drawing.Color.Black;
            //normalsms.Visible = false;
            GridView1.Visible = false;

            string date1 = DateTime.Now.ToString("MM/dd/yyyy");
            //string date2 = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

            string uname = Convert.ToString(Session["User"]);

            DataSet ds = reg.tetrivenormaltodaydata1(uname, date1);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.Visible = true;

            }
            else
            {
                string script = "alert('No records found');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
            //pnllist.Visible = false;
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }

    protected void lnkpast_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        past.Visible = true;
        //pnllist.Visible = false;
        lnktoday.ForeColor = System.Drawing.Color.Black;
        lnkpast.ForeColor = System.Drawing.Color.Green;
    }

    protected void lnknormal_Click(object sender, EventArgs e)
    {
        string uname = Convert.ToString(Session["User"]);
        normalsms.Visible = true;
        //GridView1.Visible = false;
        schsms.Visible = false;
        report.Visible = true;
        past.Visible = false;
        lnknormal.ForeColor = System.Drawing.Color.Gray;
        lnkschedule.ForeColor = System.Drawing.Color.Black;
            //DataSet ds = cs.requestdetails1(uname);

            //if (ds.Tables[0].Rows.Count != 0)
            //{
            //    GridView1.DataSource = ds;
            //    GridView1.DataBind();
            //}
            //gvFeedback.Visible = false;
    }

    protected void lnkschedule_Click(object sender, EventArgs e)
    {
        try
        {
            uname = Convert.ToString(Session["User"]);
            gvFeedback.Visible = true;
           

            past.Visible = false;
            report.Visible = false;
            lnknormal.ForeColor = System.Drawing.Color.Black;
            lnkschedule.ForeColor = System.Drawing.Color.Gray;
            lnktoday.ForeColor = System.Drawing.Color.Black;
            lnkpast.ForeColor = System.Drawing.Color.Black;

            DataSet ds = cs.requestdetails(uname);

            if (ds.Tables[0].Rows.Count != 0)
            {
                gvFeedback.DataSource = ds;
                gvFeedback.DataBind();
            }

            else
            {
                  string str = "alert('No records found.');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }

            schsms.Visible = true;
            normalsms.Visible = false;
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }

    //protected void lnkReadmorerec(object sender, CommandEventArgs e)
    //{
    //     uname = Convert.ToString(Session["User"]);

    //    if (e.CommandName == "readmorerec")
    //    {
    //        string sid = e.CommandArgument.ToString();
    //        string mails=reg.retrivemails(sid,uname);
    //        lblmobilenumbers.Text = mails;
    //        lblmobilenumbers.Visible = true;
    //        ModalPopupExtender3.Show();

    //    }
    //}

    //protected void lnkReadmorerec1(object sender, CommandEventArgs e)
    //{
    //    uname = Convert.ToString(Session["User"]);

    //    if (e.CommandName == "readmorerec1")
    //    {
    //        string sid = e.CommandArgument.ToString();
    //        //    string query = "select recivernumber from ScheduleReport  where sid=" + sid;
    //        string mails = reg.retrivemails1(sid, uname);
    //        lblmobilenumbers.Text = mails;
    //        lblmobilenumbers.Visible = true;
    //        ModalPopupExtender3.Show();

    //    }
    //}

    //protected void lnkReadmorerec2(object sender, CommandEventArgs e)
    //{
    //    uname = Convert.ToString(Session["User"]);

    //    if (e.CommandName == "readmorerec2")
    //    {
    //        string sid = e.CommandArgument.ToString();
    //        string mails = reg.retrivemails2(sid, uname);
    //        lblmobilenumbers.Text = mails;
    //        lblmobilenumbers.Visible = true;
    //        ModalPopupExtender3.Show();

    //    }
    //}

    //protected void lnkReadmorerec3(object sender, CommandEventArgs e)
    //{
    //    uname = Convert.ToString(Session["User"]);

    //    if (e.CommandName == "readmorerec3")
    //    {
    //        string sid = e.CommandArgument.ToString();
            //string mails = reg.retrivemails3(sid, uname);
    //        lbl.Text = mails;
    //        Label2.Visible = true;
            

    //    }
    //}

    protected void btnget_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime date = Convert.ToDateTime(txtfrom.Text);
            string date1 = Convert.ToString(date.ToString("MM/dd/yyyy"));
            DateTime date2 = Convert.ToDateTime(txtto.Text);
            string date3 = Convert.ToString(date2.AddDays(-1).ToString("MM/dd/yyyy"));
            DateTime date4 = Convert.ToDateTime(txtfrom.Text);
            DateTime date5 = Convert.ToDateTime(txtto.Text);
            DateTime date6 = Convert.ToDateTime(date2.AddDays(-1).ToString());
            DateTime date7 = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(-30).ToString("MM/dd/yyyy"));

            //if (date < date4)
            //{
            if (date7 < date4)
            {
                if (date4 < date5)
                {

                        string uname = Convert.ToString(Session["User"]);
                        DataSet ds = reg.tetrivenormaltodaydata(uname, date1, date3);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            GridView1.DataSource = ds;
                            GridView1.DataBind();
                            GridView1.Visible = true;
                        }
                        else
                        {
                            string str = "alert('No records found.');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                            GridView1.Visible = false;

                        }

                    }
                    else
                    {
                        string str = "alert('No records found.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        GridView1.Visible = false;

                    }

                
            }
            else
            {
                string str = "alert('Only One Month Records Can be Retrieve.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
        catch
        {

        }


        //else
        //{
        //    string str = "alert('Please select FROM Date lessthen TO Date.');";
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        //    GridView1.Visible = false;

        //}
    }
    

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        binddata();
    }
    protected void binddata()
    {

        string id = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("select * from NormalReport where currentdate between '" + txtfrom.Text + "' and '" + txtto.Text + "' and Sendernumber='" + id + "'", con);
        //SqlDataAdapter da = new SqlDataAdapter("Select * from NormalReport where Sendernumber='" + id + "'", con);
        //SqlDataAdapter da = new SqlDataAdapter("Select * from issue", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void bind()
    {
        string id = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("Select * from schedulereport where Sendernumber='" + id + "'", con);
        //SqlDataAdapter da = new SqlDataAdapter("Select * from issue", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvFeedback.DataSource = ds;
        gvFeedback.DataBind();
    }
    protected void gvFeedback_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
         gvFeedback.PageIndex = e.NewPageIndex;
        gvFeedback.DataBind();
        bind();
    }
   
}