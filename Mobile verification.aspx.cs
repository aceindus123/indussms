using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Mobile_verification : System.Web.UI.Page
{
    //Function to execute whenever page is loading
    SMSCAPI objSms = new SMSCAPI();
    string strScript = string.Empty;
    Registration reg = new Registration();
    bool result;
    exception err = new exception();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    static string excep_page = "Mobile verification.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void imgBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["MobVCode"]) != "")
            {
                lblVCode.Text = Convert.ToString(Request.QueryString["MobVCode"]);
                if (txtVerification.Text == lblVCode.Text)
                {
                    string msgtxt = reg.sendSms(Convert.ToString(Request.QueryString["username"]), Convert.ToString(Request.QueryString["mblno"]), Convert.ToString(Request.QueryString["pwd"]));
                    result = reg.updateRegstatus(Convert.ToString(Request.QueryString["mblno"]), 1, System.DateTime.Now.ToString("dd/MM/yyyy"));

                    string mobile = Convert.ToString(Request.QueryString["mblno"]);
                    DateTime validupto = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(30).ToString(""));
                    DateTime regdate = Convert.ToDateTime(System.DateTime.Now.Date.ToString(""));
                    int amount = 2;
                    int amount1 = 2;
                    inserttextbalance(mobile, amount, "Text SMS", regdate, validupto, 4, 4, "2", 1);
                    insertvoicebalance(mobile, amount, "Voice SMS", regdate, validupto, 2, 2, "2", 1);


                    objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]),Convert.ToString(Request.QueryString["mblno"]), msgtxt);
                    strScript = "alert('Your registration is successfully completed. Login details are send to your mobile number in shortly');location.replace('SMSLogin.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                }
                else
                {
                    strScript = "alert('Please enter correct verification code');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }

    }
    private void insertvoicebalance(string p, int amount, string p_2, DateTime p_3, DateTime validupto, int p_4, int p_5, string p_6, int a)
    {
        string sql = "insert into voicesmsexpenses(uname,Amount,Smstype,Purchasedate,expirydate,numofsms,smsleft,amountleft,status ) values('" + p + "'," + amount + ",'" + p_2 + "','" + p_3 + "','" + validupto + "'," + p_4 + "," + p_5 + ",'" + p_6 + "'," + a + ")";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.ExecuteNonQuery();
        con.Close();

    }

    private void inserttextbalance(string p, int amount, string p_2, DateTime p_3, DateTime validupto, int p_4, int p_5, string p_6, int a)
    {
        string sql = "insert into textsmsexpenses(uname,Amount,Smstype,Purchasedate,expirydate,numofsms,smsleft,amountleft,status ) values('" + p + "'," + amount + ",'" + p_2 + "','" + p_3 + "','" + validupto + "'," + p_4 + "," + p_5 + ",'" + p_6 + "'," + a + ")";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
}