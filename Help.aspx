<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="ajax" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $("[src*=plus]").live("click", function () {
        $(this).closest("tr").after("<tr><td></td><td colspan = '888'>" + $(this).next().html() + "</td></tr>")
        $(this).attr("src", "images/minus.png");
    });
    $("[src*=minus]").live("click", function () {
        $(this).attr("src", "images/plus.png");
        $(this).closest("tr").next().remove();
    });
</script>








   
<%--    <table width="100%" >
     <tr>
        <td align="center" width="100%"  class="titlecampain1" valign="middle">
           <h2> Customer Support</h2>
        </td>
     </tr>
   </table>
     <br />--%>
<div id="view" runat="server">
<table width="100%" id="gv">
<tr>
         <td  style="background: url(images/customersupport.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right" colspan="2">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

              </td>
    </tr>
<tr><td align="center"><b>Complaint Reports:</b></td><td align="right">
   <%-- <asp:Button ID="Button1" runat="server" Text="Click Here To Raise New Token"  Height="30px"
        BackColor="Azure" onclick="Button1_Click" />--%>
        
        <asp:ImageButton ID="Button1" runat="server" onclick="Button1_Click" ImageUrl="~/images/clickhere.png" />
        </td></tr></table>
        <br />
  <div  style="width:800px;  margin: 0px auto">
        <table>
        <tr><td class="rounded-corners">
            <asp:GridView ID="GridView1" runat="server"     
                AutoGenerateColumns="False"   
                       BorderWidth="0px" CellPadding="3" Font-Bold="False" Font-Italic="False"   
                                Font-Overline="False" Font-Size="10pt" 
                Font-Strikeout="False" Width="800px"  
                Font-Underline="False"   BackColor="White" AllowPaging="True" 
                RowStyle-Height="40px" BorderStyle="Groove" BorderColor="#0985c5"  
                                PagerStyle-Mode="NumericPages"  
                PagerStyle-BackColor="White"   PageSize="5"  
                               ShowHeaderWhenEmpty="true" EmptyDataRowStyle-Height="30px"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" GridLines="None" 
                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                onpageindexchanging="GridView1_PageIndexChanging"  DataKeyNames="iid"
                 
                onrowdatabound="GridView1_RowDataBound">
                    <PagerStyle  ForeColor="White" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#0985c5"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="White" Height="30px"  Font-Size="14px" Font-Names="Arial"  BackColor="#0985c5"   /> 
                                  <Columns>
                                   <asp:TemplateField HeaderText="Token Id" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" >
    <ItemTemplate>
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" Text='<%#Eval("iid") %>' style="text-decoration:none" ></asp:LinkButton>
    <asp:Panel ID="pan7" runat="server"  HorizontalAlign="Justify" Height="150px" >
  
              <table width="600px" bgcolor="#33ccff" align="center">
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="600px" bgcolor="white" height="150px" align="center">
             <tr style="background-color:Gray; height: 30px"><td align="center">
                 <asp:Label ID="Label8" runat="server" Text="ME To CRM" ForeColor="Black" Font-Size="Medium"></asp:Label></td><td align="right">
                     <asp:Label ID="Label9" runat="server" Text='<%#Eval("postdate") %>' ForeColor="Black" Font-Size="Medium"></asp:Label></td></tr>
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
        <asp:Label ID="Label2" runat="server" Text='<%#Eval("suject")%>' CssClass="lbl12" Font-Size="Medium"></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Date And Time" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    <asp:Label ID="Lbl3" runat="server" Text='<%#Eval("postdate")%>' CssClass="lbl12" Font-Size="Medium"></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Status" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    <asp:Label ID="lbl4" runat="server" Text='<%#Eval("status")%>' CssClass="lbl12" Font-Size="Medium">></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Reply" HeaderStyle-Width="120px" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Medium">
    <ItemTemplate>
    <asp:Image id="display" runat="server" alt = "" style="cursor: pointer" src="images/plus.png"  />
        <%--<asp:LinkButton ID="LinkButton2" runat="server" Text='<%#Eval("raisedid") %>' style=" text-decoration:none"></asp:LinkButton>--%>
        <asp:Panel ID="pan2" runat="server" Height="150px" HorizontalAlign="Center" Style="display: none">
       <%-- <table width="600px" bgcolor="#33ccff" align="center">
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan1" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>--%>
           <%--  <table width="600px" bgcolor="white" height="150px" align="center">
             <tr><td><asp:GridView ID="gvpanel" runat="server" AutoGenerateColumns="false">
             <Columns>
             <asp:TemplateField>
             <ItemTemplate>
             <asp:Label ID="lblsub" runat="server" Text='<%#Eval("replay") %>'></asp:Label>
             </ItemTemplate>
             </asp:TemplateField>
             </Columns>
             </asp:GridView></td></tr>--%>
             <table style="background-color:White; width:500px "  >
             <tr style="background-color:Gray; height: 30px"><td align="center">
                 <asp:Label ID="lblcrm" runat="server" Text="CRM To ME" ForeColor="Black" Font-Size="Large" ></asp:Label></td></tr>
             <tr height="200px" style="background-color:#CCFFFF">
             <td  align="center"  >
             <div   style="overflow-y:auto;overflow-x:auto;word-break:break-all; position: relative">
                 <asp:Label ID="lblreply" runat="server"  CssClass="lbl12" Text='<%#Eval("replay") %>' ForeColor="Black" Font-Size="Medium"   ></asp:Label>
                    </div></td>
             </tr>
             <tr><br /></tr>
             <tr><br /></tr>
          
          
             </table>      
        
        </asp:Panel>


        <%-- <ajax:ModalPopupExtender ID="ModalPopupExtender2"  runat="server" TargetControlID="LinkButton2" CancelControlID="btnimcan1" ViewStateMode="Disabled" PopupControlID="pan2" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>--%>
    </ItemTemplate>
    </asp:TemplateField>
    

                         
                    </Columns>



            </asp:GridView>
        </td></tr>
        </table>
        
        </div>
        <br />
</div>

<div id="raiseissues" runat="server" style="background-color:White" align="center">
<table width="100%">
 <%-- <tr>
    <td align="center" class="titlecampain1" >
      <h2 >Raise New Token</h2>    
    </td>
  </tr>--%>

    <tr>
      <td  style="background: url(images/raisenew.png); background-repeat:no-repeat; width:995px; height:70px; padding-top:5px;"  align="right" colspan="4">

          <br /><br /> </td>
     </tr>
     </table>
  
<table align="center" style="background-color:#E8E8E8 ">
   <tr><td> <asp:Label ID="Label3" runat="server" Text="Subject" ForeColor="Black"></asp:Label>
       <strong>:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:TextBox ID="textsub" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Subject" ValidationGroup="ContactForm" ControlToValidate="textsub"><span style="color:Red">*</span></asp:RequiredFieldValidator>

       <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="textsub" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ " >
       </ajax:FilteredTextBoxExtender></td><td style="padding-top:5px;">
<%--       <asp:Button ID="Button3" runat="server" Text="Back To Complaint Details" Height="25px" BackColor="Azure" OnClientClick="window.history.go(-1);return false;"  />--%>

          <asp:ImageButton  ID="Button3" runat="server" ImageUrl="~/images/backto.png"  OnClientClick="window.history.go(-1);return false;" />
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
        <tr><td><br /></td></tr>
        <tr><td><ajax:Editor ID="Editor1" Width="450px" Height="200px" runat="server" BackColor="White" />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Issue Details" ValidationGroup="ContactForm" ControlToValidate="Editor1"><span style="color:Red"></span></asp:RequiredFieldValidator>
        </td></tr> 
        <tr><td><br /></td></tr>
        <tr><td>
            Select Files:<asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" />
        </td></tr>
        <tr><td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ContactForm" ShowMessageBox="true" ShowSummary="false" />
            <%--<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>--%></td></tr>
    <tr><td align="center" style="padding-top:5px;">
    <%--<asp:Button ID="btn1" runat="server" Text="Submit Your Issue" ValidationGroup="ContactForm" onclick="btn1_Click" BackColor="Azure" Height="25px" />--%>
    
    <asp:ImageButton ID="btn1" runat="server" ValidationGroup="ContactForm" onclick="btn1_Click" ImageUrl="~/images/submitissue.png" />
    
    
    </td></tr>

    </table>
    <br /><br />
    
</div>

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

