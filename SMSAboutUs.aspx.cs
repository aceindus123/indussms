using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SMSAboutUs : System.Web.UI.Page
{
    string uname;
    protected void Page_Load(object sender, EventArgs e)
    {
        string uname = Convert.ToString(Session["User"]);

        if (Session["User"] != null)
        {
            if (!IsPostBack)
            {

            }
        }
       
    }
    protected void lnkhome_Click(object sender, EventArgs e)
    {
        uname = Convert.ToString(Session["User"]);

        if (Session["User"] != null)
        {
            Response.Redirect("SMSMainMenu.aspx");

        }
        else
        {
            Response.Redirect("Default.aspx");

        }
       
    }
}