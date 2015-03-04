using Microsoft.VisualBasic;
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.Data.SqlClient;


public class SMSCAPI
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    private WebProxy objProxy1 = null;

    public string SendSMS(string User, string password, string Mobile_Number, string Message)
    {
        string stringpost = null;
        string id = "MONTES";
          stringpost = "User=" + User + "&passwd=" + password + "&mobilenumber=" + Mobile_Number + "&message=" + Message +"&sid="+id;
        HttpWebRequest objWebRequest = null;
        HttpWebResponse objWebResponse = null;
        StreamWriter objStreamWriter = null;
        StreamReader objStreamReader = null;

        try
        {
            string stringResult = null;
            objWebRequest = (HttpWebRequest)WebRequest.Create("http://www.smscountry.com/SMSCwebservice_bulk.aspx");
            objWebRequest.Method = "POST";

            if ((objProxy1 != null))
            {
                objWebRequest.Proxy = objProxy1;
            }
            objWebRequest.ContentType = "application/x-www-form-urlencoded";
            objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
            objStreamWriter.Write(stringpost);
            objStreamWriter.Flush();
            objStreamWriter.Close();
            objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
            objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
            stringResult = objStreamReader.ReadToEnd();
            objStreamReader.Close();
            return stringResult;
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        finally
        {

            if ((objStreamWriter != null))
            {
                objStreamWriter.Close();
            }
            if ((objStreamReader != null))
            {
                objStreamReader.Close();
            }
            objWebRequest = null;
            objWebResponse = null;
            objProxy1 = null;
        }

        // }

    }

    public string SendSMS1(string User, string password, string Mobile_Number, string Message)
    {
        string result = "";
        List<string> TotalEmails = new List<string>();

        string x1 = Convert.ToString(Mobile_Number);
        string[] toemails = x1.Split(';');

        int index1 = 0;
        for (index1 = 0; index1 <= toemails.Length - 1; index1++)
        {
            if (toemails[index1].ToString() != "")
            {
                TotalEmails.Add(toemails[index1].ToString());
            }
        }

        if (TotalEmails.Count != 0)
        {
            for (int i = 0; i < TotalEmails.Count; i++)
            {
                string value = TotalEmails[i] as string;

                result = SendSMS(User, password, value, Message);
            }

        }
        return result;


    }

    private void StreamReader(Stream stream)
    {
        throw new NotImplementedException();
    }

    public string SendSMS(string User, string password, string Mobile_Number, string Message, string Mtype)
    {

        System.Object stringpost = "User=" + User + "&passwd=" + password + "&mobilenumber=" + Mobile_Number + "&message=" + Message + "&MType=" + Mtype;

        HttpWebRequest objWebRequest = null;
        HttpWebResponse objWebResponse = null;
        StreamWriter objStreamWriter = null;
        StreamReader objStreamReader = null;

        try
        {
            string stringResult = null;

            objWebRequest = (HttpWebRequest)WebRequest.Create("http://www.smscountry.com/SMSCwebservice_bulk.aspx?");
            objWebRequest.Method = "POST";

            if ((objProxy1 != null))
            {
                objWebRequest.Proxy = objProxy1;
            }

            objWebRequest.ContentType = "application/x-www-form-urlencoded";

            objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
            objStreamWriter.Write(stringpost);
            objStreamWriter.Flush();
            objStreamWriter.Close();

            objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
            objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
            stringResult = objStreamReader.ReadToEnd();

            objStreamReader.Close();
            return (stringResult);
        }
        catch (Exception ex)
        {
            return (ex.Message);
        }
        finally
        {

            if ((objStreamWriter != null))
            {
                objStreamWriter.Close();
            }
            if ((objStreamReader != null))
            {
                objStreamReader.Close();
            }
            objWebRequest = null;
            objWebResponse = null;
            objProxy1 = null;
        }
    }

    public string SendSMS(string User, string password, string Mobile_Number, string Message, string Mtype, string DR)
    {

        System.Object stringpost = "User=" + User + "&passwd=" + password + "&mobilenumber=" + Mobile_Number + "&message=" + Message + "&MType=" + Mtype + "&DR=" + DR;

        HttpWebRequest objWebRequest = null;
        HttpWebResponse objWebResponse = null;
        StreamWriter objStreamWriter = null;
        StreamReader objStreamReader = null;

        try
        {
            string stringResult = null;

            objWebRequest = (HttpWebRequest)WebRequest.Create("http://www.smscountry.com/SMSCwebservice_bulk.aspx?");
            objWebRequest.Method = "POST";

            if ((objProxy1 != null))
            {
                objWebRequest.Proxy = objProxy1;
            }

            objWebRequest.ContentType = "application/x-www-form-urlencoded";

            objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
            objStreamWriter.Write(stringpost);
            objStreamWriter.Flush();
            objStreamWriter.Close();

            objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
            objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
            stringResult = objStreamReader.ReadToEnd();

            objStreamReader.Close();
            return (stringResult);
        }
        catch (Exception ex)
        {
            return (ex.Message);
        }
        finally
        {

            if ((objStreamWriter != null))
            {
                objStreamWriter.Close();
            }
            if ((objStreamReader != null))
            {
                objStreamReader.Close();
            }
            objWebRequest = null;
            objWebResponse = null;
            objProxy1 = null;
        }
    }

    public string SendSMS(string User, string password, string Mobile_Number, string Message, string Mtype, string DR, string SID)
    {
        //normal messge with save reports
        System.Object stringpost = "User=" + User + "&passwd=" + password + "&mobilenumber=" + Mobile_Number + "&message=" + Message + "&MType=" + Mtype + "&DR=" + DR + "&SID=" + SID;

        HttpWebRequest objWebRequest = null;
        HttpWebResponse objWebResponse = null;
        StreamWriter objStreamWriter = null;
        StreamReader objStreamReader = null;

        try
        {
            string stringResult = null;

            objWebRequest = (HttpWebRequest)WebRequest.Create("http://www.smscountry.com/SMSCwebservice_bulk.aspx?");
            objWebRequest.Method = "POST";

            if ((objProxy1 != null))
            {
                objWebRequest.Proxy = objProxy1;
            }

            objWebRequest.ContentType = "application/x-www-form-urlencoded";

            objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
            objStreamWriter.Write(stringpost);
            objStreamWriter.Flush();
            objStreamWriter.Close();

            objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
            objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
            stringResult = objStreamReader.ReadToEnd();

            objStreamReader.Close();
            return (stringResult);
        }
        catch (Exception ex)
        {
            return (ex.Message);
        }
        finally
        {

            if ((objStreamWriter != null))
            {
                objStreamWriter.Close();
            }
            if ((objStreamReader != null))
            {
                objStreamReader.Close();
            }
            objWebRequest = null;
            objWebResponse = null;
            objProxy1 = null;
        }
    }

    public string SendSMS2(string uname, string sname, string name, string number, string subject, string accpassword, string accuser, string time)
    {
        string sysdate = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");

        System.Object stringpost = "user=" + accuser + "&passwd=" + accpassword + "&mobilenumber=" + number + "&message=" + subject + "&SenderName=" + name + "&schedulerName=" + sname + "&ScheduledDateTime=" + time + "&systemcurrenttime=" + sysdate + "&interval=" + 0;

        HttpWebRequest objWebRequest = null;
        HttpWebResponse objWebResponse = null;
        StreamWriter objStreamWriter = null;
        StreamReader objStreamReader = null;

        try
        {
            string stringResult = null;

          objWebRequest = (HttpWebRequest)WebRequest.Create("http://www.smscountry.com/APISetReminder.asp?" + stringpost + "");
          // string  request = "<request action="http://smscountry.com/testdr.aspx"method="GET"><to>" + Mobile_Number + "</to><play>http://smscountry.com/voice_clips/4031001209_130806161411.wav</play></request>";
            objWebRequest.Method = "POST";

            if ((objProxy1 != null))
            {
                objWebRequest.Proxy = objProxy1;
            }


            objWebRequest.ContentType = "application/x-www-form-urlencoded";

            objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
            objStreamWriter.Write(stringpost);
            objStreamWriter.Flush();
            objStreamWriter.Close();

            objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
            objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
            stringResult = objStreamReader.ReadToEnd();

            objStreamReader.Close();
            return (stringResult);
        }
        catch (Exception ex)
        {
            return (ex.Message);
        }
        finally
        {

            if ((objStreamWriter != null))
            {
                objStreamWriter.Close();
            }
            if ((objStreamReader != null))
            {
                objStreamReader.Close();
            }
            objWebRequest = null;
            objWebResponse = null;
            objProxy1 = null;
        }
    }

    public DataSet requestdetails(string uname1)
    {
        string uname = "aceindus";
        string Password = "ACEINDUS9";

        string s1 = " select top(10) substring(Recivernumber,1,10) as Recivernumber,substring(subject,1,10) as subject, *  from ScheduleReport where sendernumber=" + uname1 + " and status='Scheduled' order by sid desc";
        SqlDataAdapter sda = new SqlDataAdapter(s1, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string s11 = Convert.ToString(ds.Tables[0].Rows[i]["Rid"]);
                if (s11 != "" && s11 != null && s11 != "NULL")
                {
                    WebClient web1 = new WebClient();
                    NameValueCollection values1 = new NameValueCollection();
                    byte[] response1 = web1.UploadValues("http://www.smscountry.com/APIViewReminder.asp?user=" + uname + "&passwd=" + Password + "&RID=" + s11, values1);

                    Label l1 = new Label();
                    l1.Text = Encoding.UTF7.GetString(response1);
                    string res = l1.Text;

                    string status = "";
                    if (res == "Invalid Reminder ID")
                    {
                        status = "Sent";
                    }
                    else
                    {
                        status = "Scheduled";
                    }

                    string sqlqry = "update ScheduleReport set status='" + status + "' where sendernumber='" + uname1 + "' and rid='" + s11 + "'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlqry, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return ds;


        }
        else
        {
            string s11 = " select top(10) substring(Recivernumber,1,10) as Recivernumber,substring(subject,1,10) as subject, *  from ScheduleReport where sendernumber=" + uname1 + " and status='Sent' order by sid desc";
            SqlDataAdapter sda1 = new SqlDataAdapter(s11, con);
            DataSet ds1 = new DataSet();
            sda1.Fill(ds1);
            return ds1;

        }

    }

    public DataSet AddSubscribers1(string listname, string ame)
    {
        string qry = "select distinct number from SingleNumbers where listname='" + listname + "' and username='" + ame + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }


    public DataSet requestdetails1(string uname)
    {
        string s1 = " select top(10) substring(Recivernumber,1,10) as Recivernumber,substring(subject,1,10) as subject, *  from NormalReport where sendernumber=" + uname + " and status='Sent' order by sid desc";
        SqlDataAdapter sda = new SqlDataAdapter(s1, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);

        if (ds.Tables[0].Rows.Count != 0)
        {
            return ds;
        }
        return ds;
    }

    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;

    public string Voice(string number, string file)
    {
        string api_key = "PdiHP80jNEOTrOaJrCvf";
        string access_key = "cbhEYUDKjoDUZbNwmQDDhgmjUXAaH8q8NRVdR32J";
        string Mobile_Number = number;
        string stringpost = null;
        string url = "http://indussms.com/voicesms/" + file;
        string request = "";
        request = "http://voiceapi.smscountry.com/api?api_key=PdiHP80jNEOTrOaJrCvf&access_key=cbhEYUDKjoDUZbNwmQDDhgmjUXAaH8q8NRVdR32J&xml=<request action ='www.indusssms.com'><to>" + Mobile_Number + "</to><play>" + url + "</play></request>";
        //request = "<request action=http://smscountry.com/testdr.aspx method='GET'><to>" + Mobile_Number + "</to><play>" +url+"</play></request>";
        stringpost = "api_key=" + api_key + "&access_key=" + access_key + "&xml=" + request;
        HttpWebRequest objWebRequest = null;
        HttpWebResponse objWebResponse = null;
        StreamWriter objStreamWriter = null;
        StreamReader objStreamReader = null;
        try
        {
            string stringResult = null;
            objWebRequest = (HttpWebRequest)WebRequest.Create("http://voiceapi.smscountry.com/api");
            objWebRequest.Method = "POST";
            objWebRequest.ContentType = "application/x-www-form-urlencoded";
            objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream());
            objStreamWriter.Write(stringpost);
            objStreamWriter.Flush();
            objStreamWriter.Close();
            objWebResponse = (HttpWebResponse)objWebRequest.GetResponse();
            objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
            stringResult = objStreamReader.ReadToEnd();
            objStreamReader.Close();
            return (stringResult);
            //Response.Write(stringResult);
        }
        catch (Exception ex)
        {
            return ex.Message;
            //Response.Write(ex.Message);
        }
        finally
        {
            if ((objStreamWriter != null))
            {
                objStreamWriter.Close();
            }
            if ((objStreamReader != null))
            {
                objStreamReader.Close();
            }
            objWebRequest = null;
            objWebResponse = null;
            objProxy1 = null;
        }
    }  



    //public string sms(string uname, string password, string mobile, string msg)
    //{
    //    string id = "MONTES";
    //    string N = "N";
    //    string Y = "Y";
    //    WebClient web1 = new WebClient();
    //    NameValueCollection values1 = new NameValueCollection();
    //    byte[] response1 = web1.UploadValues("http://api.smscountry.com/SMSCwebservice_bulk.aspx?User = " + uname + "&passwd =" + password + "&mobilenumber=" + mobile + "&message=" + msg + "&sid =" + id + "& mtype =" + N + " &DR =" + Y + "", values1);
    //    Label l1 = new Label();
    //    l1.Text = Encoding.UTF7.GetString(response1);
    //    string res = l1.Text;

    //    return res;
    //}

}






