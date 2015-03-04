using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Specialized;
using System.Text;
using System.Data.SqlClient;
using Indussms;
using Indussms.DataAccessLayer;

public partial class Balance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataTable dt = new DataTable();
    DataTable dt3 = new DataTable();
    SqlCommand cmd1 = new SqlCommand();
    Registration reg = new Registration();
    exception err = new exception();
    static string excep_page = "Balance.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                DataSet ds = reg.databind(Convert.ToString(Session["User"]));
                string id=(Convert.ToString(Session["User"]));
                btns.Visible = false;
                btn2.Visible = false;
                btn3.Visible = false;
                // gv.Visible = false;
                ds = reg.grid();
                string amnt = reg.amount(id);
                Label1.Text = amnt;
                string exp = reg.expiry(id);
                Label3.Text = exp;
                string sms = reg.smsleft(id);
                Label2.Text = sms;
                string voiceamt = reg.voiceamount(id);
                Label4.Text = voiceamt;
                string voiceexp = reg.voiceexpiry(id);
                Label6.Text = voiceexp;
                string voicesms = reg.voicesms(id);
                Label5.Text = voicesms;
                bindgrid();
             
            }
            else
            {
                string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
            dt3 = new DataTable();
            MakeDataTable();
            //AddToDataTable();
        }
        else
        {
            dt = (DataTable)ViewState["DataTable"];
            gv.Visible = true;

        }
      
        
        ViewState["DataTable"] = dt;
       
        //binddata();
    }
    private void MakeDataTable()
    {
        dt.Columns.Add("Feature");
        dt.Columns.Add("Amount");
        dt.Columns.Add("Description");
        //dt.Columns.Add("Status");
    }
    private void AddToDataTable()
    {
        DataRow dr = dt.NewRow();
        dr["Feature"] = "Amount";
        if (RadioButton1.Checked)
        {
            dr["Amount"] = "2000";
        }
        else if (RadioButton2.Checked)
        {
            dr["Amount"] = "3000";
        }
        else if (RadioButton3.Checked)
        {
            dr["Amount"] = "5000";
        }
        else if (RadioButton4.Checked)
        {
            dr["Amount"] = "7000";
        }
           
        else
        {
            divview.Visible = false;
            string str = "alert('Select Specified Amount.');location.replace('Balance.aspx') ;";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }
        dr["Description"] = "SMS Credits";
        dt.Rows.Add(dr);
       
       
    }



    protected void bindgrid()
    {
        string id = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("Select * from purchase where username='" + id + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView3.DataSource = ds;
            GridView3.DataBind();

        }
    }

    private void BindGrid()
    {
        if (dt.Rows.Count > 0)
        {
            gv.DataSource = dt;
            gv.DataBind();
        }
        else
        {
            dt.Rows.Add(dt.NewRow());
            gv.DataSource = dt;
            gv.DataBind();
            int totalcolums = gv.Rows[0].Cells.Count;
            gv.Rows[0].Cells.Clear();
            gv.Rows[0].Cells.Add(new TableCell());
            gv.Rows[0].Cells[0].ColumnSpan = totalcolums;
            gv.Rows[0].Cells[0].Text = "Your Cart Is Empty";
            gv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            //gv.Rows[0].Cells[0].Font.Bold;
            btn2.Visible = false;
            btn3.Visible = false;
            Response.Redirect("Balance.aspx");
            //Label1.Visible = false;
            //lbltotal.Visible = false;
        }
        //gv.DataSource = dt;
        //gv.DataBind();
    }


    protected void btnvoice_Click(object sender, EventArgs e)
    {
        string id = Convert.ToString(Session["User"]);
        string date = Convert.ToString(DateTime.Now);
        lblbuy.Visible = true;
        SqlCommand cmd = new SqlCommand("voicerqst", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@username", id);
        cmd.Parameters.AddWithValue("@postdate", date);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    
    protected void btn1_Click(object sender, EventArgs e)
    {
        
        container.Visible = false;
        AddToDataTable();
        BindGrid();
        btn2.Visible = true;
        btn3.Visible = true;
    }
  
    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                }
            }
        }
    }
    protected void btn3_Click(object sender, EventArgs e)
    {
        int j = 0;
        string Uname = Convert.ToString(Session["User"]);
        foreach (GridViewRow i in gv.Rows)
        {
            GridViewRow grow = gv.Rows[j];
            TableCell tc = grow.Cells[0];
            string feature = tc.Text;
            tc = grow.Cells[1];
            string amount = tc.Text;
            tc = grow.Cells[2];
            string desc = tc.Text;
            SqlCommand cmd = new SqlCommand("insertcart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", Uname);
            cmd.Parameters.AddWithValue("@amount", amount);
            cmd.Parameters.AddWithValue("@description", desc);
            cmd.Parameters.AddWithValue("@feature", feature);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            try
            {
                Response.Redirect("ShoppingCart.aspx?username=" + Uname);
               


            }


            catch (Exception ex)
            {
                err.insert_exception(ex, excep_page);
                con.Close();
            }




            j++;
        }
    }


    protected void btn2_Click(object sender, EventArgs e)
    {

    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton1.Checked)
        {
            gv.Visible = true;
        }
    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton2.Checked)
        {
            gv.Visible = true;
        }
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton2.Checked)
        {
            gv.Visible = true;
        }
    }
    protected void btnsms_Click(object sender, EventArgs e)
    {
        container.Visible = false;
        btns.Visible = true;
    }
    protected void gv_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                }
            }
        }
    }
 
    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton4.Checked)
        {
            gv.Visible = true;
        }
    }
    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);
        DataTable dt = ViewState["DataTable"] as DataTable;
        dt.Rows[index].Delete();
        ViewState["DataTable"] = dt;
        BindGrid();
    }
}
