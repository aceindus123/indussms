<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permissions.aspx.cs" Inherits="admin_Permissions"  %>

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
    .simple1 
    { 
      text-decoration:none;
    } 
    .simple1:hover 
    { 
     text-decoration:underline;
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
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
         
 </asp:ToolkitScriptManager> 
    <div align="center">
    <br />
      <head:header ID="head1" runat="server" />
     <br />

   <br />
   
     
    
     <table>
           <tr>
              <td align="center" id="Td2" runat="server" >
                  <font size="5" color="green"><strong> Permission</strong></font>
              <br /><br /></td>
            </tr>
             <tr>
             <td align="center">
                 <asp:RadioButton ID="senderid" runat="server" Text="SenderId" Font-Size="18px" 
                AutoPostBack="true"  GroupName="rd1" Checked="true" oncheckedchanged="senderid_CheckedChanged"    
                />&nbsp;&nbsp; 
                 <asp:RadioButton ID="templates" runat="server" Font-Size="18px"
                Text="Templates" AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="templates_CheckedChanged"   
                />
            </td>
        </tr>
        </table>

         <table align="center" id="tb1" runat="server">
                            <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>SenderID Lists</strong></font>
                        
                        
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
                            <asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="SenderID" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>                
                            <asp:LinkButton ID="linkname" runat="server" CssClass="simple1" CommandArgument='<%#Eval("sid") %>' OnCommand="ListName" Text='<%# Eval("sendername") %>'></asp:LinkButton>
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
                                   <asp:LinkButton ID="linkactive" runat="server"  CssClass="simple1"  Text='<%# Eval("status") %>' CommandArgument='<%#Eval("sid") %>' OnCommand="ListName1"></asp:LinkButton></ItemTemplate>
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
                    <EmptyDataTemplate>No Template Requests</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>


                 <table align="center" runat="server" id="rdtemplates">
                <tr><td align="center" id="Td3" runat="server">
                                <font size="5" color="#00277a"><strong>Template List</strong></font>
                              </td>
                            </tr>
                            <tr><td></td></tr>
                          
                            <tr id="Viewtemp" runat="server"><td style="padding-left:0px; padding-right:0px">            
                       <asp:GridView ID="gvtemplates" runat="server"   Width="900px" RowStyle-Height="50px"   
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="5" 
                               ShowHeaderWhenEmpty="true" GridLines="Both"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red"  
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                                  
                                 DataKeyNames="tid" onrowdeleting="gvtemplates_RowDeleting" 
                                    onpageindexchanging="gvtemplates_PageIndexChanging" >
                               
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                     <Columns>
                        <asp:TemplateField  HeaderText="Slno" ItemStyle-ForeColor="black" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" ItemStyle-Font-Size="Medium">
                        <ItemTemplate>
                            <asp:Label ID="lbl" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="UserName" ItemStyle-ForeColor="black" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" ItemStyle-Font-Size="Medium">
                        <ItemTemplate>                
                           <asp:Label ID="lbluser" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                         <asp:TemplateField  HeaderText="Date" ItemStyle-ForeColor="black" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" ItemStyle-Font-Size="Medium">
                        <ItemTemplate>
                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("tdate") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                         <asp:TemplateField  HeaderText="Template Name" ItemStyle-ForeColor="black" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" ItemStyle-Font-Size="Medium" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" Text='<%#Eval("tname") %>' CommandArgument='<%#Eval("tid") %>' OnCommand="template" CssClass="simple1" Font-Size="Medium" ></asp:LinkButton>
                          <%--  <asp:Label ID="lblname" runat="server" Text='<%#Eval("tname") %>'></asp:Label>--%>
                        </ItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" ItemStyle-ForeColor="black" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" ItemStyle-Font-Size="Medium" ItemStyle-Width="45%" >
                        <ItemTemplate  >
                        <div style="overflow-y:auto;overflow-x:auto;word-break:break-all " >
                                  <asp:Label ID="lbldesc" runat="server" Text='<%#Eval("tdiscription")%>'  ></asp:Label></div></ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="Downloadfile" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkdwnld" runat="server" Font-Underline="false" OnClick="downloadimg"  CommandArgument='<%#Eval("imagepath") %>' Text="Documents Download"></asp:LinkButton>
                        </ItemTemplate>
                        
                        </asp:TemplateField>--%>
                              <asp:TemplateField HeaderText="Status" ItemStyle-ForeColor="black" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" ItemStyle-Font-Size="Medium" ItemStyle-Width="15%">
                        <ItemTemplate>
                                   <asp:LinkButton ID="linktemp" runat="server" CssClass="simple1"  Text='<%# Eval("status") %>' CommandArgument='<%#Eval("tid") %>' OnCommand="status"></asp:LinkButton></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Button ID="delete" runat="server" Text="Delete" Height="25px" Width="80px" CommandName="Delete" OnClientClick="return confirm('are you sure you want to delete this')"/>
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

           <asp:Panel ID="panview" runat="server" HorizontalAlign="Justify" Height="100px" >
                <table width="120%" bgcolor="#33ccff" align="center" height="100px"  style="border:Solid 3px #5D7B9D;>
                   <tr valign="top">
                       <td id="Td1" runat="server" align="center" colspan="2"><br />
                            <b> Sender Id Details <%-- <asp:Label ID="Label1" runat="server"  Text='<%# Eval("sendername") %>'></asp:Label>--%></b><br /><br />
                                  </td>
                        <td align="right" valign="top">
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
                           <asp:LinkButton ID="lnkdwnld1" runat="server"  Width="150px" CommandArgument='<%#Eval("imagename") %>' Font-Underline="false" ForeColor="Black" Font-Size="Medium"  Text='<%#Eval("imagename") %>' OnClick="downloadimg" Font-Bold="true" CssClass="simple"   ></asp:LinkButton>
                                <%--<asp:Image ID="Image2" runat="server" Width="200px" Height="200px" ImageUrl='<%#"~/Documents/" + Eval("imagename")%>'  CssClass="mouse" BorderColor="Silver" BorderStyle="Solid"  />--%>
                                <asp:Button ID="companydocument" runat="server" Text="Forward Company Document" OnClick="LinkButton1_Click" />
                                

                       </td>
                        
                   </tr>
                   <tr><td></td><td></td></tr>
                   <tr height="50px" >
                      <td align="right"><strong>Download DND Document:</strong>
                      </td>
                      <td align="center" >
                      <asp:LinkButton ID="lnkdwnld2" runat="server" CssClass="simple"  Width="150px" CommandArgument='<%#Eval("dnddocname") %>' Font-Underline="false" ForeColor="Black" Font-Size="Medium"  Text='<%#Eval("dnddocname") %>' OnClick="downloaddoc" Font-Bold="true" ></asp:LinkButton>
                      
                      <asp:Button ID="dnddoc" runat="server" Text="Forward DND Document" OnClick="link2" /></td>
                   </tr>
                   <tr><td></td><td></td></tr>
                   <tr><td colspan="2"></td>
                        <td>
                         <%-- <asp:Button ID="LinkButton1" runat="server"  Text="Forward" 
                                          onclick="LinkButton1_Click" />--%>
                                  </td></tr>
                                  </table>
         </asp:Panel>
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
        
         

         <div id="temp" runat="server">
         <input id="Hidden1" type="hidden" name="hdn" runat="server" />
         <asp:ModalPopupExtender ID="mp1"  runat="server" TargetControlID="Hidden1"   CancelControlID="Button1"
          ViewStateMode="Disabled" PopupControlID="Panel1" DropShadow="true" BackgroundCssClass="Modalpopup"></asp:ModalPopupExtender>

          <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Justify" Height="100px" >
                <table width="130%" bgcolor="#33ccff" align="center" height="100px"  style="border:Solid 3px #5D7B9D;>
                   <tr valign="top">
                       <td id="Td4" runat="server" align="center" colspan="2"><br />
                            <b>Requested Template  <%-- <asp:Label ID="Label1" runat="server"  Text='<%# Eval("sendername") %>'></asp:Label>--%></b><br /><br />
                                  </td>
                        <td align="right" valign="top">
                           <asp:Button ID="Button1" runat="server"  Text="X" width="25" height="21"/>
                        </td>
                    </tr>
                    <tr> 
                       <td align="right"><strong>Template Name:</strong>
                       </td>
                       <td align="center"><asp:Label ID="Label1" runat="server"  Text='<%# Eval("tname") %>' Font-Bold="true" /></td>
                   </tr>
                    <tr>
                       <td colspan="2">
                           
                        </td>
                    </tr>
                    <tr height="70px">
                       <td align="right"><strong>Message:</strong>
                       </td>
                       <td align="center">
                       <div style="overflow-y:auto;overflow-x:auto;word-break:break-all "  >
                           <asp:label ID="LinkButton1" runat="server"  Width="350px" text='<%#Eval("tdiscription") %>'  ForeColor="Black" Font-Size="Medium"      ></asp:label></div>
                           
                                <%--<asp:Image ID="Image2" runat="server" Width="200px" Height="200px" ImageUrl='<%#"~/Documents/" + Eval("imagename")%>'  CssClass="mouse" BorderColor="Silver" BorderStyle="Solid"  />--%>
                               
                               

                       </td>
                        
                   </tr>
                   <tr><td></td><td align="center"> <asp:Button ID="Button2" runat="server" Text="Forward" OnClick="btn"  /> </td></tr>
                   <tr><td></td><td></td></tr>
                  <%-- <tr height="50px" >
                      <td align="right"><strong>Download DND Document:</strong>
                      </td>
                      <td align="center" >
                      <asp:LinkButton ID="LinkButton2" runat="server" CssClass="simple"  Width="150px" CommandArgument='<%#Eval("dnddocname") %>' Font-Underline="false" ForeColor="Black" Font-Size="Medium"  Text='<%#Eval("dnddocname") %>' OnClick="downloaddoc" Font-Bold="true" ></asp:LinkButton>
                      
                      <asp:Button ID="Button3" runat="server" Text="Forward DND Document" OnClick="link2" /></td>
                   </tr>--%>
                   <tr><td></td><td></td></tr>
                   <tr><td colspan="2"></td>
                        <td>
                         <%-- <asp:Button ID="LinkButton1" runat="server"  Text="Forward" 
                                          onclick="LinkButton1_Click" />--%>
                                  </td></tr>
                                  </table>
         </asp:Panel></div>
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         
         
               
    </form>
</body>
</html>
