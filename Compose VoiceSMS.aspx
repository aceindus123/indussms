<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="Compose VoiceSMS.aspx.cs" Inherits="Compose_VoiceSMS" Async="true"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div  class="container">
    <table align="center" style="color:Red;" bgcolor="#99ccff" width="100%">
    <tr align="center"><td><strong><asp:Label ID="lblbalance" Text="Balance Amount : " runat="server" ForeColor="Green" /> </strong><asp:Label ID="lblamount" runat="server" /><br /></td></tr>
    </table>
<table>
<tr>
<td><table align="left">              
                   <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat; background-position:bottom; background-position:left;">
                         <strong>
                         <asp:LinkButton ID="linkcall" Text="Call to Record" CssClass="linkbutton1"
                              Font-Underline="false" runat="server" onclick="linkcall_Click"></asp:LinkButton></strong>
                        </td>
                  </tr>       
                  <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                          <strong><asp:LinkButton ID="linkupload" Text="Upload File" CssClass="linkbutton1"
                              Font-Underline="false" runat="server" onclick="linkupload_Click"></asp:LinkButton></strong>

                        </td>
                  </tr>
                  <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                        <strong>
                        <asp:LinkButton ID="linksppech" Text="Text to Speech" CssClass="linkbutton1"
                              Font-Underline="false" runat="server" onclick="linksppech_Click"></asp:LinkButton></strong>
                        </td></tr>
                <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                         <strong>
                         <asp:LinkButton ID="linkclips" Text="My Clips" CssClass="linkbutton1"
                              Font-Underline="false" runat="server" onclick="linkclips_Click"></asp:LinkButton></strong>
            </td>
                  </tr>          
                  </table></td>

<td valign="top" align="center" >
<asp:Panel ID="pan1" runat="server" align="center" Width="700px">
<div id="callrecord" align="center">
<table align="center">
<tr><td valign="top">
<strong><asp:Label ID="lblstep1" runat="server" Text="Step #1 : "></asp:Label></strong>
</td>
<td align="left">Call <asp:DropDownList ID="DropDownList1" runat="server"><asp:ListItem>India : 040-23744117</asp:ListItem>
    </asp:DropDownList>
    <br />Follow the prompts to record your invitation message.
    <br /><br /></td>
</tr>
<tr><td valign="top"><strong><asp:Label ID="lblstep2" runat="server" Text="Step #2 : "></asp:Label></strong></td>
<td>Enter the mobile number you called up from the retrieve your message.<br /><br /></td>
</tr>
<tr><td valign="top"><strong><asp:Label ID="lblstep3" runat="server" Text="Step #3 : "></asp:Label></strong></td>
<td>
Your Mobile Number: <asp:TextBox ID="txtno" runat="server" Width="150" ReadOnly="true"></asp:TextBox>
<br />
    <asp:Button ID="btngetclips" Text="Get Clip" runat="server" Height="30px" 
        Width="80px"/><br />
    (or)  Use previous voice clips
</td></tr>
</table>
</div>
</asp:Panel>
</td>
</tr>
</table>
</div>
</asp:Content>
