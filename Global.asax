<%@ Application Language="C#" %>

<script runat="server">

    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string Date;
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
        sessionclose();
        Session.Clear();
        
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        sessionclose();
        Session.Clear();
    }
    
    protected void sessionclose()
    {
        if ((Session["User"].ToString() == null) && (Session["User"].ToString() == ""))
        {

        }

        else if ((Session["date"].ToString() == null) && (Session["date"].ToString() == ""))
        {

        }

        else if ((Session["ip"].ToString() == null) && (Session["ip"].ToString() == ""))
        {

        }

        else
        {
            string user = Session["User"].ToString();
            string date = System.DateTime.Now.ToString();
            string ip = Session["ip"].ToString();
            string date1 = Session["date"].ToString();

            con.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("update Loginreport set Status=0,Logoutdate='" + date + "' where Uname='" + user + "' and IpAddress='" + ip + "' and Status=2", con);
            int s = cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("SMSLogin.aspx");
        }
    }
       
</script>
