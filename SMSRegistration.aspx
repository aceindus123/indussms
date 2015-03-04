<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSRegistration.aspx.cs" Inherits="SMSRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <table id="tblreg" runat="server"  cellspacing="0" cellpadding="5" width="100%" border="0" align="center"  class="tableborder" >
         <tr>
             <td  valign="middle" align="center" colspan="2" style="padding-top:1%;">
                  <asp:Label ID="Label1" runat="server" Text="Registration" CssClass="lblstyle"></asp:Label>
             </td>
         </tr>
         <tr>
           <td  valign="middle" colspan="2">
              <div style="float:right ; padding-right: 8px;">
              <asp:Button ID="imgBack" ToolTip="Back" runat="server" Text="Back" PostBackUrl="Default.aspx" Width="57px" Height="23px" />
             </div> 
            </td>
        </tr>       
        <tr >            
            <td width="65%" align="right">                               
                <table class="tblstyle">
                <tr>
                <td  class="tdstyle">
                 <asp:Literal ID="Literal3" runat="server" Text="Firstname" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left" >
                <asp:TextBox ID="Name" runat="server" CssClass="txtstyle">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="Name"
                    ErrorMessage="Provide name" ValidationGroup="RegForm" ><span >*</span></asp:RequiredFieldValidator>                
                </td>
                </tr>
                 <tr>
                <td  class="tdstyle" >
                 <asp:Literal ID="ltlsurname" runat="server" Text="Lastname" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left" >
                <asp:TextBox ID="txtsurname" runat="server" CssClass="txtstyle">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtsurname"
                    ErrorMessage="Provide initialname" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>                
                </td>
                </tr>
                <tr>
                <td  class="tdstyle">
                <asp:Literal ID="Literal4" runat="server" Text="Email" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left">
                 <asp:TextBox ID="Email" runat="server" CssClass="txtstyle" AutoPostBack="true"
                        ontextchanged="Email_TextChanged"></asp:TextBox>
           <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="Email" 
                ErrorMessage="Provide a valid email address" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="Email"
                    ErrorMessage="*Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm"><span >*</span></asp:RegularExpressionValidator>
                <asp:Label ID="regemail" runat="server" Visible="false"></asp:Label>
                </td>                
                </tr>
                
                     <tr>
                <td  class="tdstyle">
                 <asp:Literal ID="Literal8" runat="server" Text="Phone" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td  align="left">             
                  <asp:TextBox ID="Phone" runat="server" MaxLength="10" CssClass="txtstyle" AutoPostBack="true"
                        onkeypress="return onlyNos(event,this);" ontextchanged="Phone_TextChanged"></asp:TextBox> 
                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="Phone"
                    ErrorMessage="Provide a Phone number" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                <asp:Label ID="regphone" runat="server" Visible="false"></asp:Label><br />

                

                </td>
                </tr>
                <tr>
                <td  class="tdstyle">
                <asp:Literal ID="Literal6" runat="server" Text="Password" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td align="left">
                <asp:TextBox ID="Password" runat="server"  TextMode="Password" CssClass="txtstyle">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="Password"
                    ErrorMessage="Provide a password" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td  class="tdstyle">
                <asp:Literal ID="Literal1" runat="server" Text="Confirm Password" /><span >*</span><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
                <td  align="left">
                 <asp:TextBox ID="ConfirmPassword" runat="server"  TextMode="Password" CssClass="txtstyle">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="ConfirmPassword"
                    ErrorMessage="Provide a Confirm Password" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="Requiredfieldvalidator2" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    ErrorMessage="Provide same Password" ValidationGroup="RegForm"><span >*</span></asp:CompareValidator>
                </td>
                </tr>
                <tr>
                <td  class="tdstyle">
                <asp:Literal ID="Literal7" runat="server" Text="Company" /><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
               <td  align="left">
               
               <asp:TextBox ID="Company" runat="server" CssClass="txtstyle" >
                </asp:TextBox>
                
               </td>
                </tr>
                            <tr>
                <td  class="tdstyle" valign="top">
                <asp:Literal ID="Literal2" runat="server" Text="Address" /><strong>&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
                </td>
               <td  align="left">
               
               <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="txtstyle" >
                </asp:TextBox>
                
               </td>
                </tr>
           
               
                        <tr><td colspan="2">  <span> <asp:RegularExpressionValidator ID="mobilereg" runat="server" 
            ControlToValidate="Phone" ErrorMessage="Enter phone number only ten digits(starting number should starts from 1 to 9 digits)"  ValidationGroup="RegForm"
            ValidationExpression="^[01]?[- .]?(\([1-9]\d{2}\)|[1-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator></span></td></tr>
                <tr>
                <td colspan="2" align="center"  style="padding-left:15%;">
                
                <asp:Button ID="Create" runat="server" Text="Submit" ToolTip="Submit" OnClick="Create_Click" ValidationGroup="RegForm" Width="57px" Height="23px" />
                <asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="RegForm" ShowMessageBox="True" ShowSummary="False"/>
                
                 </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                </table>               
                
            </td>
            
            </tr>
     </table>
</asp:Content>

