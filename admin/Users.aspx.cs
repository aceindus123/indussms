using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Users : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    public void BindData()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from Registration", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvusers.DataSource = ds;
        gvusers.DataBind();
    }
    protected void  PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvusers.PageIndex = e.NewPageIndex;
        gvusers.DataBind();
        BindData();
    }
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label l1 = e.Row.FindControl("lblid") as Label;
            LinkButton active = e.Row.FindControl("linkactive") as LinkButton;
            LinkButton deactive = e.Row.FindControl("linkdeactive") as LinkButton;
            string name = "select mobilestatus from Registration where rid=" + l1.Text;
            SqlDataAdapter da = new SqlDataAdapter(name, sqlConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int res = Convert.ToInt32(ds.Tables[0].Rows[0]["mobilestatus"]);
            if (res == 0)
            {
                active.Visible = true;
            }
            else
            {
                deactive.Visible = true;
            }                
        }
    }
    protected void Active(object sender, EventArgs e)
    {
        GridViewRow active = (GridViewRow)((LinkButton)sender).NamingContainer;
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        string id = ((Label)gvRow.FindControl("lblid")).Text;
        if (((LinkButton)sender).Text == "Active")
        {
            SqlCommand cmd = new SqlCommand("spuserstatus", sqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rid", SqlDbType.VarChar).Value = id;
            sqlConnection.Open();
            int i = cmd.ExecuteNonQuery();
            sqlConnection.Close();            
            if (i == 1)
            {
                string str = "alert('User Status Active.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
            else
            {
                string str = "alert('User Status Not Active .');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }

        }
        else if (((LinkButton)sender).Text == "Deactive")
        {
            SqlCommand cmd = new SqlCommand("spuserstatus1", sqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rid", SqlDbType.VarChar).Value = id;
            sqlConnection.Open();
            int i = cmd.ExecuteNonQuery();
            sqlConnection.Close();
            if (i == 1)
            {
                string str = "alert('User Status Deactive.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
            else
            {
                string str = "alert('User Status Not Deactive .');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
        BindData();
    }
}