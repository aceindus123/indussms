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
using Indussms.DataAccessLayer;


public partial class MissedCall : System.Web.UI.Page
{
    Registration reg = new Registration();
    exception err = new exception();
    static string excep_page = "MissedCall.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            txtmissed.Attributes["placeholder"] = "Mobile Number";
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string number = txtmissed.Text;
            if (number != "")
            {
                bool s = reg.savemissed(number);

                txtmissed.Text = "";
                string script = "alert('We will meet Shortly')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
            else
            {
                string script = "alert('Number is invalid')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }

}
