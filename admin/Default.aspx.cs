using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class admin_Default : System.Web.UI.Page
{
    string username = string.Empty;
    string Cusername = string.Empty;
    string Cpwd = string.Empty;
    string usertype1 = string.Empty;
    string Id = string.Empty;
    string users = string.Empty;
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Abandon();
        }
    }
    protected void btnlogin_Click(object sender, ImageClickEventArgs e)
    {
        connection.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter sql1 = new SqlDataAdapter("Select *  from c_adminlogin where usertype='" + ddlUsertype.SelectedItem.Text + "' and country='" + ddlCountry.SelectedItem.Text + "' and username='" + txtuname.Text + "' and password='" + txtpwd.Text + "'", connection);
        sql1.Fill(ds);

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            if (Convert.ToString(ds.Tables[0].Rows[0]["status"]) == "Activated")
            {
                Cusername = ds.Tables[0].Rows[0]["username"].ToString();
                usertype1 = ds.Tables[0].Rows[0]["usertype"].ToString();
                Cpwd = ds.Tables[0].Rows[0]["password"].ToString();
                Id = ds.Tables[0].Rows[0]["id"].ToString();

                Session["Authentication"] = "true";
                Session.Add("UId", Id);
                Session.Add("login", Cusername);
                Session.Add("usertype", usertype1);
                Session.Add("Pwd", Cpwd);

                Response.Redirect("Admin-Menu.aspx");
            }

            else
            {
                string strScript = "alert('Please Enter Correct User Credentials');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                ddlCountry.SelectedIndex = -1;
                ddlUsertype.SelectedIndex = -1;
                txtuname.Text = "";
                txtpwd.Text = "";
            }
        }
        else
        {
            string strScript = "alert('You are Not Authorised user');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }

        connection.Close();
        //if (Login(UserID.Text, Password.Text))
        //{
        //    Session["login"] = UserID.Text;
        //    Response.Redirect("Admin-Menu.aspx");
        //}
        //else
        //{
        //    string script = "alert('You dont have Access to this Account')";
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        //}
    }
    //private bool Login(string User, string Passwd)
    //{
    //    if (User == "admin" && Passwd == "Mnhbs@1299")
    //    {
    //        return true;
    //    }
    //    else
    //    {
    //        return false;
    //    }
    //}
}