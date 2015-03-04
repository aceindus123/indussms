using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Drawing;
using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.IO;



public partial class admin_Permissions : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds = new DataSet();
   
    SqlCommand cmd = new SqlCommand();
    string id;
    DataSet dsadmin;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            if (!IsPostBack)
            {
                bindData();
               
                //string dw = reg.imagedwnld(id);
                //lnkdwnld1.Text = dw;
             //  bind();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void bindData()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from sendername", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvpermission.DataSource = ds;
        gvpermission.DataBind();
    }

    protected void gvpermission_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvpermission.PageIndex = e.NewPageIndex;
        gvpermission.DataBind();
        bindData();
    }


   

    protected string GetImageString64(byte[] image)
    {
        string base64string = Convert.ToBase64String(image, 0, image.Length);
        return "data:image/jpeg;base64," + base64string;
    }

    public DataSet bind(int a)
    {
        SqlDataAdapter da = new SqlDataAdapter(" SELECT  imagename,imagepath,sendername,username,sid from sendername where sid="+a, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        
     //   ddl1.DataSource = ds;
     //   ddl1.DataBind();


        if (ds.Tables[0].Rows.Count > 0)
        {

            string sa = Convert.ToString(ds.Tables[0].Rows[0]["imagename"]);
            lnkdwnld1.Text = sa;
            
              //Image2.ImageUrl = "~/Documents/" + sa;
        }
        else
        {
            string strScript = "alert('No Images Found This position');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        }
        return ds;
    }

    private void sendamil(string tomail, string b, string c)
    {
        string Body = " Hi smscountry.com,<br/><br/>My User Id is aceindus.<br/><br/> Please Aceept my sender id as early as possible<br/><br/>";
        Body += "<b>Sender Id name :</b> " + c + "<br/><br/>";

        Body += "<b>Please see below Attachment Document <br/>";

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", ConfigurationManager.AppSettings["ElasticUsername"].ToString());
        values.Add("api_key", ConfigurationManager.AppSettings["ElasticAPI"].ToString());
        values.Add("from", "info@indussms.com");
        values.Add("from_name", "IndusSms");
        values.Add("subject", "userid(aceindus) senderid request");
        // values.Add("time_offset_minutes", "");
        values.Add("body_html", Body);
        values.Add("to", tomail);
        b = UploadAttachment(b, "Document.jpg");
        values.Add("Attachment", b);
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

    public static string UploadAttachment(string filepath, string filename)
    {
        FileStream stream = File.OpenRead(filepath);
        WebRequest request = WebRequest.Create("https://api.elasticemail.com/attachments/upload?username=" + ConfigurationManager.AppSettings["ElasticUsername"].ToString() + "&api_key=" + ConfigurationManager.AppSettings["ElasticAPI"].ToString() + "&file=" + filename);
        request.Method = "PUT";
        request.ContentLength = stream.Length;
        Stream outstream = request.GetRequestStream();
        stream.CopyTo(outstream, 4096);
        stream.Close();
        WebResponse response = request.GetResponse();
        string result = new StreamReader(response.GetResponseStream(), Encoding.UTF8).ReadToEnd();
        response.Close();
        return result;
    }

    protected void ListName(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["permissionview"].ToString() == "1")
            {

                int listid;
                try
                {
                    string list_id;
                    list_id = e.CommandArgument.ToString();
                    listid = Convert.ToInt32(list_id);
                    Session["listid"] = listid;

                    string disable = "Select  * from  sendername where sid=" + listid + "";
                    SqlDataAdapter sda = new SqlDataAdapter(disable, sqlConnection);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);

                    txtfname.Text = ds.Tables[0].Rows[0]["sendername"].ToString();
                    lnkdwnld2.Text = ds.Tables[0].Rows[0]["dnddocname"].ToString();
                    //lnkdwnld1.Text = ds.Tables[0].Rows[0]["imagename"].ToString();
                  //  txtlname.Text = ds.Tables[0].Rows[0]["data"].ToString();
                   DataSet ds1= bind(listid);
                   DataSet ds2 = binddata(listid);
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
            if (dsadmin.Tables[0].Rows[0]["permissionaccept"].ToString() == "1")
            {
                int listid;
                try
                {
                    string list_id;
                    list_id = e.CommandArgument.ToString();
                    listid = Convert.ToInt32(list_id);

                    string disable = "Select  * from  sendername where sid=" + listid + "";
                    SqlDataAdapter sda = new SqlDataAdapter(disable, sqlConnection);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        if (Convert.ToString(ds.Tables[0].Rows[0]["status"]) == "active")
                        {
                            sqlConnection.Open();
                            string disable1 = "update sendername set status='deactive' where sid=" + listid + "";
                            SqlCommand cmd = new SqlCommand(disable1, sqlConnection);
                            cmd.ExecuteNonQuery();
                            sqlConnection.Close();

                            string strScript = "alert('Client status Deactive');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        }
                        else
                        {
                            if (Convert.ToString(ds.Tables[0].Rows[0]["status"]) == "deactive")
                            {
                                sqlConnection.Open();
                                string disable1 = "update sendername set status='active' where sid=" + listid + "";
                                SqlCommand cmd = new SqlCommand(disable1, sqlConnection);
                                cmd.ExecuteNonQuery();
                                sqlConnection.Close();

                                string strScript = "alert('Client status Active');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                            }

                        }
                    }
                    bindData();

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

   

    protected void Active(object sender, EventArgs e)
    {
        dsadmin  = Permission();
        string s2 = dsadmin.Tables[0].Rows[0]["permissionaccept"].ToString();
        if (s2 == "1")
        {
            GridViewRow active = (GridViewRow)((LinkButton)sender).NamingContainer;
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            string id = ((Label)gvRow.FindControl("lblid")).Text;
            if (((LinkButton)sender).Text == "Deactive")
            {
                SqlCommand cmd = new SqlCommand("sppermissionstatus1", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sid", SqlDbType.VarChar).Value = id;
                sqlConnection.Open();
                int i = cmd.ExecuteNonQuery();
                sqlConnection.Close();
                if (i == 1)
                {
                    string str = "alert('User Status Deactive.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                else
                {
                    string str = "alert('User Status Not Deactive .');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }

            }
            else if (((LinkButton)sender).Text == "Active")
            {
                SqlCommand cmd = new SqlCommand("sppermissionstatus", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sid", SqlDbType.VarChar).Value = id;
                sqlConnection.Open();
                int i = cmd.ExecuteNonQuery();
                sqlConnection.Close();
                if (i == 1)
                {
                    string str = "alert('User Status Active.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                else
                {
                    string str = "alert('User Status Not Active .');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
            bindData();
        }
        else
        {
            string script = "alert('No Permission.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void gvpermission_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
            try
            {
                dsadmin  = Permission();
                string s1 = dsadmin.Tables[0].Rows[0]["permissiondelete"].ToString();
                if (s1 == "1")
                {
                    int id = int.Parse(gvpermission.DataKeys[e.RowIndex].Value.ToString());
                    SqlCommand cmd = new SqlCommand("delete from sendername where sid=" + id, sqlConnection);
                    cmd.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                    sqlConnection.Close();
                    Response.Write("<script> alert('Deleted Record.') </script>");
                    gvpermission.EditIndex = -1;
                    bindData();
                }
                else
                {
                    string script = "alert('No Permission.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
    }

    public DataSet Permission()
    {
        if (Session["login"] != null)
        {
            string admin = "Select * from c_adminlogin where usertype='" + Session["usertype"].ToString() + "' and username='" + Session["login"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, sqlConnection);
            dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            return dsadmin;
            // Session["dsadmin"] = dsadmin;
        }
        else
        {
            return null;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["permissionforward"].ToString() == "1")
            {
                int listid = Convert.ToInt32(Session["listid"]);
                DataSet ds = bind(listid);
                string b = ds.Tables[0].Rows[0]["imagepath"].ToString();
                string ba = ds.Tables[0].Rows[0]["dnddocpath"].ToString();
                string a = "";
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string sa = Convert.ToString(ds.Tables[0].Rows[0]["imagename"]);
                    string sb = Convert.ToString(ds.Tables[0].Rows[0]["dnddocname"]);
                    
                    //Image2.ImageUrl = "indussms.com/Documents/" + sa;
                    //lnk1555.Text = Image2.ImageUrl;
                    a = lnk1555.Text;
                }

                string c = ds.Tables[0].Rows[0]["sendername"].ToString();
                string tomail = "anjimca2011@gmail.com";

                //sendamil(tomail, Image2.ImageUrl, c);

                string strScript = "alert('Documents Forwarded Successfully');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
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


    protected void downloadimg(object sender, EventArgs e)
    {

        int listid = Convert.ToInt32(Session["listid"]);
        DataSet ds = bind(listid);
        string filepath = ds.Tables[0].Rows[0]["imagepath"].ToString();
        string filename = ds.Tables[0].Rows[0]["imagename"].ToString();
        LinkButton lnkbtn = sender as LinkButton;
        Response.ContentType = Path.GetExtension(filepath);
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
        Response.TransmitFile(Server.MapPath("~/Documents/" + filename));
        Response.End();
    }
    public DataSet binddata(int dn)
    {
        SqlDataAdapter da = new SqlDataAdapter(" SELECT  dnddocname,dnddocpath,dnddoctype ,sendername,username,sid from sendername where sid=" + dn, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);

       

        if (ds.Tables[0].Rows.Count > 0)
        {

            string dnd = Convert.ToString(ds.Tables[0].Rows[0]["dnddocname"]);
            lnkdwnld2.Text = dnd;
            
        }
        else
        {

            string strScript = "alert('No Document  Found  In This position');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        }
        return ds;
    }
    protected void downloaddoc(object sender, EventArgs e)
    {

        int listid = Convert.ToInt32(Session["listid"]);
        DataSet ds = binddata(listid);
        string filepath = ds.Tables[0].Rows[0]["dnddocpath"].ToString();
        string filename = ds.Tables[0].Rows[0]["dnddocname"].ToString();
        LinkButton lnkbtn = sender as LinkButton;
        Response.ContentType = Path.GetExtension(filepath);
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
        Response.TransmitFile(Server.MapPath("~/Documents/" + filename));
        Response.End();
    }


}
