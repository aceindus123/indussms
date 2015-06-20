using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;
using System.Text;
using System.Web.Script.Serialization;

public partial class Callback : System.Web.UI.Page
{
    private WebProxy objProxy1 = null;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlCommand sqlcmd = new SqlCommand();
    string _to, _from, _calluid, _event, _call_status, _start_time, end_time, _endreason;


    protected void Page_Load(object sender, EventArgs e)
    {
        _calluid = Request.QueryString["smscresponse[calluid]"];
        _event = Request.QueryString["smscresponse[event]"];
        _from = Request.QueryString["smscresponse[from]"];
        _to = Request.QueryString["smscresponse[to]"];
        _call_status = Request.QueryString["smscresponse[callstatus]"];
        _endreason = Request.QueryString["smscresponse[endreason]"];
        _start_time = Request.QueryString["smscresponse[starttime]"];
        end_time = Request.QueryString["smscresponse[endtime]"];
        Response.Write(_call_status);

        if (_call_status == "completed")
        {
            Response.Write("calling db start");
            SqlCommand SqlCmd = default(SqlCommand);
            string SqlQuery = "";
            SqlQuery = "update Voicereports set status='" + _call_status + "',starttime='"+_start_time+"',endtime='"+end_time+"',endreason='"+_endreason+"',from1='"+_from+"' where callid='" + _calluid + "' and Tonumber='" + _to + "'";
            SqlCmd = new SqlCommand(SqlQuery, con);
            con.Open();
            SqlCmd.ExecuteNonQuery();
            con.Close();
            Response.Write("calling db end");
        }
    }

  
}