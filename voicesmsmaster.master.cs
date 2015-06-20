using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class voicesmsmaster : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string path = Path.GetFileName(Request.PhysicalPath);

            switch (path)
            {
                case "Compose VoiceSMS.aspx": HyperLink3.CssClass = "active";
                    break;
                case "Text.aspx": HyperLink4.CssClass = "active";
                    break;
                case "Voicereports.aspx": hypreport.CssClass = "active";
                    break;
            }
        }
    }

}
