<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="Voicereports.aspx.cs" Inherits="Voicereports" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            height: 21px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
<script type="text/javascript">
    function checkDate(sender, args) {
        if (sender._selectedDate > new Date()) {
            alert("You cannot select a day after than today!");
            sender._selectedDate = new Date();
            // set the date back to the current date
            sender._textbox.set_Value(sender._selectedDate.format(sender._format))
        }
    }
    </script>
    <script type="text/javascript">
        function checkDate1(sender, args) {
            if (sender._selectedDate > new Date()) {
                alert("You cannot select a day after than today!");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
    </script>
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
<table style="padding-left:100px;">
                            <tr><td align="center" id="View" runat="server">
                                <font size="4" color="red"><strong><u>Search By Date : </u></strong></font><br /><br />
                              </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr><td>
                            <table style="padding-left:150px;">
                            <tr><td class="style1"><font size="3" color="black"><strong>From Date : </strong></font></td>
                            <td class="style1"><asp:TextBox ID="txtfromdate" runat="server"></asp:TextBox>
                            <asp:ImageButton runat="server" ID="imgPopup" ImageUrl="~/images/calendar.png" />
                            <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="CalendarExtender1" runat="server" TargetControlID="txtfromdate" PopupButtonID="imgPopup" OnClientDateSelectionChanged="checkDate">
                            </asp:CalendarExtender>
                            </td>
                            <td style="padding-left:20px;"><font size="3" color="black"><strong>TO Date : </strong></font></td>
                            <td><asp:TextBox ID="txttodate" runat="server"></asp:TextBox>
                            <asp:ImageButton runat="server" ID="Img1" ImageUrl="~/images/calendar.png" />
                            <asp:CalendarExtender ID="CalendarExtender2" BehaviorID="CalendarExtender2" runat="server" TargetControlID="txttodate" PopupButtonID="Img1" OnClientDateSelectionChanged="checkDate">
                            </asp:CalendarExtender>
                            </td>
                            <tr><td colspan="4" align="center"><asp:Button ID="btngetdate" runat="server" 
                                    Text="GetDetails"  Height="30px" Width="90pX" onclick="btngetdate_Click"/></td></tr>
                            </table><br /><br />
                            </td></tr>
                            <tr><td><asp:GridView ID="gvreports" runat="server"   Width="800px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"   BackColor="White" AllowPaging="True"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                                ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium">
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Srlno</HeaderTemplate>
                                  <ItemStyle ForeColor="Black" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Mobile No</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblsub" runat="server" Text='<%# Eval("Tonumber") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Voice Clip</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblsub" runat="server" Text='<%# Eval("Voiceclip") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Status</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lblmess" runat="server" Text='<%# Eval("Status") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Date/Time</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Label ID="lbldate" runat="server" Text='<%# Eval("Senttime") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                   </Columns>
                    <EmptyDataTemplate>No Records.</EmptyDataTemplate>
                </asp:GridView><br /></td></tr>
                </table>
</div>
</asp:Content>

