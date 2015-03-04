<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginStatus.aspx.cs" Inherits="admin_LoginStatus" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Client Login Status : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div align="center">
    <br />
     <head:header ID="head1" runat="server" />
     <br /><br /><br /><br />
    <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  
       <tr>
           <td id="crtopt" runat="server" align="center"  class="lblog" width=" 90%">
           </td>
       </tr>
       <tr><td>&nbsp;</td></tr>
       
         <tr>
         <td id="Td1" runat="server" align="center" style="height:30px"  class="style24" width=" 90%"> 
         
         <asp:Label ID="lblTitle" runat="server" Text="Login Users List" Font-Bold="true" ForeColor="#00277a" Font-Size="15pt"></asp:Label>
             <br />
           </td>
       </tr>
   
     <tr>
    <td  id="Errmsg" align="right" class="lblog" runat="server">
           </td>
    </tr>   
   <tr>
   <td align="center">
   <asp:GridView ID="GrdLoginUsers" runat="server" Width="96%" AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" OnPageIndexChanging="PageIndexChanging"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="11pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="10" PagerStyle-BackColor="White" >
        <Columns>         
         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Login Id" HeaderStyle-HorizontalAlign="Center">
                
                <ItemTemplate>
                    <asp:Label ID="Labelid" runat="server" Text='<%# Bind("id") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="20%" />
            </asp:TemplateField>  
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="User Name" HeaderStyle-HorizontalAlign="Center">
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Uname") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="20%" />
            </asp:TemplateField>

                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Login Time" >
                
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Datetime") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
               
            </asp:TemplateField> 

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="LogOut Time" >
                
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("logoutdate") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 
            </asp:TemplateField> 

             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Ip Address" >
                
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ipaddress") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 
            </asp:TemplateField> 
         
        </Columns>
         <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle  Font-Size="9pt" Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" BorderColor="#CCCCCC" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle  BackColor="#f0f0f0" Font-Bold="false" Font-Size="10pt"  HorizontalAlign="Center" ForeColor="#00277a" Height="20px"  />
    </asp:GridView>
   </td>
   </tr>
   <tr>
   <td>
    &nbsp;
   </td>
   </tr>
<%--  <tr>
         <td id="Td2" runat="server" align="center" style="height:30px"  class="style24" width=" 90%"> 
         
         <asp:Label ID="Label1" runat="server" Text="Logout Users List" Font-Bold="true" ForeColor="#00277a" Font-Size="15pt"></asp:Label>
             <br />
           </td>
       </tr>
   

    <tr>
   <td align="center">
   <asp:GridView ID="GridView1" runat="server" Width="96%" AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="11pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="10" PagerStyle-BackColor="White" >
        <Columns>           
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="User Name" HeaderStyle-HorizontalAlign="Center">
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="20%" />
            </asp:TemplateField>

                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Logout Date" >
                
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("logdate") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
               
            </asp:TemplateField> 

             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Ip Address Time" >
                
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ipaddress") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 
            </asp:TemplateField> 
         
        </Columns>
         <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle  Font-Size="9pt" Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" BorderColor="#CCCCCC" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle  BackColor="#f0f0f0" Font-Bold="false" Font-Size="10pt"  HorizontalAlign="Center" ForeColor="#00277a" Height="20px"  />
    </asp:GridView>
   </td>
   </tr>--%>
   </table>
   <br />
   <br />
    </div>
    </form>
</body>
</html>
