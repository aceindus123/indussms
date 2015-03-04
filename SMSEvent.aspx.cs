using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;


public partial class SMSEvent : System.Web.UI.Page
{
    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;
    string uname;
 //   string id;
    DataSet ds = new DataSet();
    SMSCAPI cs = new SMSCAPI();
    Registration reg = new Registration();
    private string _schdate = string.Empty;
    public string schtimezone = "";
    private string schtime = "";
    private string schdate = "";
    private string pdate = string.Empty;

    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Convert.ToString(Session["User"]);
      // id = Convert.ToString(Session["User"]);
        string s = "active";
        if (Session["User"] != null)
        {
            string ds5 = getbal(Session["User"].ToString());
            if (ds5 != "0")
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["mode"] == "wedding")
                    {
                        Label3.Text = "Wedding / Events";
                        schline.Visible = true;
                        schline1.Visible = true;
                        schdata.Visible = false;
                        countmsg1.Visible = false;
                    }

                    else if (Request.QueryString["mode"] == "election")
                    {
                        Label3.Text = "Election Campain ";
                        schline.Visible = true;
                        schline1.Visible = true;
                        schdata.Visible = false;
                        countmsg1.Visible = false;
                    }

                    else
                    {
                        Label3.Text = "Scheduled SMS ";
                        schline.Visible = false;
                        schline1.Visible = false;
                        SINGLESMS.Visible = false;
                        divcautions.Visible = false;
                        txtmsg1.Visible = false;
                        txtmsg2.Visible = false;

                        gview.Visible = false;
                        countmsg1.Visible = false;
                    }

                    SqlDataAdapter da = new SqlDataAdapter("select sendername from sendername where status='active' and username='" + uname + "'", sqlConnection);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ddlsender.DataSource = ds;
                        ddlsender.DataTextField = "sendername";
                        ddlsender.DataValueField = "sendername";
                        ddlsender.DataBind();
                        ddlsender.Items.Insert(0, "Select");
                        ddlschedulesender.DataSource = ds;
                        ddlschedulesender.DataTextField = "sendername";
                        ddlschedulesender.DataValueField = "sendername";
                        ddlschedulesender.DataBind();
                        ddlschedulesender.Items.Insert(0, "Select");
                    }
                    if (ddlschedulesender.Items.Count == 0)
                    {
                        schsender.Visible = false;
                        schsender1.Visible = true;
                    }
                    else
                    {
                        schsender.Visible = true;
                        schsender1.Visible = false;
                    }
                    if (ddlsender.Items.Count == 0)
                    {
                        senderid.Visible = false;
                        senderid1.Visible = true;
                    }
                    else
                    {
                        senderid.Visible = true;
                        senderid1.Visible = false;
                    }
                    rdmultiple.Visible = true;
                    rdsingle.Visible = true;
                    selectlist.Visible = false;
                    selectlist1.Visible = true;
                    divcautions.Visible = false;
                    gview.Visible = false;
                    rdnumber.Checked = true;
                    rdlist.Checked = false;
                    list.Visible = false;
                    list1.Visible = false;
                }
            }
            else
            {
                string strScript = "alert('You Dont Have Money in Your account');location.replace('Balance.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }

        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private string getbal(string p)
    {
        string qry = "select smsleft from textsmsexpenses where uname='" + p + "' and status=1" ;
        SqlDataAdapter da2 = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            string value = ds2.Tables[0].Rows[0]["smsleft"].ToString();
            return value;
        }
        else
        {
            string value = "0";
            return value;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SMSCAPI objSms = new SMSCAPI();
        try
        {
            if ((txtmobileelection.Text != String.Empty && (txtmobilesubject.Text != String.Empty||txt1.Text != String.Empty || txt2.Text != String.Empty)) || (TextBox1.Text != String.Empty && (txtmobilesubject.Text != String.Empty||txt1.Text != String.Empty || txt2.Text != String.Empty)))
            {
                string id = "MONTES";
                string N = "N";
                string Y = "Y";
                string result = "";
                string number = "";
                DateTime time = Convert.ToDateTime(DateTime.Now.ToString());
                string  time1 = Convert.ToString(DateTime.Now.ToString());
                string message = "";
                string username = reg.name(uname);
                 string ds5 = getbal(Session["User"].ToString());
           
                if ((txtmobileelection.Text != String.Empty && txtmobilesubject.Text != String.Empty))
                {
                    number = txtmobileelection.Text;
                    message = txtmobilesubject.Text;
                   result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                   expence(uname, 1, "0.50", time1);
                }

                else if ((txtmobileelection.Text != String.Empty && txt1.Text != String.Empty))
                {
                    if (Convert.ToInt32(ds5) >= 2)
                    {
                        number = txtmobileelection.Text;
                        message = txt1.Text;
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, 2, "1", time1);
                    }

                    else
                    {
                        string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                }

                else if ((txtmobileelection.Text != String.Empty && txt2.Text != String.Empty))
                {
                    if (Convert.ToInt32(ds5) >= 3)
                    {
                        number = txtmobileelection.Text;
                        message = txt2.Text;
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, 3, "1.50", time1);
                    }

                    else
                    {
                        string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                }

                else
                {
                    number = TextBox1.Text;
                    int x = number.Count(','.Equals);
                    number = number.Remove(number.Length - 1);

                    if ((TextBox1.Text != String.Empty && txtmobilesubject.Text != String.Empty))
                    {
                        ds5 = getbal(Session["User"].ToString());
                        if (Convert.ToInt32(ds5) >= x * 1)
                        {
                            string y = Convert.ToString(x * 0.50);
                            int z = x * 1;

                            message = txtmobilesubject.Text;
                            result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                            expence(uname, z, y, time1);
                        }
                        else
                        {
                            string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                        }
                    }

                    else if ((TextBox1.Text != String.Empty && txt1.Text != String.Empty))
                    {

                        message = txt1.Text;
                        string y = Convert.ToString(x * 1);
                        int z = x * 2;
                        ds5 = getbal(Session["User"].ToString());
                        if (Convert.ToInt32(ds5) >= x * 2)
                        {
                            result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                            expence(uname, z, y, time1);
                        }
                        else
                        {
                            string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                        }
                    }

                    else if ((TextBox1.Text != String.Empty && txt2.Text != String.Empty))
                    {

                        message = txt2.Text;
                        string y = Convert.ToString(x * 1.50);
                        int z = x * 3;
                        ds5 = getbal(Session["User"].ToString());
                        if (Convert.ToInt32(ds5) >= x * 3)
                        {
                            result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                            expence(uname, z, y, time1);
                        }
                        else
                        {
                            string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                        }
                    }
                }

                int n = reg.insertschreport1(username, uname, number, message, time, result);
              
                rdmultiple.Checked = false;
                rdsingle.Checked = false;
                rdmultiple.Visible = true;
                rdsingle.Visible = true;
                selectlist.Visible = false;
                SINGLESMS.Visible = false;
                selectlist1.Visible = false;
                divcautions.Visible = false;
                gview.Visible = false;
                string script1 = "alert('Message Send Successfully');location.replace('SMSEvent.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script1, true);
                TextBox1.Text = "";
                txtmobilesubject.Text = "";
                txtmobileelection.Text = String.Empty;
                txtmobilesubject.Text = String.Empty;
                txt1.Text = "";
                txt2.Text = "";
            }
            else
            {
                string script = "alert('Please Select List or Number')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    private void expence(string p, int p_2, string p_3, string time)
    {
        sqlConnection.Open();
        string qry = "insert into Expences(uname,count,amount,etime) values('" + p + "'," + p_2 + ",'" + p_3 + "','" + time + "')";
        SqlCommand cmd = new SqlCommand(qry, sqlConnection);
        cmd.ExecuteNonQuery();

        string qry1 = "select top(1) b.smsleft-a.count as Cnt,(cast(b.amountleft as decimal(18,2))-cast(a.amount as decimal(18,2)) )as Bal from Expences a inner join  textsmsexpenses b on a.uname=b.uname where a.uname='" + p + "' and status=1 order by eid desc";
        SqlDataAdapter da = new SqlDataAdapter(qry1, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string a =ds.Tables[0].Rows[0]["Cnt"].ToString();
        string b = ds.Tables[0].Rows[0]["Bal"].ToString();
        string qry2 = "";

        if (a == "0")
        {
             qry2 = "update textsmsexpenses set smsleft='" + a + "',amountleft='" + b + "',status=0 where uname='" + p + "'";
        }
        else
        {
             qry2 = "update textsmsexpenses set smsleft='" + a + "',amountleft='" + b + "' where uname='" + p + "'";
           
        }
        SqlCommand cmd2 = new SqlCommand(qry2, sqlConnection);
        cmd2.ExecuteNonQuery();

        sqlConnection.Close();
    }

    protected void rdsingle_CheckedChanged(object sender, EventArgs e)
    {
        SINGLESMS.Visible = true;
        rdmultiple.Visible = true;
        rdsingle.Visible = true;
        countmsg1.Visible = false;

        selectlist.Visible = false;
        selectlist1.Visible = true;
        divcautions.Visible = false;
        gview.Visible = false;

        txtmobilesubject.Visible = true;
        txt1.Visible = false;
        txt2.Visible = false;
    }

    protected void rdmultiple_CheckedChanged(object sender, EventArgs e)
    { 
        SINGLESMS.Visible = true;
        rdmultiple.Visible = true;
        rdsingle.Visible = true;
        selectlist.Visible = true;
        selectlist1.Visible = false;

        SINGLESMS.Visible = true;
        divcautions.Visible = true;
        schdata.Visible = false;
        gview.Visible = true;

        if (uname != "")
        {
            DataSet ds = reg.Binddata1(uname);
            if (ds.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds;
                gv1.DataBind();
            }
            else
            {
                string script = "alert('No Lists Found')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }
        else
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("SMSMainMenu.aspx");
    }

    protected void dtlistname_ItemCommand(object source, DataListCommandEventArgs e)
    {
        LinkButton lnkanme = (LinkButton)e.Item.FindControl("lnklist");
        string lstname = lnkanme.Text;
        DataSet ds = new DataSet();
        string s1 = "";
        if (uname != "")
        {
            ds = reg.AddSubscribers1(lstname, uname);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string s = ds.Tables[0].Rows[i]["number"].ToString();
                    s1 += s + ",";
                }

                TextBox1.Text = s1;
                rdmultiple.Checked = true;
                selectlist.Visible = true;
                selectlist1.Visible = false;
                divcautions.Visible = true;
                gview.Visible = true;
            }
            else
            {
                string script = "alert('No Numbers Found')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }
        else
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }

    protected void rdlist_CheckedChanged(object sender, EventArgs e)
    {
        rdnumber.Checked = false;
        list.Visible = true;
        list1.Visible = true;
        txtnumbers.Enabled = false;

        number.Visible = false;
        number1.Visible = false;

        DataSet ds56 = reg.datalist(uname);
        if (ds56.Tables[0].Rows.Count > 0)
        {
            ddlist.DataSource = ds56;
            ddlist.DataValueField = "lname";
            ddlist.DataTextField = "lname";
            ddlist.DataBind();
            ddlist.Items.Insert(0, "Select List");
        }
    }

    protected void rdnumber_CheckedChanged(object sender, EventArgs e)
    {
        rdnumber.Checked = true;
        rdlist.Checked = false;
        list.Visible = false;
        list1.Visible = false;

        number.Visible = true;
        number1.Visible = true;
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtmobile.Text = "";
        txtmsg.Text = "";
        ddlist.SelectedIndex = -1;
        Response.Redirect("SMSMainMenu.aspx");
    }

    protected void btnschedule_Click(object sender, EventArgs e)
    {
        string uname = Convert.ToString(Session["user"]);
        string sname = reg.editdata1(uname);
        string time = txttime.Text;
        string time1 = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
        string subject = txtmsg.Text;
        string accuser = Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]);
        string accpassword = Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]);
        string name = "";
        string number = "";
        if (rdnumber.Checked == true)
        {
            name = txtname.Text;
            number = txtmobile.Text;
        }
        else
        {
            name = ddlist.SelectedItem.Text;
            number = txtnumbers.Text;

        }
        if (number != "")
        {

            int n = reg.insertschreport(sname, uname, name, number, subject, time1, time);

            string result = cs.SendSMS2(uname, sname, name, number, subject, accpassword, accuser, time);

            int n1 = reg.updateschreport(result, uname, time);

            string script = "alert('Message Scheduled Successfully')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);

            txttime.Text = "";
            txtname.Text = "";
            txtmobile.Text = "";
            txtmsg.Text = "";
            ddlist.SelectedIndex = -1;
            txtnumbers.Text = "";
        }
        else
        {
            string script = "alert('You are Providing Empty List')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void imgcancel_Click(object sender, ImageClickEventArgs e)
    {
        txttime.Text = "";
        ModalPopupExtender3.Hide();
    }

    protected void imgcal_Click(object sender, ImageClickEventArgs e)
    {

        //   ddltimezone.Visible = true;
        System.Collections.ObjectModel.ReadOnlyCollection<TimeZoneInfo> tzi;
        tzi = TimeZoneInfo.GetSystemTimeZones();
        foreach (TimeZoneInfo timeZone in tzi)
        {
            //   ddltimezone.Items.Add(new ListItem(timeZone.DisplayName, timeZone.Id));
        }
        pnllist.Visible = true;

        ddlHours.Items.Clear();
        ddlMins.Items.Clear();

        for (int i = 00; i <= 23; i++)
        {

            ddlHours.Items.Add(i.ToString());

        }
        for (int i = 00; i <= 59; i++)
        {
            ddlMins.Items.Add(i.ToString());
        }

        if (Convert.ToString(Page.RouteData.Values["index"]) == "" || Convert.ToString(Page.RouteData.Values["index"]) == null)
        {
        }
        else
        {

            string tzone = schtimezone;
            if (tzone != "")
            {
                TimeZoneInfo tzsel = TimeZoneInfo.FindSystemTimeZoneById(tzone);
                string strTZone = Convert.ToString(tzsel);
                if (strTZone != "")
                {
                    //    ddltimezone.ClearSelection();
                    //  ddltimezone.Items.FindByText(strTZone).Selected = true;
                }
            }
            string editschdate = schdate;
            if (editschdate != "")
            {
                DateTime dt = Convert.ToDateTime(editschdate);
                string strHrsLen = dt.Hour.ToString();
                string strminsLen = dt.Minute.ToString();
                string strDate = editschdate.Substring(0, 10).Trim();

                txtschduleemail.Text = strDate;
                if (strHrsLen != "")
                {
                    ddlHours.Items.FindByText(strHrsLen).Selected = true;
                }
                if (strminsLen != "")
                {
                    ddlMins.Items.FindByText(strminsLen).Selected = true;
                }
            }
        }
        ModalPopupExtender3.Show();
    }

    protected void imgscheduleok_Click(object sender, ImageClickEventArgs e)
    {
        pdate = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt"));
        string schtime1 = txtschduleemail.Text + " " + ddlHours.SelectedItem.Text.ToString() + ":" + ddlMins.SelectedItem.Text.ToString();


        if (Convert.ToInt32(ddlHours.SelectedItem.Text.ToString()) < 12)
        {
            ddlMins.SelectedItem.Text = ddlMins.SelectedItem.Text.ToString() + ":00 AM";
            schtime1 = txtschduleemail.Text + " " + ddlHours.SelectedItem.Text.ToString() + ":" + ddlMins.SelectedItem.Text.ToString();
        }
        else
        {
            ddlMins.SelectedItem.Text = ddlMins.SelectedItem.Text.ToString() + ":00 PM";
            schtime1 = txtschduleemail.Text + " " + ddlHours.SelectedItem.Text.ToString() + ":" + ddlMins.SelectedItem.Text.ToString();
        }
        //  schtimezone = ddltimezone.SelectedValue.ToString();

        if (Convert.ToString(schtime1) != Convert.ToString(pdate))
        {
            Session["schutctime"] = schtime1;
            //  Session["schselzone"] = schtimezone;
            txttime.Text = schtime1;
            txttime.Enabled = false;
            txttime.Visible = true;
            pnllist.Visible = false;
            ModalPopupExtender3.Hide();
        }

        else
        {
            string strScript = "alert('Scheduled date must be greater than or equal to current date');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            pnllist.Visible = true;
            ModalPopupExtender3.Show();
        }
    }

    protected void ddlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        string lstname = ddlist.SelectedItem.Text;
        if (lstname != "Select List")
        {
            string user11 = Convert.ToString(Session["User"]);
            DataSet ds;
            string s1 = "";
            ds = cs.AddSubscribers1(lstname, user11);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string s = ds.Tables[0].Rows[i]["number"].ToString();
                    s1 += s + ",";
                }
                s1 = s1.Remove(s1.Length - 1);
                txtnumbers.Text = s1;
            }
        }
        else
        {
            string script = "alert('Please select List')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }

    protected void Checktime(object sender, EventArgs e)
    {
        if (txtschduleemail.Text == DateTime.Now.ToString("dd/MM/yyyy"))
        {
            DateTime time = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
            string dt = time.Hour.ToString();
            int hour = Convert.ToInt32(dt);
            int hour1 = Convert.ToInt16(ddlHours.SelectedItem.Text);
            if (hour1 > hour)
            {
                ModalPopupExtender3.Show();
            }
            else
            {
                string script = "alert('Please select Future Time')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                ddlHours.SelectedIndex = -1;
            }
        }
        ModalPopupExtender3.Show();
    }

    protected void rdschedule_CheckedChanged(object sender, EventArgs e)
    {
        Label3.Text = "Scheduled SMS ";
        schdata.Visible = true;
        SINGLESMS.Visible = false;
        schline.Visible = false;
        schline1.Visible = false;
        divcautions.Visible = false;
        gview.Visible = false;
    }

    protected void rdnormal_CheckedChanged(object sender, EventArgs e)
    {
        normaldata.Visible = true;
        schdata.Visible = false;
    }
 
    protected void proceed_Click(object sender, EventArgs e)
    {
        string msg = txtmobilesubject.Text;
        txt1.Text = msg;
        string msg1 = txt1.Text;
        txtmobilesubject.Visible = false;
        txt1.Visible = true;
        txt2.Visible = false;
        txtmobilesubject.Text = "";
        countmsg1.Visible = false;
    }

    protected void proceed1_Click(object sender, EventArgs e)
    {
        string msg = txt1.Text;
        txt2.Text = msg;
        string msg1 = txt2.Text;
        txtmobilesubject.Visible = false;
        txt1.Visible = false;
        txt2.Visible = true;
        txt1.Text = "";
        Tr1.Visible = false;
    }

    protected void txtmobilesubject_TextChanged(object sender, EventArgs e)
    {
        string message = txtmobilesubject.Text;
        if (message.Length == 160)
        {
            Label7.Text = "Do you Want To Proceed For More Message? ";
            Label7.Visible = true;
            countmsg1.Visible = true;
        }
    }

    protected void txt1_TextChanged(object sender, EventArgs e)
    {
        string message = txt1.Text;
        if (message.Length == 306)
        {
            Label8.Text = "Do you Want To Proceed For More Message? ";
            Label8.Visible = true;
            Tr1.Visible = true;
            countmsg1.Visible = false;
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        countmsg1.Visible = false;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        countmsg1.Visible = false;
    }
    
    protected void txtmsg_TextChanged(object sender, EventArgs e)
    {
        string message = txtmsg.Text;
        if (message.Length == 160)
        {
            Label9.Text = "Do you Want To Proceed For More Message? ";
            Label9.Visible = true;
            Tr2.Visible = true;
        }
    }

    protected void txtmsg1_TextChanged(object sender, EventArgs e)
    {
        string message = txtmsg1.Text;
        if (message.Length == 306)
        {
            Label10.Text = "Do you Want To Proceed For More Message? ";
            Label10.Visible = true;
            Tr3.Visible = true;
            Tr2.Visible = false;
        }
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        string msg = txtmsg.Text;
        txtmsg1.Text = msg;
        txtmsg.Visible = false;
        txtmsg.Visible = false;
        txtmsg.Visible = false;

        txtmsg1.Visible = true;
        txtmsg2.Visible = false;
        txtmsg.Text = "";
        Tr2.Visible = false;
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        string msg = txtmsg1.Text;
        txtmsg2.Text = msg;
        txtmsg.Visible = false;
        txtmsg2.Visible = true;
        txtmsg1.Visible = false;
        txtmsg1.Text = "";
        Label10.Visible = false;
        Tr3.Visible = false;
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Tr2.Visible = false;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
         Tr3.Visible = false;
    }
}
