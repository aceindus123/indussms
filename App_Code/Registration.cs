using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Indussms.DataAccessLayer;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Data.OleDb;
using System.Collections.Specialized;
using ExcelReader;
using System.IO;


/// <summary>
/// Summary description for Registration
/// </summary>
public class Registration
{
    public DBOperations obj = new DBOperations();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string script = string.Empty;
    DataSet ds = new DataSet();
    DataSet ds1 = new DataSet();
    SqlCommand cmd;
    SqlDataAdapter sda;

    private int reg_id;

    public int Reg_id
    {
        get { return reg_id; }
        set { reg_id = value; }
    }


    public string Reg_address { get; set; }

    public string Reg_lname { get; set; }

    private string reg_fname;

    public string Reg_fname
    {
        get { return reg_fname; }
        set { reg_fname = value; }
    }
    private string reg_email;

    public string Reg_email
    {
        get { return reg_email; }
        set { reg_email = value; }
    }
    private string reg_password;

    public string Reg_password
    {
        get { return reg_password; }
        set { reg_password = value; }
    }
    private string reg_compurl;

    public string Reg_compurl
    {
        get { return reg_compurl; }
        set { reg_compurl = value; }
    }
    private string reg_phone;

    public string Reg_phone
    {
        get { return reg_phone; }
        set { reg_phone = value; }
    }
    private string reg_pdate;

    public string Reg_pdate
    {
        get { return reg_pdate; }
        set { reg_pdate = value; }
    }

    public Registration()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Insert_registrationdetails(string fname, string email, string password, string comp_url, string phone, string pdate,string lname,string address)
    {
        try
        {
            con.Open();
            SqlTransaction myTrans = con.BeginTransaction();
            SqlParameter[] arParms = new SqlParameter[8];

            arParms[0] = new SqlParameter("@fname", SqlDbType.NVarChar);
            arParms[0].Value = fname;
            arParms[1] = new SqlParameter("@email", SqlDbType.NVarChar);
            arParms[1].Value = email;
            arParms[2] = new SqlParameter("@password", SqlDbType.NVarChar);
            arParms[2].Value = password;
            arParms[3] = new SqlParameter("@companyurl", SqlDbType.NVarChar);
            arParms[3].Value = comp_url;
            arParms[4] = new SqlParameter("@phno", SqlDbType.NVarChar);
            arParms[4].Value = phone;
            arParms[5] = new SqlParameter("@pdate", SqlDbType.NVarChar);
            arParms[5].Value = pdate;
            arParms[6] = new SqlParameter("@lname", SqlDbType.NVarChar);
            arParms[6].Value = lname;
            arParms[7] = new SqlParameter("@address", SqlDbType.NVarChar);
            arParms[7].Value = address;



            DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "insert_regdetails", arParms);
            myTrans.Commit();
            con.Close();
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return true;
    }
    public void SendMailToUser(string From, string To, string Subject, string Body)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", "ravi_iginc@yahoo.com");
        values.Add("api_key", "dc808cd8-512f-4f02-a6d6-9a2fc68ada01");

        values.Add("from", From);
        values.Add("subject", Subject);

        if (Body != null)
        {
            values.Add("body_html", Body);
        }
        values.Add("to", To);



        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);


    }
    public bool updateRegstatus(string mobile, int mobilestatus, string pdate)
    {
        try
        {
            con.Open();
            SqlTransaction myTrans = con.BeginTransaction();
            SqlParameter[] arParms = new SqlParameter[3];

            arParms[0] = new SqlParameter("@phno", SqlDbType.NVarChar);
            arParms[0].Value = mobile;
            arParms[1] = new SqlParameter("@mobilestatus", SqlDbType.Int);
            arParms[1].Value = mobilestatus;
            arParms[2] = new SqlParameter("@pdate", SqlDbType.NVarChar);
            arParms[2].Value = pdate;

            DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "updateregstatus", arParms);
            myTrans.Commit();
            con.Close();
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return true;
    }
    public string sendSms(string uname, string mobile, string pwd)

    {
        try
        {
            string sd = string.Empty;
            sd += "Dear " + uname + ", \n\n";

            sd += "User ID : " + mobile + ". \n\n";
            sd += "Password : " + pwd + ". \n\n";
            return sd += "plz, login into indussms.com.";
        }
        catch
        {
            return "";
        }
    }
    public DataSet checkemail(string email)
    {
        ds.Clear();
        try
        {
            con.Open();
            cmd = new SqlCommand("checkemail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", email);
            sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            con.Close();            
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet checkmobile(string mobile)
    {
        ds.Clear();
        try
        {
            con.Open();
            cmd = new SqlCommand("checkmobile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@phno", mobile);
            sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int insertnumbers(string strFileName, string strExtension, string strUploadFileName, string path, string user1, string listname)
    {
        int n = 0;
        string date = Convert.ToString(DateTime.Now);
        string listname1 = listname;
        string user2 = user1;

        FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read);
        IExcelDataContainer excelReader; //import the excel class library(dll) class and methods
        if (strExtension == ".xls")
            // Reading from a binary Excel file ('97-2003 format; *.xls)
            excelReader = ExcelReaderContainer.CreateBinaryReader(stream); //filestream as a parameter
        else
            //Reading from a OpenXml Excel file (2007 format; *.xlsx)
            excelReader = ExcelReaderContainer.CreateOpenXmlReader(stream); //filestream as a parameter
        // DataSet - The result of each spreadsheet will be created in the result.Tables
        DataSet result = new DataSet();
        result = excelReader.AsDataSet();
        //result=null;
        excelReader.Close(); //close the excel reader
        excelReader.Dispose();
        stream.Close();
        if (result.Tables.Count>0)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                if (result.Tables[0].Rows[0][0].ToString() != "mobile")
                {
                    n = 1;
                    return n;
                }
                else
                {
                    if (result.Tables[0].Rows.Count < 22)
                    {
                        for (int i = 1; i < result.Tables[0].Rows.Count; i++)
                        {
                            string a = result.Tables[0].Rows[i][0].ToString();
                            int x = a.Length;
                            if (x == 10)
                            {
                                string sqlqry = "insert into MobileNumbers(number,postdatedate,username,listname)values('" + a + "','" + date + "','" + user2 + "','" + listname1 + "')";
                                con.Open();
                                SqlCommand cmd = new SqlCommand(sqlqry, con);
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                        n = 4;
                        return n;
                    }
                    else
                    {
                        n = 5;
                        return n;
                    }
                }
            }
            return n;
        }
        n = 6;
        return n;
    }

    public int findemail(string email)
    {
        con.Open();
        string qry = "select count(*)  from registration where email='" + email + "'";
        SqlCommand cmd = new SqlCommand(qry, con);
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return count;
    }

    public DataTable Retrivedata(string email)
    {
       // con.Open();
        string qry = "select * from registration where email='" + email + "'";
        SqlDataAdapter da = new SqlDataAdapter(qry, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public int confirmuser(string mobile,string pwd)
    {
       // string qry = "select email,phno,password,mobilestatus  from registration where email='" + email + "' and phno='" + mobile + "' and password='" + pwd + "'";

        string qry = "select email,phno,password,mobilestatus  from registration where  phno='" + mobile + "' and password='"+pwd+"'";
        SqlDataAdapter da = new SqlDataAdapter(qry, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            int status = Convert.ToInt32(ds.Tables[0].Rows[0]["mobilestatus"].ToString());
            return status;
        }
        else
            return 2;
    }

    public bool savemissed(string number)
    {
        string date1 = Convert.ToString(System.DateTime.Now);
        con.Open();
        string qry = "insert into SMSMissedList(number,postdatedate) values('"+number+"','"+date1+"')";
        SqlCommand cmd = new SqlCommand(qry, con);
        int count = Convert.ToInt32(cmd.ExecuteNonQuery());
        con.Close();
        return true;
    }

    public DataSet Binddata(string user)
    {
       string qry = "select distinct listname  from MobileNumbers where username='" + user + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
         return ds2;
    }

    public DataSet Binddata1(string user)
    {
            try
           {
               cmd = new SqlCommand("binddata1", con);
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Parameters.AddWithValue("@username", user);
               sda = new SqlDataAdapter(cmd);
               sda.Fill(ds);
           }
           catch (Exception ex)
           {
               script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
           }
          
           return ds;
    }

    public DataSet AddSubscribers(string listname, string Lusername)
    {
        string qry = "select distinct number from mobilenumbers where listname='"+listname+"' and username='"+Lusername+"'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public DataSet AddSubscribers1(string listname, string Lusername)
    {
        string qry = "select distinct number from SingleNumbers where listname='" + listname + "' and username='" + Lusername + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public int insertnumbers1(string strFileName, string strExtension, string strUploadFileName, string path, string user1, string listname)
    {
        int n = 0;
        string date = Convert.ToString(DateTime.Now);
        string listname1 = listname;
        string user2 = user1;

        FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read);
        IExcelDataContainer excelReader; //import the excel class library(dll) class and methods
        if (strExtension == ".xls")
            excelReader = ExcelReaderContainer.CreateBinaryReader(stream); //filestream as a parameter
        else
            excelReader = ExcelReaderContainer.CreateOpenXmlReader(stream); //filestream as a parameter
        DataSet result = new DataSet();
        result = excelReader.AsDataSet();
        excelReader.Close(); 
        excelReader.Dispose();
        stream.Close();
        if (result.Tables.Count > 0)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                if (result.Tables[0].Rows[0][0].ToString() != "mobile")
                {
                    n = 1;
                    return n;
                }
                else
                {
                    if (result.Tables[0].Rows.Count < 22)
                    {
                        for (int i = 1; i < result.Tables[0].Rows.Count; i++)
                        {
                            string a = result.Tables[0].Rows[i][0].ToString();
                            int x = a.Length;
                            if (x == 10)
                            {
                                string sqlqry = "insert into EventNumbers(number,postdatedate,username,listname)values('" + a + "','" + date + "','" + user2 + "','" + listname1 + "')";
                                con.Open();
                                SqlCommand cmd = new SqlCommand(sqlqry, con);
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                        n = 4;
                        return n;
                    }
                    else
                    {
                        n = 5;
                        return n;
                    }
                }
            }
            return n;
        }
        n = 6;
        return n;
    }


    public DataSet databind(string user)
    {
        string qry = "select * from registration where phno='"+user+"'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public int updateprofile(string p, string p_2, string p_3, string p_4, string user)
    {
        int n=0;
        string sql = "update registration set fname='"+p+"',email='"+p_4+"',lname='"+p_2+"',address='"+p_3+"' where phno='" + user + "'";
        SqlCommand cmd = new SqlCommand(sql,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return n;
    }

    public int updateprofile1(string username,string pdate,string newpwd)
    {
        int n = 0;
        string sql = "update registration set password='" + newpwd + "',pwdchange='" + pdate + "' where phno='" + username + "'";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        return n;
    }


    public void sendAdditionalEmail(string frm, string username, string Body, string toemail, string subject)
    {
        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", "ravi_iginc@yahoo.com");
        values.Add("api_key", "dc808cd8-512f-4f02-a6d6-9a2fc68ada01");

        values.Add("from", frm);
        values.Add("subject", subject);

        if (Body != null)
        {
            values.Add("body_html", Body);
        }
        values.Add("to", toemail);



        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
    }

    public DataSet BindContacts(string p, string p_2)
    {
        DataSet ds = new DataSet();
        try
        {
            string ad = " SELECT * FROM SingleNumbers WHERE username='"+p+"' and UPPER(cname) LIKE UPPER('"+p_2+"%')  order by cname  ";
            SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            return ds2;
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
            return ds;
        }
    }


    public int savedata(string name, string number, string list,string uname)
    {
        int n = 0;
        string date1 =Convert.ToString(System.DateTime.Now);
        string sqlqry = "insert into SingleNumbers(cname,number,listname,postdate,username)values('" + name + "','" + number + "','"+list+"','" + date1 + "','" + uname + "')";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlqry, con);
        cmd.ExecuteNonQuery();
        con.Close();
        return n;
    }

    public DataSet savedata1(string uname)
    {
        string ad = "select * from SingleNumbers where username='"+uname+"' order by postdate ";
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public DataSet savedata2(string uname,string name)
    {
        string ad = " SELECT * FROM SingleNumbers where username='"+uname+"' and UPPER(listname)='"+name+"' ";
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public int createlist(string uname, string lname)
    {
        int n = 0;
        string date1 = Convert.ToString(System.DateTime.Now);
        string sqlqry = "insert into Lists(lname,cdate,username)values('" + lname + "','" + date1 + "','" + uname + "')";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlqry, con);
        cmd.ExecuteNonQuery();
        con.Close();
        return n;
    }

    public DataSet datalist(string uname)
    {
        string ad = "select lname from Lists where username='" + uname + "'  order by lname  asc";
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public DataSet deletedata(int Id, string uname)
    {
        string sqlqry = "delete SingleNumbers where mno='"+Id+"' and username='"+uname+"'";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlqry, con);
        cmd.ExecuteNonQuery();
        con.Close();
        string ad = "select * from SingleNumbers where username='" + uname + "' order by postdate"; 
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public DataSet editdata(int prd, string uname)
    {
        string ad = "select * from SingleNumbers where username='" + uname + "' and mno='"+prd+"'";
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public int updatedata(string a, string b, string date, string uname,int id)
    {
        int n = 0;
        string sqlqry = "update SingleNumbers set cname='"+a+"',number='"+b+"',postdate='"+date+"' where mno='" + id + "' and username='" + uname + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlqry, con);
        cmd.ExecuteNonQuery();
        con.Close();
        return n;
    }

    public string editdata1(string uname)
    {
        string ad = "select fname  from registration where phno='" + uname + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2.Tables[0].Rows[0]["fname"].ToString();
    }

    public int insertschreport(string sname, string uname, string name, string number, string subject, string time1, string time)
    {
        int n = 0;
        int interval = 0;
        string stat = "Scheduled";
        ds.Clear();
        try
        {
            con.Open();
            cmd = new SqlCommand("insertreport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sname", sname);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@number", number);
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@time1", time1);
            cmd.Parameters.AddWithValue("@time", time);
            cmd.Parameters.AddWithValue("@interval", interval);
            cmd.Parameters.AddWithValue("@stat", stat);

            sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return n;


    }

    public int updateschreport(string result, string uname,string time)
    {
        int n = 0;
        ds.Clear();
        try
        {
            con.Open();
            cmd = new SqlCommand("updatereport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@result", result);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@time", time);
           
            sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return n;

    }

    public DataSet grid()
    {
        string q = "select * from issue";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(q);
        return ds;
    }

    public DataSet datalist(string uname, string name)
    {
        string ad = "select * from lists where username='"+uname+"' and lname='"+name+"'";
        SqlDataAdapter da2 = new SqlDataAdapter(ad, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public string retrivemails(string sid, string uname)
    {

        string qry = "select recivernumber from ScheduleReport where sid='" + sid + "' and Sendernumber='" + uname + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        string value = ds2.Tables[0].Rows[0]["recivernumber"].ToString();
        return value;
    }

    public string retrivemails1(string sid, string uname)
    {

        string qry = "select subject from ScheduleReport where sid='" + sid + "' and Sendernumber='" + uname + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        string value = ds2.Tables[0].Rows[0]["subject"].ToString();
        return value;
    }

    public string retrivemails2(string sid, string uname)
    {

        string qry = "select recivernumber from NormalReport where sid='" + sid + "' and Sendernumber='" + uname + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        string value = ds2.Tables[0].Rows[0]["recivernumber"].ToString();
        return value;
    }

    public string retrivemails3(string sid, string uname)
    {

        string qry = "select subject from NormalReport where sid='" + sid + "' and Sendernumber='" + uname + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(qry, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        string value = ds2.Tables[0].Rows[0]["subject"].ToString();
        return value;
    }

    public DataSet bindgrid()
    {
        string q = "select * from purchase";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(q);
        return ds;
    }

    public string name(string uname)
    {
        string qry = "select fname from registration where phno='" + uname + "'";
        SqlDataAdapter da = new SqlDataAdapter(qry, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string name = ds.Tables[0].Rows[0]["fname"].ToString();
        return name;
    }


    public int insertschreport1(string username, string uname, string number, string message, DateTime time, string result)
    {
        int n = 0;
        string stat = "Sent";
        ds.Clear();
        try
        {
            con.Open();
            cmd = new SqlCommand("insertreport1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@number", uname);
            cmd.Parameters.AddWithValue("@snumber", number);
            cmd.Parameters.AddWithValue("@subject", message);
            cmd.Parameters.AddWithValue("@time1", time);
            cmd.Parameters.AddWithValue("@stat", stat);
            cmd.Parameters.AddWithValue("@rid", result);

            sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            script = "<script type=\"text/javascript\">alert('" + ex.Message + "');</script> ";
        }
        finally
        {
            con.Close();
        }
        return n;
    }

    public DataSet tetrivenormaltodaydata(string uname, string x, string y)
    {
        string date1 = x;
        string date2 = y;
        string s4 = "SELECT  * FROM NormalReport WHERE currentdate  BETWEEN '" + date1 + "' and '" + date2 + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(s4, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public DataSet tetrivenormaltodaydata1(string uname, string date1)
    {
        string date2 = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

        string s4 = "SELECT  * FROM  NormalReport WHERE currentdate BETWEEN '"+date1+"' and '"+date2+"'";
        SqlDataAdapter da2 = new SqlDataAdapter(s4, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        return ds2;
    }

    public DataSet senderid(string id, string s)
    {
        DataSet ds = new DataSet();
        string q = "select sendername from sendername where username='" + id + "' and status='" + s + "'";
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    public string amount(string id)
    {
        string qry = "select amountleft from textsmsexpenses where Uname='" + id + "'";
        SqlDataAdapter da = new SqlDataAdapter(qry, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string amt = ds.Tables[0].Rows[0]["amountleft"].ToString();
        return amt;
    }
    public string smsleft(string id)
    {
        string sub = "select smsleft from textsmsexpenses where Uname='" + id + "'";
        SqlDataAdapter ads = new SqlDataAdapter(sub, con);
        DataSet ds = new DataSet();
        ads.Fill(ds);
        string sms = ds.Tables[0].Rows[0]["smsleft"].ToString();
        return sms;
    }
    public string expiry(string id)
    {
        string q = "select expirydate from textsmsexpenses where Uname='" + id + "'";
        SqlDataAdapter ad1= new SqlDataAdapter(q,con);
        DataSet ds = new DataSet();
        ad1.Fill(ds);
        string exp = ds.Tables[0].Rows[0]["expirydate"].ToString();
        return exp;
    }

    public string voiceamount(string id)
    {
        string qry = "select amountleft from voicesmsexpenses where Uname='" + id + "'";
        SqlDataAdapter da = new SqlDataAdapter(qry, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string am = ds.Tables[0].Rows[0]["amountleft"].ToString();
        return am;
    }
    public string voicesms(string id)
    {
        string sub = "select smsleft from voicesmsexpenses where Uname='" + id + "'";
        SqlDataAdapter ads = new SqlDataAdapter(sub, con);
        DataSet ds = new DataSet();
        ads.Fill(ds);
        string sms = ds.Tables[0].Rows[0]["smsleft"].ToString();
        return sms;
    }

    public string voiceexpiry(string id)
    {
        string q = "select expirydate from voicesmsexpenses where Uname='" + id + "'";
        SqlDataAdapter ad1 = new SqlDataAdapter(q, con);
        DataSet ds = new DataSet();
        ad1.Fill(ds);
        string exp = ds.Tables[0].Rows[0]["expirydate"].ToString();
        return exp;
    }

   
}