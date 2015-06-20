using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Net;

public partial class Mobile_verification : System.Web.UI.Page
{
    //Function to execute whenever page is loading
    SMSCAPI objSms = new SMSCAPI();
    string strScript = string.Empty;
    Registration reg = new Registration();
    bool result;
    string Msg = string.Empty;
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
            if (Session["code"]!= "")
            {
                lblVCode.Text = Session["code"].ToString();
                if (txtVerification.Text == lblVCode.Text)
                {
                    string msgtxt = reg.sendSms(Convert.ToString(Request.QueryString["username"]), Convert.ToString(Request.QueryString["mblno"]), Convert.ToString(Request.QueryString["pwd"]));
                    result = reg.updateRegstatus(Convert.ToString(Request.QueryString["mblno"]), 1, System.DateTime.Now.ToString("dd/MM/yyyy"));

                    string mobile = Convert.ToString(Request.QueryString["mblno"]);
                    DateTime validupto = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(30).ToString("MM/dd/yyyy hh:mm:ss"));
                    DateTime regdate = Convert.ToDateTime(System.DateTime.Now.Date.ToString("MM/dd/yyyy hh:mm:ss tt"));
                    int amount = 2;
                    int amount1 = 2;
                    inserttextbalance(mobile, amount, "Text SMS", regdate, validupto, 4, 4, "2", 1);
                    insertvoicebalance(mobile, amount, "Voice SMS", regdate, validupto, 2, 2, "2", 1);

                    Msg = Msg + "<td colspan='3' align='center' class='headings'>Registration Information of  "+ mobile +" ";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td class='lable1'> Name</td>";
                    Msg = Msg + "<td>:</td>";
                    Msg = Msg + "<td class='lable1'>" + Convert.ToString(Request.QueryString["username"]) + "</td>";
                    Msg = Msg + "</tr>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td class='lable1'> Email ID</td>";
                    Msg = Msg + "<td>:</td>";
                    Msg = Msg + "<td class='lable1'>" + Convert.ToString(Request.QueryString["email"]) + "</td>";
                    Msg = Msg + "</tr>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td class='lable1'> Password</td>";
                    Msg = Msg + "<td>:</td>";
                    Msg = Msg + "<td class='lable1'>" + Convert.ToString(Request.QueryString["pwd"]) + "</td>";
                    Msg = Msg + "</tr>";
                    Msg = Msg + "<tr>";
                    Msg = Msg + "<td class='lable1'> Phone No</td>";
                    Msg = Msg + "<td>:</td>";
                    Msg = Msg + "<td class='lable1'>" + Convert.ToString(Request.QueryString["mblno"]) + "</td>";
                    Msg = Msg + "</tr></table>";
                    SendMailToUser1("Indussms@info.com", "Indussms@info.com", " Registraion details of '" + mobile + "'", Msg);

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

    public void SendMailToUser1(string From, string To, string Subject, string Body)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", "ravi_iginc@yahoo.com");
        values.Add("api_key", "dc808cd8-512f-4f02-a6d6-9a2fc68ada01");

        values.Add("from", From);
        values.Add("subject", Subject);

        if (Body != null)
        {
            values.Add("body_html", Body);
        }
        values.Add("to", To);



        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);


    }
}
