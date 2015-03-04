<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Balance.aspx.cs" Inherits="admin_Balance" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Balance : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <br />
    <head:header ID="head1" runat="server" />
    <br />
     <br /><br /><br /><br />
        <table>
           <tr>
              <td align="center" id="View" runat="server" >
                  <font size="5" color="green"><strong> Balance Sheet</strong></font>
              <br /><br /></td>
            </tr>
            <tr><td>
                <table>
                <tr><td><font size="3"><strong>Enter UserName : </strong></font></td>    
                <td style="padding-left:60px;"><asp:TextBox ID="txtuname" runat="server" Width="180px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="req" runat="server" ErrorMessage="Please Enter The UserName." ControlToValidate="txtuname" ValidationGroup="bal"><span style="color:Red;">*</span></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td><br /><font size="3"><strong>Enter Amount : </strong></font></td>
                <td style="padding-left:60px;"><br /><asp:TextBox ID="txtamount" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="req1" runat="server" ErrorMessage="Please Enter The Amount." ControlToValidate="txtamount" ValidationGroup="bal"><span style="color:Red;">*</span></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td valign="top"><br /><font size="3"><strong>Select SMS Type : </strong></font></td>
                <td style="padding-left:60px;"><br /><asp:DropDownList ID="dropsmstype" runat="server" Width="181px">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Text SMS</asp:ListItem>
                <asp:ListItem>Voice SMS</asp:ListItem>
                </asp:DropDownList></td>
                </tr>
                <tr>
                <td colspan="2" style="padding-left:130px;"><br /><asp:Button ID="btnaccept" 
                        runat="server" Text="Accept" Height="30px" Width="80px" 
                        onclick="btnaccept_Click" ValidationGroup="bal"/>
                        <asp:ValidationSummary ID="validation" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="bal"/></td>
                </tr>
                </table>
            </td></tr>
            </table>
    </div>
    </form>
</body>
</html>
