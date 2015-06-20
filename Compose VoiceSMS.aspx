<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="Compose VoiceSMS.aspx.cs" Inherits="Compose_VoiceSMS" Async="true"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

<div>
        <table  align="center" width="100%">
            <tr>
               <td><br /></td>
            </tr>
            <tr>
               <td align="center">
                   <table style="width:60%; background-color:#f5f3f4; border:1px solid #c8c8c8 " align="center">
                       <tr>
                          <td colspan="2" style=" line-height:15px;height:40px" bgcolor="#0985c5"  align="center">
                             <asp:Label ID="lblbalance" Text="Balance Amount : " runat="server" ForeColor="White" Font-Names="Segoe UI" Font-Size="17px"  /> 
                             <asp:Label ID="lblamount" runat="server"   ForeColor="White" Font-Names="Segoe UI"  Font-Size="17px"/><br />
                          </td>
                      </tr>

                      <tr><td><br /></td></tr>

                      <tr>
                         <td colspan="2" align="center" valign="top">
                             <table align="center" style="width:10%">
                                 <tr>
                                    <td style="padding-left:50px;" valign="top"  id="wrapperclass"><table align="left" style="width: 161px" >   
                                    <tr><td><br /></td></tr>            
                   <tr>
                       <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat; background-position:bottom; background-position:left;">
                         <strong>
                         <asp:LinkButton ID="linkcall" Text="Call to Record" CssClass="simple"
                               runat="server" onclick="linkcall_Click"></asp:LinkButton></strong>
                        </td>
                  </tr>       
                  <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                          <strong><asp:LinkButton ID="linkupload" Text="Upload File" CssClass="simple"
                               runat="server" onclick="linkupload_Click"></asp:LinkButton></strong>

                        </td>
                  </tr>
                  <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                        <strong>
                        <asp:LinkButton ID="linksppech" Text="Text to Speech" CssClass="simple"
                               runat="server" onclick="linksppech_Click"></asp:LinkButton></strong>
                        </td></tr>
                <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                         <strong>
                         <asp:LinkButton ID="linkclips" Text="My Clips" CssClass="simple"
                               runat="server" onclick="linkclips_Click"></asp:LinkButton></strong>
            </td>
                  </tr>          
                  </table></td>


<td valign="top" align="center" >
   <asp:Panel ID="pan1" runat="server" align="center" Width="700px">
      <div id="callrecord" align="center">
          <table align="center">
             <tr>
                <td valign="top">
                     <asp:Label ID="lblstep1" runat="server" Text="Step #1 : " ForeColor="Black" Font-Names="Segoe UI"></asp:Label>
                </td>
                 <td align="left" style="padding-bottom:5px;" >
                    <span style=" font-family:Segoe UI;color:Black; line-height:20px;">Call</span>
                     <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Segoe UI"><asp:ListItem>India : 040-23744117</asp:ListItem>
                    </asp:DropDownList>
    <br /><span style=" font-family:Segoe UI;color:Black;padding-top:20px;">Follow the prompts to record your invitation message.</span>
    <br /><br /></td>
</tr>
<tr><td valign="top"><asp:Label ID="lblstep2" runat="server" Text="Step #2 : " Font-Names="Segoe UI" ForeColor="Black"></asp:Label></td>
<td><span style=" font-family:Segoe UI;color:Black;">Enter the mobile number you called up from the retrieve your message.</span><br /><br /></td>
</tr>
<tr><td valign="top"><asp:Label ID="lblstep3" runat="server" Text="Step #3 : " Font-Names="Segoe UI" ForeColor="Black"></asp:Label></td>
<td >
<span style=" font-family:Segoe UI;color:Black;">Your Mobile Number:</span> <asp:TextBox ID="txtno" runat="server" Width="150"  ReadOnly="true"></asp:TextBox>
<br /><br />
    <%--<asp:Button ID="btngetclips" Text="Get Clip" runat="server" Height="30px" 
        Width="80px"/>--%>
        <asp:ImageButton ID="btngetclips" runat="server"  ImageUrl="~/images/get.png"/>
        <br />
 <span style=" font-family:Segoe UI;color:Black;">  (or)  Use previous voice clips</span> <br /> <br />
</td></tr>
</table>
      </div>
   </asp:Panel>
</td>
</tr>
</table>
</td></tr>
</table>
               </td>
            </tr>
        </table>
      <br />
</div>
</asp:Content>
