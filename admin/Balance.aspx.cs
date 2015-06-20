using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Balance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            update.Visible = true;
            rdschedulesms.Checked = true;
            Data();
        }
    }

    protected void btnaccept_Click(object sender, EventArgs e)
    {
        string uname = txtuname.Text;
        string amount = txtamount.Text;
        DateTime purchasedate = Convert.ToDateTime(System.DateTime.Now.Date.ToString(""));
        DateTime expirydate = Convert.ToDateTime(System.DateTime.Now.Date.AddDays(30).ToString(""));
        string smstype = "";
       
        try
        {
            if (dropsmstype.Text == "Text SMS")
            {
                string sql = " select * from smscost";
                SqlDataAdapter sda = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Double d = Convert.ToDouble(ds.Tables[0].Rows[0]["textsms"].ToString());

                string amt = txtamount.Text;
                Double sms = Convert.ToDouble(amt);
                double txt = sms / d;
                string s = Convert.ToString(txt);
               
                decimal value;
                if (decimal.TryParse(s, out value))
                {
                    value = Math.Round(value);
                    s = value.ToString();
                    
                }
                else
                {
                    string strScript = "alert('Sorry Not Accepted The Textsms Balance Try Again.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }

                smstype = dropsmstype.SelectedValue.ToString();

                SqlCommand cmd = new SqlCommand("sptextsmsbalance", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", uname);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@smstype", smstype);
                cmd.Parameters.AddWithValue("@Purchasedate", purchasedate);
                cmd.Parameters.AddWithValue("@expirydate", expirydate);
                cmd.Parameters.AddWithValue("@numofsms", s);
                cmd.Parameters.AddWithValue("@smsleft", s);
                cmd.Parameters.AddWithValue("@amountleft", amount);

                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    string strScript = "alert('Accepted The Textsms Balance.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                else
                {
                    string strScript = "alert('Sorry Not Accepted The Textsms Balance Try Again.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
               
            }
            else if (dropsmstype.Text == "Voice SMS")
            {
                smstype = dropsmstype.SelectedValue.ToString();
              
                string sql = " select * from smscost";
                SqlDataAdapter sda = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Double d = Convert.ToDouble(ds.Tables[0].Rows[0]["voicesms"].ToString());

                string amt = txtamount.Text;
                Double sms = Convert.ToDouble(amt);
                double txt = sms / d;
                string s = Convert.ToString(txt);

                decimal value;
                if (decimal.TryParse(s, out value))
                {
                    value = Math.Round(value);
                    s = value.ToString();
                }
                else
                {
                    string strScript = "alert('Sorry Not Accepted The Textsms Balance Try Again.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }

                SqlCommand cmd = new SqlCommand("spvoicesmsbalance", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", uname);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@smstype", smstype);
                cmd.Parameters.AddWithValue("@Purchasedate", purchasedate);
                cmd.Parameters.AddWithValue("@expirydate", expirydate);
                cmd.Parameters.AddWithValue("@numofsms", s);
                cmd.Parameters.AddWithValue("@smsleft", s);
                cmd.Parameters.AddWithValue("@amountleft", amount);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    string strScript = "alert('Accepted The Voicesms Balance.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                else
                {
                    string strScript = "alert('Sorry Not Accepted The Voicesms Balance Try Again.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                string strScript = "alert('Please select The SMS Type.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }

            txtamount.Text = "";
            txtuname.Text = "";
            dropsmstype.SelectedIndex = -1;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    protected void rdschedulesms_CheckedChanged(object sender, EventArgs e)
    {
        update.Visible = true;
        rates.Visible = false;

    }

    protected void rdvoicesms_CheckedChanged(object sender, EventArgs e)
    {
        update.Visible = false;
        rates.Visible = true;

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {

            string text = "0." + txttext.Text;
            string voice = "0." + txtvoice.Text;
            string date = System.DateTime.Now.ToString();

            SqlCommand cmd = new SqlCommand("spsmscost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@textsms", text);
            cmd.Parameters.AddWithValue("@voicesms", voice);
            cmd.Parameters.AddWithValue("@date", date);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                string strScript = "alert('Sms Rates Updated Successfully');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                Data();
                txttext.Text = "";
                txtvoice.Text = "";
            }
            else
            {
                string strScript = "alert('Sorry Rates not Updated Try Again.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        txttext.Text = "";
        txtvoice.Text = "";

    }

    protected void Data()
    {
        string sql = " select * from smscost";
        SqlDataAdapter sda = new SqlDataAdapter(sql,con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        
        if (ds.Tables[0].Rows.Count > 0)
        {
            gvusers.DataSource = ds;
            gvusers.DataBind();
        }

    }

    protected void gvusers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gvusers_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvusers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lb=(Label)gvusers.Rows[e.RowIndex].FindControl("lblid");
        string date = System.DateTime.Now.ToString();
        TextBox txt1 = (TextBox)gvusers.Rows[e.RowIndex].FindControl("TextBox1");
        TextBox txt2 = (TextBox)gvusers.Rows[e.RowIndex].FindControl("TextBox2");
        string upd = "update smscost set textsms='" + txt1.Text + "',voicesms='" + txt2.Text + "',updaterate='" + date + "' where cid='" +lb.Text + "'";
        SqlCommand cmd = new SqlCommand(upd, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvusers.EditIndex = -1;
        Data();

    }
    protected void gvusers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvusers.EditIndex = -1;
     
        Data();
    }
}