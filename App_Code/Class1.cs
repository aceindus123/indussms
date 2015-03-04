using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Indussms.DataAccessLayer;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Collections.Specialized;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
    
    private string fname;

    public string Fname
    {
        get { return fname; }
        set { fname = value; }
    }
    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    private string address;

    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    private string country;

    public string Country
    {
        get { return country; }
        set { country = value; }
    }
    private string states;

    public string States
    {
        get { return states; }
        set { states = value; }
    }
    private string city;

    public string City
    {
        get { return city; }
        set { city = value; }
    }

    private string zipcode;

public string Zipcode
{
  get { return zipcode; }
  set { zipcode = value; }
}
private string phonenumber;

public string Phonenumber
{
    get { return phonenumber; }
    set { phonenumber = value; }
}
private string comments;

public string Comments
{
  get { return comments; }
  set { comments = value; }
}
    public DBOperations obj = new DBOperations();
    //public DBOperations obj1 = new DBOperations();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string script = string.Empty;
    DataSet ds = new DataSet();
	public Class1()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet getcountry()
    {
        //string qry = "select * from country order by countryname desc";
        string qry = "select * from Country";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        //da.Fill(ds);
        return ds;
    }
    public DataSet getstates(string id)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("select * from states where country=" + id + " order by  statename asc ", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        
da.Fill(ds);
        return ds;
      
    }
    //public DataSet getcities()
    //{
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("select * from cities ", con);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);

    //    da.Fill(ds);
    //    return ds;
    //}
    public DataSet getcities2(string id)
    {
        DataSet ds2 = new DataSet();
        SqlCommand cmd = new SqlCommand("select * from cities where stateid=" + id , con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(ds2);

        return ds2;
    }
    public bool contactus(string fname,string email,string address,string country,string states,string city,string zipcode,string phonenumber,string comments)
    {
        try
        {
            con.Open();
            SqlTransaction mytrans = con.BeginTransaction();
            SqlParameter[] pr = new SqlParameter[9];
            pr[0] = new SqlParameter("@fname", SqlDbType.NVarChar);
            pr[0].Value = fname;
            pr[1] = new SqlParameter("@email", SqlDbType.NVarChar);
            pr[1].Value = email;
            pr[2] = new SqlParameter("@address", SqlDbType.NVarChar);
            pr[2].Value = address;
            pr[3] = new SqlParameter("@country", SqlDbType.NVarChar);
            pr[3].Value = country;
            pr[4] = new SqlParameter("@state", SqlDbType.NVarChar);
            pr[4].Value = states;
            pr[5] = new SqlParameter("@city", SqlDbType.NVarChar);
            pr[5].Value = city;
            pr[6] = new SqlParameter("@zipcode", SqlDbType.NVarChar);
            pr[6].Value = phonenumber;
            pr[7] = new SqlParameter("@phnum", SqlDbType.NVarChar);
            pr[7].Value = zipcode;
            pr[8] = new SqlParameter("@comments", SqlDbType.NVarChar);
            pr[8].Value = comments;
            DBOperations.ExecuteNonQuery(mytrans, CommandType.StoredProcedure, "insert_contactus", pr);
            mytrans.Commit();
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
  
    //public DataSet getstates1(string id)
    //{
    //    DataSet ds2 = new DataSet();
    //    SqlCommand cmd = new SqlCommand("select * from states where countryname='" + id + "' ", con);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);

    //    da.Fill(ds2);

    //    return ds2;
    //}


    //public DataSet getcitiesnew(string id, string countryid)
    //{
    //    DataSet ds2 = new DataSet();
    //    SqlCommand cmd = new SqlCommand("select * from cities where statename='" + id + "' and countryname='" + countryid + "' order by  cityName asc", con);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);

    //    da.Fill(ds2);

    //    return ds2;
    //}
   
}