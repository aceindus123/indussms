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

public partial class ScheduleSMS : System.Web.UI.Page
{
    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;
    string uname;
    DataSet ds = new DataSet();
    SMSCAPI cs = new SMSCAPI();
    Registration reg = new Registration();
    private string _schdate = string.Empty;
    public string schtimezone = "";
    private string schtime = "";
    private string schdate = "";
    private string pdate = string.Empty;
    exception err = new exception();
    static string excep_page = "ScheduleSMS.aspx";
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Convert.ToString(Session["User"]);
        string s = "active";
        if (Session["User"] != null)
        {
              string demobal = getdemobal(Session["User"].ToString());
              if (demobal != "1")
              {

                  string ds5 = getbal(Session["User"].ToString());
                  if (ds5 != "0")
                  {
                      if (!IsPostBack)
                      {
                          SqlDataAdapter da = new SqlDataAdapter("select sendername from sendername where status='active' and username='" + uname + "'", sqlConnection);
                          DataSet ds = new DataSet();
                          da.Fill(ds);
                          if (ds.Tables[0].Rows.Count > 0)
                          {
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

                          divcautions.Visible = false;
                          rdnumber.Checked = true;
                          rdlist.Checked = false;
                          list.Visible = false;
                          list1.Visible = false;

                          SqlDataAdapter da1 = new SqlDataAdapter("select * from Templates where status='active' and username='" + uname + "' and count<=2", sqlConnection);
                          DataSet ds1 = new DataSet();
                          da1.Fill(ds1);
                          if (ds1.Tables[0].Rows.Count > 0)
                          {
                              ddtemplate.DataSource = ds1;
                              ddtemplate.DataTextField = "tname";
                              ddtemplate.DataValueField = "tname";
                              ddtemplate.DataBind();
                              ddtemplate.Items.Insert(0, "Select Template");
                          }

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

                  string strScript = "alert('You Have Free Money in Your account please use that Money After Access this Page');location.replace('SMsDemo.aspx');";
                  Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
              }
            }

        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private string getdemobal(string p)
    {

        string qry = "select * from textsmsexpenses where Amount=2 and uname='" + p + "' and status=1";
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

    private string getbal(string p)
    {

        string qry = "select smsleft from textsmsexpenses where uname='" + p + "' and status=1";
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


    private string cost()
    {
        string costrate = "select * from smscost";
        SqlDataAdapter da = new SqlDataAdapter(costrate, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string rate = ds.Tables[0].Rows[0]["textsms"].ToString();
        return rate;
    }

    private void expence(string p, int p_2, string p_3, string time)
    {
        try
        {
            sqlConnection.Open();
            string qry = "insert into Expences(uname,count,amount,etime) values('" + p + "'," + p_2 + ",'" + p_3 + "','" + time + "')";
            SqlCommand cmd = new SqlCommand(qry, sqlConnection);
            cmd.ExecuteNonQuery();

            string qry1 = "select top(1) b.smsleft-a.count as Cnt,(cast(b.amountleft as decimal(18,2))-cast(a.amount as decimal(18,2)) )as Bal from Expences a inner join  textsmsexpenses b on a.uname=b.uname where a.uname='" + p + "' and status=1 order by eid desc";
            SqlDataAdapter da = new SqlDataAdapter(qry1, sqlConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string a = ds.Tables[0].Rows[0]["Cnt"].ToString();
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

        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
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

                divcautions.Visible = true;
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
        
        
        Tr1.Visible = true;

        rdnumber.Checked = false;
        list.Visible = true;
        list1.Visible = true;
        txtnumbers.Enabled = false;
        divcautions.Visible = true;
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
        divcautions.Visible = false;
        Tr1.Visible = false;
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
        try
        {
            string x3 = cost();
            string uname = Convert.ToString(Session["user"]);
            string sname = reg.editdata1(uname);
            string time = txttime.Text;
           // string time1 = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string time1 = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt"));

            string subject = txtmsg.Text;
            string accuser = Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]);
            string accpassword = Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]);

            string ds5 = getbal(Session["User"].ToString());
            string time2 = Convert.ToString(DateTime.Now.ToString());


            string name = "";
            string number = "";
             string template="";
             string senderid="";


            int count = 0;//(uname,count,amount,etime
            string amount = "";
            if (rdnumber.Checked == true)
            {
               // if()
                name = txtname.Text;
                number = txtmobile.Text;
                if (Label11.Text == "2 Messages will Count")
                {
                    count = 2;
                }
                else
                {
                    count = 1;
                }
                Double y = Convert.ToDouble(x3) * Convert.ToDouble(count);
                
                amount = Convert.ToString(y);

                senderid="ACEIND";
                template="";
              //  amount = Convert.ToString(count * 0.50);
            }
            else
            {
                if (ddlschedulesender.SelectedItem.Text != "Select" && ddtemplate.SelectedItem.Text!="Select Template")
                {
                    senderid=ddlschedulesender.SelectedItem.Text;
                     template = ddtemplate.SelectedItem.Text;
                    name = ddlist.SelectedItem.Text;
                    number = txtnumbers.Text;

                    int count3 = 0;
                    if (Label11.Text == "2 Messages will Count")
                    {
                        count3 = 2;
                    }
                    else
                    {
                        count3 = 1;
                    }
                    count = number.Count(','.Equals);

                    count = count3 * (count + 1);

                    Double y = Convert.ToDouble(x3) * Convert.ToDouble(count);

                    amount = Convert.ToString(y);
                }
                else
                {
                    string strScript = "alert('Please Select Template and Sender ID');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }

               // amount = Convert.ToString(count);
            }
            // int amount1 = Convert.ToInt32("0.50") * count;
            if (number != "")
            {
                if (Convert.ToInt32(ds5) >= count)
                {
                    int n = reg.insertschreport(sname, uname, name, number, subject, time1, time,template,senderid);

                    string result = cs.SendSMS2(uname, sname, name, number, subject, accpassword, accuser, time);

                    int n1 = reg.updateschreport(result, uname, time);


                    expence(uname, count, amount, time2);

                    Tr2.Visible = false;

                    string script = "alert('Message Scheduled Successfully');location.replace('ScheduleSMS.aspx');";
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
                    string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
            else
            {
                string script = "alert('You are Providing Empty List')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }

    protected void imgcancel_Click(object sender, ImageClickEventArgs e)
    {
        txttime.Text = "";
        ModalPopupExtender3.Hide();
    }

    protected void imgcal_Click(object sender, ImageClickEventArgs e)
    {
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
            // int hour = DateTime.Now.Hour;
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


    protected void rdnormal_CheckedChanged(object sender, EventArgs e)
    {
        normaldata.Visible = true;
        schdata.Visible = false;
    }

    protected void txtmsg_TextChanged(object sender, EventArgs e)
    {
        int count = txtmsg.Text.Length;
        if (count > 160)
        {
            Label9.Text = "Do you Want To Proceed For More(2) Messages? ";
            Tr2.Visible = true;
            Label10.Visible = false;
        }

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Tr2.Visible = false;
        string ab = txtmsg.Text;
        string sub = ab.Substring(0, 160);
        txtmsg.Text = sub;
        Label10.Text = "Maximum Allowed Charecters is 160 Per (1) Message ";
        Label10.Visible = true;
        Label11.Visible = false;

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Tr2.Visible = false;
        Label10.Visible = false;
      //  Label11.Text = "list";
        Label11.Text = "2 Messages will Count";
        Label11.Visible = true;
    }

    protected void ddtemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddtemplate.SelectedItem.Text != "Select Template")
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from Templates where status='active' and username='" + uname + "' and count<=2 and tname='" + ddtemplate.SelectedItem.Text + "'", sqlConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                if (ds1.Tables[0].Rows[0]["count"].ToString() == "1")
                {
                    txtmsg.Text = ds1.Tables[0].Rows[0]["tdiscription"].ToString();
                    txtmsg.Enabled = false;
                    Label10.Text = "1 Message will Count";
                    Label10.Visible = true;
                }
                else if (ds1.Tables[0].Rows[0]["count"].ToString() == "2")
                {
                    txtmsg.Text = ds1.Tables[0].Rows[0]["tdiscription"].ToString();
                    txtmsg.Enabled = false;
                    Label11.Text = "2 Messages will Count";
                    Label11.Visible = true;
                }

            }
        }
        else
        {
            string script = "alert('Please select Tempalte')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }
}