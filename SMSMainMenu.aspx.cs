using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SMSMainMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void imaagsms_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["User"] != "")
        {
            Response.Redirect("SMSMainMenu.aspx");

        }
        else
        {
            Response.Redirect("Default.aspx");

        }
    }
}