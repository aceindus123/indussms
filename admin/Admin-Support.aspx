<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Support.aspx.cs" Inherits="admin_Admin_Support" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin Support : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style>
    .modalBackground
        {  
        	background-color: Black;  
        	filter: alpha(opacity=50);  
        	opacity: 0.50;
        }
        .exceLable
        {
         color:#005072;
         font-size:14px;
         font-family:Arial; 
         font-weight:bold; 
        }
    </style>
    <style type="text/css">
        .lnk
        {
          text-decoration:none;
        }
        .lnk:hover
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
    <br />
     <br />
        <table>
           <tr>
              <td align="center" id="View" runat="server" >
                  <font size="5" color="green"><strong> Support</strong></font>
              <br /><br /></td>
            </tr>
             <tr>
             <td align="center">
                 <asp:RadioButton ID="rdhelp1" runat="server" Text="Help" Font-Size="18px" 
                AutoPostBack="true"  GroupName="rd1" Checked="true" oncheckedchanged="rdhelp1_CheckedChanged"   
                />&nbsp;&nbsp; 
                 <asp:RadioButton ID="rdexception" runat="server" Font-Size="18px"
                Text="Exceptions" AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="rdexception_CheckedChanged"  
                />
            </td>
        </tr>
        </table>
        <table align="center" runat="server" id="rdhelp" >
                            <tr><td align="center" id="Td1" runat="server">
                                <font size="5" color="#00277a"><strong>Help List</strong></font>
                              </td>
                            </tr>
                            <tr><td></td></tr>
                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px">            
                       <asp:GridView ID="gvsupports" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                                 OnPageIndexChanging="PageIndexChanging" 
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" 
             EmptyDataRowStyle-Font-Size="Medium" >
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                  <asp:TemplateField HeaderText="SlNo." ItemStyle-HorizontalAlign="Center">
                                  <ItemTemplate>
                                   <asp:Label id="lb" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Gray"></asp:Label></ItemTemplate>
                                  </asp:TemplateField>
                                     
                          <%--<asp:BoundField DataField="iid" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Sid" ControlStyle-Width="10%"/>            --%>
                    <asp:BoundField DataField="suject" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Subject" ControlStyle-Width="15%" />            

                        <asp:BoundField DataField="phonenumber"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Phone Number"  ControlStyle-Width="30%" />
                        <asp:BoundField DataField="username"  ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="User Name" ControlStyle-Width="15%"/>
                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" >
                        <ItemTemplate>
                        <asp:LinkButton ID="lnkackactive" runat="server" Text='<%#Eval("status") %>' CommandArgument='<%#Eval("iid") %>' OnCommand="status"  CssClass="lnk" ></asp:LinkButton>
                        </ItemTemplate>
                        
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="status"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" ControlStyle-Width="10%"/>--%>
                        <asp:BoundField DataField="content"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" HeaderText="Content"  ItemStyle-Width="15%" HtmlEncode="false"/>
                        <asp:TemplateField ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center"  HeaderText="Reply" ItemStyle-Width="20%">
                        <ItemTemplate>
                        <div style="overflow-y:auto;overflow-x:auto;word-break:break-all ">
                            <asp:Label ID="lblreply" runat="server" Text='<%#Eval("replay") %>' Width="200px"></asp:Label>
                        <%--<asp:BoundField DataField="replay" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Replay" ControlStyle-Width="30%" />--%></div></ItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Responce" ItemStyle-HorizontalAlign="Center" ><ItemTemplate > <asp:LinkButton ID="linknumber" runat="server" Text="Replay" CssClass="lnk" 
                                  CommandArgument='<%#Eval("iid") %>' OnCommand="ListName"></asp:LinkButton>

                        </ItemTemplate></asp:TemplateField>
                        <asp:TemplateField >
                        <ItemTemplate>
                        <asp:ImageButton ID="imgdel" runat="server" ImageUrl="~/admin/images/delete_1.png" 
                         OnCommand="deleterecord" CommandArgument='<%# Eval("iid") %>' OnClientClick="return confirm('are you sure you want to delete this')" />
                        </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <EmptyDataTemplate>No Records.</EmptyDataTemplate>--%>
                    </Columns>                    
                </asp:GridView>
                </td></tr>
                
               
                </table>
                <table align="center" runat="server" id="rdexcep">
                <tr><td align="center" id="Td2" runat="server">
                                <font size="5" color="#00277a"><strong>Exception List</strong></font>
                              </td>
                            </tr>
                            <tr id="View2" runat="server"><td>
                            <asp:GridView ID="gvException" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                                    onpageindexchanging="gvException_PageIndexChanging" BackColor="White" 
                                    BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                    GridLines="Horizontal" Width="900px" DataKeyNames="Eid" 
                                    onrowdatabound="gvException_RowDataBound" > 
                               <Columns>
                               <asp:TemplateField HeaderText="SlNo">
                               <ItemTemplate>
                                   <asp:Label ID="Label4" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>
                              <asp:BoundField DataField="Excep_desc" HeaderText="Error Message" /> 
                              <asp:BoundField DataField="Excep_Postdate" HeaderText="Date" /> 
                              <asp:BoundField DataField="Excep_page" HeaderText="Page" />
                              <asp:BoundField DataField="Linenumber" HeaderText="Line Number" />
                              <asp:TemplateField HeaderText="Status">
                              <ItemTemplate >
                              <asp:LinkButton ID="lnkstatus" runat="server" CommandArgument ='<%# Eval("Eid") %>' 
                              OnCommand="lnkStatus" ></asp:LinkButton>
                              </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Delete"><ItemTemplate >
                              <asp:ImageButton ID="imgdelExc" runat="server" ImageUrl="~/admin/images/delete_1.png" 
                         OnCommand="gvExceptionDeleting" CommandArgument='<%# Eval("Eid") %>' 
                         OnClientClick="return confirm('are you sure you want to delete this')" />                     
                              </ItemTemplate></asp:TemplateField>
                               </Columns>                           
                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#487575" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#275353" />
                            </asp:GridView>                            
                            </td></tr>
                </table>


   <input id="Button1" runat="server" type="button" style="display:none" />              
 <input id="Button9" runat="server" type="button" style="display:none;" />

                       
                <asp:Panel ID="exceppanel" runat="server" Width="500px" style="background-color:white;" height="300px"  >
                 <table width="490px"  align="center" >
                <tr><td align="center"><h3 style="color:Navy;">Exception Status</h3></td></tr></table>
                <table width="490px"  align="center" style="height:230px;">
             
                <tr><td align="right" width="40%"> 
                    <asp:Label ID="Label1" runat="server" Text="User name :" CssClass="exceLable" ></asp:Label>  </td><td align="left"><asp:Label ID="lbusname" runat="server" ></asp:Label></td></tr>
                <tr><td align="right"> 
                    <asp:Label ID="Label2" runat="server" Text="User type : "></asp:Label></td><td align="left"><asp:Label ID="lbustype" runat="server" ></asp:Label></td></tr>                
                <tr><td align="right"> 
                    <asp:Label ID="Label3" runat="server" Text="Assigned to : "></asp:Label></td><td align="left">
                <asp:DropDownList ID="ddlUsertype" runat="server" Width="192px" Height="22px" Font-Names="Arial" Font-Size="11pt">
                    <asp:ListItem Text="Select" Selected="True">Select</asp:ListItem>
                    <asp:ListItem Text="Admin" >Admin</asp:ListItem>
                    <asp:ListItem Text="Web Admin" >Web Admin</asp:ListItem>
                    <asp:ListItem Text="Developer" >Developer</asp:ListItem>
                    <asp:ListItem Text="Analyst" >Analyst</asp:ListItem>
                    <asp:ListItem Text="Sales" >Sales</asp:ListItem>
                    <asp:ListItem Text="Customer Service">Customer Service</asp:ListItem>
                     <asp:ListItem Text="Support" >Support</asp:ListItem>
                    <asp:ListItem Text="Business Development" >Business Development</asp:ListItem>                                               
                  </asp:DropDownList>
                </td></tr>
                <tr>
                <td colspan="2" align="center"><asp:Button ID="btnsubmited" runat="server" 
                        Text="Submit" onclick="btnsubmited_Click" />
                        <asp:Button ID="btnsave" runat="server" Text="Resolved" 
                        onclick="btnsave_Click" />
                <asp:Button ID="btncanelexcep" runat="server" Text="cancel" /></td>
                </tr>
                </table>
                </asp:Panel> 

                <asp:Panel ID="pnlreplay" runat="server"  style="background-color:white;" >
                <table width="450px" align="center">
                <tr><td align="center"><h3 style="color:Navy;">Replay for the Token </h3></td></tr>
                <tr><td align="left">Token No: <asp:Label ID="lbthno" runat="server" ></asp:Label></td></tr>
                <tr><td align="left"><asp:TextBox ID="txtreplay" runat ="server" TextMode="MultiLine" Width="400px" Height="200px" ></asp:TextBox></td></tr>
                <tr><td align="right"><asp:Button ID="btnreplay" runat ="server" Text="Replay" 
                        onclick="btnreplay_Click" /><asp:Button ID="btncancel" runat="server" Text="Cancel" /></td></tr></table>
                </asp:Panel>


                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                 TargetControlID="Button1" DropShadow="false" BackgroundCssClass="modalBackground"
                 PopupControlID="pnlreplay" CancelControlID="btncancel">
</asp:ModalPopupExtender>

 <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Button9" DynamicServicePath="" Enabled="True" 
          PopupControlID="exceppanel" BackgroundCssClass="Modalpopup" CancelControlID="btncanelexcep" >
              </asp:ModalPopupExtender> 

    </div>
    </form>
</body>
</html>
