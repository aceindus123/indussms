using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using ClosedXML.Excel;

public partial class DetailedVoiceReport : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {

        binddata();
    }

    protected void binddata()
    {
        string Uname = Convert.ToString(Session["User"]);


        string qry = "select a.username,a.tonumber,a.Voiceclip,a.senttime,a.status,a.from1,a.endreason, a.errorreason, b.amount,b.eid from  voicereports a inner join voiceexpences b  on   a.username=b.uname where a.code=b.code and a.username='" + Uname + "'";
        SqlDataAdapter da = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        else
        {
            string strScript = "alert('No Reports Found');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void grd_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        string Uname = Convert.ToString(Session["User"]);

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = (Label)e.Row.FindControl("LinkButton6");

            Label lblend = (Label)e.Row.FindControl("LinkButton7");

            var labelcharge = (Label)e.Row.FindControl("Label1");

            if ((lblstatus.Text == "completed") && (lblend.Text == "NORMAL_CLEARING"))
            {
                Label lblres = (Label)e.Row.FindControl("lbl3");

                lblres.Text = "Success";
            }
            else
            {
                Label lblres = (Label)e.Row.FindControl("lbl3");
                Label lbleid = (Label)e.Row.FindControl("lbl4");

                lblres.Text = "Failed";
                if (labelcharge.Text != "0")
                {
                    try
                    {
                        string qry1 = "select * from voicesmsexpenses where uname='" + Uname + "'";
                        SqlDataAdapter da1 = new SqlDataAdapter(qry1, sqlConnection);
                        DataSet ds1 = new DataSet();
                        da1.Fill(ds1);
                        string smsleft = ds1.Tables[0].Rows[0]["smsleft"].ToString();
                        string amountleft = ds1.Tables[0].Rows[0]["amountleft"].ToString();

                        int smsleft1 = Convert.ToInt32(smsleft) + 1;

                        string smsleft2 = Convert.ToString(smsleft1);

                        //int amountleft1 = Convert.ToInt32(amountleft) + Convert.ToInt32(labelcharge.Text);

                        Double amountleft1 = Convert.ToDouble(amountleft) + Convert.ToDouble(labelcharge.Text);

                        string amountleft2 = Convert.ToString(amountleft1);

                        string qry2 = "update voicesmsexpenses set smsleft='" + smsleft2 + "',amountleft='" + amountleft2 + "' where uname='" + Uname + "'";
                        SqlCommand cmd = new SqlCommand(qry2, sqlConnection);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        sqlConnection.Close();

                        string qry3 = " update voiceexpences set count=0,amount=0  where uname='" + Uname + "' and eid='" + lbleid.Text + "'";
                        SqlCommand cmd2 = new SqlCommand(qry3, sqlConnection);
                        sqlConnection.Open();
                        cmd2.ExecuteNonQuery();
                        sqlConnection.Close();
                        binddata();
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
        }
    }


    protected void img1_Click(object sender, ImageClickEventArgs e)
    {
        string Uname = Convert.ToString(Session["User"]);
    
        string y="VoiceReports.xlsx";
        string qry = " select a.username,a.tonumber,a.Voiceclip,a.senttime,a.status,a.from1,case when a.endreason='NORMAL_CLEARING' then 'Success' else 'Failed' end as Responce,a.endreason, a.errorreason, b.amount from  voicereports a inner join voiceexpences b  on   a.username=b.uname where a.code=b.code and a.username='" + Uname + "'";
        SqlDataAdapter da = new SqlDataAdapter(qry, sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count != 0)
        {
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                using (XLWorkbook wb = new XLWorkbook())
                {
                       
                    wb.Worksheets.Add(dt, "Customers");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=" +y );
                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                        //Response.Redirect("Reports.aspx");

                    }
                }
            }
        }




        //    string strExcelConn = "";
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.AddHeader("content-disposition", "attachment; filename=Mobilenumbers.xls");
        //    Response.ContentType = "application/ms-excel";
        //    string tab = string.Empty;

        //    DataTable dexp = new DataTable();
        //    //  ds1 = (DataSet)Session["values"];
        //    dexp = ds.Tables[0];
        //    foreach (DataColumn datacol in dexp.Columns)
        //    {
        //        Response.Write(tab + datacol.ColumnName);
        //        tab = "\t";
        //    }
        //    Response.Write("\n");
        //    foreach (DataRow dr in dexp.Rows)
        //    {
        //        tab = "";
        //        for (int j = 0; j < dexp.Columns.Count; j++)
        //        {
        //            Response.Write(tab + Convert.ToString(dr[j]));
        //            tab = "\t";
        //        }

        //        Response.Write("\n");
        //    }

        //    Response.End();
        //}
        else
        {
            string strScript = "alert('NO Reports Found');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }

        Response.Flush();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        binddata();
    }
}
