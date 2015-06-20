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
    <div>
        <table  align="center" width="100%">
            <tr>
               <td><br /></td>
            </tr>
            <tr>
               <td align="center" width="80%" >
                   <table style="width:80%; background-color:#f5f3f4; border:1px solid #c8c8c8 " align="center">
                       <tr>
                          <td colspan="2" style=" line-height:15px;height:40px" bgcolor="#0985c5"  align="center">
                             <asp:Label ID="lblbalance" Text="Balance Amount : " runat="server" ForeColor="White" Font-Names="Segoe UI" Font-Size="17px"  /> 
                             <asp:Label ID="lblamount" runat="server"   ForeColor="White" Font-Names="Segoe UI"  Font-Size="17px"/><br />
                          </td>
                      </tr>

                      <tr><td><br /></td></tr>

                      <tr>
                         <td colspan="2" align="center" valign="top">
                             <table align="center" style="width:100%">
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
       <td align="center"  style="padding-left:10px;">
<table align="center"><tr><td align="left" valign="top"> <span style="font-family:Segoe UI;color:Black"> Enter Your Messge :  </span>
     </td><td>
    <asp:TextBox ID="txtsms" runat="server" TextMode="MultiLine" Height="62px" 
        Width="255px" />
</td></tr>
<tr><td></td><td><br />
<%--    <asp:Button ID="btnconvert" runat="server" Text="Convert" Height="30px" 
        Width="80px" onclick="btnconvert_Click" />--%>
        <asp:ImageButton ID="btnconvert" runat="server"  onclick="btnconvert_Click"   ImageUrl="~/images/convert.png"/>
        
        </td></tr>
</table>
</td>


                </tr>
                </table>
                </td></tr>
                </table>
               </td>
           
            </tr>
        </table>


</div>
</asp:Content>

