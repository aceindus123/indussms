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
<div class="container" align="center"  >
 <table width="100%" >
    <tr>
      <td  style="background: url(images/smsreports.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right" colspan="2">
             <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

              </td>
              </tr>
     </table>

     <table width="70%" cellspacing="10px" style="padding-left:140px;">
     <tr >
         <td>
            <asp:LinkButton ID="lnknormal" Text="Normal SMS Reports" runat="server" 
                 Font-Bold="true"  ForeColor="Black" CssClass="reports" 
                 onclick="lnknormal_Click"></asp:LinkButton>
        </td>
         <td>
            <asp:LinkButton ID="lnkschedule" Text="Scheduled SMS Reports" runat="server" 
                 Font-Bold="true"  ForeColor="Black"  CssClass="reports"
                 onclick="lnkschedule_Click"></asp:LinkButton>
       </td>
     </tr>
     </table>


     <table width="70%" id="report" runat="server" style="padding-left:150px;">
        <tr>
          <td style="padding-left:30px;">
             <asp:LinkButton ID="lnktoday" Text="Today Reports" runat="server"  
                   ForeColor="Black" onclick="lnktoday_Click" CssClass="reports"></asp:LinkButton>
          </td>
          <td style="padding-right:8px;">
             <asp:LinkButton ID="lnkpast" Text="Pastday Reports" runat="server"  
                   ForeColor="Black" onclick="lnkpast_Click" CssClass="reports"></asp:LinkButton>
          </td>
        </tr>
     </table>
     <br />

     <table id="past" runat="server"  width="80%">
       <tr>
         <td align="center">
           <font size="3" color="black"><strong>From Date : </strong></font> 
             <asp:TextBox ID="txtfrom" runat="server" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select From Date" ControlToValidate="txtfrom" ValidationGroup="date">*</asp:RequiredFieldValidator>
             <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtfrom" InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" FilterMode="InvalidChars"></ajax:FilteredTextBoxExtender>
             &nbsp;<asp:ImageButton 
                 runat="server" ID="imgPopup" ImageUrl="~/images/calendar.png" 
                style="width: 16px" />
                <ajax:FilteredTextBoxExtender ID="ftxt1" runat="server" TargetControlID="txtfrom" InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" FilterMode="InvalidChars"></ajax:FilteredTextBoxExtender>
           <ajax:CalendarExtender ID="CalendarExtender1" BehaviorID="CalendarExtender1" runat="server" TargetControlID="txtfrom" PopupButtonID="imgPopup" OnClientDateSelectionChanged="checkDate">
                            </ajax:CalendarExtender>
            <font size="3" color="black"><strong>&nbsp;&nbsp;&nbsp;&nbsp; To Date : </strong></font> <asp:TextBox ID="txtto" runat="server"  ></asp:TextBox>
            <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtto" InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" FilterMode="InvalidChars"></ajax:FilteredTextBoxExtender>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select to Date" ControlToValidate="txtto" ValidationGroup="date">*</asp:RequiredFieldValidator>
            <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtto" InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" FilterMode="InvalidChars"></ajax:FilteredTextBoxExtender>
            &nbsp;<asp:ImageButton runat="server" ID="Img1" ImageUrl="~/images/calendar.png" />
        <ajax:CalendarExtender ID="CalendarExtender2" BehaviorID="CalendarExtender2" runat="server" TargetControlID="txtto" PopupButtonID="Img1" OnClientDateSelectionChanged="checkDate" >
                            </ajax:CalendarExtender> 
<br /><br />
         <%--   <asp:Button ID="btnget" runat="server" Text="Get Details" 
                 onclick="btnget_Click" ValidationGroup="date"  />--%>
                 <asp:ImageButton ID="btnget" runat="server" onclick="btnget_Click"  ImageUrl="~/images/getdetails.png" />

             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="date" ShowMessageBox="true" ShowSummary="false" />
         </td>
       </tr>
     </table>
     <br />


     <table Width="80%" runat="server" id="schsms">
       <tr>
         <td >
                 <asp:GridView ID="gvFeedback" runat="server"   Width="900px" RowStyle-Height="40px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="True" GridLines="None" AlternatingRowStyle-BackColor="#F7F8E0"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="5" 
                                ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" 
                    EmptyDataRowStyle-Font-Size="Medium" 
                     onpageindexchanging="gvFeedback_PageIndexChanging"  
                    >
                    <PagerStyle  ForeColor="white" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#0985c5"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="white" Height="30px" BackColor="#0985c5" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                               <asp:TemplateField>
                                  <HeaderTemplate>Sl No</HeaderTemplate>
                                  <ItemStyle ForeColor="Black" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblsch" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                   <asp:TemplateField>
                                  <HeaderTemplate>Receiver No</HeaderTemplate>
                                  <ItemStyle ForeColor="Black" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblrec" runat="server" Text='<%# Eval("Recivernumber").ToString().Length > 6? (Eval("Recivernumber") as string).Substring(0,6) + " " : Eval("Recivernumber")  %>' ForeColor="Black"/>
                                      <asp:LinkButton ID="LinkButton1" runat="server" Text="..."></asp:LinkButton>
                                  
                                   <asp:Panel ID="panel1" runat="server" Height="150px" >
        <table width="800px" bgcolor="#33ccff" align="center">
             <tr><td align="left">
                 <asp:Label ID="lbname" runat="server" Text="Receiver Numbers :" ForeColor="White" Font-Size="Large"></asp:Label></td><td align="right">
                 <asp:ImageButton ID="cancel1" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="800px" bgcolor="white" height="200px" align="center" >
           
             <tr style="background-color:#CCFFFF">
             <td align="center" colspan="2" >
             <div id="schdiv" style="  overflow-y:auto;overflow-x:auto;word-break:break-all "  runat="server">
                 <asp:Label ID="lblschno" runat="server"  CssClass="lbl12" Text='<%#Eval("Recivernumber") %>' ForeColor="Black" Font-Size="Large"></asp:Label>
                 </div>
                    </td>
             </tr>
          <tr></tr>
          
             </table>      
        
        </asp:Panel>
         <ajax:ModalPopupExtender ID="mp3"  runat="server" TargetControlID="LinkButton1" CancelControlID="cancel1" ViewStateMode="Disabled" PopupControlID="panel1" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Sender No</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblsender" runat="server" Text='<%# Eval("Sendernumber") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Message</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblmsgs" runat="server" Text='<%# Eval("subject").ToString().Length > 6? (Eval("subject") as string).Substring(0,6) + " " : Eval("subject")  %>' ForeColor="Black"/>
                                  <asp:LinkButton id="lnkReadmorerec3" runat="server" Text="..."   ToolTip="Read FUll Subject " CausesValidation="false"></asp:LinkButton>
                                   <asp:Panel ID="pan2" runat="server" Height="150px" >
        <table width="800px" bgcolor="#33ccff" align="center">
             <tr><td align="left">
                 <asp:Label ID="Label1" runat="server" Text="Your Message :" ForeColor="White" Font-Size="Large"></asp:Label></td><td align="right">
                 <asp:ImageButton ID="btnimcan1" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="800px" bgcolor="white" height="200px" align="center" >
           
             <tr style="background-color:#CCFFFF">
             <td align="center" colspan="2" >
             <div id="div" style="  overflow-y:auto;overflow-x:auto;word-break:break-all "  runat="server">
                 <asp:Label ID="lbl" runat="server"  CssClass="lbl12" Text='<%#Eval("subject") %>' ForeColor="Black" Font-Size="Large"></asp:Label>
                 </div>
                    </td>
             </tr>
          <tr></tr>
          
             </table>      
        
        </asp:Panel>
         <ajax:ModalPopupExtender ID="ModalPopupExtender2"  runat="server" TargetControlID="lnkReadmorerec3" CancelControlID="btnimcan1" ViewStateMode="Disabled" PopupControlID="pan2" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                   <asp:TemplateField>
                                  <HeaderTemplate>Schedule Date</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblschdate" runat="server" Text='<%# Eval("schdate") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Status</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblsts" runat="server" Text='<%# Eval("Status") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Post Date</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lbldate" runat="server" Text='<%# Eval("currentdate") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                   </Columns>
                    <EmptyDataTemplate>No Records Found...</EmptyDataTemplate>
                </asp:GridView>
         </td>
       </tr>
     </table>

     <table Width="80%" runat="server" id="normalsms">
       <tr>
         <td>
                <asp:GridView ID="GridView1" runat="server"   Width="900px" RowStyle-Height="40px"  
                                AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="True" GridLines="None" AlternatingRowStyle-BackColor="#F7F8E0"  
                                PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   PageSize="5" 
                                ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Red" 
                                EmptyDataRowStyle-HorizontalAlign="Center" 
                    EmptyDataRowStyle-Font-Size="Medium" 
                    onpageindexchanging="GridView1_PageIndexChanging">
                    <PagerStyle  ForeColor="White" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#0985c5"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="white" Height="30px" BackColor="#0985c5" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                <asp:TemplateField>
                                  <HeaderTemplate>Srl No</HeaderTemplate>
                                  <ItemStyle ForeColor="Black" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Sender No</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblsub" runat="server" Text='<%# Eval("Sendernumber") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Receiver No</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblrev" runat="server" Text='<%# Eval("Recivernumber").ToString().Length>6?(Eval("Recivernumber")as string).Substring(0,6)+" " :Eval("Recivernumber") %>' ForeColor="Black"/>
                                      <asp:LinkButton ID="lnkreceiver" runat="server" Text="..." ToolTip="Read FUll Recivernumber" CausesValidation="false"></asp:LinkButton>
                                        <asp:Panel ID="panel" runat="server" Height="150px" >
        <table width="800px" bgcolor="#33ccff" align="center">
             <tr><td>
                 <asp:Label ID="lnlname" runat="server" Text="Receiver Numbers :" ForeColor="White" Font-Size="Large"></asp:Label></td><td align="right">
                 <asp:ImageButton ID="cancel" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="800px" bgcolor="white" height="200px" align="center" >
           
             <tr style="background-color:#CCFFFF">
             <td align="center" colspan="2" >
             <div id="divrecv" style="  overflow-y:auto;overflow-x:auto;word-break:break-all "  runat="server">
                 <asp:Label ID="lblrevnum" runat="server"  CssClass="lbl12" Text='<%# Eval("Recivernumber") %>'  ForeColor="Black" Font-Size="Large" ></asp:Label>
                 </div>
                    </td>
             </tr>
          <tr></tr>
          
             </table>      
        
        </asp:Panel>
         <ajax:ModalPopupExtender ID="mp2"  runat="server" TargetControlID="lnkreceiver" CancelControlID="cancel" ViewStateMode="Disabled" PopupControlID="panel" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Message</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px" Wrap="true"/>
                                  <ItemTemplate >
                                <asp:Label ID="lblmsg" runat="server"  Text='<%# Eval("subject").ToString().Length > 6? (Eval("subject") as string).Substring(0,6) + " " : Eval("subject")  %>' ForeColor="Black"></asp:Label>
                                  <asp:LinkButton id="lnkReadmorerec3" runat="server" Text="..."   ToolTip="Read FUll Subject " CausesValidation="false"></asp:LinkButton>
                                   <asp:Panel ID="pan2" runat="server" Height="150px" >
        <table width="800px" bgcolor="#33ccff" align="center">
             <tr><td>
                 <asp:Label ID="Label2" runat="server" Text="Your Message :" ForeColor="White" Font-Size="Large"></asp:Label></td><td align="right">
                 <asp:ImageButton ID="btnimcan1" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="800px" bgcolor="white" height="200px" align="center" >
           
             <tr style="background-color:#CCFFFF">
             <td align="center" colspan="2" >
             <div id="div" style="  overflow-y:auto;overflow-x:auto;word-break:break-all "  runat="server">
                 <asp:Label ID="lbl" runat="server"  CssClass="lbl12" Text='<%# Eval("subject") %>'  ForeColor="Black" Font-Size="Large" ></asp:Label>
                 </div>
                    </td>
             </tr>
          <tr></tr>
          
             </table>      
        
        </asp:Panel>
         <ajax:ModalPopupExtender ID="ModalPopupExtender2"  runat="server" TargetControlID="lnkReadmorerec3" CancelControlID="btnimcan1" ViewStateMode="Disabled" PopupControlID="pan2" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Status</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lblmess" runat="server" Text='<%# Eval("Status") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField>
                                  <HeaderTemplate>Date/Time</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="16px"/>
                                  <ItemTemplate><asp:Label ID="lbldate" runat="server" Text='<%# Eval("currentdate") %>' ForeColor="Black"/></ItemTemplate>
                                  </asp:TemplateField>
                   </Columns>
                    <EmptyDataTemplate>No Records Found...</EmptyDataTemplate>
                </asp:GridView>
         </td>
       </tr>
     </table>
     <br />

      <input id="btnedit" runat="server" type="button" style="display: none" />
     <%--  <ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="lnkReadmorerec3"
            BackgroundCssClass="modalBackground1"  DropShadow="false"  CancelControlID="btnclose"
            PopupControlID="pan2"  ></ajax:ModalPopupExtender>
              <asp:Panel ID="pnl1" runat="server" BackColor="White" Height="200px" Width="550px"  >
          <table bgcolor="White" align="center" width="550px" style="height: 200px" >
          <tr>
                <td align="center" colspan="2"  align="center" valign="top">
                    <asp:Label ID="Label1" runat="server" Text="Recivers Mobile Numbers" Font-Size="Medium" ForeColor="#006699" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Overline="False"></asp:Label>
                </td>
                <td align="right" valign="top">
                  <asp:Button ID="Button1" runat="server" Text="X" Font-Size="Large" />
                </td>
            </tr>
            
             <tr>
             <td align="center">
                 <asp:Label ID="Label2" runat="server" Visible="false" ForeColor="Black"></asp:Label>
             </td>
             </tr>
          </table>     
        </asp:Panel>--%>

        
     </div>
</asp:Content>

