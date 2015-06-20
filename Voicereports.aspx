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

    <script>        function date() {
            t1 = document.getElementById("txtfrom").value;

            t2 = document.getElementById("textto").value;

            var one_day = 1000 * 60 * 60 * 24;

            var x = t1.split("/");

            var y = t2.split("/");

            var date1 = new Date(x[2], (x[1] - 1), x[0]);

            var date2 = new Date(y[2], (y[1] - 1), y[0])

            var month1 = x[1] - 1;
            var month2 = y[1] - 1;

            _Diff = Math.ceil((date2.getTime() - date1.getTime()) / (one_day));
            if (_Diff < 0) {
                alert("select 7 days before to date");
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

    <div >
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>


<table style="padding-left:100px;">
<tr><td><br /></td></tr>
         <tr>
             <td align="center" id="View" runat="server">
                    <font size="4" color="Green"><strong>Search By Date </strong></font> 
                    <br /><br />
             </td>
         </tr>
           <tr><td></td></tr>
         <tr>
             <td>
                 <table style="padding-left:150px;">
                     <tr>
                       <td class="style1"><font size="3" color="black"><strong>From Date : </strong></font>
                       </td>
                       <td class="style1"><asp:TextBox ID="txtfromdate" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select From Date" ValidationGroup="val" ControlToValidate="txtfromdate">*</asp:RequiredFieldValidator>
                              <asp:filteredtextboxextender ID="ftxt1" runat="server" 
                                    TargetControlID="txtfromdate" 
                                    InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" 
                                    FilterMode="InvalidChars"></asp:filteredtextboxextender>
                            <asp:ImageButton runat="server" ID="imgPopup" ImageUrl="~/images/calendar.png" />
                            <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="CalendarExtender1" runat="server" TargetControlID="txtfromdate" PopupButtonID="imgPopup" OnClientDateSelectionChanged="checkDate">
                            </asp:CalendarExtender>
                            </td>
                       <td style="padding-left:20px;"><font size="3" color="black"><strong>To Date : </strong></font></td>
                       <td><asp:TextBox ID="txttodate" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select to Date" ValidationGroup="val" ControlToValidate="txtfromdate">*</asp:RequiredFieldValidator>
                              <asp:filteredtextboxextender ID="Filteredtextboxextender1" runat="server" 
                                    TargetControlID="txttodate" 
                                    InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" 
                                    FilterMode="InvalidChars"></asp:filteredtextboxextender>
                            <asp:ImageButton runat="server" ID="Img1" ImageUrl="~/images/calendar.png" />
                            <asp:CalendarExtender ID="CalendarExtender2" BehaviorID="CalendarExtender2" runat="server" TargetControlID="txttodate" PopupButtonID="Img1" OnClientDateSelectionChanged="checkDate" >
                            </asp:CalendarExtender>
                            </td>
</tr>
<tr><td><br /></td></tr>
                     <tr>
                        <td colspan="4" align="center">
                          <%--  <asp:Button ID="btngetdate" runat="server" 
                                    Text="GetDetails"  Height="30px" Width="90pX" onclick="btngetdate_Click" ValidationGroup="val"/>--%>
                              <asp:ImageButton ID="btngetdate" runat="server" onclick="btngetdate_Click"  ImageUrl="~/images/getdetails.png" />

                        </td>
                                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />
                     </tr>
                  </table><br /><br />
              </td>
           </tr>
           <tr>
              <td class="rounded-corners" id="gridview" runat="server">
                  <asp:GridView ID="gvreports" runat="server"   Width="800px"  AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                             BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" RowStyle-Height="30px"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  OnPageIndexChanging="PageIndexChanging"
                Font-Underline="False"    AllowPaging="True"   PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="10" 
                                ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium">
                    <PagerStyle  ForeColor="white" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#0985c5"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="white" Height="30px" BackColor="#0985c5" Font-Size="14px" Font-Names="Arial" /> 
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
                    <EmptyDataTemplate>No Records Found...</EmptyDataTemplate>
                </asp:GridView></td></tr>
                </table>
                <br />
</div>
</asp:Content>

