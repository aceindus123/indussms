using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Offers : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet dsadmin = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
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
        SqlDataAdapter da = new SqlDataAdapter("Select *,case when status = 1 then 'Deactivate' else 'Activate' end as txtstatus from notification", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvoffers.DataSource = ds;
        gvoffers.DataBind();
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvoffers.PageIndex = e.NewPageIndex;
        gvoffers.DataBind();
        BindData();
    }

    //protected void RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        Label l1 = e.Row.FindControl("lblid") as Label;
    //        LinkButton active = e.Row.FindControl("linkactive") as LinkButton;
    //        LinkButton deactive = e.Row.FindControl("linkdeactive") as LinkButton;
    //        string name = "select status from notification where nid=" + l1.Text;
    //        SqlDataAdapter da = new SqlDataAdapter(name, sqlConnection);
    //        DataSet ds = new DataSet();
    //        da.Fill(ds);
    //        int res = Convert.ToInt32(ds.Tables[0].Rows[0]["status"]);
    //        if (res == 0)
    //        {
    //            active.Visible = true;
    //        }
    //        else
    //        {
    //            deactive.Visible = true;
    //        }
    //    }
    //}

    protected void Active(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["offersstatus"].ToString() == "1")
            {
                GridViewRow active = (GridViewRow)((LinkButton)sender).NamingContainer;
                GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
                string id = ((Label)gvRow.FindControl("lblid")).Text;
                if (((LinkButton)sender).Text == "Activate")
                {
                    SqlCommand cmd = new SqlCommand("spofferstatus", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nid", SqlDbType.VarChar).Value = id;
                    sqlConnection.Open();
                    int i = cmd.ExecuteNonQuery();
                    sqlConnection.Close();
                    if (i == 1)
                    {
                        string str = "alert('Offer Status Activated Successfully.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                    else
                    {
                        string str = "alert('Offer Status Not Activated .');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }

                }
                else if (((LinkButton)sender).Text == "Deactivate")
                {
                    SqlCommand cmd = new SqlCommand("spofferstatus1", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nid", SqlDbType.VarChar).Value = id;
                    sqlConnection.Open();
                    int i = cmd.ExecuteNonQuery();
                    sqlConnection.Close();
                    if (i == 1)
                    {
                        string str = "alert('Offer Status Deactivated Successfully.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                    else
                    {
                        string str = "alert('Offer Status Not Deactivated .');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                }
                BindData();
            }
            else
            {

                string strScript = "alert('You Don't Have Permission to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission to do this task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["offerscreate"].ToString() == "1")
            {
                if (txtsubject.Text != "" && txtmessage.Text != "")
                {
                    string sub = txtsubject.Text;
                    string mess = txtmessage.Text;
                    DateTime date = System.DateTime.Now;
                    int status = 1;
                    SqlCommand cmd = new SqlCommand("spnotification", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@subject", SqlDbType.VarChar).Value = sub;
                    cmd.Parameters.AddWithValue("@message", SqlDbType.NVarChar).Value = mess;
                    cmd.Parameters.AddWithValue("@postdate", SqlDbType.DateTime).Value = date;
                    cmd.Parameters.AddWithValue("@status", SqlDbType.Int).Value = status;
                    sqlConnection.Open();
                    int i = cmd.ExecuteNonQuery();
                    txtmessage.Text = "";
                    txtsubject.Text = "";
                    sqlConnection.Close();
                    if (i == 1)
                    {
                        string str = "alert('Offer is sent to the user.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                    else
                    {
                        string str = "alert('Offer is not sent to the user.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }

                }
                BindData();
            }
            else
            {

                string strScript = "alert('You Don't Have Permission to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission to do this task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    private DataSet Permission()
    {
        if (Session["login"] != null)
        {
            string admin = "Select * from c_adminlogin where usertype='" + Session["usertype"].ToString() + "' and username='" + Session["login"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, sqlConnection);
            dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            return dsadmin;
            // Session["dsadmin"] = dsadmin;
        }
        else
        {
            return null;
        }
    }

    protected void Delete(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["offersdelete"].ToString() == "1")
            {

                GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
                string id = ((Label)gvRow.FindControl("lblid")).Text;
                SqlCommand cmd = new SqlCommand("delete from notification where nid='" + id + "'", sqlConnection);
                cmd.CommandType = CommandType.Text;
                sqlConnection.Open();
                int i = cmd.ExecuteNonQuery();
                sqlConnection.Close();
                if (i == 1)
                {
                    string str = "alert('Offer Deleted successfully.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                else
                {
                    string str = "alert('Sorry Offer Not Deleted.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                }
                BindData();
            }
            else
            {

                string strScript = "alert('You Don't Have Permission to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission to do this task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}