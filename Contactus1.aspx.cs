using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default3 : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    DataSet ds = new DataSet();
    bool cu;
    string strscript = string.Empty;
    exception err = new exception();
    static string excep_page = "Contactus1.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds = c1.getcountry();
              ddlcountry.DataSource = ds;
            ddlcountry.DataTextField = "countryname";
            ddlcountry.DataValueField = "countryid";
            ddlcountry.DataBind();
        }

    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedItem.Text == "Select Country")
        {
            ddlcity.Items.Clear();
            ddlstate.Items.Clear();
            ddlstate.Items.Insert(0, "Select State");
            ddlcity.Items.Insert(0, "Select City");

        }
        else
        {

            ddlstate.Items.Clear();
            ddlcity.Items.Clear();
            //DataSet dsstate = new DataSet();
            string y = ddlcountry.SelectedItem.Value.ToString();
            ds = c1.getstates(y);
            ddlstate.Items.Insert(0, "Select State");
            ddlcity.Items.Insert(0, "Select City");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {

                    ddlstate.Items.Add("");
                    ddlstate.Items[i].Text = ds.Tables[0].Rows[i - 1]["statename"].ToString();
                    ddlstate.Items[i].Value = ds.Tables[0].Rows[i - 1]["stateid"].ToString();
                }
            }
        }
    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlstate.SelectedItem.Text == "Select State")
        {
            ddlcity.Items.Clear();
            ddlcity.Items.Insert(0, "Select City");
        }
        else
        {
            ddlcity.Items.Clear();
            //DataSet dscity = new DataSet();
            string z = ddlstate.SelectedItem.Value.ToString();
            ds = c1.getcities2(z);
            ddlcity.Items.Insert(0, "Select City");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {

                    ddlcity.Items.Add("");
                    ddlcity.Items[i].Text = ds.Tables[0].Rows[i - 1]["cityname"].ToString();
                    ddlcity.Items[i].Value = ds.Tables[0].Rows[i - 1]["cityid"].ToString();
                }
            }
        }
    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
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
                strscript = "alert('Your information submitted successfully ')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strscript, true);
                txtfname.Text = "";
                txtEmailid.Text = "";
                txtAddress.Text = "";
                ddlcountry.SelectedItem.Text = "Select Country";
                ddlstate.SelectedItem.Text = "Select State";
                ddlcity.SelectedItem.Text = "Select City";
                txtphno.Text = "";
                txtzipcode.Text = "";
                txtcomments.Text = "";
                Response.Redirect("Default.aspx");
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}