using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class Compose_VoiceSMS : System.Web.UI.Page
{
    
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        string Uname = Convert.ToString(Session["User"]);
        if (Session["User"] != null)
        {
            int ds5 = getbal(Session["User"].ToString());
            if (ds5 != 0)
            {
                string path = Path.GetFileName(Request.PhysicalPath);
                switch (path)
                {
                    case "Compose VoiceSMS.aspx": linkcall.CssClass = "active";
                        break;
                    case "Uploadvoicesms.aspx": linkupload.CssClass = "active";
                        break;
                    case "TextToSpeech.aspx": linksppech.CssClass = "active";
                        break;
                    case "VoiceClips.aspx": linkclips.CssClass = "active";
                        break;
                }
                txtno.Text = Uname;
            }
            else
            {
                string strScript = "alert('You Dont Have balance.Please Purchase Messages');location.replace('Balance.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private int getbal(string p)
    {
        string qry = "select amountleft from voicesmsexpenses where uname='" + p + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        int value = Convert.ToInt32(ds2.Tables[0].Rows[0]["amountleft"].ToString());
        return value;
    }

    public void Default3()
    {
        Load += Page_Load;
    }
    protected void linkcall_Click(object sender, EventArgs e)
    {
        Response.Redirect("Compose VoiceSMS.aspx");
    }      
    protected void linkupload_Click(object sender, EventArgs e)
    {
        Response.Redirect("Uploadvoicesms.aspx");
    }
    protected void linksppech_Click(object sender, EventArgs e)
    {
        Response.Redirect("TextToSpeech.aspx");
    }
    protected void linkclips_Click(object sender, EventArgs e)
    {
        Response.Redirect("VoiceClips.aspx");
    }
    protected void btngetclips_Click(object sender, EventArgs e)
    {

    }
}