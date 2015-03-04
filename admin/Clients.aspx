<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clients.aspx.cs" Inherits="admin_Users" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Users : :</title>
       <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" language="javascript">
           function confirmMessageDelete(frm) {
               for (i = 0; i < frm.length; i++) {
                   if (frm.elements[i].checked) {
                       return confirm("Are you sure you want to delete the selected record?");
                       return true;
                   }
               }
               alert('select atleast one Checkbox for Delete!');
               return false;
           }
</script>
</head>
<body>
    <form id="form1" runat="server">
      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager> 
         <div align="center">
          <br />
            <head:header ID="head1" runat="server" />
            <br /><br /><br /><br />
             <table>
                            <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>Clients List  </strong></font></td>
                            </tr>
                            <tr><td></td></tr>
                           <%-- <tr>
                              <td align="right">
                                 <asp:Button ID="btncreat" runat="server" Text="Create Client" 
                                      onclick="btncreat_Click" />
                              </td>
                            </tr>--%>
                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px">            
                       <asp:GridView ID="gvusers" runat="server"   Width="1000px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                                ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                                ><%--onrowdatabound="RowDataBound"--%>
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Uid</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%# Eval("rid") %>'  /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Fast Name</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate>
                                  <asp:LinkButton ID="linkname" runat="server" Font-Underline="false" CommandArgument='<%#Eval("rid") %>' OnCommand="ListName" Text='<%# Eval("fname") %>'></asp:LinkButton>
                               
                                 
                                  </ItemTemplate>                     
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>EMail</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>PassWord</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpwd" runat="server" Text='<%# Eval("password") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>phno</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpno" runat="server" Text='<%# Eval("phno") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Register Date</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpdate" runat="server" Text='<%# Eval("pdate") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                         <asp:TemplateField>
                         <HeaderTemplate>Status</HeaderTemplate>
                         <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                         <ItemTemplate>
                             <asp:LinkButton ID="linkactive" runat="server" Font-Underline="false"  Text='<%# Eval("txtstatus") %>' CommandArgument='<%#Eval("rid") %>' OnCommand="ListName1"></asp:LinkButton></ItemTemplate>
                         <%--    <asp:LinkButton ID="linkdeactive" runat="server" Font-Underline="false" Visible="false" OnClick="Active">Deactive</asp:LinkButton></ItemTemplate>--%>
                         </asp:TemplateField>

                         <asp:TemplateField>
                         <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                         <ItemTemplate>
                             <asp:LinkButton ID="lnkdelete" runat="server" Font-Underline="false"  OnClick="Active1" OnClientClick="return confirm('are you sure you want to delete this')">Delete</asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                   </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
        
        </div>

        <input id="Hid_Sno" type="hidden" name="hddclick" runat="server" />
         <asp:ModalPopupExtender ID="ModalPopup1"  runat="server" TargetControlID="Hid_Sno" CancelControlID="btnimcan" ViewStateMode="Disabled" PopupControlID="panview" DropShadow="true" BackgroundCssClass="Modalpopup">
                                  </asp:ModalPopupExtender>
           <asp:Panel ID="panview" runat="server" HorizontalAlign="Center">
                                  <table width="200%" bgcolor="#33ccff" align="center">
                                  <tr><td align="right">
                                  <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
                                  </table>
                                  <table width="200%" bgcolor="white" align="center">
                                  <tr><td></td><td></td></tr>
                                  <tr><td id="Td1" runat="server" align="center" colspan="2"><br />
                                  <font size="4" color="#00277a"><strong><u>View User Details For ' <%# Eval("fname") %> '</u></strong></font>
                                  </td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>User Id:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtid" runat="server" ReadOnly="true"  Text='<%# Eval("rid") %>' /></td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>First Name:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtfname" runat="server"  Text='<%# Eval("fname") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Last Name:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtlname" runat="server"  Text='<%# Eval("lname") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Email Id:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtmail" runat="server"  Text='<%# Eval("email") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Pass Word:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtpwd" runat="server"  Text='<%# Eval("password") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Phone Number:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtphno" runat="server"  Text='<%# Eval("phno") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Company Url:</strong></td>
                                  <td align="left"><asp:TextBox ID="txturl" runat="server"  Text='<%# Eval("companyurl") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Register Date:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtpdate" runat="server"  Text='<%# Eval("pdate") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td colspan="2">
                                        <asp:Button ID="btnupdate" runat="server" Text="Update"  OnClick="btnupdate_click"/> </td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  </table>
                                  </asp:Panel>
    </form>
</body>
</html>
