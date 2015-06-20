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
     <br /><br />
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
             <br />
           </td>
       </tr>
   
     <tr>
    <td  id="Errmsg" align="right" class="lblog" runat="server">
           </td>
    </tr>   
   <tr>
   <td align="center">
    <asp:GridView ID="GrdLoginUsers" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  
           PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                                 
                                 DataKeyNames="id" onpageindexchanging="GrdLoginUsers_PageIndexChanging" 
                                ><%--onrowdatabound="gvpermission_RowDataBound"--%>
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                     <Columns>
                        <asp:TemplateField  HeaderText="SlNo" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>' ></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="UserName" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>                
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Uname") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                         <asp:TemplateField  HeaderText="LoginTime" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Datetime") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                         <asp:TemplateField  HeaderText="IP Address" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:Label ID="lbl3" runat="server" Text='<%#Eval("IpAddress") %>'></asp:Label>
                        </ItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="LogOutTime" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                                   <asp:Label ID="lbllogouttime" runat="server" Text='<%#Eval("Logoutdate") %>'></asp:Label>
                                   </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="Downloadfile" ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkdwnld" runat="server" Font-Underline="false" OnClick="downloadimg"  CommandArgument='<%#Eval("imagepath") %>' Text="Documents Download"></asp:LinkButton>
                        </ItemTemplate>
                        
                        </asp:TemplateField>--%>
                        
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
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
