using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Collections.Specialized;
using System.Text;

public partial class admin_Users : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet dsadmin = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            if (!IsPostBack)
            {
                BindData();
              
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    public void BindData() 
    {
        SqlDataAdapter da = new SqlDataAdapter("Select  *,case  when  mobilestatus  =  1 then  'Active'  else  'Deactive'  end  as  txtstatus from   Registration", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvusers.DataSource = ds;
        gvusers.DataBind();
    }

    protected void  PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvusers.PageIndex = e.NewPageIndex;
        gvusers.DataBind();
        BindData();
    }

    protected DataSet Permission()
    {
        if (Session["login"] != null)
        {
            string admin = "Select * from c_adminlogin where usertype='" + Session["usertype"].ToString() + "' and username='" + Session["login"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, sqlConnection);
            dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            return dsadmin;
        }
        else
        {
            return null;
        }
    }

    protected void ListName(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["viewclient"].ToString() == "1")
            {

                int listid;
                try
                {
                    string list_id;
                    list_id = e.CommandArgument.ToString();
                    listid = Convert.ToInt32(list_id);
                    Session["listid"] = listid;

                    string disable = "Select  * from  Registration where rid=" + listid + "";
                    SqlDataAdapter sda = new SqlDataAdapter(disable, sqlConnection);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);

                    txtid.Text = ds.Tables[0].Rows[0]["rid"].ToString();
                    txtfname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                    txtlname.Text = ds.Tables[0].Rows[0]["lname"].ToString();
                    txtmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    txtpwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
                    txtphno.Text = ds.Tables[0].Rows[0]["phno"].ToString();
                    txturl.Text = ds.Tables[0].Rows[0]["companyurl"].ToString();
                    txtpdate.Text = ds.Tables[0].Rows[0]["pdate"].ToString();
                    ModalPopup1.Show();
                }
                catch (Exception ex)
                {

                }
            }
            else
            {
                ModalPopup1.Hide();
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }


    }

    protected void ListName1(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["statausclient"].ToString() == "1")
            {
                int listid;
                try
                {
                    string list_id;
                    list_id = e.CommandArgument.ToString();
                    listid = Convert.ToInt32(list_id);

                    string disable = "Select  *,case  when  mobilestatus  =  1 then  'Active'  else  'Deactive'  end  as  txtstatus from  Registration where rid=" + listid + "";
                    SqlDataAdapter sda = new SqlDataAdapter(disable, sqlConnection);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        if (Convert.ToString(ds.Tables[0].Rows[0]["txtstatus"]) == "Active")
                        {
                                sqlConnection.Open();
                                string disable1 = "update Registration set mobilestatus=0 where rid=" + listid + "";
                                SqlCommand cmd = new SqlCommand(disable1, sqlConnection);
                                cmd.ExecuteNonQuery();
                                sqlConnection.Close();

                                string strScript = "alert('Client status Deactive');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        }
                        else
                        {
                            if (Convert.ToString(ds.Tables[0].Rows[0]["txtstatus"]) == "Deactive")
                            {
                                sqlConnection.Open();
                                string disable1 = "update Registration set mobilestatus=1 where rid=" + listid + "";
                                SqlCommand cmd = new SqlCommand(disable1, sqlConnection);
                                cmd.ExecuteNonQuery();
                                sqlConnection.Close();

                                string strScript = "alert('Client status Active');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            }
 
                        }
                    }
                    BindData();

                }
                catch (Exception ex)
                {

                }
            }
            else
            {
                ModalPopup1.Hide();
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void btnupdate_click(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["Updateclient"].ToString() == "1")
            {
                string id = txtid.Text;
                string name = txtfname.Text;
                string lname = txtlname.Text;
                string emailid = txtmail.Text;
                string password = txtpwd.Text;
                string phone = txtphno.Text;
                string curl = txturl.Text;
                string regdate = txtpdate.Text;

                string sql = "update  Registration set fname='" + name + "',lname='" + lname + "',email='" + emailid + "',password='" + password + "',phno='" + phone + "',companyurl='" + curl + "',pdate='" + regdate + "' where rid=" + id;
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(sql, sqlConnection);
                int i = cmd.ExecuteNonQuery();
                sqlConnection.Close();
                if (i == 1)
                {
                    string str = "alert('Client Details Updated Successfully');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                else
                {
                    string str = "alert('Plese Enter Correct Fields');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                sqlConnection.Close();
                sendamil(name, lname, emailid, password, phone, curl, regdate);
                BindData();
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private void sendamil(string name, string lname, string emailid, string password, string phone, string curl, string regdate)
    {
        string Body = " Hi " + name + ",<br/>Welcome to IndusSms, Sms marketing from Aceindus.<br/><br/>";
        Body += "<u>Your Account Details Modified By Admin For Security Reasons</u><br/><br/>";
        Body += "<b>Your Last Name :</b> " + lname + "<br/>";
        Body += "<b>Your Username :</b> " + emailid + "<br/>";
        Body += "<b>Password :</b> " + password + "<br/>";
        Body += "<b>Mobile Number :</b> " + phone + "<br/>";
        Body += "<b>Company :</b> " + curl + "<br/>";
        Body += "<b>Registered Date :</b> " + regdate + "<br/>";

        Body += "You Can Login here <a href=" + ConfigurationManager.AppSettings["ApplicationURL"] + "SMSLogin.aspx >here</a>";

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
        values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
        values.Add("from", "info@indussms.com");
        values.Add("from_name", "IndusSms");
        values.Add("subject", " IndusSms Account  Information");
        // values.Add("time_offset_minutes", "");
        values.Add("body_html", Body);
        values.Add("to", emailid);
        try
        {
            byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
            string res = Encoding.UTF8.GetString(response);
        }

        catch (Exception ex)
        {
            Response.Redirect("" + ex);
        }
    }

    protected void Active1(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["deleteclient"].ToString() == "1")
            {
                GridViewRow active = (GridViewRow)((LinkButton)sender).NamingContainer;
                GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
                string id = ((Label)gvRow.FindControl("lblid")).Text;

                string sql = "Delete   Registration  where rid=" + id;
                SqlCommand cmd = new SqlCommand(sql, sqlConnection);
                sqlConnection.Open();
              int i = cmd.ExecuteNonQuery();
                sqlConnection.Close();
                if (i == 1)
                {
                    string str = "alert('Client Deleted Successfully');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                else
                {
                    string str = "alert('Error Occured ! Please Try Again');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
        BindData();
    }
  }