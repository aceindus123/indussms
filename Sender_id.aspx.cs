using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Indussms;
using Indussms.DataAccessLayer;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;

public partial class Default3 : System.Web.UI.Page
{
    Registration reg = new Registration();
    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;
    string strscript = string.Empty;
    DataSet ds1   = new DataSet();
    byte[] buffer;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
        }
        else
        {
            Response.Redirect("SMSLogin.aspx");

        }

        if (Session["User"] != "")
        {
            DataSet ds = reg.databind(Convert.ToString(Session["User"]));
            sndid.Visible = false;
            gvview.Visible = true;
            binddata();

        }
    }
    protected void binddata()
    {
       string uname = Convert.ToString(Session["User"]);
        string qry = "select * from sendername where username='" + uname + "'";

        //SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter ad = new SqlDataAdapter(qry, con);
        ad.Fill(ds1);
        gv1.DataSource = ds1;
        gv1.DataBind();
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        //string sp = "indussms";
        string ss = "deactive";
        string s = txtsender.Text;
        string date = Convert.ToString(DateTime.Now);
        string user1 = Convert.ToString(Session["User"]);
        if (FileUpload1.HasFile)
        {
            try
            {
                string Uname = Convert.ToString(Session["User"]);
                if (FileUpload1.HasFile && FileUpload2.HasFile)
                {
                    string imagename = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string dnddocname = System.IO.Path.GetFileName(FileUpload2.PostedFile.FileName);
                    string ext = Path.GetExtension(dnddocname);
                    string ext1 = Path.GetExtension(imagename);
                    string contenttype = string.Empty;
                    string contenttype1 = string.Empty;
                    //string curFile = VideoName;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from sendername where imagename=@imagename", con);
                    cmd.Parameters.AddWithValue("@imagename", imagename);
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        string str = "alert('File Name Exits.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }

                    else
                    {
                        con.Close();
                    }

                    switch (ext)
                    {


                        case ".jpg":

                            contenttype = "image/jpg";
                           

                            break;

                        case ".png":

                            contenttype = "image/png";
                            
                            break;

                        case ".gif":

                            contenttype = "image/gif";
                            
                            break;

                        case ".jpeg":

                            contenttype = "image/jpeg";
                            
                            break;

                        case ".pdf":

                            contenttype = "application/pdf";
                            
                            break;

                    }
                    switch (ext1)
                    {


                        case ".jpg":

                            contenttype1 = "image/jpg";
                           

                            break;

                        case ".png":

                            contenttype1 = "image/png";
                            
                            break;

                        case ".gif":

                            contenttype1 = "image/gif";
                            
                            break;

                        case ".jpeg":

                            contenttype1 = "image/jpeg";
                            
                            break;

                        case ".pdf":

                            contenttype1 = "application/pdf";
                            
                            break;
                    }





                    if (contenttype != String.Empty && contenttype1 != String.Empty)
                    {
                        HttpPostedFile file = FileUpload1.PostedFile;
                        HttpPostedFile file1 = FileUpload2.PostedFile;
                        //retrieve the HttpPostedFile object
                        buffer = new byte[file.ContentLength];
                        // string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
                        // FileUpload1.SaveAs(Server.MapPath("Documents/" + imagename));
                        //string imagepath = Base_dir + "Documents/" + imagename;
                        string imagepath = Server.MapPath("Documents/" + imagename);
                        string dnddocpath = Server.MapPath("Documents/" + dnddocname);
                        //string vpath = Base_dir + "Voicesms/" + VideoNa
                        FileUpload1.SaveAs(imagepath);
                        FileUpload2.SaveAs(dnddocpath);
                        //string vpath = Server.MapPath("~/viedios/" + VideoName);
                        string imagetype = FileUpload1.PostedFile.ContentType;
                        string dnddoctype = FileUpload2.PostedFile.ContentType;
                        cmd = new SqlCommand("Insertimage", con);
                        // SqlCommand cmd = new SqlCommand("insert into VoiceSms(SmsName,Voicepath,Voicesmstype,Username) values(@SmsName,@Voicepath,@Voicesmstype,@Username)", sqlConnection);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@imagename", imagename);
                        cmd.Parameters.AddWithValue("@imagepath", imagepath);
                        cmd.Parameters.AddWithValue("@imagetype", imagetype);
                        cmd.Parameters.AddWithValue("@username", user1);

                        cmd.Parameters.AddWithValue("@sendername", s);
                        cmd.Parameters.AddWithValue("@postdate", date);
                        cmd.Parameters.AddWithValue("@status", ss);
                        cmd.Parameters.AddWithValue("@dnddocname", dnddocname);
                        cmd.Parameters.AddWithValue("@dnddocpath", dnddocpath);
                        cmd.Parameters.AddWithValue("@dnddoctype", dnddoctype);
                        con.Open();
                        int i = cmd.ExecuteNonQuery();

                        //  sqlConnection.Close();
                        if (i == 1)
                        {
                            string str = "alert('Documents Uploaded successfully.');location.replace('Sender_id.aspx') ;";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                            //Response.Redirect("Sender_id.aspx");
                        }
                        else
                        {
                            string str = "alert('Documents Not inserted.');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        }


                        con.Close();
                    }
                    else
                    {
                        string str = "alert('Please Upload file in Specified Formats.');location.replace('Sender_id.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
            }
            catch (Exception ex)
            {
                //err.insert_exception(ex, excep_page);
            }
        }
    }
    
  
    protected void buynow_Click(object sender, EventArgs e)
    {
        sndid.Visible = true;
        details.Visible = false;
        gvview.Visible = false;
        instructions.Visible = true;
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        gv1.DataBind();
        binddata();
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactBook.aspx");
    }
    protected void dwnld_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select name, type, data from dnddoc ";
        //cmd.Parameters.AddWithValue("@id", did);
        cmd.Connection = con;
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Response.ContentType = dr["type"].ToString();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + dr["name"] + "\"");
            Response.BinaryWrite((byte[])dr["data"]);
            Response.End();
        }
    }
}