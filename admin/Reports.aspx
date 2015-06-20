<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="admin_Reports" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Reports : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css"> 
    .simple1 
    { 
      text-decoration:none;
    } 
    .simple1:hover 
    { 
     text-decoration:underline;
     font-size:large;
     color:Orange;
    } 
  </style>  

    
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <br />
        <head:header ID="head1" runat="server" />
        <br /><br />
        <table>
        <tr><td align="center" id="View" runat="server" ><font size="5" color="green"><strong>SMS Reports</strong></font><br /></td></tr>
        <br />
        <tr><td align="center">
                 <asp:RadioButton ID="rdnormalsms" runat="server" Text="Normal SMS" 
                AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="rdnormalsms_CheckedChanged" 
                />&nbsp;&nbsp; <asp:RadioButton ID="rdschedulesms" runat="server" 
                Text="Schedule SMS" AutoPostBack="true"  GroupName="rd1" Checked="false" 
                oncheckedchanged="rdschedulesms_CheckedChanged" />
                &nbsp;
                <asp:RadioButton ID="rdvoicesms" runat="server" 
                Text="Voice SMS" AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="rdvoicesms_CheckedChanged" 
                 />
                &nbsp;&nbsp; <asp:RadioButton ID="rddownload" runat="server" 
                Text="Download Report" AutoPostBack="true"  GroupName="rd1" 
                Checked="false" oncheckedchanged="rddownload_CheckedChanged" 
                 />
        </td></tr>
        <tr><td>
             <asp:GridView ID="gvscedulereports" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                     BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                     Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  
                     PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
                     EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                     EmptyDataRowStyle-HorizontalAlign="Center" 
                     EmptyDataRowStyle-Font-Size="Medium" 
                     onpageindexchanging="gvscedulereports_PageIndexChanging">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                     <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                     <Columns>
                        <asp:BoundField DataField="sid" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Sender ID"/>            
                        <asp:BoundField DataField="Reciver" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Receiver Name"/>            
                        <asp:BoundField DataField="Recivernumber"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Receiver No"/>
                        <asp:TemplateField HeaderText="Subject">
                        <ItemStyle HorizontalAlign="Center" BorderColor="#CCCCCC" ForeColor="Gray"/> 
                     <ItemTemplate>               
                      <asp:Label ID="lblsub" runat="server"  Text='<%#Eval("subject").ToString().Length>=26?Eval("subject").ToString().Substring(0,25):Eval("subject").ToString() %>' ToolTip='<%#Eval("subject") %>'/>       
                     </ItemTemplate>
                     </asp:TemplateField>
                        <asp:BoundField DataField="schdate"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Schedule Time"/>
                        <asp:BoundField DataField="status"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status"/>
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView>
        </td></tr>
        <tr><td>
          <asp:GridView ID="gvnormalreports" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                        BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" 
                     Font-Strikeout="False"  OnPageIndexChanging="gvnormalreports_PageIndexChanging"
                    Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  
                    PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
                    EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                 EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                     <Columns>
                        <asp:BoundField DataField="Sendernumber" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Sender No"/>            
                        <asp:BoundField DataField="Recivernumber"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Receiver No"/>
                        <asp:TemplateField HeaderText="Subject">
                    <ItemStyle HorizontalAlign="Center" BorderColor="#CCCCCC" ForeColor="Gray"/> 
                    <ItemTemplate>               
                      <asp:Label ID="lblsubject" runat="server" Text='<%#Eval("subject").ToString().Length>=26?Eval("subject").ToString().Substring(0,25):Eval("subject").ToString() %>' ToolTip='<%#Eval("subject") %>'  />       
                 </ItemTemplate>
                    </asp:TemplateField>
                        <asp:BoundField DataField="currentdate"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Date/Time"/>
                        <asp:BoundField DataField="status"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status"/>
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
          </asp:GridView>
        </td></tr>
        <tr><td>
             <asp:GridView ID="gvvoicereports" runat="server"   Width="900px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                        BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"
                        Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  
                    PagerStyle-BackColor="White"   PageSize="10" 
                               ShowHeaderWhenEmpty="true"
                    EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                    EmptyDataRowStyle-HorizontalAlign="Center" 
                     EmptyDataRowStyle-Font-Size="Medium" 
                     onpageindexchanging="gvvoicereports_PageIndexChanging">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                        <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                     <Columns>
                        <asp:BoundField DataField="Username" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" ItemStyle-HorizontalAlign="Center"  HeaderText="Sender"/>            
                        <asp:BoundField DataField="Voiceclip"  ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Voice Clip"/>
                        <asp:BoundField DataField="Tonumber"  ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Reciver No"/>
                        <asp:BoundField DataField="Senttime"   ItemStyle-ForeColor="Gray"  ItemStyle-HorizontalAlign="Center"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Date/Time"/>
                        <asp:BoundField DataField="Status"    ItemStyle-ForeColor="Gray" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status"/>
                    </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
           </asp:GridView>
        </td></tr>
        </table>
        <table id="reports" runat="server" align="center">
            <tr>
                <td>
                    <asp:LinkButton ID="btnnormal" runat="server"  CssClass="simple1" 
                        onclick="btnnormal_Click">Normal SMS</asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="btnschedule" runat="server"  onclick="btnschedule_Click" CssClass="simple1" 
                        >Schedule SMS</asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="btnvoice" runat="server"  onclick="btnvoice_Click" CssClass="simple1"  
                        >Voice SMS</asp:LinkButton> &nbsp; &nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" Height="29px" 
                                   Width="73px" onclick="btncancel_Click" />                                                       
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
