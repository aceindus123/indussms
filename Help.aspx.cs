using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Indussms.DataAccessLayer;
using System.IO;

public partial class Help : System.Web.UI.Page
{
    bool columnHasValues = false;
    Registration reg = new Registration();
    string strscript = string.Empty;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    byte[] buffer;
    exception err = new exception();
    static string excep_page = "Help.aspx";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {
            DataSet ds = reg.databind(Convert.ToString(Session["User"]));
            raiseissues.Visible = false;
            if (!IsPostBack)
            {
                ds = reg.grid();
                binddata();
                lbl1.Visible = false;
            }
        }
        else
        {
            string strScript = "alert('Session expired pleased login again.');location.replace('SMSLogin.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void onclickchanged(object sender, EventArgs e)
    {

    }
    protected void linkbutton(object sender, EventArgs e)
    {

    }
    protected void binddata()
    {
        string id = Convert.ToString(Session["User"]);
        SqlDataAdapter da = new SqlDataAdapter("Select * from issue where username='" + id + "'", con);
        //SqlDataAdapter da = new SqlDataAdapter("Select * from issue", con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count == 0)
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
            GridView1.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
            GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }
        else
        {

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        
        con.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        raiseissues.Visible = true;
        view.Visible = false;

    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        string sts = "Process";
        string s = textsub.Text;
        string s1 = TextBox2.Text;
        string date = Convert.ToString(DateTime.Now);
        string user1 = Convert.ToString(Session["User"]);

        if (FileUpload1.HasFile)
        {
            string file_name = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            string ext = Path.GetExtension(file_name);
            string contenttype = string.Empty;

            switch (ext)
            {

                case ".doc":

                    contenttype = "application/vnd.ms-word";

                    break;

                case ".docx":

                    contenttype = "application/vnd.ms-word";

                    break;

                case ".xls":

                    contenttype = "application/vnd.ms-excel";

                    break;

                case ".xlsx":

                    contenttype = "application/vnd.ms-excel";

                    break;

                case ".jpg":

                    contenttype = "image/jpg";

                    break;

                case ".png":

                    contenttype = "image/png";

                    break;

                case ".gif":

                    contenttype = "image/gif";

                    break;

                case ".jpeg":

                    contenttype = "image/jpeg";

                    break;

                case ".pdf":

                    contenttype = "application/pdf";

                    break;

            }

            if (contenttype != String.Empty)
            {

                HttpPostedFile file = FileUpload1.PostedFile;


                buffer = new byte[file.ContentLength];
                // string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
                // FileUpload1.SaveAs(Server.MapPath("Documents/" + imagename));
                //string imagepath = Base_dir + "Documents/" + imagename;
                string file_path = Server.MapPath("Issue/" + file_name);
                FileUpload1.SaveAs(file_path);


                string file_type = FileUpload1.PostedFile.ContentType;

                con.Open();
                string qry1 = "insert into issue(suject,phonenumber,content,postdate,username,status,name,contenttype,data) values('" + s + "','" + s1 + "','" + Editor1.Content + "','" + date + "','" + user1 + "','" + sts + "','" + file_name + "','" + file_type + "','" + file_path + "')";
                SqlCommand cmd2 = new SqlCommand(qry1, con);
                cmd2.ExecuteNonQuery();
                con.Close();
                //string strs = "alert('You Have Raised New Issue')";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strs, true);
                //Response.Redirect("Help.aspx");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

            }
            else
            {
                string str = "alert('Please Upload file in Specified Formats.');location.replace('Help.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            }
        }
        else
        {
            con.Open();
            string qry = "insert into issue(suject,phonenumber,content,postdate,username,status) values('" + s + "','" + s1 + "','" + Editor1.Content + "','" + date + "','" + user1 + "','" + sts + "')";
            SqlCommand cmd1 = new SqlCommand(qry, con);
            cmd1.ExecuteNonQuery();
            con.Close();
            string str = "alert('You Have Raised New Issue')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
            //Response.Redirect("Help.aspx");
            //textsub.Text = "";
            //TextBox2.Text = "";
        }


        try
        {
            con.Open();
            Session["initdate"] = date;
            SqlDataAdapter da1 = new SqlDataAdapter("select * from issue where postdate='" + Session["initdate"].ToString() + "'", con);
            da1.Fill(ds);

            //cmd.ExecuteNonQuery();
            if (ds.Tables[0].Rows.Count > 0)
            {
                int newsid = Convert.ToInt16(ds.Tables[0].Rows[0]["iid"]);
                string ids = "00";
                string year = DateTime.Now.Year.ToString().Substring(2);
                string newid = "IS-" + year + ids;
                string modurl = newid + newsid;
                SqlCommand cmd23 = new SqlCommand("update issue set raisedid='" + modurl + "' where iid='" + newsid + "'", con);
                cmd23.ExecuteNonQuery();
                con.Close();
                
                //string id = cmd.Parameters["@id"].Value.ToString();
                lbl.Text = "Your Raised Token No:" + modurl;
                lbl1.Visible = true;
            }
            con.Close();
        }
        catch (Exception ex)
        {
            //cr140001
            //err.insert_exception(ex, excep_page);
        }
        finally
        {
            con.Close();
            con.Dispose();
        }



    }
        
    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }

        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }

        finally
        {
            con.Close();
            con.Dispose();
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        binddata();
    }
    protected void crmview(object sender, EventArgs e)
    {

    }
    
   
    
}

    