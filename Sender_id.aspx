<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Sender_id.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 317px;
        }
        
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />

<div style="background-color:White" id="details" runat="server" >

  <table  width="100%">
    <tr>
         <td  style="background: url(images/sender.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right" colspan="2">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />
         </td>
    </tr>
</table>

<p  style="font-family:Segoe UI; padding-left:30px; padding-right:30px;"><span  style="color:Black; font-size:15px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is the name or number which flashes on the recipient's mobile phone when they receive an SMS Text message. Most GSM Networks/Operators accept up to
    an 6-character Alpha-Numeric String as Sender Identification.
&nbsp;&nbsp;An Alphanumeric Source Addresses must abide by the following criteria: <br /></span></p>
<br />

    
    <table width="100%">
    <tr><td align="center"> <%--<asp:Button ID="buynow" runat="server" Text="BuyNow" onclick="buynow_Click" BackColor="Gray" Width="100px" Height="30px" />--%>
    <asp:ImageButton  ID="buynow" runat="server"  onclick="buynow_Click" ImageUrl="~/images/buy.png" />
    </td></tr>
    <tr><td><br /></td></tr> 
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px; font-size:14px;"><asp:Image ID="img11" runat="server"  ImageUrl="~/images/1arrow.jpg" /> Must be 6 Alphabets</td></tr>
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px;font-size:14px;"><asp:Image ID="Image1" runat="server"  ImageUrl="~/images/1arrow.jpg" /> Must not contain blank spaces</td></tr>
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px;font-size:14px;"><asp:Image ID="Image2" runat="server"  ImageUrl="~/images/1arrow.jpg" /> The first character cannot be "0" (zero)</td></tr>                                                       
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px;font-size:14px;"><asp:Image ID="Image3" runat="server"  ImageUrl="~/images/1arrow.jpg" /> Must not contain accented characters</td></tr>
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px;font-size:14px;"><asp:Image ID="Image4" runat="server"  ImageUrl="~/images/1arrow.jpg" /> Must not contain punctuated/special characters, such as * $ < , > ? ! % [ ] | </td></tr>
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px;font-size:14px;"><asp:Image ID="Image5" runat="server"  ImageUrl="~/images/1arrow.jpg" /> Must not contain Greek characters</td></tr>
    <tr><td style="font-family:Segoe UI; color:Black;padding-left:50px; line-height:20px;font-size:14px;"><asp:Image ID="Image6" runat="server"  ImageUrl="~/images/1arrow.jpg" /> Must not just be a name of an individual</td></tr>
    <tr><td></td></tr>
    
    </table>
    <br />
    </div>
<div  style="background-color:White" id="sndid" runat="server">


<table width="100%">
    <tr>
         <td  style="background: url(images/sender.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right" colspan="2">
             <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/Sender_id.aspx"  />

              </td>
    </tr>
<tr><td align="center" colspan="2">
   <%-- <asp:Button ID="dwnld" runat="server" Text="Download DND Document" 
         Height="30px" onclick="dwnld_Click" />--%>
           <asp:ImageButton  ID="dwnld" runat="server"  onclick="dwnld_Click" ImageUrl="~/images/download1.png" />
         </td></tr>
<tr><td><br /><br /></td></tr>

<tr><td align="center"><table width="70%">
  <tr>
<td align="right"  style="padding-right:20px;font-family:Segoe UI; color:Black;font-size:14px;">
    <asp:Label ID="Label1" runat="server" Text="Enter SenderID Name :" ForeColor="Black"  ></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtsender" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Enter 6 Characters Only" 
            ValidationExpression="^[a-z,A-Z]{6}$" ControlToValidate="txtsender" ForeColor="Red" ValidationGroup="val" >*</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter SenderId" ControlToValidate="txtsender" ValidationGroup="val">*</asp:RequiredFieldValidator>
   
            </td>
        
</tr>

<tr><td align="right" style="padding-right:20px;font-family:Segoe UI; color:Black; line-height:22px; font-size:14px;"><asp:Label ID="Label3" runat="server" Text="Upload Company Document : " ForeColor="Black"  ></asp:Label></td>
<td>
    <asp:FileUpload ID="FileUpload1" runat="server"  /><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
        runat="server" ErrorMessage=" Upload Company Document" ValidationGroup="val" ControlToValidate="FileUpload1">*</asp:RequiredFieldValidator></td>
</tr>

<tr><td align="right" style="padding-right:20px;font-family:Segoe UI; color:Black;font-size:14px;"><asp:Label ID="lbl" runat="server" Text="Upload DND Document : " ForeColor="Black" ></asp:Label></td>
<td>
    <asp:FileUpload ID="FileUpload2" runat="server"  /><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
        runat="server" ErrorMessage=" Upload Your DND Document" ValidationGroup="val" ControlToValidate="FileUpload2">*</asp:RequiredFieldValidator></td>
</tr>
</table></td></tr>

<tr><td><br /></td></tr>

<tr><td align="center">
   <asp:ImageButton  ID="btn" runat="server" onclick="btn_Click" ValidationGroup="val" ImageUrl="~/images/buy.png" />
              <asp:ImageButton  ID="btn1" runat="server" onclick="btn1_Click" ImageUrl="~/images/cancel3.png" />
   <%-- <asp:Button ID="btn" runat="server" Text="BuyNow" onclick="btn_Click" ValidationGroup="val" Height="30px" />
        <asp:Button ID="btn1" runat="server" Text="Cancel" onclick="btn1_Click" Height="30px" />--%></td> <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />
    
 </tr>
</table>
<br />
<div id="instructions" runat="server" align="left" style=" color:Black; font-family:Segoe UI; line-height:20px; padding-left:50px; font-size:14px;">
&nbsp;&nbsp;&nbsp;<h3 style="color:Black">Please follow instructions mentioned below before uploading the documents:</h3>
&nbsp;&nbsp;1. Please upload company registration document with the following formats (.jpg, .png, .jpeg).<br />
&nbsp;&nbsp;2. Please download dnd document from above click button.<br />
&nbsp;&nbsp;3. Fill in all the details in dnd document with signature.<br />
 &nbsp;&nbsp;4. After completion, upload the dnd document with the following formats (.jpg, .png, .jpeg,.pdf)<br />
&nbsp;&nbsp;5. Sender ID name must be six characters (no numbers and special characters).<br />
 &nbsp;&nbsp;6. Vaild Sender ID’s will be activated within 8 working hours.<br />
&nbsp;&nbsp;7. Invalid Sender ID’s will be not accepted and you will be informed.<br />
<br />
</div>

</div>

<div id="gvview" runat="server" style="background-color:White" align="center">
     <table align="center" >
                            <tr><td align="center" id="View" runat="server" >
                                <font size="5" color="#e04006"><strong>Requested Permissions</strong></font>
                              </td>
                            </tr>
                            <tr><td><br /></td></tr>
                            
                        <tr id="View1" runat="server"><td align="center" class="rounded-corners" >            
                       <asp:GridView ID="gv1" runat="server"   Width="900px"  AutoGenerateColumns="False"  BorderColor="#b3b3b3" 
                       BorderWidth="0px" CellPadding="3" Font-Bold="False" Font-Italic="False"   
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True" RowStyle-Height="30px"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="5" 
                               ShowHeaderWhenEmpty="true" EmptyDataRowStyle-Height="30px"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="White" Height="30px"  Font-Size="14px" Font-Names="Arial"  BackColor="#0985c5"  /> 
                                  <Columns>
                                  <asp:TemplateField HeaderText="SenderID" ItemStyle-HorizontalAlign="Center" >
                                  <ItemTemplate>
                                      <asp:Label ID="lbl1" runat="server" Text='<%#Eval("sendername") %>' ForeColor="Gray" ></asp:Label>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center">
                                  <ItemTemplate>
                                      <asp:Label ID="lbl2" runat="server" Text='<%#Eval("postdate") %>' ForeColor="Gray"></asp:Label>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                  <ItemTemplate>
                                      <asp:Label ID="lbl4" runat="server" Text='<%#Eval("status") %>' ForeColor="Gray"></asp:Label>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                         
                    </Columns>
                    <EmptyDataTemplate  >No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
    <br />
</div>
<br />
</asp:Content>

