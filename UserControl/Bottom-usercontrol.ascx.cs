using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_Bottom_usercontrol : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        Response.Redirect("SMSAboutUs.aspx");
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
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contactus1.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("FeedBack.aspx");

    }
}