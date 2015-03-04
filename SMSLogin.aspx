<%@ Page Title=": : SMS Login : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSLogin.aspx.cs" Inherits="SMSLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:Panel ID="Panel1" runat="server" DefaultButton="Signin" CssClass="tableborder" Width="100%"  >
   <table align="center" width="90%" style="padding-left:120px;"  >
   <tr>
      <td style="width:55%;" align="center" >
      <table border="0" style="height:115px" cellspacing="7px">
         <tr>
   <td >
    </td> <td colspan="2">
           &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lablogin" runat ="server" Text="Indus SMS Log In" 
           Font-Bold="True" Font-Names="Arial" Font-Size="14pt"  CssClass="lblstyle"
           ></asp:Label>
   </td>
   </tr>
   <tr>
    <td>
    &nbsp;
    </td>
   </tr>
         <tr>
   <td class="style1">
    <asp:Label ID ="ltrlUserName" Text="Mobile Number (User ID) *" runat ="server" Font-Bold="true"
           Font-Names="Arial" Font-Size="10pt" ForeColor="#006699" ></asp:Label>
                
   </td>
   <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
   <td class="style1">  
        <asp:TextBox ID="UserID" runat="server" Width="190px" Font-Size="11pt" MaxLength="10" />  
        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="UserID" 
        ErrorMessage="Enter Mobile Number" ValidationGroup="login">*</asp:RequiredFieldValidator>    
        <asp:RegularExpressionValidator ID="revmobile" runat="server"  ValidationExpression="^[01]?[- .]?(\([1-9]\d{2}\)|[1-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
        ControlToValidate="UserID" ValidationGroup="login" ErrorMessage="Enter Valid Number">*</asp:RegularExpressionValidator>
   </td>
   </tr>

   <%--   <tr>
   <td class="style1">
    <asp:Label ID ="Label1" Text="Email Id *" runat ="server" Font-Bold="True" 
           Font-Names="Arial" Font-Size="10pt" ForeColor="#006699" ></asp:Label>
                
   </td>
   <td  style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
   <td class="style1">  
        <asp:TextBox ID="txtemail" runat="server" Width="190px" Font-Size="11pt" />  
        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtemail" 
        ErrorMessage="Enter Email" ValidationGroup="login">*</asp:RequiredFieldValidator>    
        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="*Enter valid email" Display="dynamic" ValidationExpression=".*@.*\..*"
                     ValidationGroup="login">*</asp:RegularExpressionValidator>
   </td>
   </tr>--%>

         <tr>
   <td>
   <asp:Label ID="ltrlPwd" runat="server" Text="Password *" Font-Bold="True" 
           Font-Names="Arial" Font-Size="10pt" ForeColor="#006699"></asp:Label>
  
   </td>
   <td style="Color:#006699;"><strong>&nbsp;:&nbsp;</strong></td>
   <td>
          <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="190px" Font-Size="11pt" />  
           <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="Password" 
           ErrorMessage="Enter Password" ValidationGroup="login">*</asp:RequiredFieldValidator>      
   </td>
   </tr>
   <tr>
   <td colspan="2"><br />
   <div style="float:right; padding-left:15px; height: 19px;">
   <asp:LinkButton ID="HyperLink1" runat="server"  
                        ToolTip="Forgot Password?" onclick="HyperLink1_Click">Forgot Password?</asp:LinkButton> <br />
                      
   </div>
</td>
<td align="center"><br />
            <asp:ImageButton ID="Signin" runat="server"   AlternateText="Sign In"
        ImageUrl="~/images/loginimg.png" ValidationGroup="login" Height="23px" 
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
    <td  style="width:45%; line-height:23px; padding-left:100px;" align="left">
     <div> 
		
		    		<h3>Account registration</h3>
			        <ul style="width:55%; line-height:23px;  list-style-type:disc; color:#006699; font-size:12px;font-weight:bold;">
			        	<li>Contact Through Email or Call</li>
			            <li>Confirm your order</li>
			            <li>Start using our site</li>
			        </ul>
                        <asp:HyperLink ID="HyperLink8" runat="server"  NavigateUrl="~/SMSRegistration.aspx"

                        ToolTip="Register now">Register now!</asp:HyperLink>

			
				</div>
      </td>
   </tr>
   </table>

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

