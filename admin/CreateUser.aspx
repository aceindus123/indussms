<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="admin_CreateUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ad1" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title> : :  Admin : Create User : :</title>
  

<link href="css/style.css" rel="stylesheet" type="text/css" />
 <link type="text/css" href="css/menu.css" rel="stylesheet" />
  <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    <!-- stylesheets -->
	<link rel="stylesheet" type="text/css" href="css/tabstyle.css" />	
	
	<!-- javascript -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.tools.min.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
   
            <script language="Javascript" type="text/javascript">
                Users_Information
                function isNumberKey(evt) {
                    var charCode = (evt.which) ? evt.which : event.keyCode
                    if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
                        return false;

                    return true;
                }
       
    </script>
    <script type="text/javascript" language="javascript">
        function selectOne(frm) {
//            return false;

            var n = document.getElementById("gvusers").rows.length;
            var i;
            for (i = 2; i <= n; i++) {
                if (i < 10) {
                    if (document.getElementById("gvusers_ctl0" + i + "_CheckBoxreq").checked == true) {
                        return true;
                    }


                }

                else {
                    if (document.getElementById("gvusers_ctl" + i + "_CheckBoxreq").checked == true) {
                        return true;
                    }

                }
            }

            alert('select atleast one Checkbox');
            return false;

        }
        
</script>
<script type="text/javascript" language="javascript">
    function selectOneenable(frm) {
        for (i = 0; i < frm.length; i++) {
            if (frm.elements[i].checked) {
                return true;
            }
        }
        alert('select atleast one Checkbox to Activate the Client!');
        return false;
    }
</script>

<script type="text/javascript" language="javascript">
    function selectOnedisable(frm) {
        for (i = 0; i < frm.length; i++) {
            if (frm.elements[i].checked) {
                return true;
            }
        }
        alert('select atleast one Checkbox to Deactivate the Client!');
        return false;
    }
</script>
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
    <script language="javascript" type="text/javascript">

        function alertdelete12() {
            alert("You don't have rights to done this task !!!");
        }    
    </script>
    <script language="javascript" type="text/javascript" >
        function Sample() {
            var n = document.getElementById("gvusers").rows.length;
            var i;
            var j = 0;
            for (i = 2; i <= n; i++) {
                if (i < 10) {
                    if (document.getElementById("gvusers_ctl0" + i + "_CheckBoxreq").checked == true) {
                        if (j > 0) {
                            alert('you can select only one...');
                            document.getElementById("gvusers_ctl0" + i + "_CheckBoxreq").checked = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
                else {
                    if (document.getElementById("gvusers_ctl" + i + "_CheckBoxreq").checked == true) {
                        if (j > 0) {
                            alert('you can select only one...');
                            document.getElementById("gvusers_ctl0" + i + "_CheckBoxreq").checked = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
            }
        }
</script>
    
<style type="text/css">
       .modalBackground
       {  
    	background-color: Gray;  
    	filter: alpha(opacity=50);  
    	opacity: 0.50;
       }
       .updateProgress
       {  
       	border-width: 1px; 
        border-style: solid; 
        background-color: White;  
        position: absolute;  
        width: 180px;  
        height: 65px;
       }
       #gvusers td
        {
        	border:0.1px solid #CCCCCC;
        }
        #gvusers th
        {
        	border-right:0.1px solid #CCCCCC;
        }
         .modalBackground
        {  
        	background-color: Gray;  
        	filter: alpha(opacity=50);  
        	opacity: 0.50;
        }
       .updateProgress
       {  
       	border-width: 1px; 
        border-style: solid; 
        background-color: White;  
        position: absolute;  
        width: 180px;  
        height: 65px;
       }  
     
    </style>


</head>
<body>
    <form id="form1" runat="server">

       <div align="center">
    <br />
               <head:header ID="Header1" runat="server" />
        <div class="content">
             <br /><br /><br />
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                     <div id="createuser1" runat="server">
                                           
                       <table border="0" width="100%">
                        <tr>
                            <td>
                                <table width="100%" border="0" id="create" runat="server">                    
                                  
                                    <tr>
                                        <td colspan="6" align="center">                                                
                                            <font size="5" color="#0e4860"><strong>Create User</strong></font>

                                        </td>
                                    </tr>
                                    <tr>
                                    <td></td>
                                    </tr>
                                    <tr><td colspan="6" style="height:25px" ></td></tr>

                                    <tr>
                                        <td class="datab" align="right" width="25%" height="30px" style="margin-top:-10px" valign="top" >
                                            Full Name
                                        </td>
                                        <td width="5%" style="margin-top:-5"  valign="top" >:</td>
                                        <td align="left" width="20%"  style="margin-top:-5px"  valign="top">
                                            <asp:TextBox ID="txtFName" runat="server" Width="140px" ></asp:TextBox>
                                        </td>

                                        <td class="datab" align="right" width="10%" style="margin-top:-10px"  >
                                           User Name
                                        </td>
                                        <td width="5%" style="margin-top:-5" valign="top" >:</td>
                                        <td align="left" width="35%" valign="top" >
                                            <asp:TextBox ID="txtLName" runat="server" Width="140px" 
                                                ontextchanged="txtLName_TextChanged" AutoPostBack="true"></asp:TextBox>
                                             <asp:Label ID="lblmsg" runat="server" Width="200px" ></asp:Label>
                                        </td>
                                       
                                           
                                       
                                    </tr>  
                                     
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px"> 
                                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" 
                                                ErrorMessage="Please enter First Name" ControlToValidate="txtFName" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" 
                                                ControlToValidate="txtLName" ErrorMessage="Please enter User Name" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                           Designation
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlUserType" runat="server" Width="140px">
                                             <asp:ListItem Text="Select" Selected="True">Select</asp:ListItem>
                    <asp:ListItem Text="Admin" >Admin</asp:ListItem>
                    <asp:ListItem Text="Web Admin" >Web Admin</asp:ListItem>
                    <asp:ListItem Text="Developer" >Developer</asp:ListItem>
                    <asp:ListItem Text="Analyst" >Analyst</asp:ListItem>
                    <asp:ListItem Text="Sales" >Sales</asp:ListItem>
                    <asp:ListItem Text="Customer Service">Customer Service</asp:ListItem>
                     <asp:ListItem Text="Support" >Support</asp:ListItem>
                    <asp:ListItem Text="Business Development" >Business Development</asp:ListItem>

                                            </asp:DropDownList>                                                                                                                                                  
                                        </td> 
                                         <td class="datab" align="right">
                                           Country
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlCountry" runat="server" Width="140px">
                                            <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                            <asp:ListItem Value="India">India</asp:ListItem>
                                            <asp:ListItem Value="USA">USA</asp:ListItem>
                                            </asp:DropDownList>                                                                                                                                                  
                                        </td>                                         
                                    </tr>                                             
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvddlUserType" runat="server" 
                                                ControlToValidate="ddlUserType" ErrorMessage="Please select designation" 
                                                ValidationGroup="UserIdCreation" InitialValue="Select"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="ddlCountry" ErrorMessage="Please select Country" 
                                                ValidationGroup="UserIdCreation" InitialValue="Select Country"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                            
                                    
                                    <tr>
                                        <td class="datab" align="right">
                                           Password</td>
                                        <td>:</td>
                                        <td align="left">                                        
                                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                                                                                                                              
                                        </td>
                                        <td class="datab" align="right">
                                          Confirm Password
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtconPwd" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvPwd" runat="server" 
                                                ControlToValidate="txtPwd" ErrorMessage="Please enter password" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rftxtconPwd" runat="server" 
                                                ControlToValidate="txtconPwd" ErrorMessage="Please Confirm Password" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator><br />
                                            <asp:CompareValidator ID="cmvalPwd" runat="server" 
                                                ErrorMessage="Please enter password correctly" ControlToCompare="txtPwd" 
                                                ControlToValidate="txtconPwd" ValidationGroup="UserIdCreation"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                           Address
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtAddress" runat="server" Width="140px"></asp:TextBox>                                
                                        </td>  
                                         <td class="datab" align="right">
                                           Mobile
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtMobile" runat="server" Width="140px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>&nbsp;&nbsp; Eg:9xxxxxxxxx                               
                                        </td>                                       
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvtxtAddress" runat="server" 
                                                ControlToValidate="txtAddress" ErrorMessage="Please enter address" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">                                            
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txtMobile" ErrorMessage="Please enter mobile number" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                           Contact Number
                                        </td>
                                        <td>:</td>
                                        <td align="left">                                        
                                            <asp:TextBox ID="txtConNumber" runat="server" onkeypress="return isNumberKey(event)" MaxLength="11" Width="140px"></asp:TextBox>                                                                                                                                                  
                                        </td>
                                        <td class="datab" align="right">
                                           Email Id
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            
                                            <asp:TextBox ID="txtEmailId" runat="server" Width="140px"></asp:TextBox>                                                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvtxtConNumber" runat="server" 
                                                ControlToValidate="txtConNumber" ErrorMessage="Please enter contact number" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                             <asp:RequiredFieldValidator ID="rfvtxtEmailId" runat="server" 
                                                ControlToValidate="txtEmailId" ErrorMessage="Please enter Email Id" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator> <br />
                                            <asp:RegularExpressionValidator ID="rfvEmailid" runat="server" 
                                                 ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx" 
                                                 ControlToValidate="txtEmailId" 
                                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                 ValidationGroup="UserIdCreation"></asp:RegularExpressionValidator>
                                                
                                        </td>
                                    </tr>
                          <tr>
                           <td colspan="6"  width="100%" align="center">
                               <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                  <ContentTemplate> 
                                    <table  width="100%" align="center">
                                      <tr>
                                        <td width="15%">
                                              <asp:Label ID="lblclients" runat="server" Text="Clients" Font-Size="13px"></asp:Label>
                                               <asp:RadioButton ID="rdclientsyes" runat="server" Text="Yes"  GroupName="clients" Font-Size="12px" OnCheckedChanged="clientcheckedchanged" AutoPostBack="true" />
                                                <asp:RadioButton ID="rdclientsno" runat="server" Text="No" Checked="true"  GroupName="clients" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged1" /> &nbsp;&nbsp;&nbsp;&nbsp;
                                         </td>

                                          <td width="15%">
                                               Reports<asp:RadioButton ID="rdJobseekersyes" runat="server" Text="Yes"  GroupName="jobseeker"  Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged2"/>
                                               <asp:RadioButton ID="rdJobseekersno" runat="server" Text="No" Checked="true"  GroupName="jobseeker"  Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged3"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                          </td>
    
                                         <td width="15%"> 
                                               Missed Call<asp:RadioButton ID="rdpostjobsyes" runat="server" Text="Yes"   GroupName="post" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged4"/>
                                                <asp:RadioButton ID="rdpostjobsno" runat="server" Text="No" Checked="true"  GroupName="post" Font-Size="12px"  AutoPostBack="true" OnCheckedChanged="clientcheckedchanged5"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                          </td>
     
                                        <td width="15%"> 
                                              <asp:Label ID="Label3" runat="server" Text="Support" Font-Size="13px"></asp:Label>
                                             <asp:RadioButton ID="rdsupportyes" runat="server" Text="Yes"  GroupName="new" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged6" />
                                            <asp:RadioButton ID="rdsupportno" runat="server" Text="No" Checked="true"  GroupName="new" Font-Size="12px"  AutoPostBack="true" OnCheckedChanged="clientcheckedchanged7"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
    
                                        <td width="15%">   Offers<asp:RadioButton ID="rdresumeyes" runat="server" Text="Yes"  GroupName="buy" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged8"/>
                                              <asp:RadioButton ID="rdresumeno" runat="server" Text="No" Checked="true" GroupName="buy" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged9"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
       
                                         <td width="15%"> 
                                              Permissions<asp:RadioButton ID="rdfairyes" runat="server" Text="Yes" GroupName="Post Ads" Font-Size="12px" AutoPostBack="true"  OnCheckedChanged="clientcheckedchanged10"/>
                                                <asp:RadioButton ID="rdfairno" runat="server" Text="No" Checked="true" GroupName="Post Ads" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged11" />
                                          </td>
                            </tr>
       </table>
                                </ContentTemplate>
                               </asp:UpdatePanel>
                            </td>
                        </tr>

                       
                                    <tr>
                                      <td  colspan="6"  width="100%" align="center">
                                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate> 
                                        <table  width="100%" align="center">
                                           <tr>
                                             <td width="15%" valign="top">
                                             <table id="1">
                                                <tr id="SelectAll" runat="server" >
                                                  <td>
                                                    <asp:CheckBox ID="chkselectall" runat="server"  AutoPostBack="true"
                                                          oncheckedchanged="chkselectall_CheckedChanged"  />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="clientview" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chkview" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chkview_CheckedChanged" />&nbsp; &nbsp;View
                                                  </td>
                                                </tr>
                                                 <tr id="edit" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chkedit" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chkedit_CheckedChanged" />&nbsp; &nbsp;Update</td>
                                                </tr>
                                                                                        
                                                 <tr id="delete" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chkdelete_CheckedChanged" />&nbsp; &nbsp;Delete
                                                  </td>
                                                </tr>
                                      
                                                <tr id="generate" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chkgen" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chkcreate1_CheckedChanged" />&nbsp; &nbsp;Status
                                                  </td>
                                                </tr>

                                             </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="2">
                                                <tr id="chk1" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox1_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="chk2" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox2_CheckedChanged" />&nbsp; &nbsp;Normal Reports
                                                  </td>
                                                </tr>
                                               
                                                 <tr id="chk3" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox4_CheckedChanged"  />&nbsp; &nbsp;Schedule Reports
                                                  </td>
                                                </tr>
                                                 <tr id="chk4" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox5" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox5_CheckedChanged"/>&nbsp; &nbsp;Voice Repots
                                                  </td>
                                                </tr>
                                                 <tr id="chk5" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox6" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox6_CheckedChanged" />&nbsp; &nbsp;Download
                                                  </td>
                                                </tr>
                                        <%--        <tr id="chk6" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox31" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox31_CheckedChanged" />&nbsp; &nbsp;Email
                                                  </td>
                                                </tr>--%>

                                             </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="3">
                                                <tr id="chk7" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox7_CheckedChanged"  />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="chk8" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox8" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox8_CheckedChanged" />&nbsp; &nbsp;View
                                                  </td>
                                                </tr>
                                                 <tr id="chk9" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox9" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox9_CheckedChanged" />&nbsp; &nbsp;Update
                                                  </td>
                                                </tr>
                                                 
                                             </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="4">
                                                <tr id="chk13" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="CheckBox13" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox13_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                <tr id="chk15" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox15" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox15_CheckedChanged"/>&nbsp; &nbsp;Help
                                                  </td>
                                                </tr>
                                                                                         <tr id="chk17" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox17" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox17_CheckedChanged"/>&nbsp; &nbsp;Update
                                                  </td>
                                                </tr>
                                                 <tr id="Tr2" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox3" runat="server"  AutoPostBack="true" oncheckedchanged="CheckBox3_CheckedChanged1" 
                                                         />&nbsp; &nbsp;Exception
                                                  </td>
                                                </tr>
                                                 <tr id="Tr5" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox11" runat="server"  AutoPostBack="true" oncheckedchanged="CheckBox11_CheckedChanged1" 
                                                         />&nbsp; &nbsp;Responce
                                                  </td>
                                                </tr>
                                                

                                             </table>
                                            
                                         </td>
                                                <td width="15%" valign="top">
                                             <table id="5">
                                                <tr id="chk19" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="CheckBox19" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox19_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="chk20" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox20" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox20_CheckedChanged" />&nbsp; &nbsp;Create
                                                  </td>
                                                </tr>
                                                <tr id="chk21" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox10" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox10_CheckedChanged"/>&nbsp; &nbsp;Status
                                                  </td>
                                                </tr>
                                          
                                                 <tr id="chk22" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox24" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox24_CheckedChanged" />&nbsp; &nbsp;Delete
                                                  </td>
                                                </tr>

                                             </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="6">
                                                <tr id="chk23" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="CheckBox25" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox25_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="chk24" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox26" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox26_CheckedChanged" />&nbsp; &nbsp;View</td>
                                                </tr>
                                                 <tr id="chk25" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox27" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox27_CheckedChanged"/>&nbsp; &nbsp;Forward
                                                  </td>
                                                </tr>
                                                 <tr id="chk26" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox28" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox28_CheckedChanged"/>&nbsp; &nbsp;Accept
                                                  </td>
                                                </tr>
                                                 <tr id="chk27" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox29" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="CheckBox29_CheckedChanged" />&nbsp; &nbsp;Delete
                                                  </td>
                                                </tr>
                                                
                                             </table>
                                            
                                             </td>
                                           </tr>
                                        </table><br />
                                        </ContentTemplate>
       </asp:UpdatePanel>
                                      </td>
                                    </tr>
                                           
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                         <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="4" >
                                           <asp:Button ID="btn1" runat="server" Text="Create" Font-Size="15px"   
                                                ValidationGroup="UserIdCreation" onclick="btn1_Click"/>

                                                  <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Size="15px" 
                                                onclick="btncancel_Click"  /> 
                                               
                                        </td>
                                    </tr>

                                </table>
                                <br />
                            </td>
                        </tr>
                    </table >
                     </div>
                     <br />
                     <div id="gvdisplay" runat="server">
                       <table width="100%" >
                            <tr><td align="center" id="View" runat="server">
                                <font size="5" color="#00277a"><strong>Manage Users List</strong></font>
                              </td>
                            </tr>
                            <tr align="left">
                               <td height="10px" style="padding-left:0px; padding-top:20px">
                        <table width="100%"  runat="server">
                        <tr><td width="75%">
                         <asp:Button ID="editbtn" runat="server" Text="View/Edit" onclick="editbtn_Click"  OnClientClick="return selectOne(this.form)"/>&nbsp;
                         <asp:Button ID="deletebtn" runat="server" Text="Delete" onclick="deletebtn_Click" OnClientClick="return confirmMessageDelete(this.form)"/>&nbsp;  
                         <asp:Button ID="disablebtn" runat="server" Text="Deactivate" onclick="disablebtn_Click" OnClientClick="return selectOnedisable(this.form)" />&nbsp;
                         <asp:Button ID="enablebtn" runat="server" Text="Activate" onclick="enablebtn_Click" OnClientClick="return selectOneenable(this.form)"/>  &nbsp;
                         </td>
                         <td align="right">
                         <asp:Button ID="lnkcreate" runat="server" ForeColor="Blue"  Text="Create User" Font-Size="Medium" onclick="lnkcreate_Click1" ></asp:Button>                       
                         </td>
                       </tr></table>
                
                        </td></tr>
                        <tr id="View1" runat="server"><td height="100px" style="padding-left:0px; padding-right:0px">                        
                       <asp:GridView ID="gvusers" runat="server"   Width="1000px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"  DataKeyNames="id"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="grdView_PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                                >
                   
                                  <Columns>
                        <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxreq" runat="server" onclick="Sample();" />
                           
                            </ItemTemplate>
                     </asp:TemplateField>
<%--
                          <asp:HyperLinkField DataTextField="id" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="User"    />--%>
                    <asp:BoundField DataField="username" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="User Name"    />            
                    <asp:BoundField DataField="password" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Password"    />            

                        <asp:BoundField DataField="FName"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Full Name" SortExpression="FName" />
                        <asp:BoundField DataField="usertype"  ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Usertype" />
                        <asp:BoundField DataField="Country"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Country"/>
                        <asp:BoundField DataField="Address"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Address"/>
                        <asp:BoundField DataField="mobile"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Mobile"/>
                     <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center" >
                       <HeaderTemplate>
                         Status
                         </HeaderTemplate>
                            <ItemTemplate >
                                <asp:Label ID="lblstatus"  ForeColor="Gray" runat="server"   Text='<%#Eval("Status")%>'></asp:Label>
                            </ItemTemplate>
                         </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                        </td></tr>
                        <tr>
                            <td>
                                <asp:Label ID="checked_label" runat="server"></asp:Label>&nbsp; 
                                <asp:Label ID="lblId" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    </div>
             
             <input type="button"  style="display: none;" id="btndummy" runat="server" />
             <ad1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" 
             PopupControlID="pnledit" DropShadow="false" BackgroundCssClass="modalBackground" CancelControlID="btnclose">
                </ad1:ModalPopupExtender>
           <div>    
              <asp:Panel runat="server" ID="pnledit" Width="1000px" Height="450px" BorderColor="Black"  BackColor="white" ScrollBars="Vertical"
                    BackImageUrl="~/admin/images/edti_user_bg .png">
             <table width="100%"> 
                <tr>
                  <td colspan="6">
                    <table  align="right" >
                      <tr>
                        <td width="100%" align="right" style="padding-right:10px; padding-top:8px;" valign="middle"  >
                             <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Larger" Width="30px" Height="30px"/>
                        </td>
                     </tr>
                    </table>
                </td>
             </tr>
      <tr><td><br /></td></tr>
             <tr>
                <td class="datab66" align="right" width="20%">
                    First Name
                </td>
               <td width="5%">:</td>
               <td align="left" width="20%">
                    <asp:TextBox ID="txtedfname" runat="server" Width="140px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txtedfname" ErrorMessage="Please Enter First name" 
            ValidationGroup="UserIdCreation1" ToolTip="Please Enter First name" Display="Dynamic">*</asp:RequiredFieldValidator>  
        </td>
        <td class="datab66" align="right" width="20%">
           User Name
        </td>
        <td width="5%">:</td>
        <td align="left" width="30%">
            <asp:TextBox ID="txtedlname" runat="server" Width="140px" 
                ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="txtedlname" ErrorMessage="Please Enter User name" 
            ValidationGroup="UserIdCreation1" ToolTip="Please Enter User name" Display="Dynamic">*</asp:RequiredFieldValidator>  
        </td>
        </tr>   
             <tr>
               <td class="datab66" align="right">
                  Designation
                </td>
               <td>:</td>
                <td align="left">
            <asp:DropDownList ID="ddleddesgn" runat="server" Width="140px">
                     <asp:ListItem Text="Select" >Select</asp:ListItem>
                    <asp:ListItem Text="Admin" >Admin</asp:ListItem>
                    <asp:ListItem Text="Web Admin" >Web Admin</asp:ListItem>
                    <asp:ListItem Text="Developer" >Developer</asp:ListItem>
                    <asp:ListItem Text="Analyst" >Analyst</asp:ListItem>
                    <asp:ListItem Text="Sales" >Sales</asp:ListItem>
                    <asp:ListItem Text="Customer Service">Customer Service</asp:ListItem>
                     <asp:ListItem Text="Support" >Support</asp:ListItem>
                    <asp:ListItem Text="Business Development" >Business Development</asp:ListItem>
            </asp:DropDownList>    
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="ddleddesgn" ErrorMessage="Please select Designation" 
            ValidationGroup="UserIdCreation1" ToolTip="Please select Designation" Display="Dynamic" InitialValue="Select">*</asp:RequiredFieldValidator>                                                                                                                                               
        </td> 

         <td class="datab66" align="right">
           Country
        </td>
        <td>:</td>
        <td align="left">
            <asp:DropDownList ID="ddledcountry" runat="server" Width="140px" 
              >
                <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                <asp:ListItem Value="India">India</asp:ListItem>
                <asp:ListItem Value="USA">USA</asp:ListItem>
            </asp:DropDownList>   
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="ddledcountry" ErrorMessage="Please select Country" 
             ValidationGroup="UserIdCreation1" InitialValue="Select Country">*</asp:RequiredFieldValidator>                                                                                                                                               
        </td>                                         
    </tr>                                              
             <tr>
        <td class="datab66" align="right">
           Address
        </td>
        <td>:</td>
        <td align="left">
            <asp:TextBox ID="txtedaddress" runat="server" Width="140px"></asp:TextBox> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ControlToValidate="txtedaddress" ErrorMessage="Please Enter Address" 
            ValidationGroup="UserIdCreation1" ToolTip="Please Enter Address" Display="Dynamic">*</asp:RequiredFieldValidator>  
        </td>  
         <td class="datab66" align="right">
           Mobile
        </td>
        <td>:</td>
        <td align="left">
            <asp:TextBox ID="txtedmob" runat="server" Width="140px" MaxLength="10"></asp:TextBox>   
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="txtedmob" ErrorMessage="Please Enter Mobile Number" 
            ValidationGroup="UserIdCreation1" ToolTip="Please Enter Mobile Number" Display="Dynamic">*</asp:RequiredFieldValidator>  
        </td>                                       
    </tr>
             <tr>
               <td class="datab66" align="right">
           Contact Number
        </td>
        <td>:</td>
        <td align="left">                                        
            <asp:TextBox ID="txtedcontact" runat="server" onkeypress="return isNumberKey(event)" MaxLength="11" Width="140px"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="txtedcontact" ErrorMessage="Please Enter Contact Number" 
            ValidationGroup="UserIdCreation1" ToolTip="Please Enter Contact Number" Display="Dynamic">*</asp:RequiredFieldValidator>  
        </td>
        <td class="datab66" align="right">
           Email Id
        </td>
        <td>:</td>
        <td align="left">
            <asp:TextBox ID="txtedmail" runat="server" Width="140px" Enabled="false"></asp:TextBox>                                                                           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="txtedmail" ErrorMessage="Please Enter Email" 
            ValidationGroup="UserIdCreation1" ToolTip="Please Enter Email" Display="Dynamic">*</asp:RequiredFieldValidator>  
        </td>
    </tr>
             <tr>
                <td>
                 &nbsp;
                </td>
             </tr>
             <tr> <td colspan="6"  width="100%" align="center">
                                     <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                             <ContentTemplate> 
      <table  width="100%" align="center">
    <tr><td width="15%">
              <asp:Label ID="Label6" runat="server" Text="Clients" Font-Size="13px"></asp:Label>
               <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes"  GroupName="clients" Font-Size="12px" OnCheckedChanged="clientcheckedchanged20" AutoPostBack="true" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="No" Checked="true"  GroupName="clients" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged21" /> &nbsp;&nbsp;&nbsp;&nbsp;</td>

         <td width="15%"> Reports<asp:RadioButton ID="RadioButton3" runat="server" Text="Yes"  GroupName="jobseeker"  Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged22"/>
                <asp:RadioButton ID="RadioButton4" runat="server" Text="No" Checked="true"  GroupName="jobseeker"  Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged23"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
            <td width="15%">  Missed call<asp:RadioButton ID="RadioButton5" runat="server" Text="Yes"   GroupName="post" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged24"/>
                <asp:RadioButton ID="RadioButton6" runat="server" Text="No" Checked="true"  GroupName="post" Font-Size="12px"  AutoPostBack="true" OnCheckedChanged="clientcheckedchanged25"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
     
           <td width="15%">   Support<asp:RadioButton ID="RadioButton7" runat="server" Text="Yes"  GroupName="new" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged26" />
                <asp:RadioButton ID="RadioButton8" runat="server" Text="No" Checked="true"  GroupName="new" Font-Size="12px"  AutoPostBack="true" OnCheckedChanged="clientcheckedchanged27"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
       <td width="15%">   Offers<asp:RadioButton ID="RadioButton9" runat="server" Text="Yes"  GroupName="buy" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged28"/>
                <asp:RadioButton ID="RadioButton10" runat="server" Text="No" Checked="true" GroupName="buy" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged29"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
       
           <td width="15%">   Permissions<asp:RadioButton ID="RadioButton11" runat="server" Text="Yes" GroupName="Post Ads" Font-Size="12px" AutoPostBack="true"  OnCheckedChanged="clientcheckedchanged30"/>
                <asp:RadioButton ID="RadioButton12" runat="server" Text="No" Checked="true" GroupName="Post Ads" Font-Size="12px" AutoPostBack="true" OnCheckedChanged="clientcheckedchanged31" />
                           </tr>
       </table>
       </ContentTemplate>
       </asp:UpdatePanel></td>
                </tr>  
             <tr>
                                      <td  colspan="6"  width="100%" align="center">
                                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                             <ContentTemplate> 
                                        <table  width="100%" align="center">
                                           <tr>
                                             <td width="15%" valign="top">
                                             <table id="Table1" >
                                                <tr id="Tr1" runat="server" >
                                                  <td>
                                                    <asp:CheckBox ID="chk50" runat="server"  AutoPostBack="true"
                                                          oncheckedchanged="chk50_CheckedChanged"  />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                     <tr id="Tr8" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk57" runat="server" AutoPostBack="true" 
                                                            oncheckedchanged="chk57_CheckedChanged"/>&nbsp; View</td>
                                                </tr>

                                                 <tr id="Tr3" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk52" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk52_CheckedChanged" />&nbsp; &nbsp;Update
                                                  </td>
                                                </tr>
                                                 <tr id="Tr4" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk53" runat="server"  AutoPostBack="true" 
                                                           oncheckedchanged="chk53_CheckedChanged"/>&nbsp; &nbsp;Status
                                                  </td>
                                                </tr>
                                                <tr id="Tr6" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk55" runat="server" AutoPostBack="true" 
                                                           oncheckedchanged="chk55_CheckedChanged" />&nbsp; &nbsp;Delete
                                                  </td>
                                                </tr>
                                          
                                            

                                             </table>
                                            
                                             </td>

                                             <td width="15%" valign="top">
                                             <table id="Table2">
                                                <tr id="Tr10" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="chk59" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk59_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="Tr11" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk60" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk60_CheckedChanged" />&nbsp; &nbsp;Normal Reports
                                                  </td>
                                                </tr>
                                               
                                                 <tr id="Tr12" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk61" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk61_CheckedChanged"  />&nbsp; &nbsp;Schedule Reports
                                                  </td>
                                                </tr>
                                                 <tr id="Tr13" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk62" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk62_CheckedChanged"/>&nbsp; &nbsp;Voice Reports
                                                  </td>
                                                </tr>
                                                 <tr id="Tr14" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk63" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk63_CheckedChanged" />&nbsp; &nbsp;Download
                                                  </td>
                                                </tr>
                                         </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="Table3">
                                                <tr id="Tr15" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="chk64" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk64_CheckedChanged"  />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="Tr16" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk65" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk65_CheckedChanged" />&nbsp; &nbsp;View
                                                  </td>
                                                </tr>
                                                 <tr id="Tr17" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk66" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk66_CheckedChanged" />&nbsp; &nbsp;Update
                                                  </td>
                                                </tr>
                                                 
                                                
                                             </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="Table4">
                                                <tr id="Tr21" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="chk70" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk70_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 
                                                 <tr id="Tr22" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk71" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk71_CheckedChanged"/>&nbsp; &nbsp;Help</td>
                                                </tr>
                                                
                                                 <tr id="Tr23" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk72" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk72_CheckedChanged"/>&nbsp; &nbsp;Update
                                                  </td>
                                                </tr>
                                                  <tr id="Tr7" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox12" runat="server"  AutoPostBack="true" oncheckedchanged="CheckBox12_CheckedChanged" 
                                                          />&nbsp; &nbsp;Exception
                                                  </td>
                                                </tr>
                                                  <tr id="Tr9" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="CheckBox14" runat="server"  AutoPostBack="true" oncheckedchanged="CheckBox14_CheckedChanged" 
                                                          />&nbsp; &nbsp;Responce
                                                  </td>
                                                </tr>
                                                

                                             </table>
                                            
                                         </td>
                                                <td width="15%" valign="top">
                                             <table id="5">
                                                <tr id="Tr24" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="chk73" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk73_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="Tr25" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk74" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk74_CheckedChanged" />&nbsp; &nbsp;create
                                                  </td>
                                                </tr>
                                                <tr id="Tr26" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk75" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk75_CheckedChanged"/>&nbsp; &nbsp;Status
                                                  </td>
                                                </tr>
                                          
                                                 <tr id="Tr27" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk76" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk76_CheckedChanged" />&nbsp; &nbsp;Delete
                                                  </td>
                                                </tr>

                                             </table>
                                            
                                             </td>
                                                <td width="15%" valign="top">
                                             <table id="6">
                                                <tr id="Tr28" runat="server">
                                                  <td>
                                                    <asp:CheckBox ID="chk77" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk77_CheckedChanged" />&nbsp; &nbsp;Select All
                                                  </td>
                                                </tr>
                                                 <tr id="Tr29" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk78" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk78_CheckedChanged" />&nbsp; &nbsp;View
                                                  </td>
                                                </tr>
                                                 <tr id="Tr30" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk79" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk79_CheckedChanged"/>&nbsp; Forward</td>
                                                </tr>
                                                 <tr id="Tr31" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk80" runat="server"  AutoPostBack="true" 
                                                          oncheckedchanged="chk80_CheckedChanged"/>&nbsp; &nbsp;Accept
                                                  </td>
                                                </tr>
                                                 <tr id="Tr32" runat="server">
                                                  <td>
                                                     <asp:CheckBox ID="chk81" runat="server" AutoPostBack="true" 
                                                          oncheckedchanged="chk81_CheckedChanged" />&nbsp; &nbsp;Delete
                                                  </td>
                                                </tr>
                                                
                                             </table>
                                            
                                             </td>
                                           </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                      </td>
                        </tr>
             <tr>
     
      
      <td align="center" colspan="6">
        <asp:Button ID="btnupdate" runat="server" Text="Update"  
              ValidationGroup="UserIdCreation1" onclick="btnupdate_Click" />&nbsp;&nbsp;&nbsp;

              <asp:Button ID="Button1" runat="server" Text="Cancel"  
               />

      </td>
     
    </tr>
           </table>
       
                    </asp:Panel>         
           </div>
       </div>
    </div>
    </form>
</body>
</html>
