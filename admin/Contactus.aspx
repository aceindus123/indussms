<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="admin_Contactus" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Contact Us : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div align="center">
           <br />
            <head:header ID="head1" runat="server" />
            <br />
               <br /> 
              
             <table>
                            <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>Contact Us List</strong></font>
                              </td>
                            </tr>
                            <tr><td></td></tr>
                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px">            
                       <asp:GridView ID="gvcontact" runat="server"   Width="800px"  
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
                                  <asp:TemplateField HeaderText="SlNo">
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Gray"></asp:Label>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                       <%-- <asp:BoundField DataField="cid" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Cid"    />            --%>
                        <asp:BoundField DataField="fname" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Contact Name"    />            
                        <asp:BoundField DataField="email"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="EMail" SortExpression="FName" />
                        <asp:BoundField DataField="address"  ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Contact Address" />
                        <asp:BoundField DataField="city"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Contact City"/>
                        <asp:BoundField DataField="phonemumber"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Phone Number"/>
                        <asp:BoundField DataField="comments"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Comments"/>
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
        
        </div>
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
