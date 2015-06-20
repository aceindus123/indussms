<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Menu.aspx.cs" Inherits="admin_Admin_Menu" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Main Menu : : </title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div >
  
        <table border="0" width="50%" height="200px" align="center">
        <tr><td> <head:header ID="head1" runat="server" width="80%" /></td></tr>
        <tr><td><br /></td></tr>
        <tr><td align="center" style="width:100%"><table width="70%">
             <tr>
                <td align="center" ><asp:ImageButton ID="imgrc" 
                        ImageUrl="images/user.png"  runat="server" onclick="imgrc_Click" /></td>
                <td ></td>
                <td align="center" ><asp:ImageButton ID="imgservices" 
                        ImageUrl="images/voicesms.png" runat="server" onclick="imgservices_Click"   /></td>
                <td ></td>
                <td align="center" ><asp:ImageButton ID="imgsupport" 
                        ImageUrl="images/suport.png" runat="server" onclick="imgsupport_Click"/></td>
                <td ></td>
                <td align="center" ><asp:ImageButton ID="imgbtnpostjobs" 
                        ImageUrl="images/contact.png" runat="server" onclick="imgbtnpostjobs_Click" /></td>
            </tr>
            <tr>
                <td align="center">
                    <asp:LinkButton id="lnkusers" runat="server"  CssClass="datalp" Text="Clients" 
                        Font-Underline="false" onclick="lnkusers_Click" ></asp:LinkButton>
                </td>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:LinkButton id="lnkvoice" runat="server"  CssClass="datalp" 
                        Text="Voice SMS & Lists" Font-Underline="false" onclick="lnkvoice_Click"></asp:LinkButton>
                 </td>
                 <td>&nbsp;</td>
                  <td align="center">
                      <asp:LinkButton id="lnksupport" runat="server"  CssClass="datalp" 
                          Text="Support" Font-Underline="false" onclick="lnksupport_Click" ></asp:LinkButton>
                  </td>
                  <td>&nbsp;</td>
                  <td align="center">
                      <asp:LinkButton id="LinkButton1" runat="server"  CssClass="datalp" 
                          Text="Contact Us" Font-Underline="false" onclick="LinkButton1_Click"></asp:LinkButton>
                 </td> 
               </tr>
                      <tr>
                          <td colspan="5" height="60px">&nbsp;</td>
                    </tr>
                     <tr>
                        <td align="center"><asp:ImageButton ID="imgpermission" ImageUrl="images/missed.png" 
                                runat="server" onclick="imgpermission_Click"  /></td>    
                        <td>&nbsp;</td>
                        <td align="center"><asp:ImageButton ID="imgads" ImageUrl="images/offers.png"   
                                runat="server" onclick="imgads_Click" /></td>
                        <td>&nbsp;</td>
                        <td align="center"><asp:ImageButton ID="imgjobfairs" 
                                ImageUrl="images/featuredsms.png"  runat="server" onclick="imgjobfairs_Click" /></td>
                         <td>&nbsp;</td>
                        <td align="center"><asp:ImageButton ID="imgresume" ImageUrl="images/list.jpg"  
                                runat="server" onclick="imgresume_Click" /></td>
                         <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton id="lnkmissed" runat="server"  CssClass="datalp" 
                                Text="Missed Alerts" Font-Underline="false" onclick="lnkmissed_Click" ></asp:LinkButton>
                        </td>
                        <td>&nbsp;</td>
                        <td align="center">
                           <asp:LinkButton id="lnkoffers" runat="server"  CssClass="datalp" Text="Offers" 
                                Font-Underline="false" onclick="lnkoffers_Click" ></asp:LinkButton>
                        </td>
                        <td>&nbsp;</td>
                        <td align="center">
                              <asp:LinkButton id="lnkfeture" runat="server"  CssClass="datalp" 
                                  Text="Permissions" Font-Underline="false" onclick="lnkfeture_Click" ></asp:LinkButton>
                        </td>
                        <td>&nbsp;</td>
                        <td align="center">
                            <asp:LinkButton id="lnklist" runat="server"  CssClass="datalp" Text="Balance" 
                                Font-Underline="false" onclick="lnklist_Click" ></asp:LinkButton>
                        </td>
                          <td>&nbsp;</td>
                    </tr>
                    </table></td></tr>
                </table>
      </div>
    </form>
</body>
</html>
