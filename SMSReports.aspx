<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSReports.aspx.cs" Inherits="SMSReports" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%-- <script type="text/javascript">
     function CalendarView(sender, args) {
         sender._switchMode("days", true);
     }
</script>--%>
<script type="text/javascript" language="javascript">

function showDate(sender,args)
{
if(sender._textbox.get_element().value == "")
{
var todayDate = new Date();
sender._selectedDate = todayDate;
}
}
</script>

<script>    function date() {
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
    function checkDate(sender, args) {
        if (sender._selectedDate > new Date()) {
            alert("You cannot select a day after than today!");
            sender._selectedDate = new Date();
            // set the date back to the current date
            sender._textbox.set_Value(sender._selectedDate.format(sender._format))
        }
    }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajax:ToolkitScriptManager ID="tl1" runat="server"></ajax:ToolkitScriptManager>
<div class="container" align="center">
 <table width="100%" cellspacing="10px"  >
     <tr>
        <td align="center" width="100%"  class="titlecampain1" valign="middle" colspan="4">
           <h2> SMS Reports</h2>
        </td>
     </tr>
     </table>

     <table width="70%" cellspacing="10px" style="padding-left:140px;">
     <tr >
         <td>
            <asp:LinkButton ID="lnknormal" Text="Normal SMS Reports" runat="server" 
                 Font-Bold="true" Font-Underline="false" ForeColor="Black" 
                 onclick="lnknormal_Click"></asp:LinkButton>
        </td>
         <td>
            <asp:LinkButton ID="lnkschedule" Text="Scheduled SMS Reports" runat="server" 
                 Font-Bold="true" Font-Underline="false" ForeColor="Black" 
                 onclick="lnkschedule_Click"></asp:LinkButton>
       </td>
     </tr>
     </table>


     <table width="70%" id="report" runat="server" style="padding-left:150px;">
        <tr>
          <td style="padding-left:30px;">
             <asp:LinkButton ID="lnktoday" Text="Today Reports" runat="server"  
                  Font-Underline="false" ForeColor="Black" onclick="lnktoday_Click"></asp:LinkButton>
          </td>
          <td style="padding-right:8px;">
             <asp:LinkButton ID="lnkpast" Text="Pastday Reports" runat="server"  
                  Font-Underline="false" ForeColor="Black" onclick="lnkpast_Click"></asp:LinkButton>
          </td>
        </tr>
     </table>
     <br />

     <table id="past" runat="server"  width="80%">
       <tr>
         <td align="center">
           <font size="3" color="black"><strong>From Date : </strong></font> 
             <asp:TextBox ID="txtfrom" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton 
                 runat="server" ID="imgPopup" ImageUrl="~/images/calendar.png" 
                style="width: 16px" />
           <ajax:CalendarExtender ID="CalendarExtender1" BehaviorID="CalendarExtender1" runat="server" TargetControlID="txtfrom" PopupButtonID="imgPopup" OnClientDateSelectionChanged="checkDate">
                            </ajax:CalendarExtender>
            <font size="3" color="black"><strong>&nbsp;&nbsp;&nbsp;&nbsp; To Date : </strong></font> <asp:TextBox ID="txtto" runat="server" ></asp:TextBox>&nbsp;<asp:ImageButton runat="server" ID="Img1" ImageUrl="~/images/calendar.png" />
        <ajax:CalendarExtender ID="CalendarExtender2" BehaviorID="CalendarExtender2" runat="server" TargetControlID="txtto" PopupButtonID="Img1" OnClientDateSelectionChanged="checkDate">
                            </ajax:CalendarExtender> 
<br /><br />
            <asp:Button ID="btnget" runat="server" Text="Get Details" 
                 onclick="btnget_Click" />
         </td>
       </tr>
     </table>
     <br />


     <table Width="80%">
       <tr>
         <td>
                 <asp:GridView ID="gvFeedback" AutoGenerateColumns="false" runat="server" Width="100%"  DataKeyNames="sid" GridLines="None">
               <Columns>
               <asp:TemplateField HeaderText="Receiver" FooterStyle-Font-Bold="true"  HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblfirstname" runat="server" Text='<%# Eval("Recivernumber") %>' ForeColor="Black" Height="25px" Font-Size="16px"></asp:Label>
            <asp:LinkButton id="lnkReadmorerec" runat="server" Text="..." CommandArgument='<%#Eval("sid") %>' OnCommand="lnkReadmorerec" CommandName="readmorerec" ToolTip="Read more Reciepients" CausesValidation="false"></asp:LinkButton>

                 </ItemTemplate>
               </asp:TemplateField >
               <asp:TemplateField HeaderText="Subject" HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblEmailid" runat="server" Text='<%# Eval("subject") %>' ForeColor="Black" Font-Size="16px" Height="25px"></asp:Label>
            <asp:LinkButton id="lnkReadmorerec1" runat="server" Text="..." CommandArgument='<%#Eval("sid") %>' OnCommand="lnkReadmorerec1" CommandName="readmorerec1" ToolTip="Read FUll Subject " CausesValidation="false"></asp:LinkButton>

                 </ItemTemplate>
               </asp:TemplateField >
               <asp:TemplateField HeaderText="Schedule Time" HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("schdate") %>' ForeColor="Black" Font-Size="16px" Height="25px"></asp:Label>
                 </ItemTemplate>
               </asp:TemplateField >
                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblpdate" runat="server" Text='<%# Eval("status") %>' ForeColor="Black" Font-Size="16px" Height="25px"></asp:Label>
                 </ItemTemplate>
               </asp:TemplateField >
                 </Columns>
                
               </asp:GridView>
         </td>
       </tr>
     </table>

     <table Width="80%">
       <tr>
         <td>
                 <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" Width="100%"  DataKeyNames="sid" GridLines="None">
               <Columns>
               <asp:TemplateField HeaderText="Receiver" FooterStyle-Font-Bold="true"  HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblfirstname1" runat="server" Text='<%# Eval("Recivernumber") %>' ForeColor="Black" Height="25px" Font-Size="16px"></asp:Label>
            <asp:LinkButton id="lnkReadmorerec2" runat="server" Text="..." CommandArgument='<%#Eval("sid") %>' OnCommand="lnkReadmorerec2" CommandName="readmorerec2" ToolTip="Read more Reciepients" CausesValidation="false"></asp:LinkButton>

                 </ItemTemplate>
               </asp:TemplateField >
               <asp:TemplateField HeaderText="Subject" HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblEmailid1" runat="server" Text='<%# Eval("subject") %>' ForeColor="Black" Font-Size="16px" Height="25px"></asp:Label>
            <asp:LinkButton id="lnkReadmorerec3" runat="server" Text="..." CommandArgument='<%#Eval("sid") %>' OnCommand="lnkReadmorerec3" CommandName="readmorerec3" ToolTip="Read FUll Subject " CausesValidation="false"></asp:LinkButton>

                 </ItemTemplate>
               </asp:TemplateField >
               <asp:TemplateField HeaderText="Schedule Time" HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblSubject1" runat="server" Text='<%# Eval("currentdate") %>' ForeColor="Black" Font-Size="16px" Height="25px"></asp:Label>
                 </ItemTemplate>
               </asp:TemplateField >
                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="contentsize" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Label ID="lblpdate1" runat="server" Text='<%# Eval("status") %>' ForeColor="Black" Font-Size="16px" Height="25px"></asp:Label>
                 </ItemTemplate>
               </asp:TemplateField >
                 </Columns>
                
               </asp:GridView>
         </td>
       </tr>
     </table>
     <br />

      <input id="btnedit" runat="server" type="button" style="display: none" />
        <ajax:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="btnedit"
            BackgroundCssClass="modalBackground1"  DropShadow="false"  CancelControlID="btnclose"
            PopupControlID="pnllist"  >
        </ajax:ModalPopupExtender>
        <asp:Panel ID="pnllist" runat="server" BackColor="White" Height="200px" Width="550px"  >
          <table bgcolor="White" align="center" width="550px" style="height: 200px" >
          <tr>
                <td align="center" colspan="2"  align="center" valign="top">
                    <asp:Label ID="lblemail" runat="server" Text="Recivers Mobile Numbers" Font-Size="Medium" ForeColor="#006699" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Overline="False"></asp:Label>
                </td>
                <td align="right" valign="top">
                  <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Large" />
                </td>
            </tr>
            
             <tr>
             <td align="center">
                 <asp:Label ID="lblmobilenumbers" runat="server" Visible="false" ForeColor="Black"></asp:Label>
             </td>
             </tr>
          </table>     
        </asp:Panel>
     </div>
</asp:Content>

