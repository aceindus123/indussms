<%@ Page Title=": : SMS Login : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSLogin.aspx.cs" Inherits="SMSLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style>

.latest_news {  margin-top:8px; height:auto; }
.latest_news a:link{ color:#303030; text-decoration:none; }
.latest_news a:visited{ color:#303030; text-decoration:none; }

.latest_news ul { width:320px;}

.latest_news ul li { width:97%;
list-style-type: none;
display: block;
padding: 5px 20px; padding-left:20px;
margin: 0;
float: left; 
background:url(images/arrow.png) no-repeat scroll left 2px top 10px transparent;
padding:0px 0 10 0px; line-height:19px;
 font-size:14px; font-family:Segoe UI;
}
.latest_news a:hover{ color:#000; }


</style>

<script type="text/javascript">
    function onlyNos(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
        catch (err) {
            alert(err.Description);
        }
    }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:Panel ID="Panel1" runat="server" DefaultButton="Signin" CssClass="tableborder" >
<br />

 <div   align="center"  > 
 <table width="100%"><tr><td align="center">
    <table style="background: url(images/bg1.png); background-repeat:no-repeat; width:750px; height:250px; padding-left:20px;"  align="center" >
   <tr>
    <td style="width:55%;" >
      <table border="0" style="height:115px; width:400px; padding-top:20px;" cellspacing="7px" >

   <tr>
    <td>
    &nbsp;
    </td>
   </tr>
         <tr>
   <td class="style1">
    <asp:Label ID ="ltrlUserName" Text="Mobile Number (User ID) *" runat ="server" 
           Font-Names="Arial" Font-Size="10pt"  ForeColor="Black" ></asp:Label>
                
   </td>
   <td  style="Color:#006699;" valign="top"><strong>:</strong></td>
   <td class="style1">  
        
        <asp:TextBox ID="UserID" runat="server" Width="160px" Font-Size="11pt" MaxLength="10" onkeypress="return onlyNos(event,this);" />  
        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="UserID" 
        ErrorMessage="Enter Mobile Number" ValidationGroup="login">*</asp:RequiredFieldValidator>    
        <asp:RegularExpressionValidator ID="revmobile" runat="server"  ValidationExpression="^[01]?[- .]?(\([1-9]\d{2}\)|[1-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
        ControlToValidate="UserID" ValidationGroup="login" ErrorMessage="Enter Valid Number">*</asp:RegularExpressionValidator>
   </td>
   </tr>

         <tr>
   <td>
   <asp:Label ID="ltrlPwd" runat="server" Text="Password *"  
           Font-Names="Arial" Font-Size="10pt" ForeColor="Black"></asp:Label>
  
   </td>
   <td style="Color:#006699;" valign="top"><strong>:</strong></td>
   <td>
         <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="162px" Font-Size="11pt" />  
           <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="Password" 
           ErrorMessage="Enter Password" ValidationGroup="login">*</asp:RequiredFieldValidator>      
   </td>
   </tr>
   <tr>
   <td colspan="2"><br />
   <div style="float:right; padding-left:15px; height: 19px;">
   <asp:LinkButton ID="HyperLink1" runat="server"  
                        ToolTip="Forgot Password?" onclick="HyperLink1_Click" ForeColor="#2E9AFE" Font-Underline="false">Forgot Password?</asp:LinkButton> <br />
                      
   </div>
</td>
<td align="center"><br />
            <asp:ImageButton ID="Signin" runat="server"   AlternateText="Sign In"
        ImageUrl="~/images/login1.png" ValidationGroup="login" Height="35px" 
        Width="64px"  onclick="Signin_Click"/>
   
   </td>
   </tr>
   <tr>
       <td colspan="3">
           <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="login" ShowMessageBox="true" ShowSummary="false" />
       </td>
   </tr>
   </table>
      </td>
    <td  style="width:45%; line-height:23px; padding-left:25px; padding-top:20px;" align="left" valign="top">


    <div class="latest_news">   
		    	<asp:Image ID="img1" runat="server" ImageUrl="~/images/text.png" />
                            <br />
      <ul>        
  <li style="border-top:none;">  <a href="images/arrow.png">Contact Through Email or Call </a> </li>
         
     <li>   <a href="images/arrow.png"> Confirm your order  </a> </li>
     <li>    <a href="images/arrow.png"> Start using our site  </a> </li>
 </ul> 

                <p>
                    &nbsp;</p>
                

 </div>
<span style="margin-top:80px;padding-left:100px;"></span><asp:ImageButton ID="btn122" runat="server" ImageUrl="~/images/register.png" PostBackUrl="~/SMSRegistration.aspx" />

  
      </td>
   </tr>
   </table>
 </td></tr></table>
 <br />
   </div>
   </asp:Panel>

   <asp:Panel  runat="server" visible="false" id="frgetdiv" >
     <div  runat="server" align="center" width="100%"  class="container">
     <br />
                       <asp:Label ID="Label2" runat="server" Text="Forget Password" CssClass="lblstyle"></asp:Label><br /><br />

                        Enter Email ID : <asp:TextBox ID="frgtpwd" runat="server" Width="200px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="frgtpwd"  
                ErrorMessage="Provide a valid email address" ValidationGroup="frgt"><span >*</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" runat="server" ControlToValidate="frgtpwd"
                    ErrorMessage="*Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="frgt">In valid Email</asp:RegularExpressionValidator>
                        <br />
                        <br />
                        <asp:Button ID="btnpfrgt" runat="server" Text="Submit" onclick="btnpfrgt_Click" ValidationGroup="frgt"  />
                         <asp:Button ID="btncancel" runat="server" Text="Cancel" 
                                onclick="btncancel_Click"  /><br />
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                <br />

                        </div>
                           
   </asp:Panel>
  
</asp:Content>

