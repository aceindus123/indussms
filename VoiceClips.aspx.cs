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
using System.Xml;
using System.Xml.Linq;
using System.Runtime.Serialization.Json;
using Newtonsoft.Json;
using System.Text;
using System.Collections.Specialized;
using System.Collections;




public partial class VoiceClips : System.Web.UI.Page
{
    SMSCAPI objVoice = new SMSCAPI();
    public string radio;
    int pg = 0;
    public string name = "";
    public string swfFileName;
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
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
            if (!IsPostBack)
            {
                string Uname = Convert.ToString(Session["User"]);
                CurrentPageIndex = 0;
                BindData();
                SqlDataAdapter da = new SqlDataAdapter("select * from SingleNumbers where username='" + Uname + "'", sqlConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    droplist.DataSource = ds;
                    droplist.DataTextField = "listname";
                    droplist.DataValueField = "listname";
                    droplist.DataBind();
                    droplist.Items.Insert(0, "All List");
                }
                records();
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true); 
        }
    }
    public void records()
    {
        for (int i = 0; i < droplist.Items.Count; i++)
        {
            droplist.SelectedIndex = i;
            string str = droplist.SelectedItem.ToString();
            for (int counter = i + 1; counter < droplist.Items.Count; counter++)
            {
                droplist.SelectedIndex = counter;
                string compareStr = droplist.SelectedItem.ToString();
                if (str == compareStr)
                {
                    droplist.Items.RemoveAt(counter);
                    counter = counter - 1;
                }
            }
        }
    }

    public void BindData()
    {
        string Uname = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("Select * from VoiceSms where Username='" + Uname + "'", sqlConnection);
        DataSet ds = new DataSet();
        PagedDataSource pgd = new PagedDataSource();
        da.Fill(ds);
        pgd.DataSource = ds.Tables[0].DefaultView;
        pgd.CurrentPageIndex = CurrentPageIndex;
        pgd.AllowPaging = true;
        pgd.PageSize = 5;
        linknext.Visible = !(pgd.IsLastPage);
        linkprevoius.Visible = !(pgd.IsFirstPage);
        voicedata.DataSource = pgd;
        voicedata.DataBind();
        SqlDataAdapter ada = new SqlDataAdapter("select * from SingleNumbers where Username='" + Uname + "'", sqlConnection);
        DataSet sds = new DataSet();
        ada.Fill(sds);
        dlnumbers.DataSource = sds;
        dlnumbers.DataBind();
    }
    public int CurrentPageIndex
    {
        get
        {
            if (ViewState["pg"] == null)
                return 0;
            else
                return Convert.ToInt16(ViewState["pg"]);
        }
        set
        {
            ViewState["pg"] = value;
        }
    }
    protected void btnselect_Click(object sender, EventArgs e)
    {
        string checkboxids = string.Empty;
        foreach (GridViewRow row in dlnumbers.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkone");

            if (cb.Checked == true)
            {
                if (cb != null && cb.Checked)
                {
                    //get Current EMAIL_ID from the DataKey
                    checkboxids = Convert.ToString(dlnumbers.DataKeys[row.RowIndex].Value);
                    SqlDataAdapter da = new SqlDataAdapter("select number from SingleNumbers where mno='" + checkboxids + "'", sqlConnection);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    string res = Convert.ToString(ds.Tables[0].Rows[0]["number"]);
                    txtnumbers.Text = txtnumbers.Text + res + ",";
                }
            }
        }
    }
    protected void dlnumbers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        dlnumbers.PageIndex = e.NewPageIndex;
        dlnumbers.DataBind();
        BindData();
    }
    protected string checkboxvalue()
    {
        string checkboxids = string.Empty;
        foreach (GridViewRow row in dlnumbers.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkone");

            if (cb.Checked == true)
            {
                if (cb != null && cb.Checked)
                {
                    //get Current EMAIL_ID from the DataKey
                    checkboxids += Convert.ToString(dlnumbers.DataKeys[row.RowIndex].Value) + ",";
                }
            }
        }
        return checkboxids;
    }
    protected void showfooter_render(object sender, EventArgs e)
    {
        DataList objTempDL = (DataList)sender;
        if (objTempDL.Items.Count == 0)
        {
            objTempDL.ShowFooter = true;
        }
    }
    protected void linkprevoius_Click(object sender, EventArgs e)
    {
        CurrentPageIndex--;
        BindData();
    }
    protected void linknext_Click(object sender, EventArgs e)
    {
        CurrentPageIndex++;
        BindData();
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
    protected void btnschedule_Click(object sender, EventArgs e)
    {
        pan6.Visible = true;
        btnschedule.Visible = false;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        pan6.Visible = false;
        btnschedule.Visible = true;
    }
    protected void voicedata_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int dmid = (int)voicedata.DataKeys[(int)e.Item.ItemIndex];
        SqlCommand cmd = new SqlCommand("delete from VoiceSms where SmSNo=" + dmid, sqlConnection);
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter("select SmsName from VoiceSms where SmsNo=" + dmid, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string file = ds.Tables[0].Rows[0]["SmsName"].ToString();
        string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
        File.Delete(Base_dir + "VoiceSms/" + file);
        Response.Write("<script> alert('Deleted Record.') </script>");
        sqlConnection.Close();
        BindData();
    }
    protected void download(object sender, EventArgs e)
    {
        string filePath = (sender as ImageButton).CommandArgument;
        Response.ContentType = Path.GetExtension(filePath);
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
        Response.TransmitFile(Server.MapPath("VoiceSms/" + filePath));
        Response.End();
        //Response.AppendHeader("Content-Disposition", "VoiceSms; filename=" + Path.GetFileName(filePath));
        //Response.AddHeader("Content-Length", filePath.Length.ToString());
        //Response.TransmitFile(Server.MapPath("VoiceSms/" + Path.GetFileName(filePath)));
        //Response.End();
    }
    protected void voicedata_ItemDataBound1(object sender, DataListItemEventArgs e)
    {
        RadioButton rdb;
        string Uname = Convert.ToString(Session["User"]);
        rdb = (RadioButton)e.Item.FindControl("rdb");
        if (rdb != null)
        {
            rdb.Attributes.Add("onclick", "CheckOnes(this);");
        }
    }
    protected void voicedata_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string Uname = Convert.ToString(Session["User"]);
        int id = (int)voicedata.DataKeys[(int)e.Item.ItemIndex];
        string s = "select  SmsName  from  VoiceSms where SmsNo=" + id;
        SqlDataAdapter da = new SqlDataAdapter(s, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string res = Convert.ToString(ds.Tables[0].Rows[0]["SmsName"]);
        TextBox t1 = (TextBox)e.Item.FindControl("txtsms") as TextBox;
        name = t1.Text;
        SqlCommand cmd = new SqlCommand("update VoiceSms set SmsName=@SmsName where Username='" + Uname + "' and SmsNo=" + id, sqlConnection);
        cmd.Parameters.AddWithValue("@SmsName", name);
        string path = Server.MapPath("~") + "\\VoiceSms\\";
        string Fromfile = path + res;
        string Tofile = path + name;
        File.Move(Fromfile, Tofile);
        sqlConnection.Open();
        int i = cmd.ExecuteNonQuery();
        sqlConnection.Close();
        if (i == 1)
        {
            string str = "alert('Updated Voicesms.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        else
        {
            string str = "alert('Sorry Not Updated Try Again.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        //string voicename = "dmid";
        da = new SqlDataAdapter("select SmsName from VoiceSms where Username='" + Uname + "' and SmsNo=" + id, sqlConnection);
        DataSet dsvideo = new DataSet();
        da.Fill(dsvideo);
        if (!dsvideo.Tables[0].Rows.Count.Equals(0))
        {
            string videoname = dsvideo.Tables[0].Rows[0]["SmsName"].ToString();
            swfFileName = "~/Voicesms/" + videoname;
        }
        BindData();
    }
    protected void dlnumbers_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
        {
            CheckBox chkBxSelect = (CheckBox)e.Row.Cells[1].FindControl("chkone");
            CheckBox chkBxHeader = (CheckBox)this.dlnumbers.HeaderRow.FindControl("chkall");
            chkBxSelect.Attributes["onclick"] = string.Format("javascript:ChildClick(this,'{0}');", chkBxHeader.ClientID);
        }
    }
    List<string> items = new List<string>();
    protected void btnsendnow_Click(object sender, EventArgs e)
    {
        string Uname = Convert.ToString(Session["User"]);
        string callid = "";
        string tonumber = "";
        string dndnumbers = "";
        string callstus = "";
        string events="";
        string dir = "";
        string errorreason = "";
        string Mobile_Number = "";
        string number = "";
        string dndno = "";
        string To="";
        string file = "";
        string errorreason1 = "";
        DateTime Senttime = Convert.ToDateTime(System.DateTime.Now.ToString());

        foreach (DataListItem item in voicedata.Items)
        {
            RadioButton rb = (RadioButton)item.FindControl("rdb");
            if (rb.Checked == true)
            {
                radio = Convert.ToString(voicedata.DataKeys[item.ItemIndex].ToString());
            }
        }
        if (radio != null)
        {
            SqlDataAdapter da = new SqlDataAdapter("select SmsName from VoiceSms where SmsNo='" + radio + "'", sqlConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            file = ds.Tables[0].Rows[0]["SmsName"].ToString();
            //string Base_dir = AppDomain.CurrentDomain.BaseDirectory;
            //string path = Base_dir + "VoiceSms/" + file;
            if (txtnumbers.Text.EndsWith(","))
            {
                Mobile_Number = txtnumbers.Text.Substring(0, txtnumbers.Text.Length - 1);
            }
            else
            {
                Mobile_Number = txtnumbers.Text;
            }
            string s = objVoice.Voice(Mobile_Number, file);
            string json = s.Remove(0, 16);
            XmlDocument doc = new XmlDocument();
            using (var reader = JsonReaderWriterFactory.CreateJsonReader(Encoding.UTF8.GetBytes(json), XmlDictionaryReaderQuotas.Max))
            {
                XElement xml = XElement.Load(reader);
                doc.LoadXml(xml.ToString());
            }
            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                switch (node.NodeType)
                {
                    case XmlNodeType.Text:
                        items.Add(node.Value);
                        break;
                    case XmlNodeType.Element:
                        items.Add(string.Format("<{0}>{1}</{0}>", node.Name, node.InnerText));

                        if (node.Name == "calluid")
                        {
                            callid = node.InnerText;
                        }

                        if (node.Name == "to")
                        {
                            tonumber = node.InnerText;
                        }

                        if (node.Name == "dnd_numbers")
                        {
                            dndnumbers = node.InnerText;
                        }

                        if (node.Name == "callstatus")
                        {
                            callstus = node.InnerText;
                        }

                        if (node.Name == "event")
                        {
                            events = node.InnerText;
                        }
                        if (node.Name == "direction")
                        {
                            dir = node.InnerText;
                        }
                        if (node.Name == "error_reason")
                        {
                            errorreason = node.InnerText;
                        }
                        break;
                }
            }
            if (events == "error" && errorreason != "")
            {
                string[] num = Mobile_Number.Split(',');
                foreach (string item in num)
                {
                    To = item;
                    dndnumbers = item;
                    callstus = "not recived";
                    voicesms(Uname, file, Senttime, To, dndnumbers, callstus, events, errorreason);
                }   
            }
            else
            {
                if (tonumber != "")
                {
                    string[] words = tonumber.Split(',');
                    foreach (string word in words)
                    {
                        number = word;
                        dndno = "";
                        voicesms1(Uname, file, callid, Senttime, number, dndno, callstus, events, dir);
                    }
                }
                if (dndnumbers != "")
                {
                    string[] no = dndnumbers.Split(',');
                    foreach (string nos in no)
                    {
                        dndno = number = nos;
                        callstus = "not recived";
                        events = "error";
                        dir = "";
                        errorreason1 = "DND Number";
                        voicesms2(Uname, file, callid, Senttime, number, dndno, callstus, events, dir, errorreason1);
                    }
                }
            }
            if (errorreason != "")
            {
                string str = "alert('File Not Recived.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
            else 
            {
                string str = "alert('File Recived.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
            callid = "";
            tonumber = "";
            dndnumbers = "";
            Mobile_Number = "";
            callstus = "";
            events = "";
            dir = "";
            txtnumbers.Text = "";
            Uname = "";
            number = "";
            dndno = "";
            To = "";
            file = "";
            errorreason1 = "";
            errorreason = "";

        }
        else
        {
            string str = "alert('Please Select The Clip.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
    }

    public void voicesms(string Uname,string file, DateTime Senttime, string To, string dndnumbers, string callstus, string events, string Errorreason)
    {
        SqlCommand cmd = new SqlCommand("spvoicereport1", sqlConnection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", Uname);
        cmd.Parameters.AddWithValue("@Voiceclip", file);
        cmd.Parameters.AddWithValue("@Senttime", Senttime);
        cmd.Parameters.AddWithValue("@Tonumber", To);
        cmd.Parameters.AddWithValue("@Dndnumber", dndnumbers);
        cmd.Parameters.AddWithValue("@Status", callstus);
        cmd.Parameters.AddWithValue("@Event", events);
        cmd.Parameters.AddWithValue("@Errorreason", Errorreason);
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
    }
    public void voicesms1(string Uname,string file, string callid, DateTime Senttime, string number, string dndno, string callstus, string events, string dir)
    {
        SqlCommand cmd = new SqlCommand("spvoicereport", sqlConnection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", Uname);
        cmd.Parameters.AddWithValue("@Voiceclip", file);
        cmd.Parameters.AddWithValue("@Callid", callid);
        cmd.Parameters.AddWithValue("@Senttime", Senttime);
        cmd.Parameters.AddWithValue("@Tonumber", number);
        cmd.Parameters.AddWithValue("@Dndnumber", dndno);
        cmd.Parameters.AddWithValue("@Status", callstus);
        cmd.Parameters.AddWithValue("@Event", events);
        cmd.Parameters.AddWithValue("@Direction", dir);
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
    }
    public void voicesms2(string Uname, string file, string callid, DateTime Senttime, string number, string dndno, string callstus, string events, string dir, string errorreason1)
    {
        SqlCommand cmd = new SqlCommand("spvoicereport2", sqlConnection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Username", Uname);
        cmd.Parameters.AddWithValue("@Voiceclip", file);
        cmd.Parameters.AddWithValue("@Callid", callid);
        cmd.Parameters.AddWithValue("@Senttime", Senttime);
        cmd.Parameters.AddWithValue("@Tonumber", number);
        cmd.Parameters.AddWithValue("@Dndnumber", dndno);
        cmd.Parameters.AddWithValue("@Status", callstus);
        cmd.Parameters.AddWithValue("@Event", events);
        cmd.Parameters.AddWithValue("@Direction", dir);
        cmd.Parameters.AddWithValue("@Errorreason", errorreason1);
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
    }
}