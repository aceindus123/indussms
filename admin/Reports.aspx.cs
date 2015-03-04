using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using ClosedXML.Excel;
using System.IO;


public partial class admin_Reports : System.Web.UI.Page
{
    string sms;
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet dsadmin = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            if (!IsPostBack)
            {
                reports.Visible = false;
                gvnormalreports.Visible = false;
                gvscedulereports.Visible = false;
                gvvoicereports.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    public DataSet BindData(string x)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from " + x, sqlConnection);
       // qry = "select *, stuff(\"studentname\", 15, len(studentname), '...') as stdname,studentname,stuff(\"Repeatestudent_name\", 15, len(Repeatestudent_name), '...') as rstdname,Repeatestudent_name from TrainingStudentInfo left join courses on TrainingStudentInfo.course=courses.course where TrainingStudentInfo.course='" + courses + "' order by id desc";
       // SqlDataAdapter da = new SqlDataAdapter("select *, stuff(\"subject\", 15, len(subjects), '...') as subject,subjects from " + x, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    protected void rdnormalsms_CheckedChanged(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            try
            {
                dsadmin = Permission();
                string s1 = dsadmin.Tables[0].Rows[0]["viewuser"].ToString();
                if (s1 == "1")
                {
                    string x = "NormalReport";
                    DataSet data3 = BindData(x);
                    gvnormalreports.DataSource = data3;
                    gvnormalreports.DataBind();
                    gvscedulereports.Visible = false;
                    gvvoicereports.Visible = false;
                    gvnormalreports.Visible = true;
                    reports.Visible = false;
                }
                else
                {
                    string script = "alert('No Permission.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void rdschedulesms_CheckedChanged(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            try
            {
                dsadmin = Permission();
                string s2 = dsadmin.Tables[0].Rows[0]["activateuser"].ToString();
                if (s2 == "1")
                {
                    string x = "ScheduleReport";
                    DataSet data1 = BindData(x);
                    gvscedulereports.DataSource = data1;
                    gvscedulereports.DataBind();
                    gvvoicereports.Visible = false;
                    gvnormalreports.Visible = false;
                    gvscedulereports.Visible = true;
                    reports.Visible = false;
                }
                else
                {
                    string script = "alert('No Permission.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    public DataSet Permission()
    {
        if (Session["login"] != null)
        {
            string admin = "Select * from c_adminlogin where usertype='" + Session["usertype"].ToString() + "' and username='" + Session["login"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, sqlConnection);
            dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            return dsadmin;
            // Session["dsadmin"] = dsadmin;
        }
        else
        {
            return null;
        }
    }
    protected void rdvoicesms_CheckedChanged(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            try
            {
                dsadmin = Permission();
                string s3 = dsadmin.Tables[0].Rows[0]["deactivateuser"].ToString();
                if (s3 == "1")
                {
                    string x = "Voicereports";
                    DataSet data4 = BindData(x);
                    gvvoicereports.DataSource = data4;
                    gvvoicereports.DataBind();
                    gvscedulereports.Visible = false;
                    gvnormalreports.Visible = false;
                    gvvoicereports.Visible = true;
                    reports.Visible = false;
                }
                else
                {
                    string script = "alert('No Permission.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
            catch (Exception ex)
            {
               // Response.Redirect("" + ex);
                throw;
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void rddownload_CheckedChanged(object sender, EventArgs e)
    {
        rdnormalsms.Visible = false;
        rdschedulesms.Visible = false;
        rdvoicesms.Visible = false;
        gvscedulereports.Visible = false;
        gvnormalreports.Visible = false;
        gvvoicereports.Visible = false;
        reports.Visible = true;
        btncancel.Visible = true;
        if (Session["login"] != null)
        {
            //try
            //{
            //    string s4 = dsadmin.Tables[0].Rows[0]["deleteuser"].ToString();
            //}
            //catch (Exception ex)
            //{
            //    Response.Redirect("" + ex);
            //}
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void gvnormalreports_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvnormalreports.PageIndex = e.NewPageIndex;
        gvnormalreports.DataBind();
        string x = "NormalReport";
        DataSet data = BindData(x);
        gvnormalreports.DataSource = data;
        gvnormalreports.DataBind();
    }
    protected void gvvoicereports_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvvoicereports.PageIndex = e.NewPageIndex;
        gvvoicereports.DataBind();
        string x = "Voicereports";
        DataSet data = BindData(x);
        gvvoicereports.DataSource = data;
        gvvoicereports.DataBind();
    }
    protected void gvscedulereports_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvscedulereports.PageIndex = e.NewPageIndex;
        gvscedulereports.DataBind();
        string x = "ScheduleReport";
        DataSet data = BindData(x);
        gvscedulereports.DataSource = data;
        gvscedulereports.DataBind();
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx");
    }
    protected void normal_CheckedChanged(object sender, EventArgs e)
    {
        string s = "NormalReport";
        string s1 = "IndusNormalReports.xlsx";
        Download(s, s1);
    }
    public void Download(string x, string y)
    {
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM "+x))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = sqlConnection;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt, "Customers");

                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename="+y);
                        using (MemoryStream MyMemoryStream = new MemoryStream())
                        {
                            wb.SaveAs(MyMemoryStream);
                            MyMemoryStream.WriteTo(Response.OutputStream);
                            Response.Flush();
                            Response.End();
                            //Response.Redirect("Reports.aspx");
                            
                        }
                    }
                }
            }
        }
    }
    protected void btnnormal_Click(object sender, EventArgs e)
    {
        string s = "NormalReport";
        string s1 = "IndusNormalReports.xlsx";
        Download(s, s1);
    }
    protected void btnschedule_Click(object sender, EventArgs e)
    {
        string p = "ScheduleReport";
        string q = "IndusScheduleReports.xlsx";
        Download(p, q);
    }
    protected void btnvoice_Click(object sender, EventArgs e)
    {
        string p = "Voicereports";
        string q = "IndusVoiceReports.xlsx";
        Download(p, q);
    }
}