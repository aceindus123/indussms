using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Balance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnaccept_Click(object sender, EventArgs e)
    {
        string uname = txtuname.Text;
        string amount = txtamount.Text;
        DateTime purchasedate = Convert.ToDateTime(System.DateTime.Now.Date.ToString(""));
        DateTime validdate = Convert.ToDateTime(System.DateTime.Now.Date.ToString(""));
        DateTime validupto = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(30).ToString(""));
        string smstype = "";
        try
        {
            if (dropsmstype.Text == "Text SMS")
            {
                smstype = dropsmstype.SelectedValue.ToString();
                SqlCommand cmd = new SqlCommand("sptextsmsbalance", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Uname", uname);
                cmd.Parameters.AddWithValue("@TextSms", smstype);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@Purchasedate", purchasedate);
                cmd.Parameters.AddWithValue("@validdate", validdate);
                cmd.Parameters.AddWithValue("@Validupto", validupto);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    string strScript = "alert('Accepted The Textsms Balance.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                else
                {
                    string strScript = "alert('Sorry Not Accepted The Textsms Balance Try Again.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
               
            }
            else if (dropsmstype.Text == "Voice SMS")
            {
                smstype = dropsmstype.SelectedValue.ToString();
                SqlCommand cmd = new SqlCommand("spvoicesmsbalance", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Uname", uname);
                cmd.Parameters.AddWithValue("@VoiceSms", smstype);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@Purchasedate", purchasedate);
                cmd.Parameters.AddWithValue("@validdate", validdate);
                cmd.Parameters.AddWithValue("@Validupto", validupto);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    string strScript = "alert('Accepted The Voicesms Balance.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                else
                {
                    string strScript = "alert('Sorry Not Accepted The Voicesms Balance Try Again.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                string strScript = "alert('Please select The SMS Type.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }

            txtamount.Text = "";
            txtuname.Text = "";
            dropsmstype.SelectedIndex = -1;
        }
        catch (Exception ex)
        {
            throw;
        }
    }
}