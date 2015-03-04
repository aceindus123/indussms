<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
  <table  width="100%" align="center">
     <tr>
       <td>
            <uc1:TopMenu ID="Topmenu1" runat="server" />
       </td>
     </tr>
   </table>
   <br />
     <br />
     </div>
<div align="center" class="container" style="width:500px;" >
<table width="500px" align="center" height="380px">
<tr><td colspan="3" align="center">
<asp:Label ID="Lbheading" runat="server" style="font-weight:bold;font-size:15pt" 
        Text="Confirm Plan Change" ForeColor="#006666" Font-Bold="True" 
        Font-Names="Arial" Font-Size="14pt"></asp:Label><br />
</td></tr>
<tr>
<td  valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="ltrlName" runat="server" Text="Your Name" Font-Bold="false" 
        ForeColor="#336699" Font-Size="14px" Font-Names="vani"></asp:Label>
</td>
<td width="1px" align="center" class="tddimentions"><strong >&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;"  valign="middle" class="tddimentions">
 <asp:TextBox ID="txtName" runat="server" Width="150px" class="txtdimentions" Font-Size="14px" Enabled="False"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtName"
        runat="server" ForeColor="red" ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td  valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="ltrcname" runat="server" Text="Your Email Id" Font-Bold="false" Font-Size="14px" Font-Names="vani" 
        ForeColor="#336699" ></asp:Label>
</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;"  valign="middle" class="tddimentions">
<asp:TextBox ID="txtemail" runat="server"  Width="150px" Font-Size="14px" class="txtdimentions" Enabled="False">
                </asp:TextBox> 
                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtemail" 
                ErrorMessage="*Provide a valid email address" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="*Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm">*</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td height="10px" valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="ltrphno" runat="server" Text="Your Phone No" Font-Bold="false" Font-Size="14px" Font-Names="vani"
        ForeColor="#336699"></asp:Label>
</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;" valign="middle" class="tddimentions">
<asp:TextBox ID="txtphno" runat="server" Width="150px" Font-Size="14px" MaxLength="10" Enabled="False" class="txtdimentions" onkeypress="return isNumberKey(event)">
                </asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtphno"
        runat="server" ForeColor="red" ErrorMessage="Please enter the Phone No.">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td  valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="ltramount" runat="server" Text="Amount" Font-Bold="false" Font-Size="14px" Font-Names="vani"
        ForeColor="#336699"></asp:Label>

</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;" valign="middle" class="tddimentions">
<asp:TextBox ID="txtamount" runat="server"  Width="150px" Font-Size="14px" Enabled="False" class="txtdimentions">
                </asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtamount"
        runat="server" ForeColor="red" ErrorMessage="Please enter the amount.">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td  valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="ltrcurrency" runat="server" Text="Currency" Font-Bold="false" Font-Size="14px" Font-Names="vani" 
        ForeColor="#336699"></asp:Label>
</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;"  valign="middle">
 <asp:TextBox runat="server" Width="150px" ID="ddlCurrency" CssClass="txtdimentions" Text="INR" Enabled="False">
    </asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlCurrency" InitialValue="Select"
        runat="server" ForeColor="red" ErrorMessage="Please Select the Currency.">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="lblCountry" runat="server" Text="Country" Font-Bold="false" Font-Size="14px" Font-Names="vani"
        ForeColor="#336699"></asp:Label>

</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;"  valign="middle" class="tddimentions">
 <asp:DropDownList id="ddlcountry" runat="server" style="width:154px;" CssClass="txtdimentions"  AutoPostBack="true"  onselectedindexchanged="ddlcountry_SelectedIndexChanged">
 </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ContactForm" InitialValue="Select Country" ErrorMessage="Enter Country" ControlToValidate="ddlcountry">*</asp:RequiredFieldValidator>

</td>
</tr>

<tr>
<td  valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="lblState" runat="server" Text="State" Font-Bold="false" Font-Size="14px" Font-Names="vani" 
        ForeColor="#336699"></asp:Label>

</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;" valign="middle" class="tddimentions">
  <asp:DropDownList id="ddlstate" runat="server" style="width:154px; " CssClass="txtdimentions"  AutoPostBack="true"  onselectedindexchanged="ddlstate_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ContactForm" InitialValue="Select State" ErrorMessage="Enter state" ControlToValidate="ddlstate">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td  valign="middle" align="left" style="padding-left: 20px;" class="tddimentions">
<asp:Label ID="lblCity" runat="server" Text="City" Font-Bold="false" Font-Size="14px" Font-Names="vani" 
        ForeColor="#336699"></asp:Label>

</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;" valign="middle" class="tddimentions">
  <asp:DropDownList id="ddlcity" runat="server" style="width:154px; " appenddatabounditems="True" CssClass="txtdimentions">
       <asp:ListItem Value="Select City">Select City</asp:ListItem>
       </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" InitialValue="Select City" ValidationGroup="ContactForm" ErrorMessage="Enter city" ControlToValidate="ddlcity">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="left" style="padding-left: 20px;" valign="middle" class="tddimentions">
<asp:Label ID="ltrpurpose" runat="server" Text="Transaction Purpose" Font-Bold="false" Font-Size="14px" Font-Names="vani"
        ForeColor="#336699"></asp:Label>
 
</td>
<td width="1px" align="center" class="tddimentions"><strong>&nbsp;:&nbsp;</strong></td>
<td align="left" style="padding-left: 20px;padding-top: 5px;"  valign="middle" class="tddimentions" runat="server" id="txtaccount"  >
<asp:TextBox runat="server" ID="txtPurpose" Font-Size="14px" Font-Names="vani" Text="Indussms Subscription" Width="156px" Enabled="False"></asp:TextBox></td>
<td align="left" style="padding-left: 20px;padding-top: 5px;"  valign="middle" class="tddimentions" runat="server" id="txtdeliver" visible="false"  >
<asp:TextBox runat="server" ID="TextBox1" Font-Size="14px" Font-Names="vani" Text="Indussms Deliver Report" Width="156px" Enabled="False"></asp:TextBox>
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtPurpose"
        ErrorMessage="Can not be left blank" 
        runat="server" ForeColor="red">*</asp:RequiredFieldValidator>--%></td>
</tr>
<tr>
<td colspan="3" align="center" >
<asp:Button ID="btnPay" runat="server" Text="Pay Amount" onclick="btnPay_Click" />

<%--<asp:ImageButton ID="btnsubmit" runat="server" ImageUrl="images/buttons1/paypal_button.png" Height="34px" Width="140px" 
        Font-Size="14px" onclick="btnsubmit_Click"/>--%>

</td>
</tr>
</table>
</div>

</asp:Content>

