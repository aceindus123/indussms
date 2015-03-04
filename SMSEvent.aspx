<%@ Page Title=": : Indus SMS : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSEvent.aspx.cs" Inherits="SMSEvent" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
 <script type="text/javascript">

     function LimtCharacters(txtMsg, CharLength, indicator) {
         chars = txtMsg.value.length;
         document.getElementById(indicator).innerHTML = CharLength - chars;
         if (chars > CharLength) {
             txtMsg.value = txtMsg.value.substring(0, CharLength);
         }
     }
</script>
  
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" charset="utf-8">
</script>

<script type="text/javascript">
    function Label7(t) {
        if (t.value.length > 160) {
            $("#<%=Label7.ClientID%>").html(t.value);
        }
    }
</script>
<script type="text/javascript">
    function Label8(t) {
        if (t.value.length > 146) {
            $("#<%=Label8.ClientID%>").html(t.value);
        }
    }
</script>
<script type="text/javascript">
    function Label9(t) {
        if (t.value.length > 160) {
            $("#<%=Label9.ClientID%>").html(t.value);
        }
    }
</script>
<script type="text/javascript">
    function Label10(t) {
        if (t.value.length > 146) {
            $("#<%=Label10.ClientID%>").html(t.value);
        }
    }
</script>

<script type="text/javascript">
    $(function () {
        //Normal Configuration
        $("[id*=txt1]").MaxLength({ MaxLength: 306 });

    });
    </script>

    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txt2]").MaxLength({ MaxLength: 459 });

        });
    </script>

    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txtmsg1]").MaxLength({ MaxLength: 306 });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txtmsg2]").MaxLength({ MaxLength: 459 });

        });
    </script>



    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <%--<script type="text/javascript" src="MaxLength.min.js"></script--%>
    <script src="css/MaxLength.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txtmobilesubject]").MaxLength({ MaxLength: 160 });

        });
    </script>

    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txtmsg]").MaxLength({ MaxLength: 160 });

        });
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

<div class="container" id="normaldata" runat="server">

  <table width="100%" >
     <tr>
        <td align="center" width="100%"  class="titlecampain1" valign="middle" colspan="2">
           <h2>
               <asp:Label ID="Label3" runat="server" Text=""></asp:Label></h2>
        </td>
        <td>
          <asp:Button ID="btnhome" runat="server" Text="Back" PostBackUrl="~/SMSMainMenu.aspx"  CssClass="btnbutton"/>
        </td>
     </tr>
   </table> 

   <table  align="center" width="100%">
     <tr runat="server" id="schline">
         <td align="center"  width="70%" >
        Message Type :   &nbsp;&nbsp;&nbsp;  <asp:RadioButton ID="rdnormal" runat="server" Text="For Normal Message " 
              AutoPostBack="true"  GroupName="rd2" Checked="true" oncheckedchanged="rdnormal_CheckedChanged"/>
            <asp:RadioButton ID="rdschedule" runat="server" Text="For Schedule Message "  AutoPostBack="true" 
                GroupName="rd2"  Checked="false"   CssClass="radiobuttons1" oncheckedchanged="rdschedule_CheckedChanged"/>
       </td>
     </tr>

   

      <tr runat="server" id="schline1"  >
         <td align="center"  width="70%" style="padding-bottom:10px;padding-top:10px;">
            Reciver Type : &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rdsingle" runat="server" Text="For Single Number " AutoPostBack="true"  GroupName="rd1" Checked="true"   
              oncheckedchanged="rdsingle_CheckedChanged" />
            <asp:RadioButton ID="rdmultiple" runat="server" Text="For Multiple Numbers "  AutoPostBack="true" GroupName="rd1"  Checked="false"  
              CssClass="radiobuttons1"  oncheckedchanged="rdmultiple_CheckedChanged"   />
         <br /></td>
      </tr>
   </table>

  

  <table  align="center" width="100%" id="SINGLESMS"  runat="server">
     <tr class="titlecampain" id="selectlist1" runat="server" >
       <td align="right" > 
           <asp:Label ID="Label1" runat="server" Font-Names="Segoe UI" Text=" Enter Mobile Number * :   " ForeColor="Black" ></asp:Label>
       </td>
       <td style="padding-bottom:5px;">
         <asp:TextBox ID="txtmobileelection" runat="server" Width="250" MaxLength="10" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="mobileno" runat="server" ControlToValidate="txtmobileelection" ForeColor="Red"
                 ErrorMessage="*"  ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="mNoValidator" runat="server" ControlToValidate="txtmobileelection" ForeColor="Red"
                        ErrorMessage="Mobile Number must be 10 digits"  ValidationGroup="val1" SetFocusOnError="True"
                Display="dynamic" ValidationExpression="^[0-9]{10}$" > </asp:RegularExpressionValidator>
       </td>
     </tr>

     <tr class="titlecampain" id="selectlist" runat="server">
        <td align="right" valign="top"> 
           <asp:Label ID="Label2" runat="server" Font-Names="Segoe UI" Text=" Select List Name * : "  ForeColor="Black"></asp:Label>
       </td>
       <td>
           <asp:TextBox ID="TextBox1" runat="server" Width="350" Height="50px" MaxLength="10" Enabled="false" TextMode="MultiLine" ></asp:TextBox>
       </td>
     </tr>

     <tr class="titlecampain">
       <td align="right"  valign="top"> 
          <asp:Label ID="lblsubject" runat="server" Font-Names="Segoe UI" Text="Subject * (Standard Message 160 charecters) :" ForeColor="Black"></asp:Label>
       </td>

       <td  align="left">
         <asp:TextBox ID="txtmobilesubject" runat="server" TextMode="MultiLine"  AutoPostBack="true"  Width="350" Height="100px"  onkeyup="LimtCharacters(this,160,'lblcount');" 
                ontextchanged="txtmobilesubject_TextChanged" onclick="Label7(this);"  ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmobilesubject" ForeColor="Red" ErrorMessage="*" 
                        ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                
           <asp:TextBox ID = "txt1" runat="server" TextMode="MultiLine" Width="350px" AutoPostBack="true" Visible="false" onclick="Label8(this);" EnableViewState="true"
               Height="100px" ontextchanged="txt1_TextChanged"   onkeyup="LimtCharacters(this,146,'lblcount');"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt1" ForeColor="Red" ErrorMessage="*" 
                        ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
          
           <asp:TextBox ID = "txt2" runat="server" TextMode="MultiLine" Width="350px"  Visible="false" EnableViewState="true"
               Height="150px"  ></asp:TextBox><%--ontextchanged="txt2_TextChanged" AutoPostBack="true"--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt2" ForeColor="Red" ErrorMessage="*" 
                        ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
       </td>
     </tr>

     <tr id="countmsg" runat="server" >
      <td>
           &nbsp;
       </td>
       <td   valign="top">
           <asp:Label ID="lblcount" runat="server"  ></asp:Label>
       </td>
     </tr>

     <tr id="countmsg1" runat="server">
         <td>
             &nbsp;
        </td>
         <td  valign="top" align="justify">
             <asp:Label ID="Label7" runat="server"    ForeColor="Black"  ></asp:Label>&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button3" runat="server" Text="NO"  Width="70px" onclick="Button3_Click" />
             <asp:Button ID="proceed" runat="server" Text="Proceed" onclick="proceed_Click" Width="80px" Height="20px"/>
         </td>
      </tr>

      <tr id="Tr1" runat="server" visible="false">
         <td>
              &nbsp;
          </td>
          <td  valign="top" align="justify">
              <asp:Label ID="Label8" runat="server"    ForeColor="Black"  ></asp:Label>&nbsp;&nbsp;&nbsp;
              <asp:Button ID="Button4" runat="server" Text="NO"  Width="70px"  Height="20px"   onclick="Button4_Click"  />
              <asp:Button ID="Button5" runat="server" Text="Proceed" onclick="proceed1_Click" Width="80px" Height="20px" />
        </td>
      </tr>

     <tr>
       <td>&nbsp;</td>
     </tr>

     <tr>
       <td align="right" id="senderid" runat="server">
           <asp:Label ID="lblsender1" runat="server" Font-Names="Segoe UI" Text="SenderID" ForeColor="Black"></asp:Label>:
           <asp:DropDownList ID="ddlsender" runat="server" Width="150px"> </asp:DropDownList>       
       </td>
       <td id="senderid1" runat="server"></td>
        <td>
          <asp:Button ID="Button1" runat="server" Text="Send" onclick="Button1_Click" ValidationGroup="val1" CssClass="btnbutton" />
          <asp:Button ID="Button2" runat="server" Text="Back" onclick="Button2_Click"  CssClass="btnbutton" OnClientClick=""/>
       </td>
     </tr>

     <tr>
        <td align="center" colspan="2">
          <asp:Label ID="lblmsg"  runat="server" ></asp:Label>
         <br /></td>
     </tr>
     </table>

    



     <div align="center" id="gview" runat="server" visible="false">
        <h3> List Names</h3><br />

          <asp:DataList ID="gv1" runat="server" RepeatColumns="4"  RepeatDirection="Horizontal" CellPadding="4" ForeColor="#333333" 
                 onitemcommand="dtlistname_ItemCommand" Width="504px">
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <AlternatingItemStyle BackColor="White" />
             <ItemStyle BackColor="#EFF3FB" />
             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <ItemTemplate>&nbsp; 
                <asp:LinkButton ID="lnklist" runat="server" CommandArgument ='<%#Eval("listname")%>'  Text= '<%#Eval("listname")%>' >  </asp:LinkButton> 
             </ItemTemplate>
          </asp:DataList>
         
     </div>
     
     <div id="divcautions" runat="server" style="color:#565656;">
          <h3><u>Cautions</u></h3>
          1. For Multiple numbers upload MS Excel list(.xls file)<br />
          2. Upload maximum 20 numbers at a time <br />
          3. Column Name must be mobile. ex : mobile <br />
          4. You Must Select List  throwgh send message to multiple numbers
          <br />
     </div>

  <div runat="server" id="schdata" class="container">
       <input id="inpHide" type="hidden" runat="server" /> 
    <ajax:ToolkitScriptManager ID="lbl" runat="server"></ajax:ToolkitScriptManager>
    <table width="100%" cellspacing="10px">
    <tr>
      <td>&nbsp;</td>
    </tr>
        <tr>
           <td  align="center" class="schdule">
              <asp:Label ID="Label4" runat="server" Text=" Select Number or  List"  ForeColor="Black"></asp:Label>               
           </td>
             <td>:</td>
           <td>
              <asp:RadioButton ID="rdnumber" runat="server" Width="100px" Text="Number"  
                   ForeColor="Black" AutoPostBack="true" 
                   oncheckedchanged="rdnumber_CheckedChanged"></asp:RadioButton>
               <asp:RadioButton ID="rdlist" runat="server" Width="100px" Text="List"  AutoPostBack="true" 
                   ForeColor="Black" oncheckedchanged="rdlist_CheckedChanged" Height="21px"></asp:RadioButton>
           </td>
         </tr>

         <tr id="number" runat="server">
           <td  align="center" class="schdule">
              <asp:Label ID="lblname" runat="server" Text="Reciver Name"  ForeColor="Black"></asp:Label>               
           </td>
             <td>:</td>
           <td>
               <asp:TextBox ID="txtname" runat="server" Width="300px" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3"       runat="server" ControlToValidate="txtname" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">  </asp:RequiredFieldValidator>
           </td>
         </tr>

         <tr id="number1" runat="server">
           <td  align="center" class="schdule">
              <asp:Label ID="lblmobile" runat="server" Text="Reciver Mobile Number"  ForeColor="Black"></asp:Label>               
           </td>
             <td>:</td>
           <td>
              <asp:TextBox ID="txtmobile" runat="server" Width="300px" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="mobileno1"  runat="server" ControlToValidate="txtmobile" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">      </asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ControlToValidate="txtmobile"   ValidationGroup="missed"
              ErrorMessage="Please Enter Valid Mobile Number" ValidationExpression="[7-9]{1}[0-9]{9}"></asp:RegularExpressionValidator>
           </td>
         </tr>

         <tr id="list" runat="server">
           <td  align="center" class="schdule">
              <asp:Label ID="lbllist" runat="server" Text=" Select  List"  ForeColor="Black"></asp:Label>               
           </td>
             <td>:</td>
           <td>
               <asp:DropDownList ID="ddlist" runat="server" Width="300px"   AutoPostBack="true"
                   onselectedindexchanged="ddlist_SelectedIndexChanged" >
              <asp:ListItem>Select List</asp:ListItem>
              </asp:DropDownList>
           </td>
         </tr>
         <tr id="list1" runat="server">
           <td  align="center" class="schdule">
              <asp:Label ID="Label5" runat="server" Text="Selected Numbers"  ForeColor="Black"></asp:Label>               
           </td>
             <td>:</td>
           <td>
               <asp:TextBox ID="txtnumbers" runat="server" TextMode="MultiLine"  Width="300px" Height="50px"></asp:TextBox>
           </td>
         </tr>

         <tr >
           <td  align="center" class="schdule">
              <asp:Label ID="lbltime" runat="server" Text="Schedule Time"  ForeColor="Black"></asp:Label>               
           </td>
             <td>:</td>
           <td>
               <asp:TextBox ID="txttime" runat="server" Width="300px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ControlToValidate="txttime" ForeColor="Red"
                        ErrorMessage="*"      ValidationGroup="missed" SetFocusOnError="True">      </asp:RequiredFieldValidator>
              <asp:ImageButton ID="imgcal" runat="server" ImageUrl="images/1419954059_calendar.png" Width="25px" Height="25px"  onclick="imgcal_Click"  />
           </td>
         </tr>

         <tr>
           <td valign="top"  align="center" class="schdule">
              <asp:Label ID="lblmessage" runat="server" Text="Subject  " ForeColor="Black"></asp:Label>               
           </td>
           <td valign="top"  align="center">:</td>
           <td >
               <asp:TextBox ID="txtmsg" runat="server" Width="300px" Height="100px" TextMode="MultiLine" AutoPostBack="true" ontextchanged="txtmsg_TextChanged"
               onkeyup="LimtCharacters(this,160,'Label11');" onclick="Label9(this);"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14"  runat="server" ControlToValidate="txtmsg" ForeColor="Red"
                        ErrorMessage="*" ValidationGroup="missed" SetFocusOnError="True"></asp:RequiredFieldValidator>

               <asp:TextBox ID="txtmsg1" runat="server" Width="300px" Height="100px" onkeyup="LimtCharacters(this,146,'Label11');"  Visible="false" onclick="Label10(this);"
                   TextMode="MultiLine" AutoPostBack="true" ontextchanged="txtmsg1_TextChanged" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ControlToValidate="txtmsg1" ForeColor="Red"
                        ErrorMessage="*" ValidationGroup="missed" SetFocusOnError="True"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtmsg2" runat="server" Width="300px" Height="100px" TextMode="MultiLine" Visible="false"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  runat="server" ControlToValidate="txtmsg2" ForeColor="Red"
                        ErrorMessage="*"  ValidationGroup="missed" SetFocusOnError="True"></asp:RequiredFieldValidator>
           </td>
         </tr>

              <tr id="Tr4" runat="server" >
      <td>
           &nbsp;
       </td>
       <td   valign="top">
           <asp:Label ID="Label11" runat="server"  ></asp:Label>
       </td>
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
                 Height="20px" onclick="Button7_Click"/>
         </td>
      </tr>

      <tr id="Tr3" runat="server" visible="false">
         <td>
              &nbsp;
          </td>
             <td>
             &nbsp;
        </td>
          <td  valign="top" align="justify">
              <asp:Label ID="Label10" runat="server"    ForeColor="Black"  ></asp:Label>&nbsp;&nbsp;&nbsp;
              <asp:Button ID="Button8" runat="server" Text="NO"  Width="70px"  Height="20px" 
                  onclick="Button8_Click"    />
              <asp:Button ID="Button9" runat="server" Text="Proceed" Width="80px" 
                  Height="20px" onclick="Button9_Click" />
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
            <asp:Button ID="btnschedule" runat="server" Text="Schedule" ForeColor="Black"  
                   ValidationGroup="missed" onclick="btnschedule_Click" > </asp:Button>
               <asp:Button ID="btncancel" runat="server"  Text="Cancel"  onclick="btncancel_Click" ></asp:Button>
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

</div>

</asp:Content>

