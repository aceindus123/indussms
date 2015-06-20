    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Indussms.DataAccessLayer;
using Indussms;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ShoppingCart : System.Web.UI.Page
{
    Decimal pagetotal;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand cmd = new SqlCommand();
    Registration reg = new Registration();
    exception err = new exception();
    static string excep_page = "ShoppingCart.aspx";
    DataSet ds = new DataSet();
    decimal totalPrice = 0M;
   
    int totalItems = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            if (!IsPostBack)
            {

                DataSet ds = reg.databind(Convert.ToString(Session["User"]));
                data();
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    //    if (!IsPostBack)
    //    {
    //        //SqlDataAdapter da = new SqlDataAdapter("Select * from cart", con);
    //        //ds = reg.grid();
    //        string id1 = Convert.ToString(Session["User"]);
    //        SqlDataAdapter ad = new SqlDataAdapter("Select * from cart where username='" + id1 + "'", con);
    //        DataSet ds1 = new DataSet();
    //        ad.Fill(ds1);
    //        gv1.DataSource = ds1;
    //        gv1.DataBind();
    //        con.Close();       
    //    }
    //} 
       
        //binddata();    

    protected void data()
    {
        string id = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("Select * from cart where username='" + id + "'", con);
        DataSet ds = new DataSet();
        //DataTable dt = new DataTable();
        da.Fill(ds);
         if (ds.Tables[0].Rows.Count == 0)
         {
          
             up.Visible = false;
             string script1 = "alert('Your Cart Is Empty.... ');location.replace('Balance.aspx');";
             Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script1, true);
             //ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            // gv1.DataSource = ds;
            // gv1.DataBind();
            // //int columncount = gv1.Rows[0].Cells.Count;
            // gv1.Rows[0].Cells.Clear();
            // gv1.Rows[0].Cells.Add(new TableCell());
            // //gv1.Rows[0].Cells[0].ColumnSpan = columncount;
            // gv1.Rows[0].Cells[0].Text = "No Records Found";
            // gv1.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
            // gv1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
             
             
            ////gv1.Rows[0].Cells[0].Style.Font = new Font("Tahoma", 9.75F, FontStyle.Bold);
            ////gv1.Rows[0].Cells[0].Font.Size = System.Drawing.FontStyle.Bold;
            //Button1.Visible = false;
            //btn.Visible = false;
        }
        else
        {            
            gv1.DataSource = ds;
            gv1.DataBind();
            //pan.Visible = false;
            
        }
         con.Close();
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        string uname = Convert.ToString(Session["User"]);
        Response.Redirect("Payment.aspx?username=" + uname);
    }
   
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv1.PageIndex = e.NewPageIndex;
        gv1.DataBind();
        data();
    }
    protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int catid = int.Parse(gv1.DataKeys[0].Value.ToString());
        SqlDataAdapter da = new SqlDataAdapter("", con);
        con.Open();
        da.DeleteCommand = new SqlCommand("delete from cart where crid=" + catid, con);
        da.DeleteCommand.ExecuteNonQuery();
        con.Close();
        Session.Remove("totalamt");
        Response.Redirect("ShoppingCart.aspx");
        
        data();
    }
    protected void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblPrice = (Label)e.Row.FindControl("lbl4");
            decimal price = Decimal.Parse(lblPrice.Text);
            totalPrice += price;           
        }
        if (e.Row.RowType == DataControlRowType.Footer) 
        {
            Label lblTotalPrice = (Label)e.Row.FindControl("lbltotal");
            lblTotalPrice.Text = totalPrice.ToString();
            Session["totalamt"] = lblTotalPrice.Text; 
        }
    }
}








