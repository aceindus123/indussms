<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="AccountInfo.aspx.cs" Inherits="AccountInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
<ajax:ToolkitScriptManager ID="tl1" runat="server"></ajax:ToolkitScriptManager>
   <table  width="100%" align="center">
     <tr>
       <td>
            <uc1:TopMenu ID="Topmenu1" runat="server" />
       </td>
     </tr>
   </table>
   <br />
    
   <table width="100%" align="center">
   <tr>
     <td align="center" >
     <asp:Label ID="lbltitle" runat="server"   Text="Account Information" ForeColor="Black" Font-Size="22px"></asp:Label><br /><br /><br />
     </td>
   </tr>
     <tr>
       <td>
                           <fieldset    style="width:70%;  margin-left:150px;">
                                              <legend >&nbsp;Account Information&nbsp;</legend>                 
                                                <center>
                                                    <table border="0" cellpadding="3" cellspacing="3" id="table1">
                                                        <tbody>
                                                         <tr style="height:35px;">
                                                            <td style="width: 168px" class="text14 darkgrey" align="left" style="margin-top:10px;">
                                                                * <asp:Label ID="lblfname" runat="server" Text="First Name" Font-Size="15px" ForeColor="Gray"></asp:Label>:
                                                            </td>
                                                            <td style="width: 181px">
                                                                                                                      <asp:TextBox ID="txtfname" runat="server" Width="190px" MaxLength="50" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="reqfname" runat="server" ControlToValidate="txtfname" ErrorMessage="Enter Your FistName" ValidationGroup="signup" ForeColor="red">*</asp:RequiredFieldValidator>
                                                                <span id="rfvFirstName" class="text14" style="color:Red;display:none;">*</span>
                                                            </td>
                                                            <td style="width: 173px">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                         <tr style="height:35px;">
                                                            <td style="width: 168px" class="text14 darkgrey" align="left">
                                                                * <%--Last Name--%><asp:Label ID="lbllname" runat="server" Text="Last Name" Font-Size="15px" ForeColor="Gray"></asp:Label>:
                                                            </td>
                                                            <td style="width: 181px">
                                                                 <asp:TextBox ID="txtlname" runat="server" Width="190px" MaxLength="50" ></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="required" runat="server" ControlToValidate="txtlname" ErrorMessage="Enter Your LastName" ValidationGroup="signup" ForeColor="red">*</asp:RequiredFieldValidator>
                                                                <span id="rfvLastName" class="text14" style="color:Red;display:none;">*</span>
                                                            </td>
                                                            <td style="width: 173px">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                         <tr style="height:35px;">
                                                            <td style="width: 168px" class="text14 darkgrey" align="left">
                                                                * <%--Address1--%><asp:label ID="lblEmail" runat="server" Text="Email :" Width="147px" ForeColor="Gray"></asp:label>
                                                            </td>
                                                            <td style="width: 181px">
                                                               <%-- <input name="txtAddress1" type="text" id="txtAddress1">--%>
                                                               <asp:TextBox ID="txtEmail" runat="server" Width="190px" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Your Email id" ValidationGroup="signup" ForeColor="red">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="regularEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signup" ForeColor="red">*</asp:RegularExpressionValidator>
                                                                <span id="rfvAddress1" class="text14" style="color:Red;display:none;">*</span>

                                                            </td>
                                                            <td style="width: 173px">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                         <tr style="height:35px;">
                                                            <td style="width:168px" class="text14 darkgrey" align="left">
                                                                <%--Address2--%>*&nbsp;<asp:label ID="lblphone" runat="server" Text="Phone No :" Width="147px" ForeColor="Gray"></asp:label>
                                                            </td>
                                                            <td style="width: 181px">
                                                                <%--<input name="txtAddress2" type="text" id="txtAddress2">--%>
                                                                <asp:TextBox ID="txtphone" runat="server" Width="190px" MaxLength="10" ></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="reqphone" runat="server" ControlToValidate="txtphone" ErrorMessage="Enter Your phone no" ValidationGroup="signup" ForeColor="red">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="regexphone" runat="server" ControlToValidate="txtphone" Text="*"
                                                                 ValidationExpression="[0-9]{10}" ErrorMessage="no special character" ValidationGroup="signup" ForeColor="red"></asp:RegularExpressionValidator>
                                                            </td>
                                                            <td style="width: 173px">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                         <tr style="height:35px;">
                                                            <td style="width: 168px" class="text14 darkgrey" align="left" valign="top">
                                                                * <%--Country--%><asp:Label ID="lbladdress1" runat="server" Text="Address" Font-Size="15px" ForeColor="Gray"></asp:Label>
                                                            </td>
                                                            <td style="width: 181px">
                                                                 
                                                                <asp:TextBox ID="txtadd1" runat="server" Width="190px" TextMode="MultiLine"></asp:TextBox> 

<asp:RequiredFieldValidator ID="reqadd1" runat="server" ControlToValidate="txtadd1" ErrorMessage="Enter your Address" ValidationGroup="signup" ForeColor="red">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td style="width: 173px">
                                                                <span id="cvCountry" class="text14" style="color:Red;display:none;">*</span>
                                                            </td>
                                                        </tr>                                           
                                                            <tr id="trupdate" runat="server">
                                                            <td  colspan="2" align="center">
                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                             <asp:Button ID="edit1" runat="server" 
                                                                    Text="Edit" onclick="edit1_Click" Height="26px" Width="61px" />&nbsp;&nbsp;
                                                                <asp:Button ID="btnupdate" runat="server" ValidationGroup="signup" 
                                                                    Text="Update" onclick="btnupdate_Click"  Height="26px" Width="61px"/>&nbsp;&nbsp;
                                                             
                                                                <asp:Button ID="Editreset" runat="server" Text="Cancel" 
                                                                    onclick="btncancel_Click" Height="26px" Width="61px"   />
                                                            </td></tr>
                                                       
                                                        <tr id="prvalidsummary" runat="server">
                                                        <td><asp:ValidationSummary ID="validsummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="signup" /></td>
                                                        
                                                        </tr>
                                                    </tbody></table>
                                                    &nbsp;
                                                </center>
                                            </fieldset>
 
         
       </td>
     </tr>
   </table>
   <br />
   <br />

   <table width="100%" align="center">
    <tr>
     <td>
          
                                            <fieldset style="width:70%;  margin-left:150px;">
                                              <legend>&nbsp;Password Details&nbsp;</legend>                 
                                                <center>
                                                    <table border="0" cellpadding="3" cellspacing="3" id="table2">
                                                        <tbody>

                                                         <tr style="height:60px;">

                                                         <td>
                                                      Note :    We recommend that you change your Password at regular intervals to prevent misuse of your account.
                                                         </td>
                                                         </tr>
                                                         </tbody>
                                                         </table>
                                                         </center>
                                                         </fieldset>
     </td>
   </tr>

   <tr >
     <td  style="width:70%;  padding-left:150px;">
     <br />  Password Last Changed : &nbsp;&nbsp; <asp:Label ID="lblpwd" runat="server" ForeColor="Gray"></asp:Label>
     </td>
   </tr>
   <tr >
     <td  style="width:70%;  padding-left:150px;">
     <br /> <asp:Button ID="update2" runat="server"  Text="Update Password" Height="26px" Width="120px"
             onclick="update2_Click"  />&nbsp;&nbsp;
     </td>
   </tr>
   </table>
   <br />
   <br />


   <%-- <input id="btnedit" runat="server" type="button" style="display: none" />--%>
        <ajax:modalpopupextender ID="ModalPopupExtender2" runat="server" TargetControlID="update2"   BackgroundCssClass="modalBackground" 
        CancelControlID="ImageBtncancel" DropShadow="false" PopupControlID="pnledit"  OkControlID="btnclose"></ajax:modalpopupextender>


        <asp:Panel ID="pnledit" runat="server" BackColor="White" Height="270px" Width="650px"  style=" border:2px solid #dddddd;">
                <table width="100%" align="center" >     
             <tr>
            <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" align="center" ><h2>Change Password  </h2></td>
             <td>
            <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Large" /></td>
            </tr>
            <tr>
            <td colspan="3">&nbsp;</td>
            </tr>          
            <tr>
            <td align="right" style="padding-right:35px;">
              <asp:Label ID="Labcurrentpwd" runat="server" Text=" Enter your Current Password " 
                    Font-Bold="True" Font-Names="Arial" Font-Size="15px" ForeColor="#006666" ></asp:Label>
            </td>
            <td align="center"><strong>&nbsp;:&nbsp;</strong></td>
            <td align="left" style="padding-left:35px;" valign="top">
             <asp:TextBox ID="txtprepwd" runat="server" Width="200px" TextMode="Password" AutoCompleteType="Disabled" Font-Size="15px"/>
              <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtprepwd" Text="*" ValidationGroup="vg1" />
            </td>
            </tr>
            <tr>
            <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
            <td align="right" style="padding-right:35px;">
              <asp:Label ID="Label3" runat="server" Text="New Password " 
                    Font-Bold="True" Font-Names="Arial" Font-Size="15px" ForeColor="#006666" ></asp:Label>
            </td>
            <td align="center"><strong>&nbsp;:&nbsp;</strong></td>
            <td align="left" style="padding-left:35px;" valign="top">
             <asp:TextBox ID="Txtnewpwd" runat="server" Width="200px" TextMode="Password" Font-Size="15px"/>
              <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="Txtnewpwd" Text="*"  ValidationGroup="vg1" />
            </td>
            </tr>
            <tr>
            <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
            <td align="right" style="padding-right:35px;">
              <asp:Label ID="Label4" runat="server" Text="Confirm Password " 
                    Font-Bold="True" Font-Names="Arial" Font-Size="15px" ForeColor="#006666" ></asp:Label>
            </td>
            <td align="center"><strong>&nbsp;:&nbsp;</strong></td>
            <td align="left" style="padding-left:35px;" valign="top">
             <asp:TextBox ID="Txtconfirmpwd" runat="server" Width="200px" TextMode="Password" Font-Size="15px"/>
              <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="Txtconfirmpwd" Text="*"  ValidationGroup="vg1" />
              <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="Txtconfirmpwd" ControlToCompare="Txtnewpwd" ValidationGroup="vg1" Text="Password must be match">*</asp:CompareValidator>
            </td>
            </tr>
            <tr>
            <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
            <td  colspan="3" align="center">
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ValidationGroup="vg1" Width="57px" Height="23px"
                    ImageUrl="admin/images/save.png" onclick="ImageButton1_Click"
                />&nbsp; &nbsp;
                 <asp:ImageButton ID="ImageBtncancel" runat="server" Width="57px" Height="23px" 
                    ImageUrl="admin/images/cancel.png" onclick="ImageBtncancel_Click1" 
                />
            </td>
            </tr>
            </table>
        </asp:Panel>
        
</div>
</asp:Content>

