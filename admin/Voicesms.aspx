﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Voicesms.aspx.cs" Inherits="admin_Voicesms" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : VoiceSMS : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div align="center">
    <br />
     <head:header ID="head1" runat="server" />
     <br /> <br /> <br /> <br />

     <br />
     <br />
             <table>
                        <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>Voice SMS & Lists                      </td>
                            </tr>

                               <tr>
               <td align="center">
                 <asp:RadioButton ID="rdhelp1" runat="server" Text="Voice SMS" Font-Size="18px" 
                AutoPostBack="true"  GroupName="rd1" Checked="true" oncheckedchanged="rdhelp1_CheckedChanged"   
                />&nbsp;&nbsp; 
                 <asp:RadioButton ID="rdexception" runat="server" Font-Size="18px"
                Text="Lists" AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="rdexception_CheckedChanged"  
                />
            </td>
             </tr>


                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px"><br />          
                       <asp:GridView ID="gvvoice" runat="server"   Width="400px" ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium"
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   
                                PageSize="10" onrowdatabound="RowDataBound" 
                                >
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                    <Columns>
                    <asp:TemplateField>
                    <HeaderTemplate>Username</HeaderTemplate>      
                    <ItemStyle HorizontalAlign="Center"/>        
                    <ItemTemplate><asp:Label ID="lbluname" runat="server" Text='<%# Eval("Username") %>' /></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>SMS Records</HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"/> 
                    <ItemTemplate>
                        <asp:LinkButton ID="linkview" runat="server" OnCommand="pandetails" CommandArgument='<%#Eval("Username") %>'>View SMS</asp:LinkButton>
                       
                        </ItemTemplate>                        
                    </asp:TemplateField>
                   </Columns>
                   <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
     </div>
         <input id="Hid_Sno" type="hidden" name="hddclick" runat="server" />
         <asp:ModalPopupExtender ID="ModalPopupExtender1"  runat="server" TargetControlID="Hid_Sno" CancelControlID="btnimcan" ViewStateMode="Disabled" PopupControlID="panview" DropShadow="true" BackgroundCssClass="Modalpopup" >
    </asp:ModalPopupExtender>
         <asp:Panel ID="panview" runat="server" HorizontalAlign="Center">
                         <table width="110%" bgcolor="#33ccff" align="center">
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="110%" bgcolor="white">
             <tr><td></td></tr>
             <tr>
             <td align="center" id="Td1" runat="server"><br />
                 <font size="4" color="#00277a"><strong><u>Voice SMS Lists</u></strong></font>
                 </td>
                 <tr><td><br />
                 <asp:GridView ID="gvview" runat="server" AutoGenerateColumns="false" Width="700px" HorizontalAlign="Center" AllowPaging="true" PageSize="5" OnPageIndexChanging="gvview_PageIndexChanging">
                      <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="32px" BackColor="#999999" Font-Size="14px" Font-Names="Arial" /> 
                  <PagerStyle Font-Bold="True" HorizontalAlign="Center"  ForeColor="#003399" Height="25px" BackColor="#999999" Font-Size="14px" Font-Names="Arial" /> 
                 <Columns>
                 <asp:TemplateField>
                 <HeaderTemplate>SMS No</HeaderTemplate>
                 <ItemStyle HorizontalAlign="Center"/>
                 <ItemTemplate>
                 <asp:Label ID="smsno" Text='<%# Eval("SmsNo") %>' runat="server" />
                 </ItemTemplate>
                 </asp:TemplateField>  
                 <asp:TemplateField>
                 <HeaderTemplate>SMS Name</HeaderTemplate>
                 <ItemStyle HorizontalAlign="Center"/>
                 <ItemTemplate>
                 <asp:Label ID="lblsname" runat="server" Text='<%# Eval("SmsName") %>' />
                 </ItemTemplate>
                 </asp:TemplateField> 
                 <asp:TemplateField>
                 <HeaderTemplate>SMS Type</HeaderTemplate>
                 <ItemStyle HorizontalAlign="Center"/>
                 <ItemTemplate><asp:Label ID="lbltype" runat="server" Text='<%# Eval("Voicesmstype") %>' /></ItemTemplate>
                 </asp:TemplateField>                           
                 </Columns>
                 </asp:GridView><br /><br /><br />
             </td></tr>
             </table>
                </asp:Panel>
               
    </form>
</body>
</html>
