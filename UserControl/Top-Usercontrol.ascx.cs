using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.NetworkInformation;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserControl_Top_Usercontrol: System.Web.UI.UserControl
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    Registration reg = new Registration();

    protected void Page_Load(object sender, EventArgs e)
    {
       // Session.Clear();
        if (Session["User"] == null)
        {
            welcome1.Visible = false;
            lblnumber.Visible = false;
            lnklogout.Visible = false;
            lnkprofile.Visible = false;
            ipadd.Visible = false;

            signup2.Visible = true;
            signup1.Visible = true;
            login2.Visible = true;
            login1.Visible = true;
        }
        else
        {
            welcome1.Visible = true;
            lblnumber.Visible = true;
            lnklogout.Visible = true;
            lnkprofile.Visible = true;
            ipadd.Visible = true;

            signup2.Visible = false;
            signup1.Visible = false;
            login2.Visible = false;
            login1.Visible = false;
            string uname = Convert.ToString(Session["User"]);
            string username = reg.name(uname);
            lblnumber.Text = username;

            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            String sMacAddress = string.Empty;
            foreach (NetworkInterface adapter in nics)
            {
                if (sMacAddress == String.Empty)// only return MAC Address from first card  
                {
                    IPInterfaceProperties properties = adapter.GetIPProperties();
                    sMacAddress = adapter.GetPhysicalAddress().ToString();
                }
            }
            // To Get IP Address


            string IPHost = Dns.GetHostName();
            string IP = Dns.GetHostEntry(IPHost).AddressList[0].ToString();
            ipadd.Text = "Your IP-ADDRESS:" + IP;
        }
    }

    protected void lnk1_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Response.Redirect("SMSMainMenu.aspx");
        }
        else
        {
            Response.Redirect("Default.aspx");

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Response.Redirect("SMSReports.aspx");
        }
        else
        {
            Response.Redirect("SMSLogin.aspx");

        }
           
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("BulkSMSPricing.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reseller.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("FAQ.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("HowToBuy.aspx");
    }

    protected void lnklogout_Click1(object sender, EventArgs e)
    {
        if ((Session["User"].ToString() == null) && (Session["User"].ToString() == ""))
        {

        }

        else if ((Session["date"].ToString() == null) && (Session["date"].ToString() == ""))
        {

        }

        else if ((Session["ip"].ToString() == null) && (Session["ip"].ToString() == ""))
        {

        }

        else
        {
            string user = Session["User"].ToString();
            string date = System.DateTime.Now.ToString();
            //   string date = Session["date"].ToString();
            string ip = Session["ip"].ToString();
            string date1 = Session["date"].ToString();
            con.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("update Loginreport set Status=1,Logoutdate='" + date + "' where Uname='" + user + "' and IpAddress='" + ip + "' and Status=2", con);
           // int s = cmd.ExecuteNonQuery();
            con.Close();
            Session.Clear();
            Response.Redirect("SMSLogin.aspx");
        }
    }

    protected void signup1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SMSRegistration.aspx");

    }

    protected void login1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SMSLogin.aspx");

    }

    protected void lnkprofile_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Response.Redirect("AccountInfo.aspx");
        }
        else
        {
            Response.Redirect("SMSLogin.aspx");

        }
    }
}