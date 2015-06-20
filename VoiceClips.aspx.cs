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
using Indussms.DataAccessLayer;
using Indussms;
using System.Text.RegularExpressions;




public partial class VoiceClips : System.Web.UI.Page
{
    SMSCAPI objVoice = new SMSCAPI();
    Registration reg = new Registration();
    string uname;
    public string radio;
    int pg = 0;
    public string name = "";
    public string swfFileName;
    exception err = new exception();
    static string excep_page = "VoioceClips.aspx";

    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            //string demobal = getdemobal(Session["User"].ToString());
            //if (demobal != "1")
            //{

                string ds5 = getbal(Session["User"].ToString());
                if (ds5 != "0" && ds5!="")
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
                        string id = (Convert.ToString(Session["User"]));
                        CurrentPageIndex = 0;
                        BindData();
                        DataSet voiceamt = reg.voiceamount(id);

                        lblamount.Text = voiceamt.Tables[0].Rows[0]["amountleft"].ToString() + " INR";
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
                        else if (ds.Tables[0].Rows.Count == 0)
                        {
                            tblcnct.Visible = false;
                        }
                        if (voicedata.Items.Count == 0)
                        {
                            voicedata.Visible = false;
                            lbldatalist.Visible = true;
                            lbldatalist.Text = "No Record Found.";
                        }
                        records();
                    }

                }
                else
                {
                    string strScript = "alert('You Dont Have Enough Money.');location.replace('Balance.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            //}
            //else
            //{

            //    string strScript = "alert('You Have Free Money in Your account please use that Money After Access this Page');location.replace('SMsDemo.aspx');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            //}
        }


        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private string getdemobal(string p)
    {

        string qry = "select * from voicesmsexpenses where Amount=2 and uname='" + p + "' and status=1";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            string value = "1";
            return value;
        }

        else
        {
            string value = "0";
            return value;
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
        int x = 0;
        foreach (GridViewRow row in dlnumbers.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkone");

           
            if (cb.Checked == true)
            {
                if (cb != null && cb.Checked)
                {
                    x = 1;
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
        if (x == 0)
        {
            string str = "alert('Select at Least One Check Box');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
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


    protected void btncancel_Click(object sender, EventArgs e)
    {
        pan6.Visible = false;
       // btnschedule.Visible = true;
    }

    protected void voicedata_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int dmid = (int)voicedata.DataKeys[(int)e.Item.ItemIndex];
        SqlDataAdapter da = new SqlDataAdapter("select SmsName from VoiceSms where SmsNo=" + dmid, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string file = ds.Tables[0].Rows[0]["SmsName"].ToString();
        File.Delete(Server.MapPath("VoiceSms/" + file));
        

        SqlCommand cmd = new SqlCommand("delete from VoiceSms where SmSNo=" + dmid, sqlConnection);
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        string script = "alert('File Deleted  Successfully')";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        //SqlDataAdapter da = new SqlDataAdapter("select SmsName from VoiceSms where SmsNo=" + dmid, sqlConnection);
        //DataSet ds = new DataSet();
        //da.Fill(ds);

        //string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;

        //Response.Write("<script> alert('Deleted Record.') </script>");
        sqlConnection.Close();
        BindData();
        Response.Redirect("VoiceClips.aspx");
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

    private string getbal(string p)
    {
        string qry = "select smsleft from voicesmsexpenses where uname='" + p + "' and status=1";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count != 0)
        {
            string value = ds2.Tables[0].Rows[0]["smsleft"].ToString();
            return value;
        }
        else
        {
            return "";
        }
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

        Session["id"] = id;
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
            //}
            //else
            //{
            //    string str = "alert('Sorry Not Updated Try Again.');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            //}
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
        string ds5 = getbal(Session["User"].ToString());
        string Uname = Convert.ToString(Session["User"]);
        string callid = "";
        string tonumber = "";
        string dndnumbers = "";
        string callstus = "";
        string events = "";
        string dir = "";
        string errorreason = "";
        string Mobile_Number = "";
        string number = "";
        string dndno = "";
        string To = "";
        string file = "";
        string errorreason1 = "";
        string s = "";
        int x = 0;
        string y = "";
        int z = 0;

        string x3 = cost();


        string time1 = Convert.ToString(DateTime.Now.ToString());
        DateTime Senttime = Convert.ToDateTime(System.DateTime.Now.ToString());

        try
        {
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

                    number = txtnumbers.Text;
                    number = number.TrimEnd(',');
                    x = number.Count(','.Equals);


                    x = x + 1;

                    if (Convert.ToInt32(ds5) >= x)
                    {
                        //Double Z1 = Convert.ToDouble(x3) * Convert.ToDouble(x);
                        //y = Convert.ToString(Z1);

                      
                        string[] crdrevis = Regex.Split(number, ",");

                        for (int i = 0; i < crdrevis.Length; i++)
                        {
                            getbal(Session["User"].ToString());

                            string crdres = crdrevis[i];

                            if (crdres.Length == 10)
                            {
                                s = objVoice.Voice(crdres, file);

                                //Session["value"]=s;
                                if (s == "'xml' field should not be empty") { }
                                else if (s == "'xml' field is missing") { }
                                else if (s == "'api_key' field is missing") { }
                                else if (s == "'api_key' should not be empty") { }
                                else if (s == "'access_key' field is missing") { }
                                else if (s == "'access_key' should not be empty") { }
                                else if (s == "invalid 'api_key'") { }
                                else if (s == "invalid combination of 'api_key' and 'access_key'") { }
                                else if (s == "low balance") { }
                                else if (s == "'action' field is missing") { }
                                else if (s == "The remote name could not be resolved: 'voiceapi.smscountry.com'") {

                                    string str = "alert('Error Occured Please Try Later');location.replace('VoiceClips.aspx');";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                                }

                                else
                                {
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

                                    string starttime = "";
                                    string endtime = "";
                                    string endreason = "";
                                    string from = "";

                                    Random rd = new Random();
                                    Label lblsms = new Label();
                                    lblsms.Text = Convert.ToString(rd.Next(10000));

                                    string code = lblsms.Text;

                                    if (events == "error" && errorreason != "")
                                    {
                                        //string[] num = Mobile_Number.Split(',');
                                        //foreach (string item in num)
                                        //{
                                            To = crdres;
                                            dndnumbers = crdres;
                                            callstus = "not received";

                                            voicesms(Uname, file, Senttime, To, dndnumbers, callstus, events, errorreason, starttime, endtime, endreason, from, code);
                                       // }

                                        expenses(Uname, 0, "0", time1,code);

                                        if (errorreason == "all the numbers are in DND")
                                        {
                                            string str = "alert('Given Number is DND,pls give another number');location.replace('VoiceClips.aspx');";
                                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                                        }
                                    }


                                    //else if (dndnumbers != "")
                                    //{
                                    //    string[] no = dndnumbers.Split(',');
                                    //    foreach (string nos in no)
                                    //    {
                                    //        dndno = number = nos;
                                    //        callstus = "not received";
                                    //        events = "error";
                                    //        dir = "";
                                    //        errorreason1 = "DND Number";
                                    //        voicesms2(Uname, file, callid, Senttime, number, dndno, callstus, events, dir, errorreason1,starttime,endtime,endreason,from);
                                    //    }
                                    //    expenses(Uname, 0, "0", time1);
                                    //}

                                    else
                                    {
                                        if (tonumber != "")
                                        {
                                            string[] words = tonumber.Split(',');
                                            foreach (string word in words)
                                            {
                                                number = word;
                                                dndno = "";
                                                voicesms1(Uname, file, callid, Senttime, number, dndno, callstus, events, dir, starttime, endtime, endreason, from, code);
                                            }
                                        }


                                        string demobal = getdemobal(Session["User"].ToString());
                                        if (demobal != "0")
                                        {
                                            string rs = "1";
                                            //Double Z2 = Convert.ToDouble(rs) * Convert.ToDouble(x);
                                            //String Z3 = Convert.ToString(Z2);
                                            expenses(Uname, 1, rs, time1, code);
                                        }
                                        else
                                        {
                                            string rs = x3;
                                            expenses(Uname, 1, rs, time1, code);
                                        }


                                    //    string str = "alert('Voice Message Send Sucessfully.');location.replace('Callback.aspx?smscresponse[calluid]=" + callid + "&smscresponse[to]=" + number + "&smscresponse[callstatus]=" + callstus + "');";
                                        string str = "alert('Voice Message Send Sucessfully.');location.replace('VoiceClips.aspx');";
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                                    }
                                }
                            }
                            callid = ""; tonumber = ""; dndnumbers = "";
                            Mobile_Number = ""; callstus = ""; events = "";
                            dir = ""; txtnumbers.Text = ""; 
                             dndno = ""; To = "";
                            errorreason1 = ""; errorreason = "";
                        }
                    }

                    else
                    {
                        string str = "alert('You dont have enough balance');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }

            }
            else
            {
                string str = "alert('Please Select The Clip.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
        number = "";
        file = "";
        Uname = "";
    }

    private string cost()
    {
        string costrate = "select * from smscost";
        SqlDataAdapter da = new SqlDataAdapter(costrate, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string rate = ds.Tables[0].Rows[0]["voicesms"].ToString();
        return rate;
    }

    public void voicesms(string Uname, string file, DateTime Senttime, string To, string dndnumbers, string callstus, string events, string Errorreason, string starttime, string endtime, string endreason, string from, string code)
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
        cmd.Parameters.AddWithValue("@starttime", starttime);
        cmd.Parameters.AddWithValue("@endtime", endtime);
        cmd.Parameters.AddWithValue("@endreason", endreason);
        cmd.Parameters.AddWithValue("@from1", from);
        cmd.Parameters.AddWithValue("@code", code);


        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
    }

    public void voicesms1(string Uname, string file, string callid, DateTime Senttime, string number, string dndno, string callstus, string events, string dir, string starttime, string endtime, string endreason, string from, string code)
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
        cmd.Parameters.AddWithValue("@starttime", starttime);
        cmd.Parameters.AddWithValue("@endtime", endtime);
        cmd.Parameters.AddWithValue("@endreason", endreason);
        cmd.Parameters.AddWithValue("@from1", from);
        cmd.Parameters.AddWithValue("@code", code);

        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
    }

    public void voicesms2(string Uname, string file, string callid, DateTime Senttime, string number, string dndno, string callstus, string events, string dir, string errorreason1, string starttime, string endtime, string endreason, string from)
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
        cmd.Parameters.AddWithValue("@starttime", starttime);
        cmd.Parameters.AddWithValue("@endtime", endtime);
        cmd.Parameters.AddWithValue("@endreason", endreason);
        cmd.Parameters.AddWithValue("@from1", from);
        sqlConnection.Open();
        cmd.ExecuteNonQuery();
        sqlConnection.Close();
    }  
   
    protected void voicedata_EditCommand(object source, DataListCommandEventArgs e)
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
            //}
            //else
            //{
            //    string str = "alert('Sorry Not Updated Try Again.');";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            //}
        }
    }

    private void expenses(string p, int p_2, string p_3, string time, string code)
    {
        sqlConnection.Open();
        string qry = "insert into VoiceExpences(uname,count,amount,etime,code) values('" + p + "'," + p_2 + ",'" + p_3 + "','" + time + "','"+code+"')";
        SqlCommand cmd = new SqlCommand(qry, sqlConnection);
        cmd.ExecuteNonQuery();


        string qry1 = "select top(1) b.smsleft-a.count as Cnt,(cast(b.amountleft as varchar(10))-cast(a.amount as float) )as Bal from VoiceExpences a inner join  voicesmsexpenses b on a.uname=b.uname where a.uname='" + p + "' and status=1 order by eid desc";
        SqlDataAdapter da = new SqlDataAdapter(qry1, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string a = ds.Tables[0].Rows[0]["Cnt"].ToString();
        string b = ds.Tables[0].Rows[0]["Bal"].ToString();

        string qry2 = "";

        if (a == "0")
        {
            qry2 = "update voicesmsexpenses set smsleft='" + a + "',amountleft='" + b + "',status=0 where uname='" + p + "'";
        }
        else
        {
            qry2 = "update voicesmsexpenses set smsleft='" + a + "',amountleft='" + b + "' where uname='" + p + "'";

        }
       // string qry2 = "update voicesmsexpenses set smsleft='" + a + "',amountleft='" + b + "',status=0 where uname='" + p + "'";
        SqlCommand cmd2 = new SqlCommand(qry2, sqlConnection);
        cmd2.ExecuteNonQuery();

        sqlConnection.Close();


    }

    protected void droplist_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Uname = Convert.ToString(Session["User"]);
        string lname = droplist.SelectedItem.Text;
        if (droplist.SelectedItem.Text == "All List")
        {
            SqlDataAdapter ada = new SqlDataAdapter("select * from SingleNumbers where Username='" + Uname + "'", sqlConnection);
            DataSet sds = new DataSet();
            ada.Fill(sds);
            dlnumbers.DataSource = sds;
            dlnumbers.DataBind();
        }
        else
        {

            SqlDataAdapter ada = new SqlDataAdapter("select * from SingleNumbers where Username='" + Uname + "' and listname='"+lname+"'", sqlConnection);
            DataSet sds = new DataSet();
            ada.Fill(sds);
            dlnumbers.DataSource = sds;
            dlnumbers.DataBind();
        }
    }
}


