using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data.SqlClient;

public partial class SMsDemo : System.Web.UI.Page
{
    Registration reg = new Registration();
    string uname = "";
    exception err = new exception();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    static string excep_page = "SMsDemo.aspx";
    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;

    protected void Page_Load(object sender, EventArgs e)
    
    {
        uname = Convert.ToString(Session["User"]);

        DataSet ds1 = reg.amount(uname);

      
        if (!IsPostBack)
        {
            //if (TextBox1.Text == "")
            //{
            //    validnumbers.Visible = false;

            //}

            string id = (Convert.ToString(Session["User"]));


            if (ds1.Tables[0].Rows.Count > 0)
            {
                Label1.Text = ds1.Tables[0].Rows[0]["amountleft"].ToString();
                Label3.Text = ds1.Tables[0].Rows[0]["expirydate"].ToString();
                Label2.Text = ds1.Tables[0].Rows[0]["smsleft"].ToString();
            }
            else
            {
                Label1.Text = "0";
                Label3.Visible = true;
                Label2.Text = "0";
               // Label12.Visible = true;
            }

            DataSet ds2 = reg.voiceamount(id);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                Label4.Text = ds2.Tables[0].Rows[0]["amountleft"].ToString();
                Label6.Text = ds2.Tables[0].Rows[0]["expirydate"].ToString();
                Label5.Text = ds2.Tables[0].Rows[0]["smsleft"].ToString();
            }
            else
            {
                Label4.Text = "0";
                Label6.Visible = true;
                Label5.Text = "0";
               // Label13.Visible = true;
            }
        }
    }

    private string getbal(string p)
    {

        string qry = "select smsleft from textsmsexpenses where uname='" + p + "' and status=1";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            string value = ds2.Tables[0].Rows[0]["smsleft"].ToString();
            return value;
        }

        else
        {
            string value = "0";
            return value;
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SMSCAPI objSms = new SMSCAPI();
        string template="";
        string id = "ACEIND";
        string N = "N";
        string Y = "Y";
        string result = "";
        string number = "";
        DateTime time = Convert.ToDateTime(DateTime.Now.ToString());
       // string time1 = Convert.ToString(DateTime.Now.ToString());
        string time1 = Convert.ToString(DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"));

        string message = "";

        string username = reg.name(Session["User"].ToString()); // for name
        string ds5 = getbal(Session["User"].ToString()); // for number
        int x = lblnum.Text.Count(','.Equals);

        if (Convert.ToInt32(ds5) >= x)
        {
            try
            {
                if (lblnum.Text != "")
                {
                    number = lblnum.Text;
                    message = txtmobilesubject.Text;

                    string y = Convert.ToString(x * 0.50);

                   

                      result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);

                
                    expence(uname, x, y, time1);

                  //   int n = reg.insertschreport1(username, uname, number, message, time, result);
                    int n = reg.insertschreport1(username, uname, number, message, time1, result,template,id);


                     TextBox1.Text = "";
                     txtmobilesubject.Text = "";
                     Label11.Visible = false;

                    string script1 = "alert('Message Send Successfully');location.replace('SMsDemo.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script1, true);

                 //   ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Message Send Successfully. msgs Send : '"+x+"' msg cost : '"+y+"'');location.replace('SMsDemo.aspx');", true);
          


                }
                else
                {
                    string strScript = "alert('Unable to Send Message');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }


            catch (Exception ex)
            {
                err.insert_exception(ex, excep_page);
            }
        }
        else
        {
            string strScript = "alert('You Dont Have Money in Your account');location.replace('Balance.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private void expence(string p, int p_2, string p_3, string time)
    {
        try
        {
            sqlConnection.Open();
            string qry = "insert into Expences(uname,count,amount,etime) values('" + p + "'," + p_2 + ",'" + p_3 + "','" + time + "')";
            SqlCommand cmd = new SqlCommand(qry, sqlConnection);
            cmd.ExecuteNonQuery();

            string qry1 = "select top(1) b.smsleft-a.count as Cnt,(cast(b.amountleft as decimal(18,2))-cast(a.amount as decimal(18,2)) )as Bal from Expences a inner join  textsmsexpenses b on a.uname=b.uname where a.uname='" + p + "' and status=1 order by eid desc";
            SqlDataAdapter da = new SqlDataAdapter(qry1, sqlConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string a = ds.Tables[0].Rows[0]["Cnt"].ToString();
            string b = ds.Tables[0].Rows[0]["Bal"].ToString();
            string qry2 = "";

            if (a == "0")
            {
                qry2 = "update textsmsexpenses set smsleft='" + a + "',amountleft='" + b + "',status=0 where uname='" + p + "'";
            }
            else
            {
                qry2 = "update textsmsexpenses set smsleft='" + a + "',amountleft='" + b + "' where uname='" + p + "'";

            }
            SqlCommand cmd2 = new SqlCommand(qry2, sqlConnection);
            cmd2.ExecuteNonQuery();

            sqlConnection.Close();
        }

        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        txtmobilesubject.Text = "";
        validnumbers.Visible = false;

        lblnum.Text = "";
        pnledit.Visible = false;

        ModalPopupExtender2.Hide();

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            string crdres = "";

            string mobile = "";
            string crdrevs = TextBox1.Text;

            crdrevs = crdrevs.TrimEnd(',');

            string[] crdrevis = Regex.Split(crdrevs, ",");
            for (int i = 0; i < crdrevis.Length; i++)
            {
                crdres = crdrevis[i];

                if (crdres.Length == 10)
                {
                    mobile += crdres + ',';
                }
            }

            if (mobile != "")
            {
                lblnum.Text = mobile;
            }
            else
            {
                lblnum.Text = "All are wrong numbers";
            }

            Label11.Visible = true;
            validnumbers.Visible = true;
        }
        else
        {
            validnumbers.Visible = false;

        }
    }
    protected void Label61_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Show();
        pnledit.Visible = true;
    }
      
}