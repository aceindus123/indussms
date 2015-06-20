<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSRegistration.aspx.cs" Inherits="SMSRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    
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
    <style type="text/css">
        .style1
        {
            width: 27%;
        }
        .style2
        {
            height: 35px;
            text-align: right;
            width: 27%;
            color: Black;
            font-family: Segoe UI;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
    <table id="tblreg" runat="server"  cellspacing="0" cellpadding="5" width="1000px" border="0" align="center"  >
         <tr>
        
        <td  style="background: url(images/registration.jpg); background-repeat:no-repeat; width:995px; height:50px; padding-top:5px;" 
         align="right" valign="middle" colspan="3" >       
               <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" 
                   CssClass="back"  PostBackUrl="Default.aspx"  />
             </td>
         </tr>

        <tr >
        <td  valign="middle" align="center">
        <asp:Image ID="ImageButton1" ImageUrl="~/images/registration_img.jpg" runat="server"  />
        </td>  
                  
            <td width="70%" align="left" colspan="2">  
                                         
                <table width="100%">
                   <tr>
                     <td   valign="top" align="right" class="style1">
                         <asp:Label ID="Literal3" runat="server" Text="Firstname" Font-Names="Segoe UI" ForeColor="Black" /><span  style="text-align:center;">*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                     </td>
                      <td align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; " width="60%">
                        <asp:TextBox ID="Name" runat="server"  Width="262px"  Height="26px" CssClass="textboxsch4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="Name"
                         ErrorMessage="Provide name" ValidationGroup="RegForm" ><span >*</span></asp:RequiredFieldValidator>                
                     <br /> <br /> </td>
                 </tr>

                 <tr>
                <td  class="style2" valign="top" >
                 <asp:Literal ID="ltlsurname" runat="server" Text="Lastname" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
                <asp:TextBox ID="txtsurname" runat="server" Width="262px"  Height="26px" CssClass="textboxsch4">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtsurname"
                    ErrorMessage="Provide initialname" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>                
                <br /><br /></td>
                </tr>
                <tr>
                <td  class="style2" valign="top">
                <asp:Literal ID="Literal4" runat="server" Text="Email" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
                 <asp:TextBox ID="Email" runat="server" Width="262px"  Height="26px" CssClass="textboxsch4" AutoPostBack="true"
                        ontextchanged="Email_TextChanged" ValidationGroup="reg1"></asp:TextBox>
           <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="Email" 
                ErrorMessage="Provide a valid email address" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="Email"
                    ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm"><span >*</span></asp:RegularExpressionValidator>
                <asp:Label ID="regemail" runat="server" Visible="false"></asp:Label>
               <br /><br /> </td>                
                </tr>
                
                     <tr>
                <td  class="style2" valign="top">
                 <asp:Literal ID="Literal8" runat="server" Text="Phone" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td  align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">             
                  <asp:TextBox ID="Phone" runat="server" MaxLength="10" Width="262px"  Height="26px" CssClass="textboxsch4" AutoPostBack="true"
                        onkeypress="return onlyNos(event,this);" ontextchanged="Phone_TextChanged"></asp:TextBox> 
                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="Phone"
                    ErrorMessage="Provide a Phone number" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                <asp:Label ID="regphone" runat="server" Visible="false"></asp:Label><br />

                <br /></td>
                </tr>
                <tr>
                <td  class="style2" valign="top">
                <asp:Literal ID="Literal6" runat="server" Text="Password" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
                <asp:TextBox ID="Password" runat="server"  TextMode="Password" Width="262px"  Height="26px" CssClass="textboxsch4">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="Password"
                    ErrorMessage="Provide a password" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
         
                    <asp:RegularExpressionValidator  ID="RegularExpressionValidator1"  ControlToValidate="Password"
                      ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"  runat="server"
                      ErrorMessage="Password must contain: Minimum 8 characters atleast One Alphabet and One Number and one special Character"  
                       ValidationGroup="RegForm"></asp:RegularExpressionValidator>
               <br /> </td>
                </tr>
                <tr>
                <td  class="style2" valign="top">
                <asp:Literal ID="Literal1" runat="server" Text="Confirm Password" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td  align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
                 <asp:TextBox ID="ConfirmPassword" runat="server"  TextMode="Password" Width="262px"  Height="26px" CssClass="textboxsch4">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="ConfirmPassword"
                    ErrorMessage="Provide a Confirm Password" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="Requiredfieldvalidator2" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    ErrorMessage="Provide same Password" ValidationGroup="RegForm"><span >*</span></asp:CompareValidator>
                <br /><br /></td>
                </tr>
                <tr>
                <td  class="style2" valign="top">
                <asp:Literal ID="Literal7" runat="server" Text="Company" /><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
               <td  align="left" style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
               
               <asp:TextBox ID="Company" runat="server" Width="262px"  Height="26px" CssClass="textboxsch4" >
                </asp:TextBox>
                
               <br /><br /></td>
                </tr>
                            <tr>
                <td  class="style2" valign="top">
                <asp:Literal ID="Literal2" runat="server" Text="Address" /><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
               <td  align="left" style="background: url(images/textboxnew22.png); background-repeat:no-repeat; padding-left:6px; ">
               
               <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="262px"  Height="70px" CssClass="textboxsch" >
                </asp:TextBox><br /><br />
                
               </td>
                </tr>
           
               
                        <tr><td colspan="2">  <span> <asp:RegularExpressionValidator ID="mobilereg" runat="server" 
            ControlToValidate="Phone" ErrorMessage="Enter phone number only ten digits(starting number should starts from 1 to 9 digits)"  ValidationGroup="RegForm"
            ValidationExpression="^[01]?[- .]?(\([1-9]\d{2}\)|[1-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator></span></td></tr>
                <tr>
                <td colspan="2" align="center"  style="padding-left:15%;">
                
                <%--<asp:Button ID="Create" runat="server" Text="Submit" ToolTip="Submit" OnClick="Create_Click"  Width="57px" Height="23px" />--%>

                <asp:ImageButton  ID="Create" ToolTip="Submit" runat="server"  onclick="Create_Click" ImageUrl="~/images/submit1r.png" ValidationGroup="RegForm" />
              <asp:ImageButton  ID="btncancel" runat="server" onclick="Button2_Click" ImageUrl="~/images/cancel3.png" />

                <asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="RegForm" ShowMessageBox="True" ShowSummary="False"/>
                
                 </td>
                </tr>
                <tr><td class="style1">&nbsp;</td></tr>
                </table>               
                
            </td>
            
            </tr>
     </table>
     </div>
</asp:Content>

