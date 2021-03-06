﻿<%@ WebHandler Language="C#" Class="FileCS" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



public class FileCS : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int id = int.Parse(context.Request.QueryString["id"]);
        byte[] bytes;
        string contentType;
        string strConnString = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        string name;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select SmsName, Data, Voicesmstype from VoiceSms where SmsNo=@Id";
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Connection = con;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                bytes = (byte[])sdr["Data"];
                contentType = sdr["Voicesmstype"].ToString();
                name = sdr["SmsName"].ToString();
                con.Close();
            }
        }
        context.Response.Clear();
        context.Response.Buffer = true;
        context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + name);
        context.Response.ContentType = contentType;
        context.Response.BinaryWrite(bytes);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}