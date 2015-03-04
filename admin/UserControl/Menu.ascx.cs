using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

public partial class admin_UserControl_Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string path = Path.GetFileName(Request.PhysicalPath);

            switch (path)
            {
                case "Admin-Menu.aspx": lnkhome.CssClass = "active";
                    break;
                case "Clients.aspx": lnkclient.CssClass = "active";
                    break;
                case "Voicesms.aspx": lnknew.CssClass = "active";
                    break;
                case "LoginStatus.aspx": lnksupport.CssClass = "active";
                    break;
                case "Contactus.aspx": lnkpost.CssClass = "active";
                    break;
                case "Balance.aspx": lnkbuy.CssClass = "active";
                    break;
                case "Missedcallalert.aspx": lnkads.CssClass = "active";
                    break;
                case "Offers.aspx": lnkjobfairs.CssClass = "active";
                    break;
                case "Reports.aspx": lnkreports.CssClass = "active";
                    break;
                case "Permissions.aspx": lnkjobseeker.CssClass = "active";
                    break;
                case "Admin-Support.aspx": lnkerror.CssClass = "active";
                    break;
                case "CreateUser.aspx": lnkusers.CssClass = "active";
                    break;
            }
        }

        if (Convert.ToString(Session["login"]) != "")
        {
            lbluser.Text = Session["login"].ToString();
            lbluser.Visible = true;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lnkhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Menu.aspx");

    }

    protected void lnkclient_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clients.aspx");
    }

    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }

    protected void lnknew_Click(object sender, EventArgs e)
    {
        Response.Redirect("Voicesms.aspx");
    }

    protected void lnkpost_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contactus.aspx");
    }

    protected void lnksupport_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginStatus.aspx");
    }
    protected void lnkads_Click(object sender, EventArgs e)
    {
        Response.Redirect("Missedcallalert.aspx");
    }

    protected void lnkbuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Balance.aspx");
    }

    protected void lnkreports_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx");
    }

    protected void lnkjobfairs_Click(object sender, EventArgs e)
    {
        Response.Redirect("Offers.aspx");
    }

    protected void lnkjobseeker_Click(object sender, EventArgs e)
    {
        Response.Redirect("Permissions.aspx");
    }

    protected void lnkerror_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Support.aspx");
    }

    protected void lnkusers_Click(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            string own1 = Convert.ToString(Session["login"]);
            string own = ConfigurationManager.AppSettings["owner"].ToString();
            if (own1 == own)
            {
                Response.Redirect("CreateUser.aspx");
            }
            else
            {
                string strScript = "alert('You are Not authorised to Open this Page');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }
}