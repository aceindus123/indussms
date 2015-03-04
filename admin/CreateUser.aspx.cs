using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_CreateUser : System.Web.UI.Page
{
   
    DataSet ds = new DataSet();
    DataSet dsgetUserIdData = new DataSet();
    CheckBox cbox;
    string strScript;
 
    int prd = 0;
    Int32 Status;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            string usertype = Session["usertype"].ToString();

            if (!IsPostBack)
            {
                gvdisplay.Visible = true;
                createuser1.Visible = false;

                gridviewdata();
                client();
                jobseeker();
                postjobs();
                support();
                resumes();
                jobfairs();

            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    private void gridviewdata()
    {
        string find = "select * from c_adminlogin order by id";
        SqlDataAdapter sda = new SqlDataAdapter(find, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        gvusers.DataSource = ds;
        gvusers.DataBind();
        lnkcreate.Visible = true;
    }

    protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridviewdata();
        gvusers.PageIndex = e.NewPageIndex;
        gvusers.DataBind();
    }

    protected void enablebtn_Click(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            int prd1 = checkid();
            if (prd1 != 0)
            {
                string disable = "select status from c_adminlogin where id=" + prd1 + "";
                SqlDataAdapter sda = new SqlDataAdapter(disable, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    if (Convert.ToString(ds.Tables[0].Rows[0]["status"]) == "Deactivated")
                    {
                        con.Open();
                        string disable1 = "update c_adminlogin set status='Activated' where id=" + prd1 + "";
                        SqlCommand cmd = new SqlCommand(disable1, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        string strScript = "alert('User status Activated');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        gridviewdata();
                    }
                    else
                    {
                        string strScript = "alert('user status already Activated');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }
                else
                {
                    string strScript = "alert('Please select Record');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else
            {
                string strScript = "alert('Please select Record');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }

    protected void disablebtn_Click(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            int prd1 = checkid();
            if (prd1 != 0)
            {
                string disable = "select status from c_adminlogin where id=" + prd1 + "";
                SqlDataAdapter sda = new SqlDataAdapter(disable, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToString(ds.Tables[0].Rows[0]["status"]) == "Activated")
                    {
                        con.Open();
                        string disable1 = "update c_adminlogin set status='Deactivated' where id=" + prd1 + "";
                        SqlCommand cmd = new SqlCommand(disable1, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        string strScript = "alert('User status Deactivated');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                        gridviewdata();
                    }
                    else
                    {
                        string strScript = "alert('user status already Deactivated');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                    }
                }

            }
            else
            {
                string strScript = "alert('Please select Record');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }
    
    protected void deletebtn_Click(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            string own1 = Convert.ToString( Session["login"]);
            own = ConfigurationManager.AppSettings["owner"].ToString();
            if(own1== own)
            {

                int prd3 = checkid();
                if (prd3 != 0)
                {
                    string delete1 = " Delete c_adminlogin   where id=" + prd3 + " ";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete1, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    gridviewdata();

                    string strScript = "alert('Selected  Record Deleted Successfully');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
                else
                {
                    string strScript = "alert('Please select Record');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
            else{
                 string strScript = "alert('You are Not authorised User to Delete');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }

    protected void editbtn_Click(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            int prd1 = checkid();
            if (prd1 != 0)
            {

                Tr1.Visible = false;
                Tr2.Visible = false;
                Tr3.Visible = false;
                Tr4.Visible = false;
                Tr5.Visible = false;
                Tr6.Visible = false;
                Tr8.Visible = false;
                Tr10.Visible = false;
                Tr11.Visible = false;
                Tr12.Visible = false;
                Tr13.Visible = false;
                Tr14.Visible = false;
                Tr15.Visible = false;
                Tr16.Visible = false;
                Tr17.Visible = false;
                Tr21.Visible = false;
                Tr22.Visible = false;
                Tr23.Visible = false;
                Tr24.Visible = false;
                Tr25.Visible = false;
                Tr26.Visible = false;
                Tr27.Visible = false;
                Tr28.Visible = false;
                Tr29.Visible = false;
                Tr30.Visible = false;
                Tr31.Visible = false;
                Tr32.Visible = false;
                Tr9.Visible = false;
                Tr7.Visible = false;

                RadioButton2.Checked = true;
                RadioButton4.Checked = true;
                RadioButton6.Checked = true;
                RadioButton8.Checked = true;
                RadioButton10.Checked = true;
                RadioButton12.Checked = true;

                string find1 = "select * from c_adminlogin where id=" + prd1 + "";
                SqlDataAdapter sda = new SqlDataAdapter(find1, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (prd1 != 0)
                {
                    txtedfname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                    txtedlname.Text = ds.Tables[0].Rows[0]["username"].ToString();
                    ddleddesgn.SelectedItem.Text = ds.Tables[0].Rows[0]["usertype"].ToString();
                    ddleddesgn.ClearSelection();
                    ddleddesgn.Items.FindByText(ds.Tables[0].Rows[0]["usertype"].ToString()).Selected = true;
                    ddledcountry.ClearSelection();
                    ddledcountry.Items.FindByText(ds.Tables[0].Rows[0]["country"].ToString()).Selected = true;
                    txtedaddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    txtedcontact.Text = ds.Tables[0].Rows[0]["contact"].ToString();
                    txtedmob.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                    txtedmail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();


                    string clientview = ds.Tables[0].Rows[0]["viewclient"].ToString();
                    if (clientview == "1") { chk57.Checked = true; } else { chk57.Checked = false; }

                    string clientupdate = ds.Tables[0].Rows[0]["Updateclient"].ToString();
                    if (clientupdate == "1") { chk52.Checked = true; } else { chk52.Checked = false; }
               
                    string deleteclient = ds.Tables[0].Rows[0]["deleteclient"].ToString();
                    if (deleteclient == "1") { chk53.Checked = true; } else { chk53.Checked = false; }

                    string statusclient = ds.Tables[0].Rows[0]["Statausclient"].ToString();
                    if (statusclient == "1") { chk55.Checked = true; } else { chk55.Checked = false; }


                    string viewuser = ds.Tables[0].Rows[0]["viewuser"].ToString();
                    if (viewuser == "1") { chk60.Checked = true; } else { chk60.Checked = false; }

                    string activateuser = ds.Tables[0].Rows[0]["activateuser"].ToString();
                    if (activateuser == "1") { chk61.Checked = true; } else { chk61.Checked = false; }

                    string deactivateuser = ds.Tables[0].Rows[0]["deactivateuser"].ToString();
                    if (deactivateuser == "1") { chk62.Checked = true; } else { chk62.Checked = false; }

                    string deleteuser = ds.Tables[0].Rows[0]["deleteuser"].ToString();
                    if (deleteuser == "1") { chk63.Checked = true; } else { chk63.Checked = false; }


                    string missedview = ds.Tables[0].Rows[0]["missedview"].ToString();
                    if (missedview == "1") { chk65.Checked = true; } else { chk65.Checked = false; }

                    string missedupdate = ds.Tables[0].Rows[0]["missedupdate"].ToString();
                    if (missedupdate == "1") { chk66.Checked = true; } else { chk66.Checked = false; }


                    string supporthelp = ds.Tables[0].Rows[0]["supporthelp"].ToString();
                    if (supporthelp == "1") { chk71.Checked = true; } else { chk71.Checked = false; }

                    string supportupdate = ds.Tables[0].Rows[0]["supportupdate"].ToString();
                    if (supportupdate == "1") { chk72.Checked = true; } else { chk72.Checked = false; }

                    string supportexception = ds.Tables[0].Rows[0]["supportexception"].ToString();
                    if (supportexception == "1") { CheckBox12.Checked = true; } else { CheckBox12.Checked = false; }

                    string supportresponce = ds.Tables[0].Rows[0]["supportresponce"].ToString();
                    if (supportresponce == "1") { CheckBox14.Checked = true; } else { CheckBox14.Checked = false; }


                    string offerscreate = ds.Tables[0].Rows[0]["offerscreate"].ToString();
                    if (offerscreate == "1") { chk74.Checked = true; } else { chk74.Checked = false; }

                    string offersstatus = ds.Tables[0].Rows[0]["offersstatus"].ToString();
                    if (offersstatus == "1") { chk75.Checked = true; } else { chk75.Checked = false; }

                    string offersdelete = ds.Tables[0].Rows[0]["offersdelete"].ToString();
                    if (offersdelete == "1") { chk76.Checked = true; } else { chk76.Checked = false; }


                    string permissionview = ds.Tables[0].Rows[0]["permissionview"].ToString();
                    if (permissionview == "1") { chk80.Checked = true; } else { chk80.Checked = false; }

                    string permissionforward = ds.Tables[0].Rows[0]["permissionforward"].ToString();
                    if (permissionforward == "1") { chk81.Checked = true; } else { chk81.Checked = false; }

                    string permissionaccept = ds.Tables[0].Rows[0]["permissionaccept"].ToString();
                    if (permissionaccept == "1") { chk80.Checked = true; } else { chk80.Checked = false; }

                    string permissiondelete = ds.Tables[0].Rows[0]["permissiondelete"].ToString();
                    if (permissiondelete == "1") { chk81.Checked = true; } else { chk81.Checked = false; }

              

                    ModalPopupExtender1.Show(); 
                }
            }

            else
            {
                string strScript = "alert('Please Select  One Record');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
  
    protected void lnkview_Click(object sender, EventArgs e)
    {
        gvdisplay.Visible = true;
        createuser1.Visible = false;
        gridviewdata();
    } 

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void lnkcreate_Click1(object sender, EventArgs e)
    {
          createuser1.Visible = true;
          gvdisplay.Visible = false;
          lblmsg.Visible = true;
    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        lnkcreate.Visible = false;
        if (lblmsg.Text == "User Name Available")
        {
            string uname = txtLName.Text;
            string fname = txtFName.Text;
            string pwd = txtPwd.Text;
            string cpwd = txtconPwd.Text;
            string cont = ddlCountry.SelectedItem.Text;
            string adm = ddlUserType.SelectedItem.Text;
            string add = txtAddress.Text;
            string mob = txtMobile.Text;
            string conatact = txtConNumber.Text;
            string email = txtEmailId.Text;
            string a = "Activated";

            string clientview = "";
            string clientupdate = "";
            string clientdelete = "";
            string clientstatus = "";

            string viewuser = "";
            string activateuser = "";
            string deactivateuser = "";
            string deleteuser = "";

            string missedview = "";
            string missedupdate = "";

            string supporthelp = "";
            string supportupdate = "";
            string supportexception = "";
            string supportresponce = "";

            string offerscreate = "";
            string offersstatus = "";
            string offersdelete = "";

            string permissionview = "";
            string permissionforward = "";
            string permissionaccept = "";
            string permissiondelete = "";


            if (chkview.Checked == true) { clientview = "1"; } else { clientview = "0"; }
            if (chkedit.Checked == true) { clientupdate = "1"; } else { clientupdate = "0"; }
            if (chkdelete.Checked == true) { clientdelete = "1"; } else { clientdelete = "0"; }
            if (chkgen.Checked == true) { clientstatus = "1"; } else { clientstatus = "0"; }

            if (CheckBox2.Checked == true) { viewuser = "1"; } else { viewuser = "0"; }
            if (CheckBox4.Checked == true) { activateuser = "1"; } else { activateuser = "0"; }
            if (CheckBox5.Checked == true) { deactivateuser = "1"; } else { deactivateuser = "0"; }
            if (CheckBox6.Checked == true) { deleteuser = "1"; } else { deleteuser = "0"; }

            if (CheckBox8.Checked == true) { missedview = "1"; } else { missedview = "0"; }
            if (CheckBox9.Checked == true) { missedupdate = "1"; } else { missedupdate = "0"; }

            if (CheckBox15.Checked == true) { supporthelp = "1"; } else { supporthelp = "0"; }
            if (CheckBox17.Checked == true) { supportupdate = "1"; } else { supportupdate = "0"; }
            if (CheckBox3.Checked == true) { supportexception = "1"; } else { supportexception = "0"; }
            if (CheckBox11.Checked == true) { supportresponce = "1"; } else { supportresponce = "0"; }

            if (CheckBox20.Checked == true) { offerscreate = "1"; } else { offerscreate = "0"; }
            if (CheckBox10.Checked == true) { offersstatus = "1"; } else { offersstatus = "0"; }
            if (CheckBox24.Checked == true) { offersdelete = "1"; } else { offersdelete = "0"; }

            if (CheckBox26.Checked == true) { permissionview = "1"; } else { permissionview = "0"; }
            if (CheckBox27.Checked == true) { permissionforward = "1"; } else { permissionforward = "0"; }
            if (CheckBox28.Checked == true) { permissionaccept = "1"; } else { permissionaccept = "0"; }
            if (CheckBox29.Checked == true) { permissiondelete = "1"; } else { permissiondelete = "0"; }

            string save = "insert into c_adminlogin(username,fname,password,cpassword,usertype,country,address,mobile,contact ,emailid,status,viewclient,Updateclient,deleteclient,Statausclient,viewuser,activateuser,deactivateuser,deleteuser,missedview,missedupdate,supporthelp,supportupdate,supportexception,supportresponce,offerscreate,offersstatus,offersdelete,permissionview,permissionforward,permissionaccept,permissiondelete) values ('" + uname + "','" + fname + "','" + pwd + "','" + cpwd + "','" + adm + "','" + cont + "','" + add + "','" + mob + "','" + conatact + "','" + email + "','" + a + "','" + clientview + "','" + clientupdate + "','" + clientdelete + "','" + clientstatus + "', '" + viewuser + "','" + activateuser + "','" + deactivateuser + "','" + deleteuser + "','" + missedview + "','" + missedupdate + "','" + supporthelp + "','" + supportupdate + "','" + supportexception + "','" + supportresponce + "','" + offerscreate + "','" + offersstatus + "','" + offersdelete + "','" + permissionview + "','" + permissionforward + "','" + permissionaccept + "','" + permissiondelete + "')";
            con.Open();
            SqlCommand cmd = new SqlCommand(save, con);
            cmd.ExecuteNonQuery();
            con.Close();
            string strScript = "alert('User is Created Sucessfully');location.replace('CreateUser.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

            txtLName.Text = "";
            txtFName.Text = "";
            txtPwd.Text = "";
            txtconPwd.Text = "";
            ddlCountry.SelectedIndex = -1;
            ddlUserType.SelectedIndex = -1;
            txtAddress.Text = "";
            txtMobile.Text = "";
            txtConNumber.Text = "";
            txtEmailId.Text = "";
            lblmsg.Text = "";
            lblmsg.Visible = false;
     
        }

        else
        {
            lblmsg.Text = "";
            string strScript = "alert('User name Change');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void txtLName_TextChanged(object sender, EventArgs e)
    {
        string find = "select username from c_adminlogin where username='" + txtLName.Text+ "'";
        SqlDataAdapter sda = new SqlDataAdapter(find,con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
              
        if(ds.Tables[0].Rows.Count>0)
            {
                lblmsg.Visible = true;
                lblmsg.Text =  "User Name existed";
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "User Name Available";
            }
        
    }

    //protected void IndexChanged(object sender, EventArgs e)
    //{

         
       
    //}
    public int checkid()
    {
        for (int i = 0; i < gvusers.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvusers.Rows[i].FindControl("CheckBoxreq");
            if (cbox.Checked)
            {
                prd = Convert.ToInt32(gvusers.DataKeys[i].Values[0].ToString());
                Session["id"] = prd;
            }
        }
        return prd;
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {

        if (Session["login"] != null)
        {
            int prd2 = checkid();

            string uname = txtedfname.Text;
            string fname = txtedlname.Text;

            string cont = ddledcountry.SelectedItem.Text;
            string adm = ddleddesgn.SelectedItem.Text;
            string add = txtedaddress.Text;
            string mob = txtedmob.Text;
            string conatact = txtedcontact.Text;



            string clientview11 = ""; 
            string clientedit1 = "";
            string clientdelete1 = "";
            string clientemail1 = "";
            string clientactive1 = "";
            string clientdeac1 = "";
            string clientcreate1 = "";
            string clientcreate11 = "";

            string jobseekerview1 = "";
            string jobseekeract1 = "";
            string jobseekerdeact1 = "";
            string jobseekerdelete1 = "";

           string supportdeletejob12= "";
             string supportdeletejob11= "";
          

            string postview1 = "";
            string postedit1 = "";
            string postemail1 = "";
            string postdelete1 = "";
            string postnew1 = "";
         
           
            string supportdelexcep1 = "";
            string supportdeletejob1 = "";

            string resumeview1 = "";
            string resumedelete1 = "";
            string resumeemail1 = "";

            string fairevents1 = "";
            string fairrelease1 = "";
            string fairtest1 = "";
            string fairlist1 = "";

            if (chk57.Checked == true) { clientcreate1 = "1"; } else { clientcreate1 = "0"; }
            if (chk52.Checked == true) { clientedit1 = "1"; } else { clientedit1 = "0"; }
            if (chk53.Checked == true) { clientactive1 = "1"; } else { clientactive1 = "0"; }
            if (chk55.Checked == true) { clientdelete1 = "1"; } else { clientdelete1 = "0"; }

            if (chk60.Checked == true) { jobseekerview1 = "1"; } else { jobseekerview1 = "0"; }
            if (chk61.Checked == true) { jobseekeract1 = "1"; } else { jobseekeract1 = "0"; }
            if (chk62.Checked == true) { jobseekerdeact1 = "1"; } else { jobseekerdeact1 = "0"; }
            if (chk63.Checked == true) { jobseekerdelete1 = "1"; } else { jobseekerdelete1 = "0"; }

            if (chk65.Checked == true) { postview1 = "1"; } else { postview1 = "0"; }
            if (chk66.Checked == true) { postedit1 = "1"; } else { postedit1 = "0"; }

            if (chk71.Checked == true) { supportdelexcep1 = "1"; } else { supportdelexcep1 = "0"; }
            if (chk72.Checked == true) { supportdeletejob1 = "1"; } else { supportdeletejob1 = "0"; }
            if (CheckBox12.Checked == true) { supportdeletejob11 = "1"; } else { supportdeletejob11 = "0"; }
            if (CheckBox14.Checked == true) { supportdeletejob12 = "1"; } else { supportdeletejob12 = "0"; }

            if (chk74.Checked == true) { resumeview1 = "1"; } else { resumeview1 = "0"; }
            if (chk75.Checked == true) { resumedelete1 = "1"; } else { resumedelete1 = "0"; }
            if (chk76.Checked == true) { resumeemail1 = "1"; } else { resumeemail1 = "0"; }

            if (chk78.Checked == true) { fairevents1 = "1"; } else { fairevents1 = "0"; }
            if (chk79.Checked == true) { fairrelease1 = "1"; } else { fairrelease1 = "0"; }
            if (chk80.Checked == true) { fairtest1 = "1"; } else { fairtest1 = "0"; }
            if (chk81.Checked == true) { fairlist1 = "1"; } else { fairlist1 = "0"; }

            string update1 = " update c_adminlogin set username='" + fname + "',fname='" + uname + "',usertype='" + adm + "',country='" + cont + "',address='" + add + "',mobile='" + mob + "',contact='" + conatact + "' ,viewclient='"+clientcreate1+"',Updateclient='"+clientedit1+"',deleteclient='"+clientactive1+"',Statausclient='"+clientdelete1+"', viewuser='"+jobseekerview1+"',activateuser='"+jobseekeract1+"',deactivateuser='"+jobseekerdeact1+"',deleteuser='"+jobseekerdelete1+"',missedview='"+postview1+"',missedupdate='"+postedit1+"', supporthelp='"+supportdelexcep1+"',supportupdate='"+supportdeletejob1+"',supportexception='"+supportdeletejob11+"',supportresponce='"+supportdeletejob12+"',  offerscreate='"+resumeview1+"',offersstatus='"+resumedelete1+"',offersdelete='"+resumeemail1+"',permissionview='"+fairevents1+"', permissionforward='"+fairrelease1+"',permissionaccept='"+fairtest1+"',permissiondelete='"+fairlist1+"' where id=" + prd2 + " ";
            con.Open();
            SqlCommand cmd = new SqlCommand(update1, con);
            cmd.ExecuteNonQuery();
            con.Close();
            gridviewdata();

            string strScript = "alert('Selected  Record updated Successfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtLName.Text = "";
        txtFName.Text = "";
        txtPwd.Text = "";
        txtconPwd.Text = "";
        ddlCountry.SelectedIndex = -1;
        ddlUserType.SelectedIndex = -1;
        txtAddress.Text = "";
        txtMobile.Text = "";
        txtConNumber.Text = "";
        txtEmailId.Text = "";
        lblmsg.Text = "";
        lblmsg.Visible = false;
        Response.Redirect("CreateUser.aspx");
    }
 
    protected void client()
    {
        SelectAll.Visible = false;
        clientview.Visible = false;
        edit.Visible = false;
        delete.Visible = false;
        generate.Visible = false;
    }
    protected void jobseeker()
    {
        chk1.Visible = false;
        chk2.Visible = false;
        chk3.Visible = false;
        chk4.Visible = false;
        chk5.Visible = false;
        //chk6.Visible = false;
    }
    protected void postjobs()
    {
        chk7.Visible = false;
        chk8.Visible = false;
        chk9.Visible = false;
    }
    protected void support()
    {
        chk13.Visible = false;
        Tr2.Visible = false;
        chk15.Visible = false;
        Tr5.Visible = false;
        chk17.Visible = false;
        
    }
    protected void resumes()
    {
        chk19.Visible = false;
        chk20.Visible = false;
        chk21.Visible = false;
        chk22.Visible = false;
      
    }
    protected void jobfairs()
    {
        chk23.Visible = false;
        chk24.Visible = false;
        chk25.Visible = false;
        chk26.Visible = false;
        chk27.Visible = false;
    }
    protected void client1()
    {
        chk50.Visible = false;
        chk52.Visible = false;
        chk53.Visible = false;
        chk55.Visible = false;
        chk57.Visible = false;
    }
    protected void jobseeker1()
    {
        chk59.Visible = false;
        chk60.Visible = false;
        chk61.Visible = false;
        chk62.Visible = false;
        chk63.Visible = false;
        
    }
    protected void postjobs1()
    {
        chk64.Visible = false;
        chk65.Visible = false;
        chk66.Visible = false;
    }
    protected void support1()
    {
        chk70.Visible = false;
        chk71.Visible = false;
        chk72.Visible = false;

    }
    protected void resumes1()
    {
        chk73.Visible = false;
        chk74.Visible = false;
        chk75.Visible = false;
        chk76.Visible = false;

    }
    protected void jobfairs1()
    {
        chk77.Visible = false;
        chk78.Visible = false;
        chk79.Visible = false;
        chk80.Visible = false;
        chk81.Visible = false;
    }

    protected void clientcheckedchanged(object sender, EventArgs e)
    {
        SelectAll.Visible = true;
        clientview.Visible = true;
        edit.Visible = true;
        delete.Visible = true;
        generate.Visible = true;

    }
    protected void clientcheckedchanged1(object sender, EventArgs e)
    {
        client();
        chkselectall.Checked = false;
        chkview.Checked = false;
        chkedit.Checked = false;
        chkdelete.Checked = false;
        chkgen.Checked = false;
    }
    protected void clientcheckedchanged2(object sender, EventArgs e)
    {
        chk1.Visible = true;
        chk2.Visible = true;
        chk3.Visible = true;
        chk4.Visible = true;
        chk5.Visible = true;
        //chk6.Visible = true;
    }
    protected void clientcheckedchanged3(object sender, EventArgs e)
    {
        jobseeker();

        CheckBox1.Checked = false;
        CheckBox2.Checked = false;
        CheckBox4.Checked = false;
        CheckBox5.Checked = false;
        CheckBox6.Checked = false;
    }
    protected void clientcheckedchanged4(object sender, EventArgs e)
    {
        chk7.Visible = true;
        chk8.Visible = true;
        chk9.Visible = true;
    }
    protected void clientcheckedchanged5(object sender, EventArgs e)
    {
        postjobs();
        CheckBox7.Checked = false;
        CheckBox8.Checked = false;
        CheckBox9.Checked = false;
  
    }
    protected void clientcheckedchanged6(object sender, EventArgs e)
    {
        chk13.Visible = true;
        chk15.Visible = true;
        chk17.Visible = true;
        Tr2.Visible = true;
        Tr5.Visible = true;
      
    }
    protected void clientcheckedchanged7(object sender, EventArgs e)
    {
        support();
        CheckBox13.Checked = false;
        CheckBox15.Checked = false;
        CheckBox17.Checked = false;
        Tr2.Visible = false;
        Tr5.Visible = false;

    }
    protected void clientcheckedchanged8(object sender, EventArgs e)
    {
        chk19.Visible = true;
        chk20.Visible = true;
        chk21.Visible = true;
        chk22.Visible = true;
    }
    protected void clientcheckedchanged9(object sender, EventArgs e)
    {
        resumes();
        CheckBox19.Checked = false;
        CheckBox20.Checked = false;
        CheckBox10.Checked = false;
        CheckBox24.Checked = false;
    }
    protected void clientcheckedchanged10(object sender, EventArgs e)
    {
        chk23.Visible = true;
        chk24.Visible = true;
        chk25.Visible = true;
        chk26.Visible = true;
        chk27.Visible = true;
       
    }
    protected void clientcheckedchanged11(object sender, EventArgs e)
    {
        jobfairs();
        CheckBox25.Checked = false;
        CheckBox26.Checked = false;
        CheckBox27.Checked = false;
        CheckBox28.Checked = false;
        CheckBox29.Checked = false;
    }
    protected void chkselectall_CheckedChanged(object sender, EventArgs e)
    {
        if (chkselectall.Checked==true)
        {
            chkview.Checked = true;
            chkedit.Checked = true;
            chkdelete.Checked = true;
            chkgen.Checked = true;
        }
        else
        {
            chkview.Checked = false;
            chkedit.Checked = false;
            chkdelete.Checked = false;
            chkgen.Checked = false;
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            CheckBox2.Checked = true;
            CheckBox4.Checked = true;
            CheckBox5.Checked = true;
            CheckBox6.Checked = true;
        }
        else
        {
            CheckBox2.Checked = false;
            CheckBox4.Checked = false;
            CheckBox5.Checked = false;
            CheckBox6.Checked = false;
        }
    }
    protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox7.Checked == true)
        {
            CheckBox8.Checked = true;
            CheckBox9.Checked = true;
      
        }
        else
        {
            CheckBox8.Checked = false;
            CheckBox9.Checked = false;
    
        }
    }
    protected void CheckBox13_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox13.Checked == true)
        {
            CheckBox11.Checked = true;
            CheckBox15.Checked = true;
            CheckBox3.Checked = true;
            CheckBox17.Checked = true;
        }
        else
        {
            CheckBox11.Checked = false;
            CheckBox15.Checked = false;
            CheckBox3.Checked = false;
            CheckBox17.Checked = false;
        }
    }

    protected void CheckBox19_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox19.Checked == true)
        {
            CheckBox20.Checked = true;
            CheckBox10.Checked = true;
            CheckBox24.Checked = true;
     
        }
        else
        {
            CheckBox20.Checked = false;
            CheckBox10.Checked = false;
            CheckBox24.Checked = false;
        }
    }
    protected void CheckBox25_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox25.Checked == true)
        {
            CheckBox26.Checked = true;
            CheckBox27.Checked = true;
            CheckBox28.Checked = true;
            CheckBox29.Checked = true;
        }
        else
        {
            CheckBox26.Checked = false;
            CheckBox27.Checked = false;
            CheckBox28.Checked = false;
            CheckBox29.Checked = false;
        }

    }
    protected void CheckBox24_CheckedChanged(object sender, EventArgs e)
    {
        if(CheckBox24.Checked == false)
        {
            CheckBox19.Checked = false;
           
        }
        else if (CheckBox20.Checked == true && CheckBox10.Checked == true && CheckBox24.Checked ==   true)
        {
             CheckBox19.Checked = true;
        }
    }
    protected void CheckBox20_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox20.Checked == false)
        {
            CheckBox19.Checked = false;
        }
        else if (CheckBox20.Checked == true && CheckBox10.Checked == true && CheckBox24.Checked == true)
        {
            CheckBox19.Checked = true;
        }
        
    }
    protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox10.Checked == false)
        {
            CheckBox19.Checked = false;
        }
        else if (CheckBox20.Checked == true && CheckBox10.Checked == true && CheckBox24.Checked == true)
        {
            CheckBox19.Checked = true;
        }
    }
    protected void CheckBox26_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox26.Checked == false)
        {
            CheckBox25.Checked = false;
        }

        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }
    protected void CheckBox27_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox27.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }
    protected void CheckBox28_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox28.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }
    protected void CheckBox29_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox29.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox28.Checked == true && CheckBox29.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }

    protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox15.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox15.Checked == true  && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }

    protected void CheckBox17_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox17.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if ( CheckBox15.Checked == true && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }
    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox3.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox3.Checked == true && CheckBox11.Checked == true   && CheckBox8.Checked == true && CheckBox9.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox8.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if ( CheckBox8.Checked == true && CheckBox9.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox9.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if ( CheckBox8.Checked == true && CheckBox9.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox11.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox3.Checked == true && CheckBox11.Checked == true && CheckBox8.Checked == true && CheckBox9.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }

    protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox6.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox6.Checked == true &&  CheckBox5.Checked == true && CheckBox4.Checked == true && CheckBox2.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }
    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox5.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox6.Checked == true  && CheckBox5.Checked == true && CheckBox4.Checked == true && CheckBox2.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }
    protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox4.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox6.Checked == true  && CheckBox5.Checked == true && CheckBox4.Checked == true && CheckBox2.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox2.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox6.Checked == true  && CheckBox5.Checked == true && CheckBox4.Checked == true && CheckBox2.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }

    protected void chkcreate1_CheckedChanged(object sender, EventArgs e)
    {
        if (chkgen.Checked == false)
        {
            chkselectall.Checked = false;
        }
        else if (chkview.Checked == true && chkedit.Checked == true  && chkdelete.Checked == true && chkgen.Checked==true)
        {
            chkselectall.Checked = true;
        }
    }

    protected void chkdelete_CheckedChanged(object sender, EventArgs e)
    {
        if (chkdelete.Checked == false)
        {
            chkselectall.Checked = false;
        }
        else if (chkview.Checked == true && chkedit.Checked == true && chkdelete.Checked == true )
        {
            chkselectall.Checked = true;
        }
    }

    protected void chkedit_CheckedChanged(object sender, EventArgs e)
    {
        if (chkedit.Checked == false)
        {
            chkselectall.Checked = false;
        }
        else if (chkview.Checked == true && chkedit.Checked == true  && chkdelete.Checked == true )
        {
            chkselectall.Checked = true;
        }
    }
    protected void chkview_CheckedChanged(object sender, EventArgs e)
    {
        if (chkview.Checked == false)
        {
            chkselectall.Checked = false;
        }
        else if (chkview.Checked == true && chkedit.Checked == true  && chkdelete.Checked == true )
        {
            chkselectall.Checked = true;
        }
    }

    protected void clientcheckedchanged20(object sender, EventArgs e)
    {
        Tr1.Visible = true;
        Tr3.Visible = true;
        Tr4.Visible = true;
        Tr6.Visible = true;
        Tr8.Visible = true;
    }

    protected void clientcheckedchanged21(object sender, EventArgs e)
    {
        Tr1.Visible = false;
        Tr3.Visible = false;
        Tr4.Visible = false;
        Tr6.Visible = false;
        Tr8.Visible = false;
    }

    protected void clientcheckedchanged22(object sender, EventArgs e)
    {
        Tr10.Visible = true;
        Tr11.Visible = true;
        Tr12.Visible = true;
        Tr13.Visible = true;
        Tr14.Visible = true;
    }

    protected void clientcheckedchanged23(object sender, EventArgs e)
    {
        Tr10.Visible = false;
        Tr11.Visible = false;
        Tr12.Visible = false;
        Tr13.Visible = false;
        Tr14.Visible = false;
    }

    protected void clientcheckedchanged24(object sender, EventArgs e)
    {
        Tr15.Visible = true;
        Tr16.Visible = true;
        Tr17.Visible = true;
    }

    protected void clientcheckedchanged25(object sender, EventArgs e)
    {
        Tr15.Visible = false;
        Tr16.Visible = false;
        Tr17.Visible = false;
    }

    protected void clientcheckedchanged26(object sender, EventArgs e)
    {
        Tr21.Visible = true;
        Tr22.Visible = true;
        Tr23.Visible = true;
        Tr7.Visible = true;
        Tr9.Visible = true;
    }

    protected void clientcheckedchanged27(object sender, EventArgs e)
    {
        Tr21.Visible = false;
        Tr22.Visible = false;
        Tr23.Visible = false;
        Tr7.Visible = false;
        Tr9.Visible = false;
    }

    protected void clientcheckedchanged28(object sender, EventArgs e)
    {
        Tr24.Visible = true;
        Tr25.Visible = true;
        Tr26.Visible = true;
        Tr27.Visible = true;
    }

    protected void clientcheckedchanged29(object sender, EventArgs e)
    {
        Tr24.Visible = false;
        Tr25.Visible = false;
        Tr26.Visible = false;
        Tr27.Visible = false;
      
    }
    protected void clientcheckedchanged30(object sender, EventArgs e)
    {
      
        Tr28.Visible = true;
        Tr29.Visible = true;
        Tr30.Visible = true;
        Tr31.Visible = true;
        Tr32.Visible = true;
    }
    protected void clientcheckedchanged31(object sender, EventArgs e)
    {
       
        Tr28.Visible = false;
        Tr29.Visible = false;
        Tr30.Visible = false;
        Tr31.Visible = false;
        Tr32.Visible = false;
    }
    protected void chk50_CheckedChanged(object sender, EventArgs e)
    {
       
        if (chk50.Checked == true)
        {
            chk52.Checked = true;
            chk53.Checked = true;
            chk55.Checked = true;
            chk57.Checked = true;
        }
        else
        {
            chk52.Checked = false;
            chk53.Checked = false;
            chk55.Checked = false;
            chk57.Checked = false;
        }
    }

    protected void chk52_CheckedChanged(object sender, EventArgs e)
    {
        if (chk52.Checked == false)
        {
            chk50.Checked = false;
        }
        else if ( chk52.Checked == true && chk53.Checked == true && chk55.Checked == true &&  chk57.Checked == true )
        {
            chk50.Checked = true;
        }
    }
    protected void chk53_CheckedChanged(object sender, EventArgs e)
    {
        if (chk53.Checked == false)
        {
            chk50.Checked = false;
        }
        else if (chk52.Checked == true && chk53.Checked == true &&  chk55.Checked == true &&  chk57.Checked == true )
        {
            chk50.Checked = true;
        }
    }

    protected void chk55_CheckedChanged(object sender, EventArgs e)
    {
        if (chk55.Checked == false)
        {
            chk50.Checked = false;
        }
        else if (chk52.Checked == true && chk53.Checked == true  && chk55.Checked == true && chk57.Checked == true )
        {
            chk50.Checked = true;
        }
    }

    protected void chk57_CheckedChanged(object sender, EventArgs e)
    {
        if (chk57.Checked == false)
        {
            chk50.Checked = false;
        }
        else if (chk52.Checked == true && chk53.Checked == true && chk55.Checked == true  && chk57.Checked == true )
        {
            chk50.Checked = true;
        }
    }

    protected void chk59_CheckedChanged(object sender, EventArgs e)
    {

        if (chk59.Checked == true)
        {
            chk60.Checked = true;
            chk61.Checked = true;
            chk62.Checked = true;
            chk63.Checked = true;
        }
        else
        {
            chk60.Checked = false;
            chk61.Checked = false;
            chk62.Checked = false;
            chk63.Checked = false;
        }
    }

    protected void chk60_CheckedChanged(object sender, EventArgs e)
    {
        if (chk60.Checked == false)
        {
            chk59.Checked = false;
        }
        else if (chk60.Checked == true && chk61.Checked == true && chk62.Checked == true && chk63.Checked == true )
        {
            chk59.Checked = true;
        }
    }
    protected void chk61_CheckedChanged(object sender, EventArgs e)
    {
        if (chk61.Checked == false)
        {
            chk59.Checked = false;
        }
        else if (chk60.Checked == true && chk61.Checked == true && chk62.Checked == true && chk63.Checked == true)
        {
            chk59.Checked = true;
        }
    }
    protected void chk62_CheckedChanged(object sender, EventArgs e)
    {
        if (chk62.Checked == false)
        {
            chk59.Checked = false;
        }
        else if (chk60.Checked == true && chk61.Checked == true && chk62.Checked == true && chk63.Checked == true)
        {
            chk59.Checked = true;
        }
    }
    protected void chk63_CheckedChanged(object sender, EventArgs e)
    {
        if (chk63.Checked == false)
        {
            chk59.Checked = false;
        }
        else if (chk60.Checked == true && chk61.Checked == true && chk62.Checked == true && chk63.Checked == true)
        {
            chk59.Checked = true;
        }
    }
    protected void chk64_CheckedChanged(object sender, EventArgs e)
    {
        if (chk64.Checked == true)
        {
            chk65.Checked = true;
            chk66.Checked = true;
        }
        else
        {
            chk65.Checked = false;
            chk66.Checked = false;
        }
    }
    protected void chk65_CheckedChanged(object sender, EventArgs e)
    {
        if (chk65.Checked == false)
        {
            chk64.Checked = false;
        }
        else if (chk65.Checked == true && chk66.Checked == true )
        {
            chk64.Checked = true;
        }
    }
    protected void chk66_CheckedChanged(object sender, EventArgs e)
    {
        if (chk66.Checked == false)
        {
            chk64.Checked = false;
        }
        else if (chk65.Checked == true && chk66.Checked == true )
        {
            chk64.Checked = true;
        }
    }


    protected void chk70_CheckedChanged(object sender, EventArgs e)
    {
        if (chk70.Checked == true)
        {
            chk71.Checked = true;
            chk72.Checked = true;
          
        }
        else
        {
            chk71.Checked = false;
            chk72.Checked = false;
           
        }
    }
    protected void chk71_CheckedChanged(object sender, EventArgs e)
    {
        if (chk71.Checked == false)
        {
            chk70.Checked = false;
        }
        else if (chk71.Checked == true && chk72.Checked == true)
        {
            chk70.Checked = true;
        }
    }
    protected void chk72_CheckedChanged(object sender, EventArgs e)
    {
        if (chk72.Checked == false)
        {
            chk70.Checked = false;
        }
        else if (chk71.Checked == true && chk72.Checked == true)
        {
            chk70.Checked = true;
        }
    }
    protected void chk73_CheckedChanged(object sender, EventArgs e)
    {
        if (chk73.Checked == true)
        {
            chk74.Checked = true;
            chk75.Checked = true;
            chk76.Checked = true;

        }
        else
        {
            chk74.Checked = false;
            chk75.Checked = false;
            chk76.Checked = false;

        }
    }
    protected void chk74_CheckedChanged(object sender, EventArgs e)
    {
        if (chk74.Checked == false)
        {
            chk73.Checked = false;
        }
        else if (chk74.Checked == true && chk75.Checked == true && chk76.Checked == true)
        {
            chk73.Checked = true;
        }
    }
    protected void chk75_CheckedChanged(object sender, EventArgs e)
    {
        if (chk75.Checked == false)
        {
            chk73.Checked = false;
        }
        else if (chk74.Checked == true && chk75.Checked == true && chk76.Checked == true)
        {
            chk73.Checked = true;
        }
    }
    protected void chk76_CheckedChanged(object sender, EventArgs e)
    {
        if (chk76.Checked == false)
        {
            chk73.Checked = false;
        }
        else if (chk74.Checked == true && chk75.Checked == true && chk76.Checked == true)
        {
            chk73.Checked = true;
        }
    }
    protected void chk77_CheckedChanged(object sender, EventArgs e)
    {
        if (chk77.Checked == true)
        {
            chk78.Checked = true;
            chk79.Checked = true;
            chk80.Checked = true;
            chk81.Checked = true;
        }
        else
        {
            chk78.Checked = false;
            chk79.Checked = false;
            chk80.Checked = false;
            chk81.Checked = false;
        }
    }
    protected void chk78_CheckedChanged(object sender, EventArgs e)
    {
        if (chk78.Checked == false)
        {
            chk77.Checked = false;
        }
        else if (chk78.Checked == true && chk79.Checked == true && chk80.Checked == true && chk80.Checked == true)
        {
            chk77.Checked = true;
        }
    }
    protected void chk79_CheckedChanged(object sender, EventArgs e)
    {
        if (chk79.Checked == false)
        {
            chk77.Checked = false;
        }
        else if (chk78.Checked == true && chk79.Checked == true && chk80.Checked == true && chk80.Checked == true)
        {
            chk77.Checked = true;
        }
    }
    protected void chk80_CheckedChanged(object sender, EventArgs e)
    {
        if (chk80.Checked == false)
        {
            chk77.Checked = false;
        }
        else if (chk78.Checked == true && chk79.Checked == true && chk80.Checked == true && chk80.Checked == true)
        {
            chk77.Checked = true;
        }
    }
    protected void chk81_CheckedChanged(object sender, EventArgs e)
    {
        if (chk81.Checked == false)
        {
            chk77.Checked = false;
        }
        else if (chk78.Checked == true && chk79.Checked == true && chk80.Checked == true && chk80.Checked == true)
        {
            chk77.Checked = true;
        }
    }

    protected void CheckBox11_CheckedChanged1(object sender, EventArgs e)
    {
        if (CheckBox11.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox15.Checked == true && CheckBox17.Checked == true && CheckBox11.Checked == true && CheckBox3.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }
    protected void CheckBox3_CheckedChanged1(object sender, EventArgs e)
    {
        if (CheckBox3.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox15.Checked == true && CheckBox17.Checked == true && CheckBox11.Checked == true && CheckBox3.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }
    protected void CheckBox12_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox12.Checked == false)
        {
            chk70.Checked = false;
        }
        else if (chk71.Checked == true && chk72.Checked == true && CheckBox12.Checked == true && CheckBox14.Checked == true)
        {
            chk70.Checked = true;
        }
    }
    protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox14.Checked == false)
        {
            chk70.Checked = false;
        }
        else if (chk71.Checked == true && chk72.Checked == true && CheckBox12.Checked == true && CheckBox14.Checked == true)
        {
            chk70.Checked = true;
        }
    }
}
