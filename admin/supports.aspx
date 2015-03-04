<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supports.aspx.cs" Inherits="admin_supports" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Supports : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <br />
    <head:header ID="head1" runat="server" />
    <br />
    <table align="center">
                            <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>Supports List</strong></font>
                              </td>
                            </tr>
                            <tr><td></td></tr>
                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px">            
                       <asp:GridView ID="gvsupports" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                          <asp:BoundField DataField="iid" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Sid" ControlStyle-Width="10%"/>            
                    <asp:BoundField DataField="suject" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Subject" ControlStyle-Width="10%"/>            

                        <asp:BoundField DataField="phonenumber"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Phone Number"  ControlStyle-Width="30%" />
                        <asp:BoundField DataField="username"  ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="User Name" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="status"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="content"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Content" ControlStyle-Width="30%"/>
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
    </div>
    </form>
</body>
</html>
