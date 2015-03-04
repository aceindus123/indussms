using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using paypalservice1;

public partial class Payment : System.Web.UI.Page
{
    Class1 cls1 = new Class1();
    Registration reg1 = new Registration();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Request.QueryString["UserName"]) != "")
        {
            string UserPno = Convert.ToString(Request.QueryString["UserName"]);
            if (!IsPostBack)
            {
                ds1 = reg1.databind(UserPno);

                if (ds1.Tables[0].Rows.Count > 0)
                {
                    txtName.Text = ds1.Tables[0].Rows[0]["fname"].ToString();
                    txtemail.Text = ds1.Tables[0].Rows[0]["email"].ToString();
                    txtphno.Text = ds1.Tables[0].Rows[0]["phno"].ToString();
                    string totamount = Convert.ToString(Session["totalamt"]);
                    txtamount.Text = totamount;
                   

                }


                ds1 = cls1.getcountry();
                ddlcountry.DataSource = ds1;
                ddlcountry.DataTextField = "countryname";
                ddlcountry.DataValueField = "countryid";
                ddlcountry.DataBind();
                ddlcountry.Items.Insert(0, "Select country");


            }
        }
    }

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedValue != "Select Country")
        {
            ds1.Clear();
            ddlstate.Items.Clear();
            string selCountry = ddlcountry.SelectedValue.ToString();
            ds1 = cls1.getstates(selCountry);
            ddlstate.DataSource = ds1;
            ddlstate.DataTextField = "statename";
            ddlstate.DataValueField = "stateid";
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, "Select State");
        }
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlstate.SelectedValue != "Select State")
        {
            ds1.Clear();
            ddlcity.Items.Clear();
            string selitem = ddlstate.SelectedItem.Text;
            string selstate = ddlstate.SelectedValue.ToString();
            ds1 = cls1.getcities2(selstate);
            ddlcity.DataSource = ds1;
            ddlcity.DataTextField = "cityname";
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, "Select City");
        }

    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedItem.Text != "Select country")
        {
            if (ddlstate.SelectedItem.Text != "Select State")
            {
                if (ddlcity.SelectedItem.Text != "Select City")
                {
                    string name = txtName.Text;
                    string email = txtemail.Text;
                    string phone = txtphno.Text;

                    //txtamount.Text = Convert.ToString(Request.QueryString["plancost"]);

                    string itemInfo = txtPurpose.Text;
                    string amount = txtamount.Text;
                    string currency = ddlCurrency.Text;
                    string country = ddlcountry.SelectedItem.Text;
                    string state = ddlstate.SelectedItem.Text;
                    string city = ddlcity.SelectedItem.Text;

                    PayWithPayPal(amount, itemInfo, name, phone, email, currency, country, state, city);

                    txtName.Text = "";
                    txtemail.Text = "";
                    txtphno.Text = "";
                    txtamount.Text = "";
                    ddlCurrency.Text = "";
                    ddlcity.SelectedIndex = 0;
                    ddlstate.SelectedIndex = 0;
                    ddlcountry.SelectedIndex = 0;
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('Please Select City');",true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('Please Select State');",true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('Please Select Country');",true);
        }
    }


    protected void PayWithPayPal(string amount, string itemInfo, string name, 
        string phone, string email, string currency, string pcountry, string pstate, string pcity)
    {
        //localhost.Service service1 = new localhost.Service();
        paypalservice service1 = new paypalservice();
        service1.Amount = amount;
        service1.ItemInfo = itemInfo;
        service1.Name = name;
        service1.Phone = phone;
        service1.Email = email;
        service1.Currency = currency;

        string planid = "0";
        service1.Planid = planid;
        string S = service1.formstring(service1.Amount, service1.ItemInfo, service1.Name, service1.Phone, service1.Email, service1.Currency, service1.Planid);
        if (S.StartsWith("Amount"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "k1", "alert('You Entered These: " + S + " Please Enter All the Data Correctly')", true);
        }
        else
        {
            Response.Write(S);
        }
    }
}