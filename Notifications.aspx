<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
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
     <div id="dllist" runat="server" align="center" style="background-color:White" >
     <br />
      <asp:DataList ID="DataList1" runat="server" BackColor="Gray" BorderColor="#666666"

            BorderStyle="None" BorderWidth="2px" CellPadding="2" CellSpacing="2"

            Font-Names="Verdana" Font-Size="Small" GridLines="Both" 

              Width="80%" HorizontalAlign="Justify" >

            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

            <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Large" ForeColor="White"

                HorizontalAlign="Center" VerticalAlign="Middle" />

            <HeaderTemplate>
            

                Notification</HeaderTemplate>
                

            <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="2px" />

            <ItemTemplate>
            <u><asp:Label ID="lblsubject" runat="server" Text='<%#Eval("subject") %>' CssClass="dl1"></asp:Label></u><br />
           <%--b> Message For User</b>--%><asp:Label ID="lblmessage" runat="server" Text=' <%# Eval("message") %>' CssClass="dl2"></asp:Label> 
             

            </ItemTemplate>

        </asp:DataList>
        <asp:Label ID="lblmsg" runat="server" Text="NO Offers Available" style="font-size:medium; font-style:italic"  ></asp:Label><br /> 
        <br />
    <%--</table>--%></div>
</asp:Content>

