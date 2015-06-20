<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="ScheduleSMS.aspx.cs" Inherits="ScheduleSMS" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="MaxLength.min.js"></script>
    <script src="css/MaxLength.min.js" type="text/javascript"></script>
<%--    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txtmsg]").MaxLength({ MaxLength: 160 });

        });
    </script>--%>

    <script type="text/javascript">
        function Check(textBox, maxLength) {
            if (textBox.value.length > maxLength) {
                alert("Max characters allowed are " + maxLength);
                textBox.value = textBox.value.substr(0, maxLength);
            }
        }        

</script>
    <script type="text/javascript">
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }
        </script>

    <script type="text/javascript">

      function CompareDate(sender, args) {

          var fromdate = sender._selectedDate;
          var dd = fromdate.getDate();
          var mm = fromdate.getMonth() + 1; //January is 0!
          var yyyy = fromdate.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }

          var fromdate1 = new Date();
          fromdate1 = dd + '/' + mm + '/' + yyyy;

              //  alert(fromdate1);

          var todate = new Date();
          var dd1 = todate.getDate();
          var mm1 = todate.getMonth() + 1; //January is 0!
          var yyyy1 = todate.getFullYear();
          if (dd1 < 10) {
              dd1 = '0' + dd1;
          }
          if (mm1 < 10) {
              mm1 = '0' + mm1;
          }
          var todate1 = new Date();
          todate1 = dd1 + '/' + mm1 + '/' + yyyy1;
          //alert(todate1);
          var oneDay = 24 * 60 * 60 * 1000;

          if ((fromdate1 != "") && (todate1 != "")) {

              //                var fdt1 = fromdate1.g;
              //                var tdt1 = todate1.getTime();

              if (fromdate1 < todate1) {
                  alert("You cannot schedule a day earlier than today!");
                  sender._selectedDate = new Date();
                  // set the date back to the current date
                  sender._textbox.set_Value(sender._selectedDate.format(sender._format));
              }

          }
      }




      function checkDate(sender, args) {

          if (sender._selectedDate < new Date()) {
              var date1 = sender._selectedDate.format(sender._format);
              var d = new Date(sender._format);
              alert(date1);
              alert(d);
              alert(sender._selectedDate);
              alert("You can schedule  a day earlier than today!");

              sender._selectedDate = new Date();
              sender._textbox.set_Value(sender._selectedDate.format(sender._format))
          }

      }

      function Checktime(sender, args) {

          if (sender._selectedDate < new Date()) {
              var date1 = sender._selectedDate.format(sender._format);
              var d = new Date(sender._format);
              alert(date1);
                }

      }

      function SetHiddenVariable() {
          var d = new Date();
          var year = d.getFullYear();
          var month = d.getMonth() + 1;
          var date = d.getDate();
          var hours = d.getHours();
          var minutes = d.getMinutes();
          var seconds = d.getSeconds();
          var tt = d.format("tt");
   
          var hid1 = month + "/" + date + "/" + year + " " + hours + ":" + minutes + ":" + seconds;
          //var hid1=date + "/" + month + "/" + year + " " + dt;
          document.getElementById("<%= inpHide.ClientID %>").value = hid1;

     }
      FTB_FreeTextBox.prototype.CancelEvent = function (ev) {
          try {
              ev.preventDefault();
              ev.stopPropagation();
          }
          catch (e) {
              if (FTB_Browser.isIE) {
                  ev.cancelBubble = true;
                  ev.returnValue = false;
              }
          }
      };

</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container23" id="normaldata" runat="server">

  <div runat="server" id="schdata" >
       <input id="inpHide" type="hidden" runat="server" /> 
    <ajax:ToolkitScriptManager ID="lbl" runat="server"></ajax:ToolkitScriptManager>


  <table width="100%" border="0">

     <tr>
         <td  style="background: url(images/header_bg.png); background-repeat:no-repeat; width:1000px; height:70px;"  align="right" colspan="3">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back1"  PostBackUrl="~/SMSMainMenu.aspx"  />
          </td>
     </tr>
     <tr>
      <td>
      <table style="background: url(images/com.jpg); background-repeat:no-repeat; width:1050px; height:auto;padding-left:200px; margin-top:10px;">
             <tr>
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="Label4" runat="server" Text=" Select Number or  List"  ForeColor="Black" CssClass="schlabel"></asp:Label>               
           </td>
             <td valign="top">:</td>
           <td>
              &nbsp;<asp:RadioButton ID="rdnumber" runat="server" Width="100px" Text="Number"  
                   ForeColor="Black" AutoPostBack="true" 
                   oncheckedchanged="rdnumber_CheckedChanged"></asp:RadioButton>
               <asp:RadioButton ID="rdlist" runat="server" Width="100px" Text="List"  AutoPostBack="true" 
                   ForeColor="Black" oncheckedchanged="rdlist_CheckedChanged" Height="21px"></asp:RadioButton>
          <br /> <br /></td>
         </tr>

         <tr id="number" runat="server">
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="lblname" runat="server" Text="Reciver Name"  ForeColor="Black" CssClass="schlabel"></asp:Label>               
           </td>
             <td valign="top">:</td>
           <td style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
               <asp:TextBox ID="txtname" runat="server" Width="262px"  Height="20px" CssClass="textboxsch"></asp:TextBox>

               <asp:RequiredFieldValidator ID="RequiredFieldValidator3"       runat="server" ControlToValidate="txtname" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">  </asp:RequiredFieldValidator>

               <br /> <br />

           </td>
         </tr>

         <tr id="number1" runat="server">
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="lblmobile" runat="server" Text="Reciver Mobile Number"    CssClass="schlabel" ForeColor="Black"></asp:Label>               
           </td>
             <td valign="top">:</td>
           <td style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
              <asp:TextBox ID="txtmobile" runat="server"   onkeypress="return onlyNos(event,this);" 
              MaxLength="10" Width="262px"  Height="20px" CssClass="textboxsch"></asp:TextBox>
              <asp:RequiredFieldValidator ID="mobileno1"  runat="server" ControlToValidate="txtmobile" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">      </asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ControlToValidate="txtmobile"   ValidationGroup="missed"
              ErrorMessage="Please Enter Valid Mobile Number" ValidationExpression="[7-9]{1}[0-9]{9}"></asp:RegularExpressionValidator>
           <br /> <br /> </td>
         </tr>

         <tr id="list" runat="server">
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="lbllist" runat="server" Text=" Select  List"  CssClass="schlabel" ForeColor="Black"></asp:Label>               
           </td>
             <td valign="top"> :</td>
           <td  style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
               <asp:DropDownList ID="ddlist" runat="server" Width="262px"  Height="20px" CssClass="textboxsch"  AutoPostBack="true"
                   onselectedindexchanged="ddlist_SelectedIndexChanged" >
              <asp:ListItem>Select List</asp:ListItem>
              </asp:DropDownList>
           <br /><br /></td>
         </tr>

              <tr id="Tr1" runat="server" visible="false">
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="Label1" runat="server" Text=" Select  Template"  CssClass="schlabel" ForeColor="Black"></asp:Label>               
           </td>
             <td valign="top"> :</td>
           <td  style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
               <asp:DropDownList ID="ddtemplate" runat="server" Width="262px"  Height="20px" 
                   CssClass="textboxsch"  AutoPostBack="true" onselectedindexchanged="ddtemplate_SelectedIndexChanged"
                    >
              <asp:ListItem>Select Template</asp:ListItem>
              </asp:DropDownList>
           <br /><br /></td>
         </tr>

         <tr id="list1" runat="server">
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="Label5" runat="server" Text="Selected Numbers" CssClass="schlabel"  ForeColor="Black"></asp:Label>               
           </td>
             <td valign="top">:</td>
           <td style="background: url(images/textboxnew22.png); background-repeat:no-repeat; padding-left:6px; ">
               <asp:TextBox ID="txtnumbers" runat="server" TextMode="MultiLine" Width="262px"  Height="80px" CssClass="textboxsch" ></asp:TextBox>
          <br /><br /> </td>
         </tr>

         <tr >
           <td  align="right" class="schdule" valign="top">
              <asp:Label ID="lbltime" runat="server" Text="Schedule Time" CssClass="schlabel"  ForeColor="Black"></asp:Label>               
           </td>
             <td valign="top">:</td>
           <td style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
               <asp:TextBox ID="txttime" runat="server" Width="262px"  Height="20px" CssClass="textboxsch" Enabled="false" ></asp:TextBox>
               <ajax:FilteredTextBoxExtender ID="ftxt1" runat="server" TargetControlID="txttime" InvalidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&" FilterMode="InvalidChars"></ajax:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ControlToValidate="txttime" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">      </asp:RequiredFieldValidator>
              <asp:ImageButton ID="imgcal" runat="server" 
                   ImageUrl="images/1419954059_calendar.png" Width="25px" Height="25px"  onclick="imgcal_Click"  />
            <br /> <br /></td>
         </tr>

         <tr>
           <td valign="top"  align="right" class="schdule" valign="top">
              <asp:Label ID="lblmessage" runat="server" Text="Subject  " CssClass="schlabel" ForeColor="Black"></asp:Label>               
           </td>
           <td valign="top"  align="center" >:</td>
           <td style="background: url(images/textboxnew22.png); background-repeat:no-repeat; padding-left:6px; ">
               <asp:TextBox ID="txtmsg" runat="server" Width="262px"  Height="80px" CssClass="textboxsch" AutoPostBack="true" onKeyUp="javascript:Check(this, 306);"
        onChange="javascript:Check(this, 306);"
                   TextMode="MultiLine" ontextchanged="txtmsg_TextChanged"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14"  runat="server" ControlToValidate="txtmsg" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">      </asp:RequiredFieldValidator>
           <br /> <br /> </td>
         </tr>
          <tr id="Tr2" runat="server" visible="false">
         <td>
             &nbsp;
        </td>
         <td>
             &nbsp;
        </td>
         <td  valign="top" align="justify">
             <asp:Label ID="Label9" runat="server"    ForeColor="Black"  ></asp:Label>&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button6" runat="server" Text="NO"  Width="70px" 
                 onclick="Button6_Click"  />
             <asp:Button ID="Button7" runat="server" Text="Proceed"  Width="80px" 
                  onclick="Button7_Click"/>
         </td>
      </tr>
      <tr>
          <td>
             &nbsp;
        </td>
         <td>
             &nbsp;
        </td>
         <td  valign="top" align="justify">
             <asp:Label ID="Label10" runat="server"  ForeColor="Black" Visible="false" ></asp:Label>&nbsp;&nbsp;&nbsp;
             
         </td>
      </tr>
         <tr>
          <td>
             &nbsp;
        </td>
         <td>
             &nbsp;
        </td>
         <td  valign="top" align="justify">
             <asp:Label ID="Label11" runat="server"  ForeColor="Black" Visible="false" ></asp:Label>&nbsp;&nbsp;&nbsp;
             
         </td>
      </tr>
         <tr>
         <td align="right" class="schdule" id="schsender" runat="server">
           <asp:Label ID="lblsender" runat="server" Text="SenderID"  ForeColor="Black"></asp:Label><asp:DropDownList ID="ddlschedulesender" runat="server" Height="20px" >
            </asp:DropDownList>
       </td>
          <%-- <td >
                &nbsp;            
           </td>--%>
          <td id="schsender1" runat="server"></td>
           <td >
            
           </td>
              <td >
              <asp:ImageButton  ID="btnschedule" runat="server" ValidationGroup="missed" onclick="btnschedule_Click" ImageUrl="~/images/schedule.png" />
              <asp:ImageButton  ID="btncancel" runat="server" onclick="btncancel_Click" ImageUrl="~/images/cancel - Copy.png" />

            
           </td>
         </tr>
      </table>
      </td>
     </tr>

  
   </table>

         <input id="btnedit" runat="server" type="button" style="display: none" />
        <ajax:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="btnedit"
            BackgroundCssClass="modalBackground1"  DropShadow="false" PopupControlID="pnllist"  >
        </ajax:ModalPopupExtender>
       
        <asp:Panel ID="pnllist" runat="server" BackColor="White" Height="330px" Width="750px"  >
          <table bgcolor="White" align="center" width="740px" style="height: 330px" >
             <tr>
                <td align="center" colspan="2"  align="center">
                    <asp:Label ID="lblemail" runat="server" Text="Schedule your SMS Time" Font-Size="Medium" ForeColor="#006699" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Overline="False"></asp:Label>
                </td>
            </tr>
             <tr>
               <td colspan="2" >
                 <hr />
               </td>
           </tr>
          <tr>
             <td style="width:42%; padding-right:10px;" align="right">
                Select Date :
             </td>
             <td>
                  <asp:TextBox ID="txtschduleemail" runat="server" Text="Select Date" ToolTip="Select Date" ></asp:TextBox>
                  <ajax:CalendarExtender ID="CalendarExtender1" runat="server" PopupPosition="BottomLeft"  Format="dd/MM/yyyy"
                     TargetControlID="txtschduleemail" OnClientDateSelectionChanged="CompareDate" >
                  </ajax:CalendarExtender> 
                   <asp:RequiredFieldValidator ID="rfvtxtschduleemail" runat="server" ErrorMessage="Please select date for schedule SMS" 
                    InitialValue="Select Date" ControlToValidate="txtschduleemail" Display="Dynamic" ValidationGroup="vgsch">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    
        <tr>
            <td style="padding-right:10px;" align="right">
                Select Time :
            </td>
            <td>
               <asp:DropDownList runat="server" ID="ddlHours"  OnSelectedIndexChanged="Checktime"  ToolTip="Hours" AutoPostBack="true" >
                </asp:DropDownList> :  
                <asp:DropDownList runat="server" ID="ddlMins" ToolTip="Minutes">            
                </asp:DropDownList> &nbsp;<asp:Label ID="Label6" runat="server" Text="HH:mm(24 Hours format)"></asp:Label>
            </td>
        </tr>
    
       <tr>
           <td colspan="2" align="center">
             <asp:ImageButton ID="imgscheduleok" runat ="server"  ValidationGroup="vgsch"
                ImageUrl="images/submit.png"  Width="57px" Height="23px" AlternateText="Schedule" ToolTip="Schedule" onclick="imgscheduleok_Click" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="imgcancel" runat ="server" 
                ImageUrl="images/cancel.png" Width="57px" Height="23px"  AlternateText ="Cancel"  onclick="imgcancel_Click" />
          </td>
     </tr>
    
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
            </tr>
            <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
    </table>     
    </asp:Panel>
</div>

  <div id="divcautions" runat="server" style="color:#565656;padding-left:50px;">
          <h3><u>Cautions</u></h3>
          1. For Multiple numbers upload MS Excel list(.xls file) or Notepad file (.txt)<br />
          2. Upload maximum 20 numbers at a time in Excel file or NO limit to Notepad file <br />
          3. Column Name must be mobile. ex : mobile in Excel file <br />
          4. You Must Select List  throwgh send message to multiple numbers
          <br />
     </div>
</div>
</asp:Content>

