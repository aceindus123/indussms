using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class UserControl_accountmenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
  

        if (!IsPostBack)
        {
            //string path = HttpContext.Current.Request.Url.AbsolutePath;
            string path = Path.GetFileName(Request.PhysicalPath);

            switch (path)
            {
                case "AccountInfo.aspx": profile.Attributes.Add("class", "selected");
                    break;
                case "ContactBook.aspx": address_book.Attributes.Add("class", "selected");
                    break;
                case "Balance.aspx": balance.Attributes.Add("class", "selected");
                    break;
                case "ShoppingCart.aspx": shopping_cart.Attributes.Add("class", "selected");
                    break;
                case "Notifications.aspx": notifications.Attributes.Add("class", "selected");
                    break;
                case "Help.aspx": notifications.Attributes.Add("class", "selected");
                    break;
               
            }
        }
    }
}