<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="TextToSpeech.aspx.cs" Inherits="TextToSpeech" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script  type="text/javascript">
    $(function () {
        //Normal Configuration
        $("[id*=txtsms]").MaxLength({ MaxLength: 160 });

    });
    </script>
      <script  src="css/MaxLength.min.js"  type="text/javascript"></script>
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

<td align="center"  style="padding-left:150px;">
<table align="center"><tr><td align="center"><strong>
     Enter Your Messge : </strong></td><td>
    <asp:TextBox ID="txtsms" runat="server" TextMode="MultiLine" Height="62px" 
        Width="255px" />
</td></tr>
<tr><td></td><td><br />
    <asp:Button ID="btnconvert" runat="server" Text="Convert" Height="30px" 
        Width="80px" onclick="btnconvert_Click" /></td></tr>
</table>
</td>
</tr>
</table>
</div>
</asp:Content>

