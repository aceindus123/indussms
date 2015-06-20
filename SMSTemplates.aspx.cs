using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;


public partial class SMSTemplates : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count=0;
        string dis = "";
        if ((txtmobilesubject.Text != String.Empty) || (txt1.Text != String.Empty) || (txt2.Text != String.Empty))
        {
            if (txtmobilesubject.Text != String.Empty)
            {
                count = 1;
                dis = txtmobilesubject.Text;

            }
            else if (txt1.Text != String.Empty)
            {
                count = 2;
                dis = txt1.Text;

            }
            else if (txt2.Text != String.Empty)
            {
                count = 3;
                dis = txt2.Text;

            }
      

            try
            {
                string name = txtname.Text;
                string uname = Convert.ToString(Session["User"]);
                string date = Convert.ToString(System.DateTime.Now);
                string status = "deactive";
                con.Open();
                SqlCommand cmd = new SqlCommand("inserttemplet", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", uname);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@dis", dis);
                cmd.Parameters.AddWithValue("@count", count);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@status", status);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                txtname.Text = "";
                txtmobilesubject.Text = "";
                txt1.Text = "";
                txt2.Text = "";
                txtmobilesubject.Visible = true;
                txt1.Visible = false;
                RequiredFieldValidator2.Visible = false;
                RequiredFieldValidator5.Visible = false;
                RequiredFieldValidator1.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                txt2.Visible = false;
                countmsg1.Visible = false;
                Tr1.Visible = false;
                string strScript = "alert('Your Template Submited Successfully');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                bind();
            }
            catch
            {

            }
        }
        else
        {
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SMSMainMenu.aspx");
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
        Label1.Visible = true;
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
        Label1.Visible = false;
        Label2.Visible = true;
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
        string message = txt1.Text;
        if (message.Length == 306)
        {
            Label8.Text = "Do you Want To Proceed For More Message? ";
            Label8.Visible = true;
            Tr1.Visible = true;
            countmsg1.Visible = false;
            Label1.Visible = false;
        }
        else if ((message.Length <= 306) && (message.Length >=160))
        {
            txt1.Text = message;
            txt1.Visible = true;
            Label1.Visible = true;

        }
        else 
        {
            string message1 = txt1.Text;
            txtmobilesubject.Visible = true;
            txtmobilesubject.Text = message1;
            txt1.Visible = false;
            txt1.Text = "";
            Label1.Visible = false;

          
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        countmsg1.Visible = false;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        countmsg1.Visible = false;
        Label1.Visible = true;
        Tr1.Visible = false;
    }
    protected void txt2_TextChanged(object sender, EventArgs e)
    {
        string message = txt2.Text;

        if ((message.Length <= 459) && (message.Length >= 306))
        {
            txt2.Text = message;
            txt2.Visible = true;
            Label2.Visible = true;

        }
        else if ((message.Length <= 306) && (message.Length >= 160))
        {
            txt1.Visible = true;
            txt1.Text = message;
            txt2.Visible = false;
            txt2.Text = "";
            Label2.Visible = false;
            Label1.Visible = true;
        }

        else
        {
            txtmobilesubject.Visible = true;
            txtmobilesubject.Text = message;
            txt1.Visible = false;
            txt1.Text = "";
            Label1.Visible = false;
        }
    }
    protected void bind()
    {
        string uname = Convert.ToString(Session["User"]);
        string q = "select * from templates where username='" + uname + "'";
        SqlDataAdapter ad = new SqlDataAdapter(q, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        bind();

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
         int catid = int.Parse(GridView1.DataKeys[0].Value.ToString());
        SqlDataAdapter da = new SqlDataAdapter("", con);
        con.Open();
        da.DeleteCommand = new SqlCommand("delete from templates where tid=" + catid, con);
        da.DeleteCommand.ExecuteNonQuery();
        con.Close();
        string strScript = "alert(' Template Deleted Successfully');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        Response.Redirect("SMSTemplates.aspx");

        bind();
    }
}