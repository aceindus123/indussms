using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class Uploadvoicesms : System.Web.UI.Page
{
    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;
    byte[] buffer;
    static string excep_page = "Uploadvoicesms.aspx";
    exception err = new exception();
    Registration reg = new Registration();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            string id = Convert.ToString(Session["User"]);

            DataSet voiceamt = reg.voiceamount(id);

            lblamount.Text = voiceamt.Tables[0].Rows[0]["amountleft"].ToString() + " INR";
            string path = Path.GetFileName(Request.PhysicalPath);
            switch (path)
            {
                case "Compose VoiceSMS.aspx": linkcall.CssClass = "active";
                    break;
                case "Uploadvoicesms.aspx": linkupload.CssClass = "active";
                    break;
                case "TextToSpeech.aspx": linksppech.CssClass = "active";
                    break;
                case "VoiceClips.aspx": linkclips.CssClass = "active";
                    break;

            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void linkcall_Click(object sender, EventArgs e)
    {
        Response.Redirect("Compose VoiceSMS.aspx");
    }
    protected void linkupload_Click(object sender, EventArgs e)
    {
        Response.Redirect("Uploadvoicesms.aspx");
    }
    protected void linksppech_Click(object sender, EventArgs e)
    {
        Response.Redirect("TextToSpeech.aspx");
    }
    protected void linkclips_Click(object sender, EventArgs e)
    {
        Response.Redirect("VoiceClips.aspx");
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            Int32 maxSize = 4194304;
            Int32 filesize = FileUpload1.PostedFile.ContentLength;
            string Uname = Convert.ToString(Session["User"]);
            if (FileUpload1.HasFile)
            {
                if (filesize <= maxSize)
                {

                    string VideoName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    //string curFile = VideoName;

                    sqlConnection.Open();
                    SqlCommand cmd = new SqlCommand("select * from VoiceSms where SmsName=@VideoName", sqlConnection);
                    cmd.Parameters.AddWithValue("@VideoName", VideoName);
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        string str = "alert('File Name Exits.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }


                    else
                    {
                        sqlConnection.Close();
                        HttpPostedFile file = FileUpload1.PostedFile;
                        //retrieve the HttpPostedFile object
                        buffer = new byte[file.ContentLength];
                        string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
                        string vpath = Base_dir + "VoiceSms/" + VideoName;
                        //string vpath = Base_dir + "Voicesms/" + VideoName;
                        FileUpload1.SaveAs(vpath);
                        //string vpath = Server.MapPath("~/viedios/" + VideoName);
                        string VideoContentType = FileUpload1.PostedFile.ContentType;
                        cmd = new SqlCommand("Insertvoice", sqlConnection);
                        // SqlCommand cmd = new SqlCommand("insert into VoiceSms(SmsName,Voicepath,Voicesmstype,Username) values(@SmsName,@Voicepath,@Voicesmstype,@Username)", sqlConnection);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SmsName", VideoName);
                        cmd.Parameters.AddWithValue("@Voicepath", vpath);
                        cmd.Parameters.AddWithValue("@Voicesmstype", VideoContentType);
                        cmd.Parameters.AddWithValue("@Username", Uname);
                        sqlConnection.Open();
                        int i = cmd.ExecuteNonQuery();
                        //  sqlConnection.Close();
                        if (i == 1)
                        {
                            string str = "alert('File Uploaded successfully.');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                            Response.Redirect("VoiceClips.aspx");
                        }
                        else
                        {
                            string str = "alert('File Not Uploaded');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        }
                    }




                    sqlConnection.Close();
                }
                //else 
                //{
                //    string str = "alert('please select file.');";
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                //}


                else
                {
                    string str = "alert('Please Select File Within 4MB.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
            }
        }



        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {

        if (FileUpload1.PostedFile.ContentLength <= 4194304)
        {

            args.IsValid = false;

        }

        else
        {

            args.IsValid = true;

        }

    }

 
   
}