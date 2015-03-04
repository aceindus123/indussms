using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Net;
using System.Data.SqlClient;

public partial class FeedBack : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    Class1 c1 = new Class1();
    DataSet ds = new DataSet();
    bool cu;
    string strscript = string.Empty;
    exception err = new exception();
    static string excep_page = "FeedBack.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds = c1.getcountry();
            ddlcountry.DataSource = ds;
            ddlcountry.DataTextField = "countryname";
            ddlcountry.DataValueField = "countryid";
            ddlcountry.DataBind();
        }

    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedItem.Text == "Select Country")
        {
            ddlcity.Items.Clear();
            ddlstate.Items.Clear();
            ddlstate.Items.Insert(0, "Select State");
            ddlcity.Items.Insert(0, "Select City");

        }
        else
        {

            ddlstate.Items.Clear();
            ddlcity.Items.Clear();
            DataSet dsstate = new DataSet();
            string y = ddlcountry.SelectedItem.Value.ToString();
            ds = c1.getstates(y);
            ddlstate.Items.Insert(0, "Select State");
            ddlcity.Items.Insert(0, "Select City");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {

                    ddlstate.Items.Add("");
                    ddlstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["statename"].ToString();
                    ddlstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["stateid"].ToString();
                }
            }
        }
    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlstate.SelectedItem.Text == "Select State")
        {
            ddlcity.Items.Clear();
            ddlcity.Items.Insert(0, "Select City");
        }
        else
        {
            ddlcity.Items.Clear();
            DataSet dscity = new DataSet();
            string z = ddlstate.SelectedItem.Value.ToString();
            ds = c1.getcities2(z);
            ddlcity.Items.Insert(0, "Select City");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {

                    ddlcity.Items.Add("");
                    ddlcity.Items[i].Text = ds.Tables[0].Rows[i - 1]["cityname"].ToString();
                    ddlcity.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                }
            }
        }
    }
    protected void imgSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string fname = txtfname.Text;
            string femail = txtEmailid.Text;
            string fsub = Txtsubject.Text;
            string fmsg = txtcomments.Text;
            string contry1 = ddlcountry.SelectedItem.Text;
            string state1 = ddlstate.SelectedItem.Text;
            string city1 = ddlcity.SelectedItem.Text;

            int reply = insertfb(fname, femail, fsub, fmsg, contry1, state1, city1);
            if (reply > 0)
            {
                sendemail(fname, femail, fsub, fmsg);
                string alert = "alert('Your Feed Back is Submitted Successfully')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);
                txtcomments.Text = "";
                txtEmailid.Text = "";
                txtfname.Text = "";
                Txtsubject.Text = "";
                ddlcountry.SelectedIndex = -1;
                ddlstate.SelectedIndex = -1;
                ddlcity.SelectedIndex = -1;
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }

    public int insertfb(string fname, string femail, string fsub, string fmsg, string contry1, string state1, string city1)
    {
        DateTime dt = System.DateTime.Now;
        int x = 0;
        con.Open();
        SqlCommand cmd = new SqlCommand("insertfdb", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@fname", fname));
        cmd.Parameters.Add(new SqlParameter("@femail", femail));
        cmd.Parameters.Add(new SqlParameter("@fsubject", fsub));
        cmd.Parameters.Add(new SqlParameter("@fmessage", fmsg));
        cmd.Parameters.Add(new SqlParameter("@fdate", dt));
        cmd.Parameters.Add(new SqlParameter("@contry1", contry1));
        cmd.Parameters.Add(new SqlParameter("@state1", state1));
        cmd.Parameters.Add(new SqlParameter("@city1", city1));
        x = cmd.ExecuteNonQuery();
        con.Close();
        return x;

    }
    private void sendemail(string fname, string femail, string fsub, string fmsg)
    {
        try
        {
            string Subject = "IndusEmail Feedback :" + fsub;
            string msgbody = "";

            msgbody = msgbody + "<table cellpadding='3' cellspacing='15' class='lable2'>";
            msgbody = msgbody + "<tr><td colspan='3' style='background:url(" + ConfigurationManager.AppSettings["siteurl"] + "images/logo.png) no-repeat;height:92px;width:420px'></td></tr>";
            msgbody = msgbody + "<tr>";
            msgbody = msgbody + "<td colspan='3' align='center' class='headings'>Feed Back Information of " + fname + " for Indus Email";
            msgbody = msgbody + "<tr>";
            msgbody = msgbody + "<td class='lable1'>My Name</td>";
            msgbody = msgbody + "<td>:</td>";
            msgbody = msgbody + "<td class='lable1'>" + fname + "</td>";
            msgbody = msgbody + "</tr>";
            msgbody = msgbody + "<tr>";
            msgbody = msgbody + "<td class='lable1'>My Email ID</td>";
            msgbody = msgbody + "<td>:</td>";
            msgbody = msgbody + "<td class='lable1'>" + femail + "</td>";
            msgbody = msgbody + "</tr>";
            msgbody = msgbody + "<tr>";
            msgbody = msgbody + "<td class='lable1'>My Feed Back</td>";
            msgbody = msgbody + " <td>:</td>";
            msgbody = msgbody + "<td class='lable1'>" + fmsg + "</td>";
            msgbody = msgbody + "</tr></table>";


            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection();
            values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
            values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
            values.Add("from", femail);
            values.Add("from_name", fname);
            values.Add("subject", Subject);
            values.Add("body_html", msgbody);
            values.Add("to", "info@indusemail.com");
            byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);

        }
        catch (Exception ex)
        {
            ex.Message.ToString();

        }


    }
    protected void imgReset_Click(object sender, ImageClickEventArgs e)
    {
        txtcomments.Text = "";
        txtEmailid.Text = "";
        txtfname.Text = "";
        Txtsubject.Text = "";
        ddlcountry.SelectedIndex = -1;
        ddlstate.SelectedIndex = -1;

        ddlcity.SelectedIndex = -1;

    }
  
   
}
