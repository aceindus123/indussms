<%@ Page Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="FeedBack" Title="A customer feedback is extremely valuable for our growth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content=" Kindly provide your valuable feedback to improve our email marketing services. In turn, your feedback helps to us to serve in a more valuable manner   " />

    <style type="text/css">
      .content{font-family:Verdana, Geneva, sans-serif;font-size:13px;color:#3b4f52;text-decoration:none;outline:none;line-height:18px;}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
        <div align="left" style="width:100%;float:left;vertical-align:top;" class="container">    
            <div align="center" style="width:100%;margin-left:auto;margin-right:auto;vertical-align:middle;border-radius:5px;">

            <table>
             <tr>
      <td  style="background: url(images/feed.png); background-repeat:no-repeat; width:995px; height:70px; padding-top:5px;"  align="right" colspan="4">
            

          <br /><br /> </td>
     </tr>
     <tr>
     <td>
                    <p style="font-family:Arial; font-size:17px;color: #1e5784;" align="center">Your valuable feedback will elevate our team spirit to work even harder for providing well-organized services.</p>
     
     </td>
     </tr>
            </table>
                   <%-- <p style="text-align:center;vertical-align:middle;font-weight:normal; font-size:22px; color:#006600; text-decoration:none; font-family:vani;">Feed Back Form</p>--%>
                  
                      &nbsp;
            </div>
            <div>
                 <table style="width:100%;vertical-align:middle;border-radius:5px; padding-top:5px;" >
                        <tr>
                            <td align="left" colspan="1" width="27%" valign="middle"> 
                                <img alt="" src="images/feedback.png"/>
                            </td>
                            <td align="left" valign="middle" width="73%">
                                <table width="100%" align="left" valign="top" cellspacing="10px">
                                  <tr>
                                    <td><b>Your Name </b></td>
                                    <td><b>:</b></td>
                                    <td>
                                    <asp:TextBox id="txtfname" runat="server" style="width:300px; height:20px;" Font-Size="12"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter fullname" ValidationGroup="ContactForm" ControlToValidate="txtfname">*</asp:RequiredFieldValidator>
                                    </td>
                                  </tr>

                        
                                  <tr>
                                    <td><b>E-Mail 
                                        Id </b></td>
                                    <td ><b>:</b>&nbsp;</td>
                                    <td >
                                       <asp:TextBox id="txtEmailid" runat="server" style="width:300px; height:20px;" Font-Size="12"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmailid">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtEmailid"
                                              ErrorMessage="Enter valid emailaddress" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="ContactForm">*</asp:RegularExpressionValidator>
                                    </td>
                                  </tr>


                                  <tr>
                                    <td ><b>Subject </b></td>
                                    <td ><b>:</b>&nbsp;</td>
                                    <td >
                                       <asp:TextBox id="Txtsubject" Font-Size="12" runat="server" style="width:300px; height:20px;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter Your Subject" ControlToValidate="Txtsubject">*</asp:RequiredFieldValidator>
                                        </td>
                                  </tr>

                                  <tr> 
                                    <td ><b>Country</b></td>
                                    <td ><b>:</b></td>
                                    <td >
                                       <asp:DropDownList id="ddlcountry" runat="server" style="width:300px; height:20px;" appenddatabounditems="True"  AutoPostBack="true"  onselectedindexchanged="ddlcountry_SelectedIndexChanged">
                                       
                                            <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ContactForm" InitialValue="Select Country" ErrorMessage="Enter Country" ControlToValidate="ddlcountry">*</asp:RequiredFieldValidator>
                                         
                                    </td>
                                  </tr>

                                  <tr>
                                    <td ><b>State</b></td>
                                    <td ><b>:</b></td>
                                    <td >
                                        <asp:DropDownList id="ddlstate" runat="server" style="width:300px; height:20px;" appenddatabounditems="True"  AutoPostBack="true"  onselectedindexchanged="ddlstate_SelectedIndexChanged">
                                         <asp:ListItem Value="Select State">Select State</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ContactForm" InitialValue="Select State" ErrorMessage="Enter state" ControlToValidate="ddlstate">*</asp:RequiredFieldValidator>
                                        
                                        
                                   </td>
                                  </tr>

                                  <tr>
                                    <td ><b>City</b></td>
                                    <td ><b>:</b></td>
                                    <td >
                                       <asp:DropDownList id="ddlcity" runat="server" style="width:300px; height:20px;" appenddatabounditems="True">
                                       <asp:ListItem Value="Select City">Select City</asp:ListItem>
                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="Select City" ValidationGroup="ContactForm" ErrorMessage="Enter city" ControlToValidate="ddlcity">*</asp:RequiredFieldValidator>
                                    </td>
                                  </tr>

                        

                                  <tr>
                                    <td ><b>Your 
                                        Message  </b></td>
                                    <td ><b>:</b></td>
                                    <td >
                                       <asp:TextBox id="txtcomments" runat="server" Height="100px" Width="300px" TextMode="MultiLine" Font-Size="12"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="ContactForm" ErrorMessage="Enter your comments" ControlToValidate="txtcomments">*</asp:RequiredFieldValidator>
                                    </td>
                                  </tr>

                                   <tr>
                                    <td ></td>
                                    <td ></td>
                                    <td > <asp:ImageButton id="imgSubmit" runat="server" ImageUrl="~/images/submit.png" ValidationGroup="ContactForm" onclick="imgSubmit_Click" />&nbsp;
                                       <asp:ImageButton id="imgReset" runat="server" ImageUrl="~/images/reset.png" onclick="imgReset_Click" />
                                       <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="ContactForm" ShowMessageBox="true" ShowSummary="false"/>
                                    </td>
                                  </tr>
                               </table>

                           </td>   
                       </tr>
              </table>
            </div>                                 
        </div>
</asp:Content>

