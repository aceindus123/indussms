<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clients.aspx.cs" Inherits="admin_Users" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Users : :</title>
       <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" language="javascript">
           function confirmMessageDelete(frm) {
               for (i = 0; i < frm.length; i++) {
                   if (frm.elements[i].checked) {
                       return confirm("Are you sure you want to delete the selected record?");
                       return true;
                   }
               }
               alert('select atleast one Checkbox for Delete!');
               return false;
           }
</script>

  <style type="text/css">

        .style2
        {
            height: 35px;
            text-align: right;
            width: 27%;
            color: Black;
            font-family: Segoe UI;
        }
    </style>
    <style type="text/css">
         .simple1 
    { 
      text-decoration:none;
    } 
    .simple1:hover 
    { 
     text-decoration:underline;
    } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager> 
         <div align="center">
          <br />
            <head:header ID="head1" runat="server" />
            <br /><br />
             <table>
                            <tr><td align="center" id="View" runat="server" >
                                <font size="5" color="#00277a"><strong>Clients List  </strong></font></td>
                                
                                <td align="right"><asp:Label ID="CreateClient"
                                 runat="server" Text="Create Client" Visible="false" ForeColor="#00277a" Font-Size="22px" Font-Bold="true"></asp:Label><asp:Button ID="btn1" runat="server" Text="Create User" 
                                        onclick="btn1_Click" /> </td>
                            </tr>
                            <tr><td></td></tr>

                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px" colspan="2">            
                       <asp:GridView ID="gvusers" runat="server"   Width="1000px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                                ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                                ><%--onrowdatabound="RowDataBound"--%>
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Uid</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>'  /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Fast Name</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate>
                                  <asp:LinkButton ID="linkname" runat="server" Font-Underline="false" CommandArgument='<%#Eval("rid") %>' OnCommand="ListName" Text='<%# Eval("fname") %>'></asp:LinkButton>
                               
                                 
                                  </ItemTemplate>                     
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>EMail</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>PassWord</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpwd" runat="server" Text='<%# Eval("password") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>phno</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpno" runat="server" Text='<%# Eval("phno") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Register Date</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblpdate" runat="server" Text='<%# Eval("pdate") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                         <asp:TemplateField>
                         <HeaderTemplate>Status</HeaderTemplate>
                         <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                         <ItemTemplate>
                             <asp:LinkButton ID="linkactive" runat="server" Font-Underline="false"  Text='<%# Eval("txtstatus") %>' CommandArgument='<%#Eval("rid") %>' OnCommand="ListName1"></asp:LinkButton></ItemTemplate>
                         <%--    <asp:LinkButton ID="linkdeactive" runat="server" Font-Underline="false" Visible="false" OnClick="Active">Deactive</asp:LinkButton></ItemTemplate>--%>
                         </asp:TemplateField>

                         <asp:TemplateField>
                         <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                         <ItemTemplate>
                             <asp:LinkButton ID="lnkdelete" runat="server" Font-Underline="false"  OnClick="Active1" OnClientClick="return confirm('are you sure you want to delete this')">Delete</asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                   </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>

                <br />
                <table id="createuser" runat="server" visible="false">
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
                     <td></td>
                <td  align="left"  style="padding-left:15%;">
                
                <asp:ImageButton  ID="Create" ToolTip="Submit" runat="server"   
                        ImageUrl="~/images/submit1r.png" ValidationGroup="RegForm" 
                        onclick="Create_Click" />
              <asp:ImageButton  ID="btncancel" runat="server" ImageUrl="~/images/cancel3.png" 
                        onclick="btncancel_Click" />

                <asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="RegForm" ShowMessageBox="True" ShowSummary="False"/>
                
                 </td>
                </tr>
                </table>
        
        </div>

        <input id="Hid_Sno" type="hidden" name="hddclick" runat="server" />
         <asp:ModalPopupExtender ID="ModalPopup1"  runat="server" TargetControlID="Hid_Sno" CancelControlID="btnimcan" ViewStateMode="Disabled" PopupControlID="panview" DropShadow="true" BackgroundCssClass="Modalpopup">
                                  </asp:ModalPopupExtender>
           <asp:Panel ID="panview" runat="server" HorizontalAlign="Center">
                                  <table width="200%" bgcolor="#33ccff" align="center">
                                  <tr><td align="right">
                                  <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
                                  </table>
                                  <table width="200%" bgcolor="white" align="center">
                                  <tr><td></td><td></td></tr>
                                  <tr><td id="Td1" runat="server" align="center" colspan="2"><br />
                                  <font size="4" color="#00277a"><strong><u>View User Details For ' <%# Eval("fname") %> '</u></strong></font>
                                  </td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>User Id:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtid" runat="server" ReadOnly="true"  Text='<%# Eval("rid") %>' /></td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>First Name:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtfname" runat="server"  Text='<%# Eval("fname") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Last Name:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtlname" runat="server"  Text='<%# Eval("lname") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Email Id:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtmail" runat="server"  Text='<%# Eval("email") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Pass Word:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtpwd" runat="server"  Text='<%# Eval("password") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Phone Number:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtphno" runat="server"  Text='<%# Eval("phno") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Company Url:</strong></td>
                                  <td align="left"><asp:TextBox ID="txturl" runat="server"  Text='<%# Eval("companyurl") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td align="right"><strong>Register Date:</strong></td>
                                  <td align="left"><asp:TextBox ID="txtpdate" runat="server"  Text='<%# Eval("pdate") %>' /></td>
                                  </tr><tr><td colspan="2"><br /></td></tr>
                                  <tr><td colspan="2">
                                        <asp:Button ID="btnupdate" runat="server" Text="Update"  OnClick="btnupdate_click"/> </td></tr>
                                  <tr><td colspan="2"><br /></td></tr>
                                  </table>
                                  </asp:Panel>
    </form>
</body>
</html>
