<%@ Page Title=": : Indus SMS : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSEvent.aspx.cs" Inherits="SMSEvent" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="css/style.css" rel="stylesheet" type="text/css" />
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

<script type="text/javascript">
    function Check(textBox, maxLength) {
        if (textBox.value.length > maxLength) {
            alert("Max characters allowed are " + maxLength);
            textBox.value = textBox.value.substr(0, maxLength);
        }
    }        
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
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

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="css/MaxLength.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            //Normal Configuration
            $("[id*=txtmobilesubject]").MaxLength({ MaxLength: 160 });

        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="container1" id="normaldata" runat="server"  >

<table>
  <tr>
    <td  valign="top">
          <table>
            <tr>
            <td  style="background: url(images/event_img.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

              </td>
            </tr>
          </table>
           
 
  <table  align="center" width="100%" >
      <tr runat="server" id="schline1"  >
         <td align="center"  width="70%" style="padding-bottom:10px;padding-top:10px;" >
           <asp:Label  ID="rec1" runat="server" Text="Reciver Type :  " CssClass="schlabel"  ForeColor="Black"></asp:Label>
           <asp:RadioButton ID="rdsingle" runat="server" Text="For Single Number " AutoPostBack="true"  GroupName="rd1" Checked="true"   
              oncheckedchanged="rdsingle_CheckedChanged" />
            <asp:RadioButton ID="rdmultiple" runat="server" Text="For Multiple Numbers "  AutoPostBack="true" GroupName="rd1"  Checked="false"  
              CssClass="radiobuttons1"  oncheckedchanged="rdmultiple_CheckedChanged"   />
         <br /></td>
      </tr>
   </table>

  <table  align="center" width="100%" id="SINGLESMS"  runat="server"
   style="background: url(images/mobile.png); background-repeat:no-repeat; width:1050px; height:auto;padding-left:200px;">
     <tr class="titlecampain" id="selectlist1" runat="server" >
       <td align="right" > 
           <asp:Label ID="Label1" runat="server" Font-Names="Segoe UI" Text=" Enter Mobile Number * :   " ForeColor="Black" ></asp:Label>
       </td>
       <td  style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
         <asp:TextBox ID="txtmobileelection" runat="server" Width="262px"  Height="20px" CssClass="textboxsch" MaxLength="10"  onkeypress="return onlyNos(event,this);"></asp:TextBox>
          <asp:RequiredFieldValidator ID="mobileno" runat="server" ControlToValidate="txtmobileelection" ForeColor="Red"
                 ErrorMessage="*"  ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="mNoValidator" runat="server" ControlToValidate="txtmobileelection" ForeColor="Red"
                        ErrorMessage="Mobile Number must be 10 digits"  ValidationGroup="val1" SetFocusOnError="True"
                Display="dynamic" ValidationExpression="^[0-9]{10}$" > </asp:RegularExpressionValidator>
       <br /><br /></td>
     </tr>

     <tr class="titlecampain" id="selectlist" runat="server">
        <td align="right" valign="top"> 
           <asp:Label ID="Label2" runat="server" Font-Names="Segoe UI" Text=" Select List Name * : "  ForeColor="Black"></asp:Label>
       </td>
       <td style="background: url(images/textboxnew22.png); background-repeat:no-repeat; padding-left:6px; ">
           <asp:TextBox ID="TextBox1" runat="server" Width="262px"  Height="80px" CssClass="textboxsch"  MaxLength="10" Enabled="false" TextMode="MultiLine" ></asp:TextBox>
       <br /><br /></td>
     </tr>

     <tr id="trtemplate" runat="server" visible="false">
       <td  align="right"  valign="top">
           <asp:Label ID="lbltemplate" runat="server" Font-Names="Segoe UI" Text=" Select Template Name * : "  ForeColor="Black"></asp:Label>
         
       </td>
       <td style="background: url(images/text_boxnew.png); background-repeat:no-repeat; padding-left:6px; ">
           <asp:DropDownList ID="ddtemplate" runat="server" Width="262px"  Height="20px" 
               CssClass="textboxsch"  AutoPostBack="true"
               onselectedindexchanged="ddtemplate_SelectedIndexChanged"   >
           <asp:ListItem>Select</asp:ListItem>
           </asp:DropDownList>
       <br /><br /></td>
     </tr>

     <tr class="titlecampain">
       <td align="right"  valign="top"> 
          <asp:Label ID="lblsubject" runat="server" Font-Names="Segoe UI" Text="Subject *  :" ForeColor="Black"></asp:Label>
       </td>

       <td  align="left" style="background: url(images/textboxnew22.png); background-repeat:no-repeat; padding-left:6px; ">
         <asp:TextBox ID="txtmobilesubject" runat="server" TextMode="MultiLine"  AutoPostBack="true" Width="258px"  Height="80px" CssClass="textboxsch1"
                 onkeyup="LimtCharacters(this,160,'lblcount');" 
                ontextchanged="txtmobilesubject_TextChanged" onclick="Label7(this);"  ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmobilesubject" ForeColor="Red" ErrorMessage="*" 
                        ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                
           <asp:TextBox ID = "txt1" runat="server" TextMode="MultiLine"  AutoPostBack="true" Visible="false" onclick="Label8(this);" EnableViewState="true"
         Width="258px"  Height="80px" CssClass="textboxsch1"       ontextchanged="txt1_TextChanged"   onkeyup="LimtCharacters(this,146,'lblcount');"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt1" ForeColor="Red" ErrorMessage="*" 
                        ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
          
           <asp:TextBox ID = "txt2" runat="server" TextMode="MultiLine" Width="258px"   AutoPostBack="true"
               Height="80px" CssClass="textboxsch1"  Visible="false" EnableViewState="true" ontextchanged="txt2_TextChanged"
                ></asp:TextBox><%--ontextchanged="txt2_TextChanged" AutoPostBack="true"--%>
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
             <asp:Button ID="proceed" runat="server" Text="Proceed" onclick="proceed_Click" Width="80px" />
         </td>
      </tr>

        <tr>
      <td></td>
       <td>
             <asp:Label ID="Label3" runat="server" Visible="false"  ForeColor="Black" Text="2nd Message counted "  ></asp:Label>&nbsp;&nbsp;&nbsp;
       
       </td>
      </tr>

      <tr id="Tr1" runat="server" visible="false">
         <td>
              &nbsp;
          </td>
          <td  valign="top" align="justify">
              <asp:Label ID="Label8" runat="server"    ForeColor="Black"  ></asp:Label>&nbsp;&nbsp;&nbsp;
              <asp:Button ID="Button4" runat="server" Text="NO"  Width="70px"   onclick="Button4_Click"  />
              <asp:Button ID="Button5" runat="server" Text="Proceed" onclick="proceed1_Click" Width="80px"  />
        </td>
      </tr>

        <tr>
      <td></td>
       <td>
             <asp:Label ID="Label4" runat="server" Visible="false"  ForeColor="Black" Text="3rd Message counted "  ></asp:Label>&nbsp;&nbsp;&nbsp;
       
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
        <td >
       <%--   <asp:Button ID="Button1" runat="server" Text="Send" onclick="Button1_Click" ValidationGroup="val1" CssClass="btnbutton" />
          <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click"  Width="60px" CssClass="btnbutton" OnClientClick=""/>--%>

           <asp:ImageButton  ID="btnschedule" runat="server" ValidationGroup="missed" onclick="Button1_Click" ImageUrl="~/images/send.png" />
              <asp:ImageButton  ID="btncancel" runat="server" onclick="Button2_Click" ImageUrl="~/images/cancel - Copy.png" />
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

  <div id="divcautions" runat="server" style="color:#565656; padding-left:50px; font-family:Segoe UI;">
            <h3><u>Cautions</u></h3>
            1. First Upload or Enter Mobile Numbers in Contact Book in Mainmenu Page<br />
          2. For Multiple numbers upload MS Excel list(.xls file) or Notepad file (.txt)<br />
          3. Upload maximum 20 numbers at a time in Excel file or NO limit to Notepad file <br />
          4. Column Name must be mobile. ex : mobile in Excel file <br />
          5. You Must Select List  throwgh send message to multiple numbers
          <br /><br />
     </div>
    </td>
  </tr>
</table>
 

</div>

</asp:Content>

