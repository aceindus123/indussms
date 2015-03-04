<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="Uploadvoicesms.aspx.cs" Inherits="Uploadvoicesms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

<td align="center" style="padding-left:150px;">
<table align="center"><tr><td align="center"><strong>
     Select File : </strong>
    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="Lavender"/><asp:RegularExpressionValidator
        ID="RegularExpressionValidator1" runat="server" ErrorMessage="only accept mp3 format" ControlToValidate="FileUpload1"  ValidationExpression="^.+(.mp3|.MP3)$"></asp:RegularExpressionValidator>
</td></tr>
<tr><td align="center"><br />
    <asp:Button ID="btnupload" runat="server" Text="Upload" Height="30px" 
        Width="70px" onclick="btnupload_Click"/></td></tr>
</table>

</td>
</tr>
</table>
</div>
</asp:Content>

