using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Indussms.DataAccessLayer;
using System.Net;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Text;

public partial class SMSLogin : System.Web.UI.Page
{
    string email;
    Registration reg = new Registration();
    static string excep_page = "SMSLogin.aspx";
    exception err = new exception();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = true;

    }
    protected void Signin_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string mobile1 = UserID.Text;
            Session["User"] = mobile1;
            //  string email1= txtemail.Text;
            string pwd1 = Password.Text;
            int confirm = reg.confirmuser(mobile1, pwd1);

            if (confirm == 1)
            {
                    //string date = Convert.ToString(System.DateTime.Now.ToString());
                    DateTime date = Convert.ToDateTime(System.DateTime.Now.ToString());
                    Session["date"] = date;
                    string ip = HttpContext.Current.Request.UserHostAddress;
                    string ipa = Request.UserHostAddress;
                    string ip1 = GetIP();
                    Session["ip"] = ip1;
                    int status = 2;
                    SqlCommand cmd = new SqlCommand("sploginreport", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Uname", mobile1);
                    cmd.Parameters.AddWithValue("@IpAddress", ip1);
                    cmd.Parameters.AddWithValue("@Datetime", date);
                    cmd.Parameters.AddWithValue("@status", status);

                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                    sqlConnection.Close();
                    Response.Redirect("SMSMainMenu.aspx");
            }
            else
            {
                string script = "alert('Mobile Number / Password is  invalid ')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }    
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }
     protected string GetIP()
    {
        IPAddress[] addr = new IPAddress[0];
        try
        {
            string strHostName = "";


            strHostName = System.Net.Dns.GetHostName();

            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);

            addr = ipEntry.AddressList;


        }
        catch
        { }
        return addr[addr.Length - 2].ToString();
    }
    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        frgetdiv.Visible = true;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        frgetdiv.Visible = false;
    }
    protected void btnpfrgt_Click(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";
            string email = frgtpwd.Text;
            int s = reg.findemail(email);
            if (s == 0)
            {
                lblmsg.Visible = true;
                string script = "alert('You are Not Registered User')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                frgetdiv.Visible = true;
                Panel1.Visible = false;
            }
            else
            {
                lblmsg.Visible = true;
                DataTable dt = reg.Retrivedata(email);
                string fname = dt.Rows[0]["fname"].ToString();
                // string email1 = dt.Rows[0]["email"].ToString();
                string pwd = dt.Rows[0]["password"].ToString();
                string mobile = dt.Rows[0]["phno"].ToString();

                sendEmail(email, fname, pwd, mobile);

                string script = "alert('Password Sent to Your Registered Email')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                frgtpwd.Text = "";
                frgetdiv.Visible = false;
                Panel1.Visible = true;
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }


    }
    private void sendEmail(string email,string fname,string pwd,string mobile)
    {

        string Body = " Hi " + fname + ",<br/>Welcome to IndusSms, Sms marketing from Aceindus.<br/><br/>";
        Body += "<u>Your Account Details</u><br/><br/>";
        Body += "<b>Your Username :</b> " + email + "<br/>";
        Body += "<b>Password :</b> " + pwd + "<br/>";
        Body += "<b>Mobile Number :</b> " + mobile + "<br/>";

        Body += "You Can Login here <a href=" + ConfigurationManager.AppSettings["ApplicationURL"] + "SMSLogin.aspx >here</a>";

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
        values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
        values.Add("from", "info@indussms.com");
        values.Add("from_name", "IndusSms");
        values.Add("subject", " IndusSms Password  Information");
        // values.Add("time_offset_minutes", "");
        values.Add("body_html", Body);
        values.Add("to", email);
        try
        {
            byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
            string res = Encoding.UTF8.GetString(response);
        }

        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
        finally
        {

        }
    }
}