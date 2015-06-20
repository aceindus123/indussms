<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSTemplates.aspx.cs" Inherits="SMSTemplates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="css/MaxLength.min.js" type="text/javascript"></script>

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
<div class="container">
<%-- <table width="100%" >
     <tr>
        <td align="center" width="100%"  class="titlecampain1" valign="middle">
           <h2> Templates</h2>
        </td>
     </tr>
     <tr>
     <td></td>
     </tr>
     
   </table>--%>
   <table  width="100%" >

   
   <tr>
         <td  style="background: url(images/templates.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right" colspan="2">
             <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

              </td>
    </tr>


    <tr>
       <td align="right">
       <span style="font-family:Segoe UI; color:Black;">  Template Name : </span></td><td>&nbsp;<asp:TextBox ID="txtname" runat="server" Width="218px" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="mobileno" runat="server" ControlToValidate="txtname" ForeColor="Red"
                 ErrorMessage="*"  ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
       </td>
     </tr>
     <tr>
     <td valign="top" align="right">
     <span style="font-family:Segoe UI;color:Black;">  Description  : </span></td>
     
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

     <tr id="countmsg1" runat="server" visible="false">
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
             <asp:Label ID="Label1" runat="server" Visible="false"  ForeColor="Black" Text="2nd Message counted "  ></asp:Label>&nbsp;&nbsp;&nbsp;
       
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
             <asp:Label ID="Label2" runat="server" Visible="false"  ForeColor="Black" Text="3rd Message counted "  ></asp:Label>&nbsp;&nbsp;&nbsp;
       
       </td>
      </tr>
      <tr><td><br /></td></tr>
     <tr>
      <td>
      </td>
      <td><%--<asp:Button ID="btnsubmit" runat="server" Text="Submit"  ValidationGroup="val1"
              onclick="btnsubmit_Click" />
              <asp:Button ID="Button1" runat="server" Text="Cancel" onclick="Button1_Click" />--%>

              <asp:ImageButton ID="btnsubmit" runat="server"  ValidationGroup="val1"      onclick="btnsubmit_Click"  ImageUrl="~/images/submit1r.png" />
              <asp:ImageButton ID="Button1" runat="server" onclick="Button1_Click"  ImageUrl="~/images/cancel3.png" />
              </td>
     </tr>
     <tr><td><br /></td></tr>
   </table>
   <div align="center" >
   <table id="gv"  width="900px" align="center">
   <tr><td class="rounded-corners" align="center">
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"   PageSize="5"  PagerStyle-Mode="NumericPages" AllowPaging="true" 
         BorderWidth="1px" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-HorizontalAlign="Center"  EmptyDataRowStyle-ForeColor="Red"
          EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Font-Size="Medium" EmptyDataRowStyle-Height="30px" 
           Width="100%" RowStyle-Height="40px"  RowStyle-BorderColor="Gray" 
           DataKeyNames="tid" onrowdeleting="GridView1_RowDeleting" onpageindexchanging="GridView1_PageIndexChanging" 
           >
       <PagerStyle  ForeColor="White" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#0985c5"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="White" Height="30px"  Font-Size="14px" Font-Names="Arial"  BackColor="#0985c5"   /> 
       <Columns>
       <asp:TemplateField HeaderText="Slno" ItemStyle-HorizontalAlign="Center">
       <ItemTemplate>
           <asp:Label ID="Label1" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black"></asp:Label>
       </ItemTemplate>
       </asp:TemplateField>
       <asp:BoundField HeaderText="TemplateName" DataField="tname" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="25%" />
       <asp:TemplateField ItemStyle-Width="50%" HeaderText="Message" ItemStyle-HorizontalAlign="Justify">
       <ItemTemplate>
       <div id="schdiv" style="  overflow-y:auto;overflow-x:auto;word-break:break-all "  runat="server">
       <asp:Label ID="lbl" runat="server" Text='<%#Eval("tdiscription") %>' ForeColor="Black" style="overflow-y:auto;overflow-x:auto;word-break:break-all " wrap="true" ></asp:Label></div>
       </ItemTemplate>
       </asp:TemplateField>
       <asp:BoundField HeaderText="Date" DataField="tdate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="Status" DataField="status"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px" />
        <asp:ButtonField CommandName="delete" HeaderText="Action" ButtonType="Button" Text="Delete" ControlStyle-Width="70px" ControlStyle-Height="30px" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"   />
        
       </Columns>
        <EmptyDataTemplate>
       No Templates Added
       </EmptyDataTemplate>


       </asp:GridView>
   </td></tr></table></div>
   <br />
   </div>
</asp:Content>

