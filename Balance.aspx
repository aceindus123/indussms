<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Balance.aspx.cs" Inherits="Balance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
<div style="background-color:White">
<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>








<div class="container">
  <table  width="100%" align="center">
     <tr>
       <td>
            <uc1:topmenu ID="Topmenu1" runat="server" />
       </td>
     </tr>
   </table>
   <br />
     </div>
     <div style="background-color:White">
     <div >
     <table width="100%">
     <tr style="height:126px"><td style="background-color:#E6E6FA";>
         &nbsp;&nbsp;&nbsp;<u><i>SMS</i></u><br />
         &nbsp;&nbsp;&nbsp;Balance Amount<strong>:</strong>&nbsp;<asp:Label ID="Label1" runat="server" Text="" ForeColor="#0066FF"></asp:Label><br /><br />
         &nbsp;&nbsp;&nbsp;Number Of SMS Left<strong>:</strong>&nbsp;<asp:Label ID="Label2" runat="server" ForeColor="#0066FF"></asp:Label><br /><br />
         &nbsp;&nbsp;&nbsp;Expires On<strong>:</strong>&nbsp;<asp:Label ID="Label3" runat="server" ForeColor="#0066FF" ></asp:Label>
         <%--<asp:DataList ID="DataList1" runat="server">
         </asp:DataList>--%>
        
         
         <br /><br /> &nbsp;&nbsp;&nbsp;<asp:Button ID="btnsms" runat="server" Text="Buy SMS" 
             onclick="btnsms_Click" CssClass="buttonStyle1"  />
        
         </td>

     <td valign="top" style="background-color:#E6E6FA">&nbsp;&nbsp;<u><i>VOICE</i></u><br />
      &nbsp;&nbsp;Balance Amount<strong>:</strong>&nbsp;<asp:Label ID="Label4" runat="server" Text="" ForeColor="#0066FF"></asp:Label><br /><br />
         &nbsp;&nbsp;Number Of SMS Left<strong>:</strong>&nbsp;<asp:Label ID="Label5" runat="server" ForeColor="#0066FF"></asp:Label><br /><br />
         &nbsp;&nbsp;Expires On<strong>:</strong>&nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#0066FF" ></asp:Label>
         <%--<asp:DataList ID="DataList2" runat="server">
         </asp:DataList>--%>
         <br />
         <br />
         <asp:Button ID="btnvoice" runat="server" Text="Buy Voice SMS" 
             onclick="btnvoice_Click" CssClass="buttonStyle1" />
         <asp:Label ID="lblbuy" runat="server" Text="Our Executive Will Contact You Soon" Visible="false"></asp:Label>
     </td>
  <%--   <td valign="top">Emails</td>--%>
     </tr></table>
        
            

     </div>
      <div id="container" runat="server">
             <asp:TabContainer ID="TabContainer1" runat="server" Height="138px" ActiveTabIndex="1" Width="100%">
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
    </div>
    <div id="btns" runat="server">
    <asp:Panel ID="panrd" runat="server" BackColor="Gray">
       <asp:RadioButton ID="RadioButton1" runat="server" Text="2000INR"  GroupName="rd1" 
            oncheckedchanged="RadioButton1_CheckedChanged" AutoPostBack="true" /><asp:RadioButton ID="RadioButton2"
            runat="server" Text="3000INR" GroupName="rd1" 
            oncheckedchanged="RadioButton2_CheckedChanged" AutoPostBack="true" />
        <asp:RadioButton ID="RadioButton3" runat="server" Text="5000INR" GroupName="rd1" 
            oncheckedchanged="RadioButton3_CheckedChanged" AutoPostBack="true" />
        <asp:RadioButton ID="RadioButton4" runat="server" Text="7000INR" 
            GroupName="rd1" AutoPostBack="true" 
            oncheckedchanged="RadioButton4_CheckedChanged" />
            
            <br />
            <br />
             <asp:Button ID="btn1" runat="server" Text="Add To Cart" 
            ValidationGroup="val" onclick="btn1_Click" CssClass="buttonStyle1" 

                 />&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" 
                Text="Cancel" OnClientClick="window.history.go(-1);return false;" 
                   CssClass="buttonStyle1"/>
                </asp:Panel>
                <%-- <asp:Panel ID="panview" runat="server" HorizontalAlign="Left">
                         <table width="110%" bgcolor="#3366FF" align="center" >
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21" BackColor="#3366FF"/></td></tr>
             </table>
             <table width="110%" bgcolor="white" align="center">
             <tr><td></td></tr>
             <tr>
             <td align="center" id="View" runat="server"><br />
                 <asp:Label ID="Label7" runat="server" Text="Label" ForeColor="#00277a" Font-Size="Large" style="text-decoration:underline"></asp:Label>
              
                 </td></tr>
                 <tr><td align="center"><br />
                 <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" 
                         Width="700px" HorizontalAlign="Center" GridLines="None" ShowFooter="true"
                  AllowPaging="true" PageSize="5" ForeColor="#333333" CellPadding="4" 
                         EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                         EmptyDataRowStyle-ForeColor="Black" onrowdatabound="gv_RowDataBound1" onrowdeleting="gv_RowDeleting1"  
                          
                         >
                 <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#999999" Font-Size="14px" Font-Names="Arial" /> 
                 <Columns>
                <asp:BoundField DataField="Feature" HeaderText="Feature" ItemStyle-HorizontalAlign="Center" />
                  <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign="Center" />
                 <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Center" />
                 <asp:CommandField  ButtonType="Button" HeaderText="Actions" DeleteText="Delete" ShowDeleteButton="true" ControlStyle-CssClass="buttonStyle1"  />              
                                    
                 </Columns>
                 <EmptyDataTemplate>
                 No Lists Found.
                 </EmptyDataTemplate>
                 <HeaderStyle BackColor="#5D7B9D"  ForeColor="White" Font-Names="Arial" Font-Size="18px" Height="30px" /> 
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                 </asp:GridView>
                 <br />
                
                 <br /><br /><br />
             </td></tr>
             </table>
                </asp:Panel>--%>
                  

    </div>
    <br />
 <div class="rounded-corners" align="center" id="divview" runat="server">
  
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
       
        <asp:Button ID="btn2" runat="server" Text="Continue Shopping" 
             onclick="btn2_Click" OnClientClick="window.history.go(-1);return false;" />&nbsp;&nbsp;<asp:Button ID="btn3"
            runat="server" Text="Preceed Checkout" Width="130px" 
            onclick="btn3_Click"  />
            </div>
    <div style="color:GrayText">
    How to Post Purchase Request:<br />
    *For Ex...<br />
    1.In Feature Column Enter as amount.<br />
    2.In amount column enter your amount like 2000INR,3000INR,5000INR,7000INR.<br />
    3.In Description column type your purchase type as textsms.<br />

    </div>
    </div>
</asp:Content>

