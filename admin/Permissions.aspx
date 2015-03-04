<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permissions.aspx.cs" Inherits="admin_Permissions" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Permissions : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />

    <style type="text/css"> 
    .simple 
    { 
      background-color:#33ccff; 
      color:#fff; 
    } 
    .simple:hover 
    { 
      background-color:#fff; 
      color:Blue; 
    } 
  </style> 

    <style type="text/css">
    .mouse
    {
     height:300px;
     width:300px;   
    }
    
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <br />
     <head:header ID="head1" runat="server" />
     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager> 
     <br />
     <br />
     <br />
     <br />
     <br />
         <table align="center">
                            <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>Permission List</strong></font>
                        
                        
                              </td>
                              </tr>
                              <tr><td></td></tr>
                        <tr id="View1" runat="server"><td style="padding-left:0px; padding-right:0px">            
                       <asp:GridView ID="gvpermission" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                                onpageindexchanging="gvpermission_PageIndexChanging"  
                                 DataKeyNames="sid" onrowdeleting="gvpermission_RowDeleting"
                                ><%--onrowdatabound="gvpermission_RowDataBound"--%>
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                     <Columns>
                        <asp:TemplateField  HeaderText="Sid" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("sid") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="SenderID" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>                
                            <asp:LinkButton ID="linkname" runat="server" Font-Underline="false" CommandArgument='<%#Eval("sid") %>' OnCommand="ListName" Text='<%# Eval("sendername") %>'></asp:LinkButton>
                        </ItemTemplate></asp:TemplateField>
                         <asp:TemplateField  HeaderText="Date" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("postdate") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                         <asp:TemplateField  HeaderText="Username" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Label ID="lbl3" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                                   <asp:LinkButton ID="linkactive" runat="server" Font-Underline="false"  Text='<%# Eval("status") %>' CommandArgument='<%#Eval("sid") %>' OnCommand="ListName1"></asp:LinkButton></ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="Downloadfile" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkdwnld" runat="server" Font-Underline="false" OnClick="downloadimg"  CommandArgument='<%#Eval("imagepath") %>' Text="Documents Download"></asp:LinkButton>
                        </ItemTemplate>
                        
                        </asp:TemplateField>--%>
                        <asp:TemplateField ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Button ID="btndelete" runat="server" Text="Delete" Height="25px" Width="80px" CommandName="Delete" OnClientClick="return confirm('are you sure you want to delete this')"/>
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
    </div>

         <input id="Hid_Sno" type="hidden" name="hddclick" runat="server" />
         <asp:ModalPopupExtender ID="ModalPopup1"  runat="server" TargetControlID="Hid_Sno"   CancelControlID="btnimcan"
          ViewStateMode="Disabled" PopupControlID="panview" DropShadow="true" BackgroundCssClass="Modalpopup"></asp:ModalPopupExtender>

           <asp:Panel ID="panview" runat="server" HorizontalAlign="Center" Height="100px" >
                <table width="150%" bgcolor="#33ccff" align="center" height="100px">
                   <tr valign="top">
                       <td id="Td1" runat="server" align="center" colspan="2"><br />
                            <b> Sender Id Details <%-- <asp:Label ID="Label1" runat="server"  Text='<%# Eval("sendername") %>'></asp:Label>--%></b><br /><br />
                                  </td>
                        <td align="right">
                           <asp:Button ID="btnimcan" runat="server"  Text="X" width="25" height="21"/>
                        </td>
                    </tr>
                    <tr> 
                       <td align="right"><strong>Sender id Name:</strong>
                       </td>
                       <td align="left"><asp:Label ID="txtfname" runat="server"  Text='<%# Eval("sendername") %>' /></td>
                   </tr>
                    <tr>
                       <td colspan="2">
                           
                        </td>
                    </tr>
                    <tr height="50px">
                       <td align="right"><strong>Company Document Download:</strong>
                       </td>
                       <td align="center">
                           <asp:LinkButton ID="lnkdwnld1" runat="server"  Width="150px" CommandArgument='<%#Eval("imagename") %>' Font-Underline="false" ForeColor="Black" Font-Size="Medium"  Text='<%#Eval("imagename") %>' OnClick="downloadimg" Font-Bold="true" CssClass="simple" ></asp:LinkButton>
                                <%--<asp:Image ID="Image2" runat="server" Width="200px" Height="200px" ImageUrl='<%#"~/Documents/" + Eval("imagename")%>'  CssClass="mouse" BorderColor="Silver" BorderStyle="Solid"  />--%>
                                  <asp:LinkButton ID="lnk1555" runat="server" Visible="false"></asp:LinkButton>   
                       </td>
                   </tr>
                   <tr><td></td><td></td></tr>
                   <tr >
                      <td align="right"><strong>Download DND Document:</strong>
                      </td>
                      <td align="center">
                      <asp:LinkButton ID="lnkdwnld2" runat="server" CssClass="simple"  Width="150px" CommandArgument='<%#Eval("dnddocname") %>' Font-Underline="false" ForeColor="Black" Font-Size="Medium"  Text='<%#Eval("dnddocname") %>' OnClick="downloaddoc" Font-Bold="true" ></asp:LinkButton>
                      
                      </td>
                   </tr>
                   <tr><td></td><td></td></tr>
                   <tr><td colspan="2"></td>
                        <td>
                          <asp:Button ID="LinkButton1" runat="server"  Text="Forward" 
                                          onclick="LinkButton1_Click" />
                                  </td></tr>
                                  </table>
         </asp:Panel>          
    </form>
</body>
</html>
