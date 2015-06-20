<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Balance.aspx.cs" Inherits="Balance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #btns
        {
            width: 78%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
<br />
<div style="background-color:White">
<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>

    
    <table width="100%" align="center">
    <tr>
         <td  style="background: url(images/balence.png); background-repeat:no-repeat; width:995px; height:60px; padding-top:5px;"  align="right" colspan="2">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

         </td>
    </tr>

     <tr >
    
       <td  align="center"  colspan="2" style="padding-left:60px;">

           <table width="80%" align="center"  style="background: url(images/baliner.png); background-repeat:no-repeat; height:230px; padding-left:30px; padding-top:45px;" align="center">
         <tr><td>TEXT SMS </td>  <td>VOICE SMS</td></tr>
         <tr>
             <td>Balance Amount<strong>:</strong>&nbsp;<asp:Label ID="Label1" runat="server" Text="" ForeColor="#0066FF"></asp:Label></td>
             <td>Balance Amount<strong>:</strong>&nbsp;<asp:Label ID="Label4" runat="server" Text="" ForeColor="#0066FF"></asp:Label></td>
         </tr>
         <tr>
            <td>Number Of SMS Left<strong>:</strong>&nbsp;<asp:Label ID="Label2" runat="server" ForeColor="#0066FF"></asp:Label></td>
            <td>Number Of SMS Left<strong>:</strong>&nbsp;<asp:Label ID="Label5" runat="server" ForeColor="#0066FF"></asp:Label></td>
         </tr>
         <tr>
            <td>Expires On<strong>:</strong>&nbsp;<asp:Label ID="Label3" runat="server" ForeColor="#0066FF" ></asp:Label></td>
            <td>Expires On<strong>:</strong>&nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#0066FF" ></asp:Label></td>
         </tr>
         <tr>
           <td><asp:Label ID="Label7" runat="server" ForeColor="#0066FF"  Text="Your Sms Count is Low, Please purchased" Visible="false"></asp:Label></td> 
           <td>  <asp:Label ID="Label8" runat="server" ForeColor="#0066FF"  Text="Your Sms Count is Low, Please purchased" Visible="false"></asp:Label></td>
        </tr>


        <tr>
           <td><%-- <asp:Button ID="btnsms" runat="server" Text="Buy SMS" 
             onclick="btnsms_Click" CssClass="buttonStyle1"  />--%>
             <asp:ImageButton ID="btnsms" ImageUrl="~/images/buysms.png" runat="server" onclick="btnsms_Click"   />
             
             </td>
           <td> <%--<asp:Button ID="btnvoice" runat="server" Text="Buy Voice SMS" 
             onclick="btnvoice_Click" CssClass="buttonStyle1" />--%>

             <asp:ImageButton ID="btnvoice" ImageUrl="~/images/buyvoice.png" runat="server" onclick="btnvoice_Click"   />

         <asp:Label ID="lblbuy" runat="server" Text="Our Executive Will Contact You Soon" Visible="false"></asp:Label></td>
        </tr>
       </table>

      </td>
     </tr>
     
     </table>       

     <br />
    <div id="container" runat="server"   align="center">
             <asp:TabContainer ID="TabContainer1" runat="server" Height="138px" ActiveTabIndex="1" Width="66%">
                 <asp:TabPanel runat="server" ID="Pn1" HeaderText="Purchase History" CssClass="tb" ForeColor="Black">
                     <ContentTemplate>
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" AllowPaging="true" HeaderStyle-BackColor="#E6E6FA" Width="100%" PageSize="5" EmptyDataRowStyle-ForeColor="Red"  EmptyDataRowStyle-HorizontalAlign="Center"  EmptyDataRowStyle-Font-Size="Medium"   >
         <Columns>
         <asp:TemplateField HeaderText="Date">
         <ItemTemplate>
             <asp:Label ID="Label1" runat="server" CssClass="lb" Text='<%#Eval("postdate")%>'></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="OrderNumber">
         <ItemTemplate>
             <asp:Label ID="Label2" runat="server" Text='<%#Eval("ordernum")%>' CssClass="lb"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Valid From">
         <ItemTemplate>
             <asp:Label ID="Label3" runat="server" Text='<%#Eval("validfrom")%>' CssClass="lb"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Valid Upto">
         <ItemTemplate>
             <asp:Label ID="Label4" runat="server" Text='<%#Eval("validupto")%>' CssClass="lb"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Credit">
         <ItemTemplate>
             <asp:Label ID="Label5" runat="server" Text='<%#Eval("credit")%>' CssClass="lb"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Amount">
         <ItemTemplate>
             <asp:Label ID="Label6" runat="server" Text='<%#Eval("amount")%>' CssClass="lb"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         </Columns>
          <EmptyDataTemplate>
       Your Purchase History is Empty
       </EmptyDataTemplate>
         </asp:GridView></ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </asp:TabPanel>

              </asp:TabContainer>
           
           </div>
           <br />
    <div id="btns" runat="server" style="padding-left:180px;" >
    <asp:Panel ID="panrd" runat="server" BackColor="#A9E2F3"  Width="78%" 
            align="center">
    <br />
      &nbsp;&nbsp;&nbsp; <asp:RadioButton ID="RadioButton1" runat="server" Text="2000INR"  GroupName="rd1" 
            oncheckedchanged="RadioButton1_CheckedChanged" AutoPostBack="true" />&nbsp;&nbsp;&nbsp;
       <asp:RadioButton ID="RadioButton2"
            runat="server" Text="3000INR" GroupName="rd1" 
            oncheckedchanged="RadioButton2_CheckedChanged" AutoPostBack="true" />&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="RadioButton3" runat="server" Text="5000INR" GroupName="rd1" 
            oncheckedchanged="RadioButton3_CheckedChanged" AutoPostBack="true" />&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="RadioButton4" runat="server" Text="7000INR" 
            GroupName="rd1" AutoPostBack="true" 
            oncheckedchanged="RadioButton4_CheckedChanged" />
            
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;    <%-- <asp:Button ID="btn1" runat="server" Text="Add To Cart" 
            ValidationGroup="val" onclick="btn1_Click" CssClass="buttonStyle1" />&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" 
                Text="Cancel" OnClientClick="window.history.go(-1);return false;" 
                   CssClass="buttonStyle1"/>--%>

                   <asp:ImageButton ID="btn1" runat="server"  ValidationGroup="val" onclick="btn1_Click" ImageUrl="~/images/addtocart.png" />
                   <asp:ImageButton ID="Button3" runat="server"    OnClientClick="window.history.go(-1);return false;" ImageUrl="~/images/cancel3.png"/>

                </asp:Panel>
    </div>
  
  <br />
    <div  align="center" id="divview" style="width:800px;  margin: 0px auto" runat="server">
  
    <table width="80%"><tr><td align="center">
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="80%" 
            ForeColor="#333333"  onrowdatabound="gv_RowDataBound" 
            HeaderStyle-BackColor="#3AC0F2" RowStyle-BackColor="#A1DCF2" 
            AlternatingRowStyle-BackColor="White" RowStyle-ForeColor="#3A3A3A" HeaderStyle-Height="30px"
            HeaderStyle-ForeColor="White" onrowdeleting="gv_RowDeleting" EmptyDataRowStyle-Font-Size="Medium" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Black" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Height="120px" EmptyDataRowStyle-Width="150px" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

   <Columns>
                    <asp:BoundField DataField="Feature" HeaderText="Feature" ItemStyle-HorizontalAlign="Center"></asp:BoundField>                        
                    <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                     <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Center"></asp:BoundField> 
                    <asp:CommandField  ButtonType="Button" HeaderText="Actions" DeleteText="Delete" ShowDeleteButton="true" ControlStyle-CssClass="buttonStyle1"  />              
                </Columns>
                <EmptyDataTemplate>
                Your Cart Is Empty..
                </EmptyDataTemplate>
            </asp:GridView></td></tr></table>
            <br />
       
        <%--<asp:Button ID="btn2" runat="server" Text="Continue Shopping" 
             onclick="btn2_Click" OnClientClick="window.history.go(-1);return false;" />
             
             &nbsp;&nbsp;<asp:Button ID="btn3"
            runat="server" Text="Preceed Checkout" Width="130px" 
            onclick="btn3_Click"  />--%>

             <asp:ImageButton ID="btn2" runat="server"  onclick="btn2_Click" ImageUrl="~/images/continue.png" OnClientClick="window.history.go(-1);return false;" />
                   <asp:ImageButton ID="btn3" runat="server"     onclick="btn3_Click" ImageUrl="~/images/proceed.png"/>

            </div>
            <br />

    <div style="color:GrayText; padding-left:100px; font-family:Segoe UI;">
    <strong>How to Post Purchase Request:<br /></strong>
    *For Ex...<br />
    1.In Feature Column Enter as amount.<br />
    2.In amount column enter your amount like 2000INR,3000INR,5000INR,7000INR.<br />
    3.In Description column type your purchase type as textsms.<br />

    </div>
    <br />
    </div>
    <br />
</asp:Content>

