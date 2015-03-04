using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Reseller : System.Web.UI.Page
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
            Response.Redirect("Reseller.aspx");
        }
       
    }
}
