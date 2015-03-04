using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ExcelReader;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data.OleDb;

public partial class ContactBook : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds = new DataSet();
    Registration reg = new Registration();
    string uname;
    string Base_dir = AppDomain.CurrentDomain.BaseDirectory;

    protected void Page_Load(object sender, EventArgs e)
    {

        uname = Convert.ToString(Session["User"]);

        if (!IsPostBack)
        {
            tablegrid.Visible = true;
            divcontact.Visible = false;
            griddata.Visible = false;
            listname.Visible = false;
            import.Visible = false;
            export.Visible = false;
            //Button1.Attributes.Add("onclick", "javascript:return DeleteConfirm()"); 
            Label1.Text = "Lists For:" + uname;
           bindgridview();
        // string uname = Convert.ToString(Session["User"]);

        DataSet ds56 = reg.datalist(uname);
        if (ds56.Tables[0].Rows.Count > 0)
        {
            ddlist.DataSource = ds56;
            ddlist.DataValueField = "lname";
            ddlist.DataTextField = "lname";
            ddlist.DataBind();
            ddlist.Items.Insert(0, "Select List");


            ddllist.DataSource = ds56;
            ddllist.DataValueField = "lname";
            ddllist.DataTextField = "lname";
            ddllist.DataBind();
            ddllist.Items.Insert(0, "Select List");

            ddlimport.DataSource = ds56;
            ddlimport.DataValueField = "lname";
            ddlimport.DataTextField = "lname";
            ddlimport.DataBind();
            ddlimport.Items.Insert(0, "Select List");

            ddlexport.DataSource = ds56;
            ddlexport.DataValueField = "lname";
            ddlexport.DataTextField = "lname";
            ddlexport.DataBind();
            ddlexport.Items.Insert(0, "Select List");
        }

        griddata.Visible = true;
        }
    }
    

    

    protected void Companysearch1(object sender, CommandEventArgs e)
    {
        LinkButton lnk1 = (LinkButton)sender;

        lnk1.ForeColor = System.Drawing.Color.Black;

        if (lnk1.Text != "")
        {
            DataSet ds1 = new DataSet();
            //  string uname = Convert.ToString(Session["User"]);
            ds1 = reg.BindContacts(uname, lnk1.Text);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                gv1.DataSource = ds1;
                gv1.DataBind();
                griddata.Visible = true;
                import.Visible = false;
                export.Visible = false;
                lnk1.ForeColor = System.Drawing.Color.Red;


            }
            else
            {
                string script = "alert('No Contacts Found')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                griddata.Visible = false;
                lnk1.ForeColor = System.Drawing.Color.Green;

            }
        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {

        tablegrid.Visible = false;
        string name = txtname.Text;
        string number = txtnumber.Text;
        string listname = ddllist.SelectedItem.Value;
        if (listname != "Select List")
        {
            // string uname = Convert.ToString(Session["User"]);
            int s = reg.savedata(name, number, listname, uname);

            if (s == 0)
            {
                string script = "alert('Contact Added Successfully')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                txtname.Text = "";
                txtnumber.Text = "";
                ddllist.SelectedIndex = -1;
            }
            else
            {
                string script = "alert('Error Occured While Saving Your Contact')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            }
        }
        else
        {
            string script = "alert('Please Select Lis')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }

        ddlist.SelectedIndex = -1;
    }

    protected void allcontacts_Click(object sender, EventArgs e)
    {

        tablegrid.Visible = true;
        divcontact.Visible = false;
        griddata.Visible = true;
        listname.Visible = false;
        import.Visible = false;
        export.Visible = false;


        //  string uname = Convert.ToString(Session["User"]);

        DataSet ds1 = reg.savedata1(uname);

        if (ds1.Tables[0].Rows.Count > 0)
        {

            gv1.DataSource = ds1;
            gv1.DataBind();
            ddllist.SelectedIndex = -1;
        }

        else
        {
            string script = "alert('No Contacts Found')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            griddata.Visible = false;

        }
        ddlist.SelectedIndex = -1;

    }
    protected void edit_click(object sender, EventArgs e)
    {
        for (int i = 0; i < gv1.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gv1.Rows[i].FindControl("chkone");
            if (cbox.Checked)
            {
                int prd = Convert.ToInt32(gv1.DataKeys[i].Values[0].ToString());
                Session["id"] = prd;
                DataSet ds1 = reg.editdata(prd, uname);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    ModalPopupExtender2.Show();

                    txteditlname.Text = ds1.Tables[0].Rows[0]["cname"].ToString();
                    txteditdesc.Text = ds1.Tables[0].Rows[0]["number"].ToString();

                }
            }
        }
    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        string a = txteditlname.Text;
        string b = txteditdesc.Text;
        int id = Convert.ToInt32(Session["id"]);
        string date = Convert.ToString(DateTime.Now);
        int n = reg.updatedata(a, b, date, uname, id);

        DataSet ds1 = reg.savedata1(uname);

        if (ds1.Tables[0].Rows.Count > 0)
        {

            gv1.DataSource = ds1;
            gv1.DataBind();
            ddllist.SelectedIndex = -1;
        }


    }

    protected void btndel_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;

            for (int i = 0; i < gv1.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)gv1.Rows[i].FindControl("chkone");
                if (cbox.Checked)
                {
                    int prd = Convert.ToInt32(gv1.DataKeys[i].Values[0].ToString());


                    DataSet ds1 = reg.deletedata(prd, uname);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        gv1.DataSource = ds1;
                        gv1.DataBind();

                        string strscpt = "alert('Selected Contact deleted sucessfully');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                        griddata.Visible = true;
                    }
                    else
                    {
                        string strscpt = "alert('No Contacts Found');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
                    }
                }
            }
        }

        catch (Exception ErrMsg)
        {
            Response.Write("Error SQL:" + ErrMsg.Message + " ");
        }
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        tablegrid.Visible = false;
        divcontact.Visible = true;
        griddata.Visible = false;
        listname.Visible = false;
        import.Visible = false;
        export.Visible = false;
        divlist.Visible = false;

    }

    protected void chkall_CheckedChanged(object sender, EventArgs e)
    {
        int currentcount = 0;
        CheckBox chkall = (CheckBox)gv1.HeaderRow.FindControl("chkall");

        if (chkall.Checked == true)
        {
            foreach (GridViewRow gvOrdr in gv1.Rows)
            {
                CheckBox chkIndividual = (CheckBox)gvOrdr.FindControl("chkone");
                chkIndividual.Checked = true;
            }
        }
        else
        {
            foreach (GridViewRow gvOrdr in gv1.Rows)
            {
                CheckBox chkIndividual = (CheckBox)gvOrdr.FindControl("chkone");
                chkIndividual.Checked = false;
            }
        }
    }

    protected void subgrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        DataSet ds1 = reg.savedata1(uname);
        gv1.DataSource = ds1;
        gv1.PageIndex = e.NewPageIndex;
        gv1.DataBind();

        griddata.Visible = true;

    }

    protected void btnnewlist_Click(object sender, EventArgs e)
    {
        listname.Visible = true;
        tablegrid.Visible = false;
        divcontact.Visible = false;
        griddata.Visible = false;
        import.Visible = false;
        export.Visible = false;
        divlist.Visible = false;

    }

    protected void btnadd1_Click(object sender, EventArgs e)
    {
        //  string uname = Convert.ToString(Session["User"]);
        string lname = txtlistname.Text;
        int n = reg.createlist(uname, lname);
        if (n == 0)
        {
            string script = "alert('List Name Added Successfully')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            txtlistname.Text = "";
        }
        else
        {
            string script = "alert('Error occured While Saving Your List Name')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
    }
    protected void ddlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = ddlist.SelectedItem.Text;

        DataSet ds1 = reg.savedata2(uname, x);

        if (ds1.Tables[0].Rows.Count > 0)
        {

            gv1.DataSource = ds1;
            gv1.DataBind();
            ddllist.SelectedIndex = -1;
            griddata.Visible = true;
        }

        else
        {
            string script = "alert('No Contacts Found')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
            griddata.Visible = false;
        }

    }
    protected void lnkimp_Click(object sender, EventArgs e)
    {
        import.Visible = true;
        export.Visible = false;
        griddata.Visible = false;

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (upload1.HasFile)
        {
            string strFileName = Server.HtmlEncode(upload1.FileName);
            string strExtension = Path.GetExtension(strFileName);

            string strUploadFileName = "ExcelReports/" + strFileName;//date + strExtension               
            string path = Base_dir + strUploadFileName;
            upload1.SaveAs(path);

            string listname = ddlimport.SelectedItem.Text;

            string date = Convert.ToString(DateTime.Now);
            string subscriber = "subscriber";

            FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read);
            IExcelDataContainer excelReader; //import the excel class library(dll) class and methods
            if (strExtension == ".xls")
                // Reading from a binary Excel file ('97-2003 format; *.xls)
                excelReader = ExcelReaderContainer.CreateBinaryReader(stream); //filestream as a parameter
            else
                //Reading from a OpenXml Excel file (2007 format; *.xlsx)
                excelReader = ExcelReaderContainer.CreateOpenXmlReader(stream); //filestream as a parameter
            // DataSet - The result of each spreadsheet will be created in the result.Tables
            DataSet result = new DataSet();
            result = excelReader.AsDataSet();
            //result=null;
            excelReader.Close(); //close the excel reader
            excelReader.Dispose();
            stream.Close();
            if (result.Tables.Count > 0)
            {
                if (result.Tables[0].Rows.Count > 0)
                {
                    if (result.Tables[0].Rows[0][0].ToString() != "mobile")
                    {
                        string script = "alert('Enter Column name mobile')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }
                    else
                    {
                        for (int i = 1; i < result.Tables[0].Rows.Count; i++)
                        {
                            string a = result.Tables[0].Rows[i][0].ToString();
                            int x = a.Length;
                            if (x == 10)
                            {
                                string sqlqry = "insert into SingleNumbers(cname,number,listname,postdate,username)values('" + subscriber + "','" + a + "','" + listname + "','" + date + "','" + uname + "')";
                                con.Open();
                                SqlCommand cmd = new SqlCommand(sqlqry, con);
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                        string script = "alert('Valid Numbers Upload Successfully')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
                    }

                }


            }
            string script1 = "alert('Enter numbers in Excel sheet with Column name mobile')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script1, true);

        }
        else
        {
            string script = "alert('Browse file first')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", script, true);
        }
        ddlimport.SelectedIndex = -1;
    }

    protected void lnkexp_Click(object sender, EventArgs e)
    {
        import.Visible = false;
        export.Visible = true;
        griddata.Visible = false;


    }
    protected void btnexport_Click(object sender, EventArgs e)
    {

        if (ddlexport.SelectedItem.Text != "Select List")
        {

            string a = ddlexport.SelectedItem.Text;
            ddlexport.SelectedIndex = 0;

            string sqlq = "select * from SingleNumbers where  username='" + uname + "' and listname='" + a + "' ";
            SqlDataAdapter da = new SqlDataAdapter(sqlq, con);
            DataSet ds1 = new DataSet();
            da.Fill(ds1);
            if (ds1.Tables[0].Rows.Count != 0)
            {
                string strExcelConn = "";
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=Mobilenumbers.xls");
                Response.ContentType = "application/ms-excel";
                string tab = string.Empty;

                DataTable dexp = new DataTable();
                //  ds1 = (DataSet)Session["values"];
                dexp = ds1.Tables[0];
                foreach (DataColumn datacol in dexp.Columns)
                {
                    Response.Write(tab + datacol.ColumnName);
                    tab = "\t";
                }
                Response.Write("\n");
                foreach (DataRow dr in dexp.Rows)
                {
                    tab = "";
                    for (int j = 0; j < dexp.Columns.Count; j++)
                    {
                        Response.Write(tab + Convert.ToString(dr[j]));
                        tab = "\t";
                    }

                    Response.Write("\n");
                }

                Response.End();
            }
            else
            {
                string strScript = "alert('NO Reports Found');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }


            Response.Flush();
        }
        else
        {
            string strScript = "alert('Please Select List For Download the Numbers');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

        }
        export.Visible = true;
        ddlexport.SelectedIndex = -1;

    }

    protected void btnUpdatecancel_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    //protected void delctc_Click(object sender, EventArgs e)
    //{
    //    string q = "delete list from "
    //}
    protected void bindgridview()
    {
        string qry = "select * from lists where username='" + uname + "'";
        //SqlCommand cmd = new SqlCommand(q, con);
        SqlDataAdapter ad = new SqlDataAdapter(qry, con);
        ad.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            listtable.DataSource = ds;
            listtable.DataBind();
            int columncount = listtable.Rows[0].Cells.Count;
            listtable.Rows[0].Cells.Clear();
            listtable.Rows[0].Cells.Add(new TableCell());
            listtable.Rows[0].Cells[0].ColumnSpan = columncount;
            listtable.Rows[0].Cells[0].Text = "No Lists Found";
        }
        else
        {
            listtable.DataSource = ds;
            listtable.DataBind();
        }
        con.Close();
    }
        

    
    protected void btndel(object sender, EventArgs e)
    {
        foreach (GridViewRow gvrow in listtable.Rows)
        {
            //Finiding checkbox control in gridview for particular row
            CheckBox chkdelete = (CheckBox)gvrow.FindControl("chk1");
            //Condition to check checkbox selected or not
            //if (chkdelete != null)
            if (chkdelete.Checked)
            {
                //Getting UserId of particular row using datakey value
                string usrid = Convert.ToString(listtable.DataKeys[gvrow.RowIndex].Value);

                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM lists FROM lists E LEFT JOIN SingleNumbers S ON S.listname=E.lname WHERE lno=" + usrid, con);
                    //SqlCommand cmd = new SqlCommand("delete lists  where lno=" + usrid, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }


            }
                else
                 {
               
                    string str1 = "alert(' Please Select CheckBox ')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str1, true);
                }
            


        }
        
        string str = "alert('Your Selected  list Deleted ')";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        bindgridview();

    }
    protected void listtable_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        listtable.PageIndex = e.NewPageIndex;
        listtable.DataBind();
        bindgridview();
    }
   
}

