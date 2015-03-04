using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Admin_Support : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet dsadmin = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {            
            if (!IsPostBack)
            {
                BindData();
                //Bindexception();        
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    public void BindData()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from issue", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvsupports.DataSource = ds;
        gvsupports.DataBind();
        rdhelp.Visible = true;
        rdexcep.Visible = false;
        gvsupports.Visible = true;
        gvException.Visible = false;
    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvsupports.PageIndex = e.NewPageIndex;
        gvsupports.DataBind();
        BindData();
    }

    protected void rdhelp1_CheckedChanged(object sender, EventArgs e)
    {           
        BindData();
    }
    protected void rdexception_CheckedChanged(object sender, EventArgs e)
    {        
        Bindexception();        
    }

    private DataSet Permission()
    {
        if (Session["login"] != null)
        {
            string query = "select * from c_adminlogin where username='" + Convert.ToString(Session["login"]) + "' and usertype='" + Convert.ToString(Session["usertype"]) + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet permissionds = new DataSet();
            adp.Fill(permissionds);
            return permissionds;
        }
        else
        {
            return null;
        }
    }

    private void Bindexception()
    {
        SqlCommand cmd = new SqlCommand("Select * from Exception",con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds1 = new DataSet();
        adp.Fill(ds1);
        gvException.DataSource = ds1;
        gvException.DataBind();
        rdexcep.Visible = true;
        rdhelp.Visible = false;
        gvsupports.Visible = false;
        gvException.Visible = true;
    }

    //protected void supportReplay(object sender, CommandEventArgs e)
    //{
        
    //            string reqid = e.CommandArgument.ToString();
    //            SqlCommand cmd = new SqlCommand("select * from issues where iid='" + reqid + "'", con);
    //            SqlDataAdapter adp = new SqlDataAdapter(cmd);
    //            DataSet ds2 = new DataSet();
    //            adp.Fill(ds2);
    //            pnlreplay.Visible = true;
    //            ModalPopupExtender1.Show();
            
    //}

    protected void ListName(object sender, CommandEventArgs e)
    {
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count > 0)
        {
            if (dsadmin.Tables[0].Rows[0]["supporthelp"].ToString() == "1")
            {
                string reqid = e.CommandArgument.ToString();
                SqlCommand cmd = new SqlCommand("select * from issue where iid='" + reqid + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                adp.Fill(ds2);
                lbthno.Text = ds2.Tables[0].Rows[0]["raisedid"].ToString();
                pnlreplay.Visible = true;
                ModalPopupExtender1.Show();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", "alert('You dont have permission to do this')", true);
            }
        }
    }

    protected void btnreplay_Click(object sender, EventArgs e)
    {
        string rid = lbthno.Text.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("update issue set replay='"+ txtreplay.Text +"' where raisedid='" + rid + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindData();
    }
    protected void gvException_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvException.PageIndex = e.NewPageIndex;
        Bindexception();
    }
    protected void gvExceptionDeleting(object sender, CommandEventArgs e)
    {

        int id = Convert.ToInt32(e.CommandArgument.ToString());
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count > 0)
        {
            if (dsadmin.Tables[0].Rows[0]["supportexception"].ToString() == "1")
            {
                SqlCommand cmd = new SqlCommand("delete from Exception where Eid=" + id + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", "alert('Exception Deleted Successfully');location.replace('Admin-Support.aspx');", true);

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('You dont have permission to do this')",true);
            }

        }
    }
    protected void gvException_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string selId = gvException.DataKeys[e.Row.RowIndex].Value.ToString();
            LinkButton lnkStatus1 = (LinkButton)e.Row.FindControl("lnkstatus");
            SqlCommand cmd = new SqlCommand("select Excep_Status from Exception where Eid='"+selId+"'",con);
            con.Open();
            int status =Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (status == 0)
            {
                lnkStatus1.Text = "Need to Resolve";
            }
            else
            {
                lnkStatus1.Text = "Resolved";
            }

        }
    }

    protected void deleterecord(object sender, CommandEventArgs e)
    {
        int issueId = Convert.ToInt32(e.CommandArgument.ToString());
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count > 0)
        {
            if (dsadmin.Tables[0].Rows[0]["supportupdate"].ToString() == "1")
            {
                SqlCommand cmd = new SqlCommand("delete from issue where iid=" + issueId + " ",con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('Deleted Successfully');location.replace('Admin-Support.aspx');",true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('you dont have permission to do this')",true);
            }

        }

    }

    protected void lnkStatus(object sender, CommandEventArgs e)
    {
        
                
        dsadmin = Permission();
        if (dsadmin.Tables[0].Rows.Count > 0)
        {
            if (dsadmin.Tables[0].Rows[0]["supportresponce"].ToString() == "1")
            {
                int errorId = Convert.ToInt32(e.CommandArgument.ToString());
                lbusname.Text = Convert.ToString(Session["login"]);
                lbustype.Text = Convert.ToString(Session["usertype"]);
                exceppanel.Visible = true;
                ModalPopupExtender2.Show();
               
            }
            else
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(),"alert box","alert('You dont have permission to do this.');");
            }
        }
    }
}