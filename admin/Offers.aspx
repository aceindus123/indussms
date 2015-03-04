<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Offers.aspx.cs" Inherits="admin_Offers" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Offers : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <br />
        <head:header ID="head1" runat="server"/>
        <br /> <br /> <br /> <br />
        <table align="center">
        <tr><td colspan="2"><br /></td></tr>
        <tr><td align="center" id="View" runat="server" colspan="2">
        <font size="5" color="green"><strong><u>User Messages Offers</u></strong></font>
        </td></tr><tr><td colspan="2"><br /></td></tr>
        <tr><td align="right">Enter Subject : </td>
        <td align="left"><asp:TextBox ID="txtsubject" runat="server" Width="220px" />
        <asp:RequiredFieldValidator ID="reqsub" runat="server" ErrorMessage="Please Enter The Subject." ControlToValidate="txtsubject" ValidationGroup="offers"><span style="color:Red;">*</span></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr><td align="right"> Enter Message : </td>
        <td align="left"><asp:TextBox ID="txtmessage" runat="server" TextMode="MultiLine" Height="70px" Width="220px"/>
        <asp:RequiredFieldValidator ID="reqmess" runat="server" ErrorMessage="Please Enter The Message." ControlToValidate="txtmessage" ValidationGroup="offers"><span style="color:Red;">*</span></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr><td colspan="2" align="center"><asp:Button ID="btnsend" Text="Send" ValidationGroup="offers"
        runat="server" Height="30px" Width="70px" onclick="btnsend_Click"/>
            <asp:ValidationSummary ID="validation" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="offers"/>
        </td></tr>
        </table>
        <table>
        <tr><td><br /></td></tr>
        <tr><td align="center" id="Td1" runat="server">
        <font size="5" color="Green"><strong><u>List For Messages Offers</u></strong></font>
        </td></tr>
        <tr><td><br />
        <asp:GridView ID="gvoffers" runat="server"   Width="800px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                                ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                                >
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Oid</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%# Eval("nid") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Subject</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblsub" runat="server" Text='<%# Eval("subject") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Messages</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblmess" runat="server" Text='<%# Eval("message") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Date/Time</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lbldate" runat="server" Text='<%# Eval("postdate") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Status</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate>
                                  <asp:LinkButton ID="linkactive" runat="server" Font-Underline="false" OnClick="Active" Text='<%#Eval("txtstatus") %>'></asp:LinkButton>
                                  <%--<asp:LinkButton ID="linkdeactive" runat="server" Font-Underline="false" Visible="false" OnClick="Active">Deactive</asp:LinkButton>--%></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Delete</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Button ID="btndelete" runat="server" Text="Delete"  Height="30px" 
                                  Width="70px" OnClick="Delete" OnClientClick="return confirm('are you sure you want to delete this')"/></ItemTemplate>
                                  </asp:TemplateField>
                   </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
        </td></tr></table>
    </div>
    </form>
</body>
</html>
