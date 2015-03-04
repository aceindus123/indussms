<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="ajax" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
<div class="container">
<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>
  <table  width="100%" align="center">
     <tr>
       <td>
            <uc1:topmenu ID="Topmenu1" runat="server" />
       </td>
     </tr>
   </table>
   <br />
     <br />
     </div>
<div id="view" runat="server">
<table width="100%" id="gv"><tr><td><b>Complaint Reports:</b></td><td align="right">
    <asp:Button ID="Button1" runat="server" Text="Click Here To Raise New Token"  Height="30px"
        BackColor="Azure" onclick="Button1_Click" /></td></tr></table>
        <br />
<asp:Panel ID="panel1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
     PageSize="5" 
        BackColor="White"  ShowFooter="true"
         HeaderStyle-BackColor="#87CEFA" 
         AlternatingRowStyle-BackColor="#F7F8E0" HeaderStyle-Height="30px" AllowPaging="true"
        Width="100%" onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None"
        onpageindexchanging="GridView1_PageIndexChanging" RowStyle-Height="50px"
         >
        
    <Columns>
    <asp:TemplateField HeaderText="Token Id" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" >
    <ItemTemplate>
        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("iid") %>' style="text-decoration:none"></asp:LinkButton>
    <asp:Panel ID="pan7" runat="server"  HorizontalAlign="Justify" Height="150px" >
  
              <table width="600px" bgcolor="#33ccff" align="center">
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="600px" bgcolor="white" height="150px" align="center">
             <tr style="background-color:Gray; height: 30px"><td align="center">
                 <asp:Label ID="Label8" runat="server" Text="ME To CRM" ForeColor="Black"></asp:Label></td><td align="right">
                     <asp:Label ID="Label9" runat="server" Text='<%#Eval("postdate") %>' ForeColor="Black"></asp:Label></td></tr>
             <tr style="background-color:#CCFFFF">
             <td align="center" colspan="2">
                 <asp:Label ID="Label1" runat="server"  CssClass="lbl12" Text='<%#Eval("content") %>' ForeColor="Black" Font-Size="Large"></asp:Label>
                    </td>
             </tr>
          
          
             </table>          
    </asp:Panel>

         
    
  
    <ajax:ModalPopupExtender ID="ModalPopupExtender1"  runat="server" TargetControlID="LinkButton1" CancelControlID="btnimcan" ViewStateMode="Disabled" PopupControlID="pan7" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
    
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Subject" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
        <asp:Label ID="Label2" runat="server" Text='<%#Eval("suject")%>' CssClass="lbl12">></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Date And Time" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    <asp:Label ID="Lbl3" runat="server" Text='<%#Eval("postdate")%>' CssClass="lbl12">></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Status" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    <asp:Label ID="lbl4" runat="server" Text='<%#Eval("status")%>' CssClass="lbl12">></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Reply Token" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
        <asp:LinkButton ID="LinkButton2" runat="server" Text='<%#Eval("raisedid") %>' style=" text-decoration:none"></asp:LinkButton>
        <asp:Panel ID="pan2" runat="server" Height="150px" >
        <table width="600px" bgcolor="#33ccff" align="center">
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan1" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="600px" bgcolor="white" height="150px" align="center">
             <tr style="background-color:Gray; height: 30px"><td align="center">
                 <asp:Label ID="lblcrm" runat="server" Text="CRM To ME" ForeColor="Black"></asp:Label></td><<%--td align="right">
                     <asp:Label ID="Label9" runat="server" Text='<%#Eval("postdate") %>' ForeColor="Black"></asp:Label></td><--%>/tr>
             <tr style="background-color:#CCFFFF">
             <td align="center" colspan="2" >
                 <asp:Label ID="lblreply" runat="server"  CssClass="lbl12" Text='<%#Eval("replay") %>' ForeColor="Black" Font-Size="Large"></asp:Label>
                    </td>
             </tr>
          
          
             </table>      
        
        </asp:Panel>


         <ajax:ModalPopupExtender ID="ModalPopupExtender2"  runat="server" TargetControlID="LinkButton2" CancelControlID="btnimcan1" ViewStateMode="Disabled" PopupControlID="pan2" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
    </ItemTemplate>
    </asp:TemplateField>
    


    <%--<asp:TemplateField HeaderText="Details" HeaderStyle-Width="120px" ItemStyle-Width="120px">
    <ItemTemplate>
    <asp:LinkButton ID="lnk12" runat="server" Text="Show"></asp:LinkButton>
    </ItemTemplate>
    </asp:TemplateField>--%>
    </Columns>
    <PagerStyle BackColor="#87CEFA" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
    <FooterStyle  Font-Bold="True" Height="30px" Font-Size="16px" />
    </asp:GridView>
    <br />
    
   
</asp:Panel>
</div>

<div id="raiseissues" runat="server" style="background-color:White" align="center">
<table width="100%">
  <tr>
    <td align="center" class="titlecampain1" >
      <h2 >Raise New Token</h2>    
    </td>
  </tr>
  </table>
  
<table align="center" style="background-color:#E8E8E8 ">
   <tr><td> <asp:Label ID="Label3" runat="server" Text="Subject" ForeColor="Black"></asp:Label>
       <strong>:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:TextBox ID="textsub" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Subject" ValidationGroup="ContactForm" ControlToValidate="textsub"><span style="color:Red">*</span></asp:RequiredFieldValidator>

       <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="textsub" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ " >
       </ajax:FilteredTextBoxExtender></td><td style="padding-top:5px;">
       <asp:Button ID="Button3" runat="server" Text="Back To Complaint Details" Height="25px" BackColor="Azure" OnClientClick="window.history.go(-1);return false;"  />
      </td>
    </tr>
  
    <tr>
       <td>
         <asp:Label ID="Label4" runat="server" Text="Mobile Number" ForeColor="Black"></asp:Label><strong>:</strong>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" MaxLength="10"
              runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Mobile Number" ValidationGroup="ContactForm" ControlToValidate="TextBox2" ><span style="color:Red">*</span></asp:RequiredFieldValidator>
              
              <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" FilterType="Numbers" TargetControlID="TextBox2" 
            runat="server">
        </ajax:FilteredTextBoxExtender>
    </td>
  </tr>
        <tr><td></td></tr>
        <tr><td><ajax:Editor ID="Editor1" Width="450px" Height="200px" runat="server" BackColor="White" />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Issue Details" ValidationGroup="ContactForm" ControlToValidate="Editor1"><span style="color:Red"></span></asp:RequiredFieldValidator>
        </td></tr> 
        <tr><td>
            Select Files:<asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" />
        </td></tr>
        <tr><td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ContactForm" ShowMessageBox="true" ShowSummary="false" />
            <%--<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>--%></td></tr>
    <tr><td align="center" style="padding-top:5px;"><asp:Button ID="btn1" runat="server" Text="Submit Your Issue" ValidationGroup="ContactForm" onclick="btn1_Click" BackColor="Azure" Height="25px" /></td></tr>
    </table>
    <br />
    
</div>
 <%--<asp:Button ID="btn1" runat="server" style="display:none" />
    <ajax:ModalPopupExtender ID="mp1" runat="server" TargetControlID="btn1" PopupControlID="panel1" BackgroundCssClass="backgrnd" ></ajax:ModalPopupExtender>--%>
<%--<asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>--%>
<div id="lbl1" runat="server" align="center">
<table id="label" runat="server" align="center" >
  <tr><td align="center">
      <asp:Label ID="lbl" runat="server" Text="Label" ForeColor="#3366FF" Font-Size="Large"></asp:Label>
      </td></tr>
      </table>
      <br />
      <br />
      <br />
      </div>

 </div>

</asp:Content>

