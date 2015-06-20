<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />




<%--<script type="text/javascript">
    $(function () {
        $("[id*=GridView1] td").hover(function () {
            $("td", $(this).closest("tr")).addClass("hover_row");
        }, function () {
            $("td", $(this).closest("tr")).removeClass("hover_row");
        });
    });
</script>

<script >
$('body').css('background','blue')
</script>
<script>
    function changebackground(color) {
        document.body.style.background = color;

    }
    onload = "changebackground('red');"
</script>--%>






<ajax:ToolkitScriptManager ID="tl1" runat="server"></ajax:ToolkitScriptManager>
<div class="container" >

  <table width="100%" >
  <tr>
      <td  style="background: url(images/notifications1.png); background-repeat:no-repeat; width:995px; height:70px; padding-top:5px;"  align="right" colspan="4">
             <asp:ImageButton ID="imgsch" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

          <br /><br /> </td>
     </tr>
     
   </table>
    
     <div id="dllist" runat="server" align="center" >
     <br />
     <table width="80%"><tr><td align="center" class="rounded-corners" >
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#0985c5" HeaderStyle-Height="30px" 
             HeaderStyle-ForeColor="White" RowStyle-Height="30px" CssClass="rounded-corners"   HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large"
           BorderColor="Black" BorderStyle="Double"     BorderWidth="0px" CellPadding="3" Font-Bold="False" Font-Italic="False"   Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"    AllowPaging="True" GridLines="None" AlternatingRowStyle-BackColor="#F7F8E0"  
                PagerStyle-Mode="NumericPages"   PagerStyle-BackColor="White"   PageSize="5" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found." EmptyDataRowStyle-ForeColor="Black" 
                 EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" onpageindexchanging="GridView1_PageIndexChanging" >

           <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
         <Columns>
         <asp:TemplateField HeaderText="Subject" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
            &nbsp;&nbsp; <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("subject") %>'   ForeColor="#003399" Font-Underline="false" ></asp:LinkButton>
            
              <asp:Panel ID="panel" runat="server" Height="150px" >
        <table width="700px" bgcolor="#33ccff" align="center" >
             <tr><td align="right">
                <%-- <asp:Label ID="lnlname" runat="server" Text=" :" ForeColor="White" Font-Size="Large"></asp:Label></td><td align="right">--%>
                 <asp:ImageButton ID="cancel" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="700px" style="background-color:white; height:200px"  align="center"  >
           
             <tr style="background-color:#CCFFFF;height:200px;">
             <td align="center" colspan="2" >
             <div id="divrecv" style="  overflow-y:auto;overflow-x:auto;word-break:break-all "  runat="server">
                 <asp:Label ID="lblrevnum" runat="server"  CssClass="lbl12" Text='<%# Eval("message") %>'  ForeColor="Black" Font-Size="Medium" ></asp:Label>
                 </div>
                    </td>
             </tr>
          <tr></tr>
          
             </table>      
        
        </asp:Panel>
         <ajax:ModalPopupExtender ID="mp2"  runat="server" TargetControlID="LinkButton1" CancelControlID="cancel" ViewStateMode="Disabled" PopupControlID="panel" DropShadow="true" BackgroundCssClass="Background">
    </ajax:ModalPopupExtender>
           
         </ItemTemplate>
         </asp:TemplateField>
           <asp:TemplateField HeaderText="Date" ControlStyle-Font-Size="Medium" ItemStyle-HorizontalAlign="Center">
         <ItemTemplate>
             <asp:Label ID="Label1" runat="server" Text='<%#Eval("postdate") %>' ForeColor="#003399"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         </Columns>
         </asp:GridView></td></tr></table>
         <br />
         <br />
     </div>
      </div>
</asp:Content>

