<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Sender_id.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:White" id="details" runat="server" >
<br />
<table  width="100%">
<tr><td align="center" colspan="2">
    <asp:Label ID="Label2" runat="server" Text="SenderId" ForeColor="Blue" Font-Size="X-Large"></asp:Label></td></tr>
</table>
&nbsp;&nbsp;This is the name or number which flashes on the recipient's mobile phone when they receive an SMS Text message. Most GSM Networks/Operators accept up to &nbsp;&nbsp;&nbsp;&nbsp; 
    an 6-character Alpha-Numeric String as Sender Identification.
&nbsp;&nbsp;An Alphanumeric Source Addresses must abide by the following criteria: <br />
<br />

    
    <table>
    <tr><td>&gt;&gt;Must be 6Alphabets</td><td>
        <asp:Button ID="buynow" runat="server" Text="BuyNow" onclick="buynow_Click" BackColor="Gray" Width="100px" Height="30px" /></td></tr>
    <tr><td>&gt;&gt;Must not contain blank spaces</td></tr>
    <tr><td>&gt;&gt;The first character cannot be "0" (zero)</td></tr>                                                       
    <tr><td>&gt;&gt;Must not contain accented characters</td></tr>
    <tr><td>&gt;&gt;Must not contain punctuated/special characters, such as * $ < , > ? ! % [ ] | </td></tr>
    <tr><td>&gt;&gt;Must not contain Greek characters</td></tr>
    <tr><td>&gt;&gt;Must not just be a name of an individual</td></tr>
    <tr><td></td></tr>
    
    </table>
    <br />
    </div>
<div  style="background-color:White" id="sndid" runat="server">
<br />
<br />
<div style="background-color:White" align="center">
<h2 align="center" style="color:Blue">SenderID</h2>
   
<br />

<table align="right"><tr><td align="center">
    <asp:Button ID="dwnld" runat="server" Text="Download DND Document" 
         Height="30px" onclick="dwnld_Click" /></td></tr></table>
        <br />
        <br />
<table align="center">

<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Enter SenderID Name :" ForeColor="Black" Font-Size="Large" ></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtsender" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Enter 6 Characters Only" 
            ValidationExpression="^[a-z]{6}$" ControlToValidate="txtsender" ForeColor="Red" ValidationGroup="val" >*</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter SenderId" ControlToValidate="txtsender" ValidationGroup="val">*</asp:RequiredFieldValidator>
   
            </td>
        
</tr>


<tr><td></td></tr>
<tr><td><asp:Label ID="Label3" runat="server" Text="Upload Company Document : " ForeColor="Black" Font-Size="Large" ></asp:Label></td>
<td>
    <asp:FileUpload ID="FileUpload1" runat="server"  /><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
        runat="server" ErrorMessage=" Upload Company Document" ValidationGroup="val" ControlToValidate="FileUpload1">*</asp:RequiredFieldValidator></td>
</tr>
<tr><td><asp:Label ID="lbl" runat="server" Text="Upload DND Document : " ForeColor="Black" Font-Size="Large" ></asp:Label></td>
<td>
    <asp:FileUpload ID="FileUpload2" runat="server"  /><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
        runat="server" ErrorMessage=" Upload Your DND Document" ValidationGroup="val" ControlToValidate="FileUpload2">*</asp:RequiredFieldValidator></td>
</tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td align="right">
    <asp:Button ID="btn" runat="server" Text="BuyNow" onclick="btn_Click" ValidationGroup="val" Height="30px" /></td><td align="left">
        <asp:Button ID="btn1" runat="server" Text="Cancel" onclick="btn1_Click" Height="30px" /></td> <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />
    
 </tr>
</table>
<br />
<div id="instructions" runat="server" align="left" style=" color:Gray">
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

</div></div>
<div id="gvview" runat="server" style="background-color:White" align="center">
     <table align="center">
                            <tr><td align="center" id="View" runat="server" >
                                <font size="5" color="#00277a"><strong>Requested Permissions</strong></font>
                              </td>
                            </tr>
                            <tr><td></td></tr>
                            
                        <tr id="View1" runat="server"><td align="center" >            
                       <asp:GridView ID="gv1" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True" RowStyle-Height="30px"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="5" 
                               ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial"  /> 
                                  <Columns>
                                  <asp:TemplateField HeaderText="SenderID" ItemStyle-HorizontalAlign="Center">
                                  <ItemTemplate>
                                      <asp:Label ID="lbl1" runat="server" Text='<%#Eval("sendername") %>' ForeColor="Gray"></asp:Label>
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
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
                </td></tr></table>
    <br />
</div>
</asp:Content>

