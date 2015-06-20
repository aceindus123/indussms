<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Missedcallalert.aspx.cs" Inherits="admin_Missedcallalert" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Missed Call Alerts : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
     <style type="text/css"> 
    .simple1 
    { 
      text-decoration:none;
    } 
    .simple1:hover 
    { 
     text-decoration:underline;
    } 
  </style>  

</head>


<body>
    <form id="form1" runat="server">
   
   <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

    <div align="center">
    <br />
    <head:header ID="head1" runat="server" />
    <br /> <br />

    <table>
           <tr>
              <td align="center" id="View" runat="server">
                      <font size="5" color="#00277a"><strong>Missed Call Alerts</strong></font> <br /> <br />
              </td>
           </tr>
           <tr><td></td></tr>
           <tr id="View1" runat="server">
               <td height="100px" style="padding-left:0px; padding-right:0px">            
                     <asp:GridView ID="gvmisscalls" runat="server"   Width="600px"  AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                        BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"
                        OnPageIndexChanging="PageIndexChanging" Font-Underline="False"   BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages" 
                        PagerStyle-BackColor="White"   PageSize="10" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                        EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" > <%--onrowdatabound="RowDataBound"--%>

                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                    <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                          <Columns>
                              <asp:TemplateField>
                                  <HeaderTemplate>Mid</HeaderTemplate>
                                    <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                    <ItemTemplate><asp:Label ID="lblmno" runat="server" Text='<%# Eval("mno") %>' /></ItemTemplate>
                              </asp:TemplateField>

                              <asp:TemplateField>
                                  <HeaderTemplate>Phone Number</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate>
                                  <asp:LinkButton ID="linknumber" runat="server" CssClass="simple1" Text='<%# Eval("number") %>' CommandArgument='<%#Eval("mno") %>' OnCommand="ListName"></asp:LinkButton>

                               
                                  </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate>Alert Time/Date</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpdate" runat="server" Text='<%# Eval("postdatedate") %>' /></ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField>
                                 <HeaderTemplate>Response</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate>
                                  <div style="overflow-y:auto;overflow-x:auto;word-break:break-all " > 
                                  <asp:Label ID="lblresponse" runat="server" Text='<%# Eval("response") %>' /></div></ItemTemplate>
                             </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>

                <input id="Hid_Sno" type="hidden" name="hddclick" runat="server" />
                    <asp:ModalPopupExtender ID="Popup1"  runat="server" TargetControlID="Hid_Sno" CancelControlID="btnimcan" 
                     PopupControlID="panview" DropShadow="true" BackgroundCssClass="Modalpopup"> </asp:ModalPopupExtender> 
                   <asp:Panel ID="panview" runat="server" HorizontalAlign="Center">
                                      <table width="110%" bgcolor="#33ccff" align="center">
                                          <tr>
                                            <td align="right">
                                                <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/>
                                            </td>
                                         </tr>
                                     </table>

                                      <table width="110%" bgcolor="white" align="center">
                                         <tr><td colspan="2"><br /></td></tr>
                                         <tr><td colspan="2"><br /></td></tr>
                                         <tr>
                                            <td align="right">
                                              <strong>Enter The User Response : </strong>
                                           </td>
                                            <td align="left">
                                            <asp:TextBox ID="txtresponse" runat="server" TextMode="MultiLine" Height="60px" CausesValidation="false"/>
                                            <asp:RequiredFieldValidator ID="reqres" runat="server" ErrorMessage="Please Enter The Response." ControlToValidate="txtresponse" ValidationGroup="missed"><span style="color:Red;">*</span></asp:RequiredFieldValidator>
                                           </td>
                                        </tr>
                                         <tr><td colspan="2"><br /></td></tr>
                                         <tr><td></td>
                                             <td align="left">
                                                <asp:Button ID="btnsave" Text="Save" runat="server" OnClick="btnsave_click" Height="35px" CausesValidation="false" Width="80px" ValidationGroup="missed"/>
                                                 <asp:ValidationSummary ID="validations" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="missed"/>
                                             </td>
                                         </tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  </table>
                                  </asp:Panel>
                              
    </div>
    </form>
</body>
</html>
