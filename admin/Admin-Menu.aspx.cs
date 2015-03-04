using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void imgrc_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Clients.aspx");
    }
    protected void lnkusers_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clients.aspx");
    }
    protected void lnkvoice_Click(object sender, EventArgs e)
    {
        Response.Redirect("Voicesms.aspx");
    }
    protected void imgservices_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Voicesms.aspx");
    }
    protected void imgbtnpostjobs_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Contactus.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contactus.aspx");
    }
    protected void imgsupport_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin-support.aspx");
    }
    protected void lnksupport_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-support.aspx");
    }
    protected void imgpermission_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Missedcallalert.aspx");
    }
    protected void lnkmissed_Click(object sender, EventArgs e)
    {
        Response.Redirect("Missedcallalert.aspx");
    }
    protected void imgresume_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Balance.aspx");
    }
    protected void lnklist_Click(object sender, EventArgs e)
    {
        Response.Redirect("Balance.aspx");
    }
    protected void imgads_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Offers.aspx");
    }
    protected void lnkoffers_Click(object sender, EventArgs e)
    {
        Response.Redirect("Offers.aspx");
    }
    protected void imgjobfairs_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Permissions.aspx");
    }
    protected void lnkfeture_Click(object sender, EventArgs e)
    {
        Response.Redirect("Permissions.aspx");
    }
}