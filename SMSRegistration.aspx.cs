using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class SMSRegistration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    Registration obj = new Registration();
    string strscript = string.Empty;
    string Msg = string.Empty;
    DataSet dscheck = new DataSet();
    static string excep_page = "SMSRegistration.aspx";
    exception err = new exception();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Create_Click(object sender, EventArgs e)
    {
        try
        {
            obj.Reg_fname = Name.Text;
            obj.Reg_email = Email.Text;
            obj.Reg_password = Password.Text;
            obj.Reg_compurl = Company.Text;
            obj.Reg_phone = Phone.Text;
          //  obj.Reg_pdate = System.DateTime.Now.ToString("dd/MM/yyyy");
            obj.Reg_pdate = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            obj.Reg_lname = txtsurname.Text;
            obj.Reg_address = TextBox1.Text;


            obj.Insert_registrationdetails(obj.Reg_fname, obj.Reg_email, obj.Reg_password, obj.Reg_compurl, obj.Reg_phone, obj.Reg_pdate, obj.Reg_lname, obj.Reg_address);
            Random rd = new Random();
            Label lblsms = new Label();
            lblsms.Text = Convert.ToString(rd.Next(10000));
            SMSCAPI objSms = new SMSCAPI();
            objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), obj.Reg_phone, "Your IndusSMS Verification Code is " + lblsms.Text + "");
            Msg += "Dear " + obj.Reg_fname + ",";
            Msg = Msg + "<table cellpadding='3' cellspacing='15' class='lable2'>";
            Msg = Msg + "<tr><td colspan='3' style='background:url(" + ConfigurationManager.AppSettings["siteurl"] + "images/logo.png) no-repeat;height:92px;width:420px'></td></tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td colspan='3' align='center' class='headings'>Registration Information of Indussms ";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td class='lable1'> Name</td>";
            Msg = Msg + "<td>:</td>";
            Msg = Msg + "<td class='lable1'>" + obj.Reg_fname + "</td>";
            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td class='lable1'> Email ID</td>";
            Msg = Msg + "<td>:</td>";
            Msg = Msg + "<td class='lable1'>" + obj.Reg_email + "</td>";
            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td class='lable1'> Password</td>";
            Msg = Msg + "<td>:</td>";
            Msg = Msg + "<td class='lable1'>" + obj.Reg_password + "</td>";
            Msg = Msg + "</tr>";
            Msg = Msg + "<tr>";
            Msg = Msg + "<td class='lable1'> Phone No</td>";
            Msg = Msg + "<td>:</td>";
            Msg = Msg + "<td class='lable1'>" + obj.Reg_phone + "</td>";
            Msg = Msg + "</tr></table>";

            Session["code"] = lblsms.Text;
            obj.SendMailToUser("info@indussms.com", obj.Reg_email, " Your registraion details for Indussms ", Msg);

            Response.Redirect("Mobile verification.aspx?mblno=" + obj.Reg_phone + "&pwd=" + obj.Reg_password + "&username=" + obj.Reg_fname + "&email="+obj.Reg_email+"");

    

            txtsurname.Text = "";
            Name.Text = ""; Email.Text = "";
            Password.Text = "";
            ConfirmPassword.Text = "";
            Company.Text = "";
            Phone.Text = "";
            TextBox1.Text = "";
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
        
    }

  
    protected void Email_TextChanged(object sender, EventArgs e)
    {
        dscheck.Clear();
        dscheck = obj.checkemail(Email.Text);
        if (dscheck.Tables[0].Rows.Count > 0)
        {
            regemail.Visible = true;
            regemail.Text = "Email id already existed";
            Email.Text = "";
        }
        else
        {
            regemail.Visible = true;
            regemail.Text = "Email id available";
        }
    }
    protected void Phone_TextChanged(object sender, EventArgs e)
    {
        dscheck.Clear();
        dscheck = obj.checkmobile(Phone.Text);
        if (dscheck.Tables[0].Rows.Count > 0)
        {
            regphone.Visible = true;
            regphone.Text = "Mobile number already existed";
            Phone.Text = "";
        }
        else
        {
            regphone.Visible = true;
            regphone.Text = "Mobile number is available";
        }
    }
    protected void Button2_Click(object sender, ImageClickEventArgs e)
    {

    }
}
