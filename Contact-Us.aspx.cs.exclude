using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Contact_Us : System.Web.UI.Page
{
    //SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //private string strconnection="Data Source=indussms.db.10717941.hostedresource.com;Initial Catalog=indussms;User id=indussms;Password=Aceindus@1299;"; 
    Class1 c1 = new Class1();
    DataSet ds = new DataSet();
    bool cu;
    string strscript = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
     {
        if (!IsPostBack)
        {
            //bindcountry();
            ds = c1.getcountry();
            ddlcountry.DataSource = ds;
            ddlcountry.DataTextField = "countryname";
            ddlcountry.DataValueField = "countryid";
            ddlcountry.DataBind();
            //DataSet cds = new DataSet();
            //SqlCommand ccmd = new SqlCommand("select * from states where countryname='USA' ", con);
            //SqlDataAdapter cda = new SqlDataAdapter(ccmd);
            //cda.Fill(cds);
            //ddlstate.DataSource = cds;
            //ddlstate.DataTextField = "statename";
            //ddlstate.DataValueField = "stateteid";
            //ddlstate.DataBind();
            //ddlstate.Items.Insert(0, "Select State");
        }
    }
       
    
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        c1.Fname = txtfname.Text;
        c1.Email = txtEmailid.Text;
        c1.Address = txtAddress.Text;
        c1.Country = ddlcountry.SelectedItem.Text;
        c1.States = ddlstate.SelectedItem.Text;
        c1.City = ddlcity.SelectedItem.Text;
        c1.Phonenumber = txtphno.Text;
        c1.Zipcode = txtzipcode.Text;
        c1.Comments = txtcomments.Text;
        cu = c1.contactus(c1.Fname, c1.Email, c1.Address, c1.Country, c1.States, c1.City, c1.Phonenumber, c1.Zipcode, c1.Comments);
        if (cu == true)
        {
            strscript = "alert('Your query submitted successfully completed');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strscript, true);
        }


    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ss = ddlcountry.SelectedValue;
        ds = c1.getstates(ss);
        ddlstate.DataSource = ds;
        ddlstate.DataTextField = "statename";
        ddlstate.DataValueField = "stateid";
        ddlstate.DataBind();
        //ddlstate.Items.Insert(0, "Select State");
    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cc = ddlstate.SelectedValue;
        ds = c1.getcities2(cc);
        ddlcity.DataSource = ds;
        ddlcity.DataTextField = "cityname";
        ddlcity.DataValueField = "cityid";
        ddlcity.DataBind();
        //ddlstate.Items.Insert(0, "Select State");
        //ddlcity.Items.Insert(0, "Select city");
    }
}