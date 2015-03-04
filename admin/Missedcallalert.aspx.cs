using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Missedcallalert : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("Select * from SMSMissedList", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvmisscalls.DataSource = ds;
        gvmisscalls.DataBind();
    }

    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvmisscalls.PageIndex = e.NewPageIndex;
        gvmisscalls.DataBind();
        BindData();
    }

    //protected void RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        int id;
    //        Label l1 = e.Row.FindControl("lblmno") as Label;
    //        Label l2 = e.Row.FindControl("lblresponse") as Label;
    //        id = Convert.ToInt32(l1.Text);
    //        SqlDataAdapter da = new SqlDataAdapter("select response from SMSMissedList where mno=" + id, sqlConnection);
    //        DataSet ds = new DataSet();
    //        da.Fill(ds);
    //        string response = ds.Tables[0].Rows[0]["response"].ToString();
    //        if (response == "")
    //            l2.Text = "NULL";
    //    }
    //}
    protected DataSet Permission()
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
    protected void ListName(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["missedview"].ToString() == "1")
            {

                int listid;
                try
                {
                    string list_id;
                    list_id = e.CommandArgument.ToString();
                    listid = Convert.ToInt32(list_id);
                    Session["listid"] = listid;
                    Popup1.Show();
                }
                catch (Exception ex)
                {

                }
            }
            else
            {
                Popup1.Hide();
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }


    }

    protected void btnsave_click(object sender, EventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count != 0)
        {
            if (dsadmin.Tables[0].Rows[0]["missedupdate"].ToString() == "1")
            {
                string res = txtresponse.Text;
                int id = Convert.ToInt32(Session["listid"]);
        
                SqlCommand cmd = new SqlCommand("proupdatemissedcall", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@response", SqlDbType.VarChar).Value = res;
                cmd.Parameters.AddWithValue("@mno", SqlDbType.VarChar).Value = id;
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();
                BindData();
                Response.Redirect("Missedcallalert.aspx");
            }
            else
            {
                Popup1.Hide();
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}
