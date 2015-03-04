<%@ Page  Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Mobile verification.aspx.cs" Inherits="Mobile_verification" Title=": :Indussms-Mobileverification : :"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="tblstyle">
  <tr>
     <td class="mbltitle" colspan="2">
        <asp:Label ID="lbltext" runat="server" Text="Mobile Verification"></asp:Label>
     </td>
  </tr>
   <tr>
       <td class="tdregform">
          <asp:Label ID="lblVCode" runat="server" Visible="false"></asp:Label>
  <!--begin of the content-->
          <asp:TextBox ID="txtVerification" runat="server" Height="30px" placeholder="Enter verification code" CssClass="txtstyle"></asp:TextBox>
      
  <!--end of the content-->
        </td>
        <td class="tdregform1">  
             <asp:Button ID="imgBtn" runat="server"  Width="40px" Height="30px" Text="Go" onclick="imgBtn_Click" /></td>
    </tr>
</table>
</asp:Content>

