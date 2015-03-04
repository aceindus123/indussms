<%@ Page Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="MissedCall.aspx.cs" Inherits="MissedCall" Title=": : SMS Missed Call Alert : :" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div  >
    <div id="MC" align="center" class="tableborder">
 <table width="100%" >
     <tr>
        <td align="center" width="100%"  class="titlecampain1" valign="middle" colspan="2">
           <h2> Missed Call Alert</h2>
        </td>
     </tr>
   </table>
 
     <br />
     <table  >
       <tr>
         <td>
             <asp:Label ID="lblmobile" runat="server" Text="Please Enter Mobile Number : " ForeColor="Black"></asp:Label>
         </td>
         <td>
            <asp:TextBox ID="txtmissed" runat="server" MaxLength="10"  Width="180"></asp:TextBox>
            <asp:RequiredFieldValidator ID="mobileno1"       runat="server" ControlToValidate="txtmissed" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">                   </asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ControlToValidate="txtmissed"   ValidationGroup="missed"
              ErrorMessage="Please Enter Valid Mobile Number:" ValidationExpression="[7-9]{1}[0-9]{9}"></asp:RegularExpressionValidator>
         </td>
       </tr>
       <tr>
       <td>
       &nbsp;
       </td>
       </tr>
       <tr>
         <td >
          </td>
         <td colspan="3">
          <asp:Button ID="btnsubmit" runat="server" Text="Submit" onclick="btnsubmit_Click" ValidationGroup="missed" />
         </td>
       </tr>
     </table>
    
    <br />
    <br />
     <br />
    </div>
    </div>
</asp:Content>

