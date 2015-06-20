<%@ Page Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="MissedCall.aspx.cs" Inherits="MissedCall" Title=": : SMS Missed Call Alert : :" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajax:ToolkitScriptManager ID="tl1" runat="server"></ajax:ToolkitScriptManager>
<div class="container"> 
    
     <table width="1000px"  align="center">
     <tr>
      <td  style="background: url(images/missedcall.jpg); background-repeat:no-repeat; width:995px; height:70px; padding-top:5px;"  align="right" colspan="4">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

          <br /><br /> </td>
     </tr>

     <tr>
    <td style="padding-left:50px">
             <asp:Image ID="ImageButton1" ImageUrl="~/images/missed.png" runat="server" 
                    Width="173px"  />
            </td>
      
     
       <td valign="middle" align="left" style="padding-left:30px">
           <table>
              <tr>
                   <td align="right" valign="middle" >
             <asp:Label ID="lblmobile" runat="server" Text="Please Enter Mobile Number*" ForeColor="Black" Font-Names="Segoe UI"></asp:Label>
             &nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;
         </td>
                   <td style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:8px;padding-bottom:5px;  " 
                    align="center" valign="middle">
            <asp:TextBox ID="txtmissed" runat="server" MaxLength="10" Width="250px"  Height="20px" CssClass="textboxsch" ></asp:TextBox>
            <ajax:FilteredTextBoxExtender ID="ftxt" runat="server" FilterType="Numbers" TargetControlID="txtmissed"></ajax:FilteredTextBoxExtender>
            
            <asp:RequiredFieldValidator ID="mobileno1"       runat="server" ControlToValidate="txtmissed" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">                   </asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ControlToValidate="txtmissed"   ValidationGroup="missed"
              ErrorMessage="Enter Valid Mobile Number" ValidationExpression="[7-9]{1}[0-9]{9}"></asp:RegularExpressionValidator>
         </td>   </tr>
         <tr><td colspan="2"><br /><br /></td></tr>
     <tr>

                   <td colspan="2" align="center" >
                
              <asp:ImageButton  ID="btnsubmit" ToolTip="Submit" runat="server"  onclick="btnsubmit_Click" ImageUrl="~/images/submit1r.png" ValidationGroup="missed" />
              <asp:ImageButton  ID="Button1" runat="server" onclick="Button1_Click" ImageUrl="~/images/cancel3.png" />

         </td>
            </tr>
             <tr><td colspan="2"><br /></td></tr>
         </table>
       </td>
     </tr>
     </table>

</div>

</asp:Content>

