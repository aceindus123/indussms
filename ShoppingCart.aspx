<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container">

<asp:ScriptManager ID="sp1" runat="server"></asp:ScriptManager>

 <table width="100%" >
   <tr>
      <td  style="background: url(images/shopping.png); background-repeat:no-repeat; width:995px; height:70px; padding-top:5px;"  align="right" colspan="4">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

          <br /><br /> </td>
     </tr>
     <tr>
     <td></td>
     </tr>
     
   </table>

     <asp:Panel ID="up" runat="server" style=" width:100%; background-color:White">
         <%--<asp:Label ID="Label5" runat="server" Text="Your Cart Is Empty"></asp:Label>--%>
         <br />
         <table align="center" width="100%"><tr ><td align="center" colspan="2">
        <asp:GridView ID="gv1" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" 
             Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True" RowStyle-Height="30px"  
                                PagerStyle-Mode="NumericPages"  
             PagerStyle-BackColor="White"   PageSize="5" ShowFooter="true"
                               ShowHeaderWhenEmpty="true"  GridLines="Horizontal" DataKeyNames="crid" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="Your Cart Is Empty...."
                                EmptyDataRowStyle-Font-Size="Medium" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Height="30px"
             
             
             onrowdeleting="gv1_RowDeleting" onrowdatabound="gv1_RowDataBound">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial"  /> 
                                  <Columns>
                                  <asp:TemplateField HeaderText="Feature" ItemStyle-HorizontalAlign="Center">
                                  <ItemTemplate>
                                      <asp:Label ID="lbl1" runat="server" Text='<%#Eval("feature") %>' ForeColor="Gray" Font-Size="Medium"></asp:Label>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Center">
                                  <ItemTemplate>
                                      <asp:Label ID="lbl2" runat="server" Text='<%#Eval("description") %>' ForeColor="Gray" Font-Size="Medium"></asp:Label>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="true" FooterStyle-Font-Size="Medium">
                                  <ItemTemplate>
                                      <asp:Label ID="lbl4" runat="server" Text='<%#Eval("amount") %>' ForeColor="Gray" Font-Size="Medium"></asp:Label>
                                  </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="Total Amount :" ForeColor="#003399"></asp:Label>
                                        <asp:Label ID="lbltotal" runat="server" Text="Label" ForeColor="#003399"></asp:Label>
                        </FooterTemplate>
                                  </asp:TemplateField>                                  
                          <asp:CommandField ButtonType="Button" ShowDeleteButton="true" ItemStyle-Width="40px" 
                          ControlStyle-CssClass="buttonStyle1" HeaderText="Action" />  
                    </Columns>
                  
                   
                </asp:GridView></td></tr></table>
      
      <br />
         <%--<asp:Label ID="Label4" runat="server" ></asp:Label>--%>
      <%--   <asp:Button ID="Button1" runat="server" Text="PayNow" onclick="Button1_Click" CssClass="buttonStyle1"  Width="100px"/>--%>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <asp:ImageButton ID="Button1" runat="server" Text="PayNow" onclick="Button1_Click" ImageUrl="~/images/paynow.png" />
         <br />
         <br />

     </asp:Panel>
     
    </div>
</asp:Content>

