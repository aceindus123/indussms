using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

public partial class AccountInfo : System.Web.UI.Page
{
    Registration reg = new Registration();
    exception err = new exception();
    static string excep_page = "AccountInfo.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != "")
        {
            if (!IsPostBack)
            {
                DataSet ds = reg.databind(Convert.ToString(Session["User"]));

                if (ds.Tables[0].Rows[0]["pwdchange"].ToString() == null)
                {
                    lblpwd.Text = "Not Modified Upto Now";
                }
                else
                {
                    lblpwd.Text = ds.Tables[0].Rows[0]["pwdchange"].ToString();
                }
                int count = ds.Tables[0].Rows.Count;
                txtfname.Text = Convert.ToString(ds.Tables[0].Rows[0]["fname"]);
                txtlname.Text = Convert.ToString(ds.Tables[0].Rows[0]["lname"]);
                txtadd1.Text = Convert.ToString(ds.Tables[0].Rows[0]["address"]);
                txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email"]);
                txtphone.Text = Convert.ToString(ds.Tables[0].Rows[0]["phno"]);
                txtfname.ReadOnly = true;
                txtlname.ReadOnly = true;
                txtphone.ReadOnly = true;
                txtEmail.ReadOnly = true;
                txtadd1.ReadOnly = true;
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["User"] != "")
            {
                string a = txtfname.Text;
                string b = txtlname.Text;
                string c = txtadd1.Text;
                string d = txtEmail.Text;
                int x = reg.updateprofile(a, b, c, d, Convert.ToString(Session["User"]));
                string strScript;
                strScript = "alert('User details has been updated successfully.');location.replace('AccountInfo.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
            else
            {
                Response.Redirect("SMSLogin.aspx");
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }


    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AccountInfo.aspx");
    }

    protected void clear()
    {
        txtfname.Text = "";
        txtlname.Text = "";
        txtadd1.Text = "";
        txtEmail.Text = "";
        txtphone.Text = "";
    }
    protected void edit1_Click(object sender, EventArgs e)
    {
        txtfname.ReadOnly = false;
        txtlname.ReadOnly = false;
        txtphone.ReadOnly = true;
        txtEmail.ReadOnly = false;
        txtadd1.ReadOnly = false;

       
    }
    protected void update2_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Show();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            DataSet ds = reg.databind(Convert.ToString(Session["User"]));

            string password = ds.Tables[0].Rows[0]["password"].ToString();
            string toemail = ds.Tables[0].Rows[0]["email"].ToString();
            string subject = "Account Information";
            string oldpwd = txtprepwd.Text;
            string newpwd = Txtnewpwd.Text;
        //    string pdate = Convert.ToString(DateTime.Now);
            string pdate = System.DateTime.Now.ToString();

            string frm = "info@indussms.com";
            string username = Convert.ToString(Session["User"]);


            if (password == oldpwd)
            {
                int x = reg.updateprofile1(username, pdate, newpwd);
                string Body = string.Empty;

                Body = Body + "<table cellpadding='3' cellspacing='15' class='lable2'>";
                Body = Body + "<tr><td colspan='3' style='background:url(" + ConfigurationManager.AppSettings["siteurl"] + "images/logo.png) no-repeat;height:92px;width:420px'></td></tr>";
                Body = Body + "<tr>";
                Body = Body + "<td align='center' colspan='3' class='headings'>This Email is sending for your Indus SMS account security purpose..";
                Body = Body + "<tr>";
                Body = Body + "<td align='center' colspan='3' class='headings'>Dear user Your password has been changed now.Please check your Account details";
                Body = Body + "<tr>";
                Body = Body + "<td align='center' colspan='3' class='headings'>Your Account details are:";
                Body = Body + "<tr>";
                Body = Body + "<td class='lable1'>User Name</td>";
                Body = Body + "<td>:</td>";
                Body = Body + "<td class='lable1'>" + username + "</td>";
                Body = Body + "</tr>";
                Body = Body + "<tr>";
                Body = Body + "<td class='lable1'>Your Previous Password</td>";
                Body = Body + "<td>:</td>";
                Body = Body + "<td class='lable1'>" + oldpwd + "</td>";
                Body = Body + "</tr>";
                Body = Body + "<tr>";
                Body = Body + "<td class='lable1'>Your new password</td>";
                Body = Body + "<td>:</td>";
                Body = Body + "<td class='lable1'>" + newpwd + "</td>";
                Body = Body + "</tr>";
                Body = Body + "<tr>";
                Body = Body + "<td align='center' colspan='3' class='headings'>These changes made on: " + pdate + "";
                Body = Body + "<tr>";
                Body = Body + "<td align='center' colspan='3' class='headings'>Please Check your account by <a href=" + ConfigurationManager.AppSettings["siteurl"] + " >Login here</a>";
                Body = Body + "<tr>";
                Body = Body + "<td align='center' colspan='3' class='headings'>";
                Body = Body + "</tr></table>";

                reg.sendAdditionalEmail(frm, username, Body, toemail, subject);

                string allert = "alert(' Password changed successfully.');location.replace('AccountInfo.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", allert, true);
            }
            else
            {
                string allert = "alert(' Current password that you are entered is wrong');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", allert, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }
    protected void ImageBtncancel_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AccountInfo.aspx");

    }
}