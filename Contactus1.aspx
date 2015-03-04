<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Contactus1.aspx.cs" Inherits="Default3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>

<div class="container">

<table width="100%">
  <tr>
    <td align="center" class="titlecampain1" >
      <h2 >Contact Us</h2>    
    </td>
  </tr>

  <tr>
    <td  align="center">We would be pleased to help you. If you have any queries or want to write a comment or suggestion, you can kindly write in on the form mentioned below.<br />
                           For any further queries, you can also contact us at the information provided below:
   </td>
 </tr>
</table>

<br />

<table width="100%" cellpadding="10px" cellspacing="10px">
  <tr>
      <td align="center" width="455px">
            <asp:UpdatePanel runat="server">
            <ContentTemplate>

               <table width="90%" border="0" style="background-color:#F8F8FF" >
                    <tr bgcolor="green" style="height:30px">
                       <td class="tdhead" colspan="2" align="center">
                          <h3><i>Contact Form</i></h3>
                       </td>
                    </tr>
  
                    <tr>
                      <td class="tdlbl" align="center" >
                         <b>Full Name</b><strong>:</strong>
                      </td>
                       <td align="left">
                          <asp:TextBox id="txtfname" runat="server" CssClass="tdtxt" ></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter fullname" ValidationGroup="ContactForm" ControlToValidate="txtfname"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                           <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtfname" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" >
                           </asp:FilteredTextBoxExtender>
                       </td>
                     </tr>
   
                    <tr>
                      <td class="tdlbl" align="center" >
                         <b>E-Mail</b>&nbsp;<strong>:</strong>
                      </td>
                      <td align="left"><asp:TextBox id="txtEmailid" runat="server" CssClass="tdtxt"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmailid"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtEmailid"
                                               ErrorMessage="Enter valid emailaddress" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="ContactForm"><span style="color:Red">*</span></asp:RegularExpressionValidator>
                      </td>
                    </tr>

                    <tr>
                        <td  class="tdlbl" style="padding-top:5px;" align="center"><b>Address</b>&nbsp;<strong>:</strong></td>
                        <td align="left"><asp:TextBox id="txtAddress" runat="server" CssClass="multxt" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter Address" ControlToValidate="txtAddress"><span style="color:Red">*</span></asp:RequiredFieldValidator></td>
                   </tr>

                    <tr>
                      <td  class="tdlbl" align="center"><b>Country</b>&nbsp;<strong>:</strong></td>
                      <td align="left">
                         <asp:DropDownList id="ddlcountry" runat="server"   CssClass="tdtxt" appenddatabounditems="True"   
                                     AutoPostBack="true" onselectedindexchanged="ddlcountry_SelectedIndexChanged">             
                                            <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                         </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ContactForm" InitialValue="Select Country" ErrorMessage="Enter Country" ControlToValidate="ddlcountry"><span style="color:Red">*</span></asp:RequiredFieldValidator>   
                      </td>
                  </tr>
     
                    <tr>
                     <td class="tdlbl" align="center">
                        <b>State</b>&nbsp;<strong>:</strong>
                      </td>
                     <td align="left">
                          <asp:DropDownList ID="ddlstate" runat="server" appenddatabounditems="True"
                           AutoPostBack="true" onselectedindexchanged="ddlstate_SelectedIndexChanged"  CssClass="tdtxt">
                             <asp:ListItem Value="Select State">Select State</asp:ListItem>
                          </asp:DropDownList>
                    </td>
                 </tr>
        
                    <tr>
                     <td class="tdlbl" align="center">
                         <b>City</b>&nbsp;<strong>:</strong>
                     </td>
                     <td align="left">
                          <asp:DropDownList id="ddlcity" runat="server" Height="25px"  CssClass="tdtxt" appenddatabounditems="True" 
                           onselectedindexchanged="ddlcity_SelectedIndexChanged">
                                       <asp:ListItem Value="Select City">Select City</asp:ListItem>
                          </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="Select City" ValidationGroup="ContactForm" ErrorMessage="Enter city" ControlToValidate="ddlcity"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                      </td>
                  </tr>

                    <tr>
                      <td class="tdlbl" align="center">
                          <b>Zip Code</b><strong>:</strong>
                      </td>
                      <td align="left">
                         <asp:TextBox id="txtzipcode" runat="server" CssClass="tdtxt" MaxLength="5"  Font-Size="14px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter zipcode" ControlToValidate="txtzipcode"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                          <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtzipcode" FilterType="Numbers">
                          </asp:FilteredTextBoxExtender>
                      </td>
                  </tr>
   
                    <tr>
                      <td class="tdlbl"style="padding-top:5px;" align="center">
                         <b>PhoneNumber</b>&nbsp;<strong>:</strong>
                      </td>
                      <td align="left">
                         <asp:TextBox id="txtphno" runat="server" CssClass="tdtxt"  MaxLength="10"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter phonenumber" ControlToValidate="txtphno"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                          <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtphno" FilterType="Numbers">
                          </asp:FilteredTextBoxExtender>
                      </td>
                   </tr>
    
                    <tr>
                      <td  class="tdlbl" style="padding-top:5px;" align="center">
                         <b>Comments</b>&nbsp;<strong>:</strong>
                      </td>
                      <td align="left">
                         <asp:TextBox id="txtcomments" runat="server"  CssClass="multxt" TextMode="MultiLine"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter your comments" ControlToValidate="txtcomments"><span style="color:Red">*</span></asp:RequiredFieldValidator>
                      </td>
                   </tr>

                    <tr>
                     <td align="right">
                          <asp:Button ID="btnsubmit" runat="server" ValidationGroup="ContactForm" 
                          Text="Submit" onclick="btnsubmit_Click" />&nbsp;&nbsp;
                     </td>
              
                     <td>
                         <asp:Button ID="btnreset" runat="server"
                          Text="Cancel" onclick="btnreset_Click" />
                     </td>
                 </tr>

                    <tr>
                       <td align="center" valign="middle" style="padding-right:10px;"  colspan="2">
                          <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="ContactForm" ShowMessageBox="true" ShowSummary="false"/>
                          </td>
                    </tr>

            </table>

            </ContentTemplate>
            </asp:UpdatePanel>
      </td>

      <td valign="top">
          <table>        
             <tr>
               <td style="padding-top:10px;"><p align="justify" style="font-size:15px;line-height:22px;color:#565656;">Global Head Quarters - USA<br />
                    Indus Group Incorporated,<br />
                1033 Sterling Road, Ste. 204 & 205,<br />
                Herndon-VA-20170. USA.<br />
                Washington DC Metro Area.<br />
                Voice:<font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px ">  <b> 703-957-7829 </b></font> <br />
                Fax:   <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none; line-height:22px"><b>  703-842-8746</b></font><br /><br /><br />


                For general inquiries please email us 	 :<a href="mailto:info@indussms.com"> <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>info@indussms.com</b></font></a><br />
                For Feedback, Please email us  :     <a href="mailto:feedback@indussms.com"> <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>feedback@indussms.com</b></font></a> <br />                        
                <p align="justify" style="font-size:15px;line-height:22px;color:#565656;">For Technical Difficulties, please email us  :   </p>  <a href="mailto:support@indussms.com"> <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>support@indussms.com</b></font></a> <br />                        
                <p align="justify" style="font-size:15px;line-height:22px;color:#565656;">For suggestions and Innovative Ideas to improve the portal, Please email us  : <a href="mailto:webmaster@indussms.com"> <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none;line-height:22px "><b>webmaster@indussms.com</b></font></a> <br />                                 
                <p align="justify" style="font-size:15px;line-height:22px;color:#565656;">For Sales Please email us  :  <a href="mailto:sales@indussms.com"> <font style="font-weight:normal; font-size:12px; color:#1e5784; text-decoration:none; line-height:22px"><b>sales@indussms.com</b></font></a>  
                </p>
            </td>
            </tr>
        </table>
      </td>

 </tr>
</table>

</div>
</asp:Content>

