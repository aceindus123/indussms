<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ad1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Admin : Login : : </title>

    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
 <body >
    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <div class="adminlogo" align="center">
           <img src="images/one.jpg" />
         </div>
    <div style="background-color:#0b2e8c; width:80%;height:10px; margin:0 auto; " align="center"  >
      
    </div>
    <br />
    <br />
  <br />
      <br />
       <div>
          <%-- <table border="0" align="center">
             <tr>
                 <td colspan="2">
                    <img src="images/newsletters.gif" align="left" alt=""/>
                   <asp:Label ID="lablogin" runat ="server" Text="Admin Login"   Font-Bold="True" Font-Names="Arial" Font-Size="14pt"   ForeColor="#666666"></asp:Label>
                </td>
             </tr>
             <tr>
                <td style="height:35px;">
                    <asp:Label ID ="ltrlUserName" Text="User Name :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label>
                   <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="UserID" Text="*" />
                </td>
                 <td>  
                    <asp:TextBox ID="UserID" runat="server" Width="164px" Font-Size="12pt" />        
                 </td>
             </tr>
             <tr>
               <td style="height:35px;">
                   <asp:Label ID="ltrlPwd" runat="server" Text="Password :" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699"></asp:Label>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="Password" Text="*" />
               </td>
               <td>
                   <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="164px" Font-Size="12pt" />        
               </td>           
             </tr>
             <tr>
               <td colspan="2"><br />
                  <div style="float:right;"><asp:ImageButton ID="imgLogin" runat="server" 
                          ImageUrl="~/admin/images/login.png" onclick="Signin_Click"/></div>          
      </td>
   </tr>
   </table>--%>


   <table width="83%" border="0" align="center">
                <tr>
                 <td colspan="2" align="center">
                    <img src="images/newsletters.gif" align="middle" alt=""/>
                   <asp:Label ID="lablogin" runat ="server" Text="Admin Login"   Font-Bold="True" Font-Names="Arial" Font-Size="14pt"   ForeColor="#666666"></asp:Label>
                </td>
             </tr>
             <tr>
               <td></td>
             </tr>
        <tr id="Tr1" runat="server">
          <td  align="right" style="font-size:15px " height="30" > <asp:Label ID ="ltrlUserName" Text="User Type :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label></td>
           <td colspan="4" style="padding-left:15px; line-height:20px;"> 
           <asp:DropDownList ID="ddlUsertype" runat="server" Width="192px" Height="22px" Font-Names="Arial" Font-Size="11pt">
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
                  <asp:RequiredFieldValidator ID="rfvddlUsertype" runat="server" ErrorMessage="Select user type" 
                          ValidationGroup="login" ControlToValidate="ddlUsertype" InitialValue="Select">*</asp:RequiredFieldValidator>
            
          </td>
        </tr>
         <tr id="Tr2" runat="server">
          <td  align="right" style="font-size:15px" height="30"><asp:Label ID ="Label1" Text="Country :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label></td>
           <td colspan="4" style="padding-left:15px;"> 
            <asp:DropDownList ID="ddlCountry" runat="server" Width="192px" Height="22px" Font-Names="Arial" Font-Size="11pt">
                    <asp:ListItem Text="Select" Selected="True">Select</asp:ListItem>
                    <asp:ListItem Text="India" >India</asp:ListItem>
                    <asp:ListItem Text="USA" >USA</asp:ListItem>
                    <asp:ListItem Text="UK" >UK</asp:ListItem>
                    <asp:ListItem Text="Australia" >Australia</asp:ListItem>
                    <asp:ListItem Text="Singapoor" >Singapore</asp:ListItem>
                                                                 
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="rfvddlCountry" runat="server" ErrorMessage="Select country" 
                          ValidationGroup="login" ControlToValidate="ddlCountry" InitialValue="Select">*</asp:RequiredFieldValidator>
          </td>
        </tr>
      
         <tr id="tdjoblogin" runat="server">
          <td height="30" align="right" style="font-size:15px"><asp:Label ID ="Label2" Text="User Name :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label></td>
          <td colspan="4" style="padding-left:15px;"> 
            <asp:TextBox ID="txtuname" runat="server" Width="190px" Height="20px" Font-Names="Arial" Font-Size="11pt"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" Enter User Name" ControlToValidate="txtuname" ValidationGroup="login">*</asp:RequiredFieldValidator>
              <ad1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="true" TargetControlID="txtuname" WatermarkText="Enter User Name" WatermarkCssClass="watermarked">
              </ad1:TextBoxWatermarkExtender>
          </td>
        </tr>
    
          <tr>
          <td align="right" style="font-size:15px"><asp:Label ID ="Label3" Text="Password :" runat ="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#006699" ></asp:Label></td>
          <td colspan="4" valign="top" style="padding-left:15px;">
            <asp:TextBox ID="txtpwd" runat="server" Width="190px" Height="20px" TextMode="Password" Font-Names="Arial" Font-Size="11pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvpwd" ControlToValidate="txtpwd" 
                runat="server" ErrorMessage="Enter the Password" ValidationGroup="login">*</asp:RequiredFieldValidator>
             <ad1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="true" TargetControlID="txtpwd" WatermarkText="Enter Password"  WatermarkCssClass="watermarked">
             </ad1:TextBoxWatermarkExtender>
          </td>
        </tr>
        <tr>
          <td colspan="5" style="padding-top:23px;padding-right:10px" align="center">
               <asp:ImageButton ID="btnlogin" runat="server" ImageUrl="~/admin/images/login.png" Width="65" Height="29" 
                   onclick="btnlogin_Click" ValidationGroup="login" />
          </td>
        </tr>
        </table>
       </div>
    </form>
</body>
</html>
