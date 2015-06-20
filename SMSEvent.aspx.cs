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
    exception err = new exception();
    static string excep_page = "SMSEvent.aspx";

    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Convert.ToString(Session["User"]);
      // id = Convert.ToString(Session["User"]);
        string s = "active";
        if (Session["User"] != null)
        {
            string demobal = getdemobal(Session["User"].ToString());
            if (demobal!="1")
            {
                string ds5 = getbal(Session["User"].ToString());
                if (ds5 != "0")
                {
                    if (!IsPostBack)
                    {

                        schline1.Visible = true;
                        countmsg1.Visible = false;

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

                        SqlDataAdapter da1 = new SqlDataAdapter("select * from Templates where status='active' and username='" + uname + "'", sqlConnection);
                        DataSet ds1 = new DataSet();
                        da1.Fill(ds1);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            ddtemplate.DataSource = ds1;
                            ddtemplate.DataTextField = "tname";
                            ddtemplate.DataValueField = "tname";
                            ddtemplate.DataBind();
                            ddtemplate.Items.Insert(0, "Select");
                        }
               
                    }
                }
                else
                {
                    string strScript = "alert('You Dont Have Money in Your account');location.replace('Balance.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else{

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

    protected void cleardata()
    {
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
        TextBox1.Text = "";
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SMSCAPI objSms = new SMSCAPI();
        string id = "ACEIND";
        string N = "N";
        string Y = "Y";
        string result = "";
        string number = "";
        //       DateTime time = Convert.ToDateTime(DateTime.Now.ToString());
        string time1 = Convert.ToString(DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"));
        string message = "";
        string username = reg.name(uname);// for name
        string ds5 = getbal(Session["User"].ToString());// for number
        string x3 = cost();
        string temlate = "";

        //if (ddlsender.SelectedItem.Text == "Select")
        //{
        //     id = "ACEIND";
        //}

        //else
        //{
        //    id = ddlsender.SelectedItem.Text;
        //}

        try
        {
            if (rdsingle.Checked == true)
            {
                temlate = "";
              
                if ((txtmobileelection.Text != String.Empty && txtmobilesubject.Text != String.Empty))
                {
                    number = txtmobileelection.Text;
                    message = txtmobilesubject.Text;
                    result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                    expence(uname, 1, x3, time1);

                    int n = reg.insertschreport1(username, uname, number, message, time1, result, temlate,id);
                    cleardata();
                }

                else if ((txtmobileelection.Text != String.Empty && txt1.Text != String.Empty))
                {
                    if (Convert.ToInt32(ds5) >= 2)
                    {
                        Double y = Convert.ToDouble(x3) * 2;
                        string x1 = Convert.ToString(y);
                        number = txtmobileelection.Text;
                        message = txt1.Text;
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, 2, x1, time1);
                        int n = reg.insertschreport1(username, uname, number, message, time1, result, temlate,id);
                        cleardata();
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
                        Double y = Convert.ToDouble(x3) * 3;
                        string x1 = Convert.ToString(y);
                        number = txtmobileelection.Text;
                        message = txt2.Text;
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, 3, x1, time1);
                        int n = reg.insertschreport1(username, uname, number, message, time1, result, temlate,id);
                        cleardata();
                    }

                    else
                    {
                        string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                }

                else
                {
                    string script = "alert('Please Enter Mobile Number and Subject')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }


            else
            {
                temlate = ddtemplate.SelectedItem.Text;
                number = TextBox1.Text;

                if (TextBox1.Text != String.Empty && txtmobilesubject.Text != String.Empty && ddtemplate.SelectedItem.Text != "Select" && ddlsender.SelectedItem.Text != "Select")
                {
                    int x = number.Count(','.Equals);
                    number = number.Remove(number.Length - 1);

                    ds5 = getbal(Session["User"].ToString());
                    if (Convert.ToInt32(ds5) >= x * 1)
                    {
                        int z = x * 1;
                        Double y1 = Convert.ToDouble(z) * Convert.ToDouble(x3);
                        string y = Convert.ToString(y1);
                        message = txtmobilesubject.Text;
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, z, y, time1);
                        int n = reg.insertschreport1(username, uname, number, message, time1, result, temlate,id);
                        cleardata();

                    }
                    else
                    {
                        string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                }

                else if (TextBox1.Text != String.Empty && txt1.Text != String.Empty && ddtemplate.SelectedItem.Text != "Select" && ddlsender.SelectedItem.Text != "Select")
                {
                    int x = number.Count(','.Equals);
                    number = number.Remove(number.Length - 1);
                    message = txt1.Text;
                    // string y = Convert.ToString(x * 1);
                    int z = x * 2;
                    Double y1 = Convert.ToDouble(z) * Convert.ToDouble(x3);
                    string y = Convert.ToString(y1);

                    ds5 = getbal(Session["User"].ToString());
                    if (Convert.ToInt32(ds5) >= x * 2)
                    {
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, z, y, time1);
                        int n = reg.insertschreport1(username, uname, number, message, time1, result, temlate,id);
                        cleardata();

                    }
                    else
                    {
                        string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                }

                else if (TextBox1.Text != String.Empty && txt2.Text != String.Empty && ddtemplate.SelectedItem.Text != "Select" && ddlsender.SelectedItem.Text != "Select")
                {
                    int x = number.Count(','.Equals);
                    number = number.Remove(number.Length - 1);
                    message = txt2.Text;
                    // string y = Convert.ToString(x * 1.50);

                    int z = x * 3;
                    Double y1 = Convert.ToDouble(z) * Convert.ToDouble(x3);
                    string y = Convert.ToString(y1);
                    ds5 = getbal(Session["User"].ToString());
                    if (Convert.ToInt32(ds5) >= x * 3)
                    {
                        result = objSms.SendSMS(Convert.ToString(ConfigurationManager.AppSettings["SmsUsername"]), Convert.ToString(ConfigurationManager.AppSettings["SmsPassword"]), number, message, N, Y, id);
                        expence(uname, z, y, time1);
                        int n = reg.insertschreport1(username, uname, number, message, time1, result, temlate,id);
                        cleardata();
                    }
                    else
                    {
                        string script = "alert('You Dont have Enough Balance to send Messages! Please check Balance Page');location.replace('Balance.aspx');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                }

                else
                {
                    string script = "alert('Please Select  List and Template and SenderID');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                }
            }
        }

        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
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
        trtemplate.Visible = false;
        txtmobilesubject.Visible = true;
        txt1.Visible = false;
        txt2.Visible = false;
    }

    protected void rdmultiple_CheckedChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da1 = new SqlDataAdapter("select * from sendername where status='active' and username='" + uname + "'", sqlConnection);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            SINGLESMS.Visible = true;
            rdmultiple.Visible = true;
            rdsingle.Visible = true;
            selectlist.Visible = true;
            selectlist1.Visible = false;
            trtemplate.Visible = true;

            SINGLESMS.Visible = true;
            divcautions.Visible = true;
            gview.Visible = true;

            if (uname != "")
            {
                DataSet ds2 = reg.Binddata1(uname);
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    gv1.DataSource = ds2;
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
        else
        {
            string script = "alert('You are Not Provided Template and register Sender ID');location.replace('Sender_id.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }

        SqlDataAdapter da2 = new SqlDataAdapter("select * from Templates where status='active' and username='" + uname + "'", sqlConnection);
        DataSet ds3 = new DataSet();
        da2.Fill(ds3);
        if (ds3.Tables[0].Rows.Count > 0)
        {
            ddtemplate.DataSource = ds3;
            ddtemplate.DataTextField = "tname";
            ddtemplate.DataValueField = "tname";
            ddtemplate.DataBind();
            ddtemplate.Items.Insert(0, "Select");
        }
        else
        {
            string strScript = "alert('You Dont have Approved Templates. ');location.replace('SMSTemplates.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
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


    protected void proceed_Click(object sender, EventArgs e)
    {
        string msg = txtmobilesubject.Text;
        txt1.Text = msg;
        string msg1 = txt1.Text;
      //  SINGLESMS.Visible = false;
        txtmobilesubject.Visible = false;
        txt1.Visible = true;
        txt2.Visible = false;
        txtmobilesubject.Text = "";
        countmsg1.Visible = false;
        Label3.Visible = true;
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
        Label4.Visible = true;
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
        //string message = txt1.Text;
        //if (message.Length == 306)
        //{
        //    Label8.Text = "Do you Want To Proceed For More Message? ";
        //    Label8.Visible = true;
        //    Tr1.Visible = true;
        //    countmsg1.Visible = false;
        //}
        string message = txt1.Text;
        if (message.Length == 306)
        {
            Label8.Text = "Do you Want To Proceed For More Message? ";
            Label8.Visible = true;
            Tr1.Visible = true;
            countmsg1.Visible = false;
            Label3.Visible = false;
        }
        else if ((message.Length <= 306) && (message.Length >= 160))
        {
            txt1.Text = message;
            txt1.Visible = true;
            Label3.Visible = true;

        }
        else
        {
            string message1 = txt1.Text;
            txtmobilesubject.Visible = true;
            txtmobilesubject.Text = message1;
            txt1.Visible = false;
            txt1.Text = "";
            Label3.Visible = false;


        }
    }

    protected void txt2_TextChanged(object sender, EventArgs e)
    {
        string message = txt2.Text;

        if ((message.Length <= 459) && (message.Length >= 306))
        {
            txt2.Text = message;
            txt2.Visible = true;
            Label4.Visible = true;

        }
        else if ((message.Length <= 306) && (message.Length >= 160))
        {
            txt1.Visible = true;
            txt1.Text = message;
            txt2.Visible = false;
            txt2.Text = "";
            Label4.Visible = false;
            Label3.Visible = true;
        }

        else
        {
            txtmobilesubject.Visible = true;
            txtmobilesubject.Text = message;
            txt1.Visible = false;
            txt1.Text = "";
            Label3.Visible = false;
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


    protected void ddtemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddtemplate.SelectedItem.Text!="Select")
        {
 SqlDataAdapter da1 = new SqlDataAdapter("select * from Templates where status='active' and username='" + uname + "' and tname='" + ddtemplate.SelectedItem.Text + "'", sqlConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                if (ds1.Tables[0].Rows[0]["count"].ToString() == "1")
                {
                    txtmobilesubject.Text = ds1.Tables[0].Rows[0]["tdiscription"].ToString();
                    txtmobilesubject.Enabled = false;
                    txt1.Visible = false;
                    txt2.Visible = false;
                    txtmobilesubject.Visible = true;
                }
                else if (ds1.Tables[0].Rows[0]["count"].ToString() == "2")
                {
                    txt1.Text = ds1.Tables[0].Rows[0]["tdiscription"].ToString();
                    txt1.Visible = true;
                    txt2.Visible = false;
                    txtmobilesubject.Visible = false;
                    txt1.Enabled = false;
                }
                else
                {
                    txt2.Text = ds1.Tables[0].Rows[0]["tdiscription"].ToString();
                    txt2.Enabled = false;
                    txt1.Visible = false;
                    txt2.Visible = true;
                    txtmobilesubject.Visible = false;
                }
            }
        }
    }

}
