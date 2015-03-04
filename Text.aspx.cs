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
using SpeechLib;
using System.Windows.Forms;
using System.Threading;


public partial class Text : System.Web.UI.Page
{
    SpFileStream spFileStream = new SpFileStream();
    SpeechStreamFileMode spFileMode =
    SpeechStreamFileMode.SSFMCreateForWrite;
    // SpObjectTokenClass my_SpObjToken = new SpObjectTokenClass();
    SpeechVoiceSpeakFlags my_Spflag = SpeechVoiceSpeakFlags.SVSFlagsAsync;
    SpVoice my_Voice = new SpVoice();
    static string excep_page = "Text.aspx";
    exception err = new exception();
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnconvert_Click(object sender, EventArgs e)
    {
        try
        {
            string Uname = Convert.ToString(Session["User"]);
            if (Session["User"] != null)
            {
                SaveFileDialog savefile = new SaveFileDialog();
                savefile.Filter = "mp3 files (*.mp3)|*.mp3";
                savefile.Title = "Save  file";
                savefile.FilterIndex = 2;
                savefile.RestoreDirectory = true;
                DialogResult res = STAShowDialog(savefile);
                if ((res == DialogResult.OK))
                {
                    //buffer = new byte[savefile.FileName.ContentLength];
                    string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
                    string audioname = System.IO.Path.GetFileName(savefile.FileName);
                    string path = Base_dir + "VoiceSms/" + audioname;
                    string type = "mp3";
                    string vpath = savefile.FileName;
                    spFileStream.Open(savefile.FileName, spFileMode, false);
                    my_Voice.AudioOutputStream = spFileStream;
                    my_Voice.Speak(txtsms.Text, my_Spflag);
                    my_Voice.WaitUntilDone(-1);
                    spFileStream.Close();
                    sqlConnection.Open();
                    SqlCommand cmd = new SqlCommand("select * from VoiceSms where SmsName=@audioname", sqlConnection);
                    cmd.Parameters.AddWithValue("@audioname", audioname);
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        string str = "alert('File Name Exits And This Saved In Your System.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                    else
                    {
                        sqlConnection.Close();
                        cmd = new SqlCommand("Insertvoice", sqlConnection);
                        // SqlCommand cmd = new SqlCommand("insert into VoiceSms(SmsName,Voicepath,Voicesmstype,Username) values(@SmsName,@Voicepath,@Voicesmstype,@Username)", sqlConnection);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SmsName", audioname);
                        cmd.Parameters.AddWithValue("@Voicepath", path);
                        cmd.Parameters.AddWithValue("@Voicesmstype", type);
                        cmd.Parameters.AddWithValue("@Username", Uname);
                        sqlConnection.Open();

                        int i = cmd.ExecuteNonQuery();
                        File.Move(savefile.FileName, Base_dir + "VoiceSms/" + audioname);
                        if (i == 1)
                        {
                            string str = "alert('Audio Converted Uploaded.');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                        }
                        else
                        {
                            string str = "alert('Sorry Not Uploaded Try Again Upload File.');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                            Response.Redirect("Uploadvoicesms.aspx");
                        }
                    }

                    sqlConnection.Close();
                    txtsms.Text = "";
                }
            }
            else
            {
                string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
        //Response.Redirect("Compose VoiceSMS.aspx");
    }
    public DialogResult STAShowDialog(FileDialog dialog)
    {
        DialogState state = new DialogState();
        state.dialog = dialog;
        System.Threading.Thread t = new System.Threading.Thread(state.ThreadProcShowDialog);
        t.SetApartmentState(System.Threading.ApartmentState.STA);
        t.Start();
        t.Join();
        return state.result;
    }
    public class DialogState
    {
        public DialogResult result;
        public FileDialog dialog;
        public void ThreadProcShowDialog()
        {
            result = dialog.ShowDialog();
        }
    }
}