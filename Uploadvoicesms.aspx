<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="Uploadvoicesms.aspx.cs" Inherits="Uploadvoicesms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css"> 
  
  </style> 


    <link href="css/style.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
    function validateLength(oSrc, args) {
        args.IsValid = (args.Value.length >= 4);
    }
</script>



 <script type="text/javascript" >
        function Validate() {
            var msg = "";
            var bIsValid = true;
            var uploadedFile = document.getElementById("<%=FileUpload1.ClientID %>");
 
            if (uploadedFile.files[0].size <= 4194304) // greater than 512KB
            {
                msg += "File Size is limited to 4 MB!";
                bIsValid = false;
            }
         

         </script>


<script type="text/javascript">
    function validateFileSize() {
        var uploadControl = document.getElementById('<%= FileUpload1.ClientID %>');
        if (uploadControl.files[0].size <= 4194304) {
            document.getElementById('dvMsg').style.display = "block";
            return false;
        }
        else {
            document.getElementById('dvMsg').style.display = "none";
            return true;
        }
    }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div >
        <table  align="center" width="100%">
            <tr>
               <td><br /></td>
            </tr>
            <tr>
               <td align="center" width="80%" >
                   <table style="width:70%; background-color:#f5f3f4; border:1px solid #c8c8c8 " align="center">
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

                  <td>
        <table align="center"><tr><td align="center">
    <span style="font-family:Segoe UI;color:Black"> Select File : </span>
    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="Lavender" onchange="validateFileSize();" /><asp:RegularExpressionValidator
        ID="RegularExpressionValidator1" runat="server" ErrorMessage="only mp3,mp4 & wma formats allowed" ControlToValidate="FileUpload1"  ValidationExpression="(.+\.([Mm][Pp][3])|.+\.([Mm][Pp][4])|.+\.([Ww][Mm][Aa]))$" ValidationGroup="voicesms"></asp:RegularExpressionValidator>
    
        
    <asp:CustomValidator ID="NewPasswordCustomValidator" runat="server"  
                     ToolTip="FileSize should not exceed 5MB" 
                    ErrorMessage="<br>FileSize Exceeds the Limits.Please Try uploading smaller size files less than 4MB." 
                    ControlToValidate="FileUpload1"  
                   ClientValidationFunction = "CustomValidator1_ServerValidate"></asp:CustomValidator>
                    <div id="Message"></div>
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br>Upload file within 5MB" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>--%>
</td></tr>
<tr><td align="center"><br />
  
        
        <asp:ImageButton ID="btnupload" runat="server"  onclick="btnupload_Click"  ValidationGroup="voicesms" ImageUrl="~/images/upload.png"/>
        </td></tr>
        <tr><td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="voicesms" ShowMessageBox="true" ShowSummary="false" />
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
        <br />
   </div>
   <div id="dvMsg" style="background-color:Red; color:White; width:190px; padding:3px; display:none;" >
        Maximum size allowed is 4 MB
   </div> 
</asp:Content>

