<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="ContactBook.aspx.cs" Inherits="ContactBook" %>
<%@ Register Src="~/UserControl/accountmenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">




<script type = "text/javascript">
    function ConfirmDelete1() {
        var count = 0;
        var gv = document.getElementById("<%=listtable.ClientID%>");
        var chk = gv.getElementsByTagName("input");
        for (var i = 0; i < chk.length; i++) {
            if (chk[i].checked && chk[i].id.indexOf("chk1") == -1) {
                count++;
            }
        }
        if (count == 0) {
            alert("Please select the record.");
            return false;
        }

    }
</script>

 <script type = "text/javascript">
     function ConfirmDelete() {
         var count = 0;
         var gv = document.getElementById("<%=gv1.ClientID%>");
         var chk = gv.getElementsByTagName("input");
         for (var i = 0; i < chk.length; i++) {
             if (chk[i].checked && chk[i].id.indexOf("chkAll") == -1) {
                 count++;
             }
         }
         if (count == 0) {
             alert("Please select the record.");
             return false;
         }
         else {
             return confirm("Are you sure want to delete?");
         }
     }
</script>

<script type = "text/javascript">
    function ConfirmDelete1() {
        var count = 0;
        var gv = document.getElementById("<%=gv1.ClientID%>");
        var chk = gv.getElementsByTagName("input");
        for (var i = 0; i < chk.length; i++) {
            if (chk[i].checked && chk[i].id.indexOf("chkAll") == -1) {
                count++;
            }
        }
        if (count == 0) {
            alert("Please select the record.");
            return false;
        }
       
    }
</script>


  <script language="javascript" type="text/javascript" >
      function Sample() {
          var n = document.getElementById("ContentPlaceHolder1_gv1").rows.length;
          var i;
          var j = 0;
          for (i = 0; i <= n; i++) {
              if (i < 10) {
                  //ContentPlaceHolder1_gv1_chkone_0
                  //if (document.getElementById("ctl00_ContentPlaceHolder1_gv1_ctl0" + i + "_chkone").checked == true) {
                  if (document.getElementById("ContentPlaceHolder1_gv1_chkone_" + i).checked == true) {
                      if (j > 0) {
                          alert('you can select only one...');
                          //                          document.getElementById("ctl00_ContentPlaceHolder1_gv1_ctl0" + i + "_chkone").checked = false;
                          document.getElementById("ContentPlaceHolder1_gv1_chkone_" + i).checked = false;
                      }
                      else {
                          j++;
                      }
                  }
              }
              else {
//                  if (document.getElementById("ctl00_ContentPlaceHolder1_gv1_ctl" + i + "_chkone").checked == true) {
                  if (document.getElementById("ContentPlaceHolder1_gv1_chkone_" + i).checked == true) {
                      if (j > 0) {
                          alert('you can select only one...');
                          //                          document.getElementById("ctl00_ContentPlaceHolder1_gv1_ctl0" + i + "_chkone").checked = false;
                          document.getElementById("ContentPlaceHolder1_gv1_chkone_" + i).checked = false;
                      }
                      else {
                          j++;
                      }
                  }
              }
          }
      }
</script>

    <script type="text/javascript">

        function DeleteConfirm() {
            var Ans = confirm("Do you want to Delete Selected List ?");
            if (Ans) {
                return true;
            }
            else {
                return false;
            }
        }  
    </script>  


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajax:ToolkitScriptManager ID="tm" runat="server"></ajax:ToolkitScriptManager>
  <div class="container">
  <table width="100%" >
<%--     <tr>
        <td align="center" width="100%"  class="titlecampain1" valign="middle">
           <h2> Contacts Information</h2>
        </td>
     </tr>
   </table>
   <br />
   <table width="100%" align="center">--%>
  <tr>
         <td  style="background: url(images/contactinformation.png); background-repeat:no-repeat; width:995px; height:70px;"  align="right" colspan="2">
             <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/backbutton.png" runat="server" CssClass="back"  PostBackUrl="~/SMSMainMenu.aspx"  />

              </td>
    </tr>
     <tr>
       <td align="left" width="25%" style="padding-left:20px; " valign="top">
        <div  >
           <asp:LinkButton ID="allcontacts" runat="server" Text="All Contacts" 
                ForeColor="Black" Font-Underline="false" Font-Size="17px" Width="200px" 
                Height="26px" onclick="allcontacts_Click"></asp:LinkButton>
           <br />
              <asp:DropDownList ID="ddlist" runat="server"  Width="200px" Height="26px"  AutoPostBack="true"
                onselectedindexchanged="ddlist_SelectedIndexChanged">
           <asp:ListItem>Select List</asp:ListItem>
           </asp:DropDownList>

        </div>
        <br />
        <div>
         <%--  <asp:Button ID="btnnew" runat="server" Text="New Contact"  Height="27px" Width="100px"
                Font-Bold="true" onclick="btnnew_Click"/>
            <asp:Button ID="btnnewlist" runat="server" Text="New List" Height="27px"   Width="100px"
                Font-Bold="true" onclick="btnnewlist_Click"/>--%>
             <asp:ImageButton ID="btnnew" ImageUrl="~/images/newcontact.png" runat="server"  OnClick="btnnew_Click"   />
             <asp:ImageButton ID="btnnewlist" ImageUrl="~/images/newlist.png" runat="server"  onclick="btnnewlist_Click"   />

        </div>
     </td>
     
       <td align="center" width="75%" valign="top" >
     
        <table width="100%" id="tablegrid" runat="server"   >
    
       <tr>
            <td  align="right">
             <asp:LinkButton ID="delctc" runat="server" Text="Delete Lists" 
                    ForeColor="Black" Font-Underline="false"
                 Font-Size="17px" Width="150px" Height="26px" onclick="delctc_Click"></asp:LinkButton>

                  <asp:Panel ID="panview" runat="server" HorizontalAlign="Left">
                         <table width="110%" bgcolor="#3366FF" align="center" >
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21" BackColor="#3366FF"/></td></tr>
             </table>
             <table width="110%" bgcolor="white" align="center">
             <tr><td></td></tr>
             <tr>
             <td align="center" id="View" runat="server"><br />
                 <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#00277a" Font-Size="Large" style="text-decoration:underline"></asp:Label>
                <%-- <font size="4" color="#00277a"><strong><u> List For '<%# Eval("Username") %>'</u></strong></font>--%>
                 </td></tr>
                 <tr><td align="center"><br />
                 <asp:GridView ID="listtable" runat="server" AutoGenerateColumns="false" 
                         Width="700px" HorizontalAlign="Center" GridLines="None" 
                  AllowPaging="true" PageSize="5" ForeColor="#333333" CellPadding="4" 
                         EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-Font-Size="Medium" 
                         EmptyDataRowStyle-ForeColor="Black" DataKeyNames="lno" 
                         onrowdeleting="listtable_RowDeleting" 
                         onpageindexchanging="listtable_PageIndexChanging1" 
                         >
                         <RowStyle HorizontalAlign="Center"  Height="30px"/>
                 <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#999999" Font-Size="14px" Font-Names="Arial" /> 
                 <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
               <ItemStyle HorizontalAlign="Center" />
                 <ItemTemplate>
                     <asp:CheckBox ID="chk1" runat="server"  />
                 </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                 <HeaderTemplate>ListName</HeaderTemplate>
                 <ItemStyle HorizontalAlign="Center"/>
                 <ItemTemplate>
                 <asp:Label ID="lbl1" Text='<%# Eval("lname") %>' runat="server" ForeColor="Gray" />
                 </ItemTemplate>
                 </asp:TemplateField>  
                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                 <HeaderTemplate>Date</HeaderTemplate>
                 <ItemStyle HorizontalAlign="Center"/>
                 <ItemTemplate>
                 <asp:Label ID="lbl2" runat="server" Text='<%# Eval("cdate") %>' ForeColor="Gray" />
                 </ItemTemplate>
                 </asp:TemplateField> 
                <%-- <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                     <asp:Button ID="btndel" runat="server" Text="Delete" OnClick="btndel"  Width="55px"  />
                 </ItemTemplate>
                 </asp:TemplateField>    --%>                       
                 </Columns>
                 <EmptyDataTemplate>
                 No Lists Found.
                 </EmptyDataTemplate>
                 <HeaderStyle BackColor="#5D7B9D"  ForeColor="White" Font-Names="Arial" Font-Size="18px" Height="30px" /> 
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                 </asp:GridView>
                 <br />
                 <%-- <asp:HiddenField ID="hfCount" runat="server" Value = "0" />--%>
                   <asp:Button ID="btnDelete" runat="server" Text="Delete Selected Lists"

   OnClientClick = "return DeleteConfirm();" OnClick="btnDelete_Click" CssClass="buttonStyle1" />
                 <br /><br /><br />
             </td></tr>
             </table>
                </asp:Panel>
                <ajax:ModalPopupExtender ID="mp1" runat="server" PopupControlID="panview" TargetControlID="delctc" BackgroundCssClass="Background" CancelControlID="btnimcan" RepositionMode="RepositionOnWindowResize"></ajax:ModalPopupExtender>


                <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Sender_id.aspx" Text="Create SenderId" ForeColor="Black" Font-Underline="false"  Font-Size="17px" Width="150px" Height="26px"></asp:HyperLink>--%>
                <asp:LinkButton ID="lnkimp" runat="server" Text="Import Contacts" 
                    ForeColor="Black" Font-Underline="false"
                 Font-Size="17px" Width="150px" Height="26px" onclick="lnkimp_Click"></asp:LinkButton>
           <asp:LinkButton ID="lnkexp" runat="server" Text="Export Contacts" ForeColor="Black" Font-Underline="false"
            Font-Size="17px" Width="150px" Height="26px" onclick="lnkexp_Click"></asp:LinkButton>
    </td>
       </tr>
       <tr style="margin-top:20px;">
         <td  width="100%" class="rounded-corners" style="line-height:26px; background-color:#0985c5;" >
           &nbsp;&nbsp; <span style="color:White;"> All Contacts<br /></span>
        </td>
      </tr>
       <tr>
     <td></td>
     </tr>
      <tr >
        <td width="100%"  style="margin-top:20px;" >
           <asp:TextBox ID="txtserch" runat="server" Width="100px" Height="26px"></asp:TextBox> 

      &nbsp;
      <asp:LinkButton ID="A" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="A" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="B" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="B" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="C" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="C" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="D" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="D" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="E" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="E" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton> 
      &nbsp;&nbsp; 
      <asp:LinkButton ID="F" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="F" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton> 
      &nbsp;&nbsp;
      <asp:LinkButton ID="G" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="G" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="H" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="H" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="I" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="I" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="J" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="J" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="k" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="K" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="L" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="L" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="M" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="M" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="N" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="N" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="O" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="O" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="P" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="P" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="Q" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="Q" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="R" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="R" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="S" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="S" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="T" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="T" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="U" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="U" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="V" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="V" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="W" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="W" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="X" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="X" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="Y" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="Y" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;
      <asp:LinkButton ID="Z" runat="server" CommandName="Information Technology" OnCommand="Companysearch1" Font-Underline="true" Text="Z" Font-Overline="false" Font-Bold="true" Font-Size="12px" Font-Names="Arial,Helvetica,sans-serif"></asp:LinkButton>
      &nbsp;&nbsp;

        </td>
      </tr>
      
     </table>

        <div id="divcontact" runat="server">
          <asp:Panel ID="pnladd" runat="server">
          
          <table  cellspacing="10px">
          <tr>
             <td align="center" style="background-color: #0985c5; line-height:34px; font-size:19px; font-style:oblique" width="100%" class="rounded-corners">
              <span style="color:White;">  Add Contact Individual</span>
             </td>
          </tr>
            <tr>
               <td >
               <asp:Label ID="lblname" runat="server" Width="200px" Text="Enter Contact Name" ForeColor="Black"></asp:Label>   : <asp:TextBox ID="txtname" runat="server" Width="200px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtname"
                    ErrorMessage="Provide Name" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator> 
               </td>
            </tr>
            <tr>
               <td>
                <asp:Label ID="lblnumber" runat="server" Width="200px" Text="Enter Mobile Number" ForeColor="Black"></asp:Label>  : <asp:TextBox ID="txtnumber" runat="server" Width="200px"  MaxLength="10"></asp:TextBox>

                <ajax:FilteredTextBoxExtender ID="ftxt1" runat="server" TargetControlID="txtnumber" FilterType="Numbers"></ajax:FilteredTextBoxExtender>
                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtnumber"
                    ErrorMessage="Provide Number" ValidationGroup="RegForm"><span >*</span></asp:RequiredFieldValidator> 
                     <asp:RegularExpressionValidator ID="mNoValidator" runat="server" ControlToValidate="txtnumber" ForeColor="Red"
                        ErrorMessage="Mobile Number must be 10 digits"  ValidationGroup="val1" SetFocusOnError="True"
                Display="dynamic" ValidationExpression="^[0-9]{10}$" > </asp:RegularExpressionValidator>
               </td>
            </tr>
            <tr>
               <td>
                <asp:Label ID="lbllist" runat="server" Width="200px" Text="Select List to add this Contact" ForeColor="Black"></asp:Label>  : 
                <asp:DropDownList runat="server" ID="ddllist" Width="200px" >
                <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                  
               </td>
            </tr>
            <tr>
             <td align="center">
               <%--<asp:Button ID="btnadd" runat="server" Text="Add" onclick="btnadd_Click" ValidationGroup="RegForm"  Width="50px" Height="30px"/>--%>
               <asp:ImageButton ID="btnadd" runat="server" onclick="btnadd_Click" ValidationGroup="RegForm" ImageUrl="~/images/add.png" />
             </td>
            </tr>
          </table>
          </asp:Panel>
        </div>

        <table id="griddata" runat="server" align="center">
     <tr>
        <td width="80%">
               <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" PageSize="10"  ShowFooter="True" EnableModelValidation="True"   onpageindexchanging="subgrid_PageIndexChanging" 
                  HeaderStyle-HorizontalAlign="Center" CellPadding="4" GridLines="None" DataKeyNames="mno"    Width="100%" AllowPaging="True" ForeColor="#333333"   >
                 <Columns>
                      <asp:TemplateField ControlStyle-Width="20px" HeaderStyle-Width="20px" FooterStyle-Width="20px"  HeaderStyle-HorizontalAlign="Center"
                         ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                        <asp:CheckBox ID="chkone" runat="server"  onclick="Sample();" />
                        </ItemTemplate>
                        <FooterTemplate >
       
                         </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField ControlStyle-Width="150px"  HeaderStyle-Width="150px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" 
                        ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" >
                      <HeaderTemplate>
                                  <asp:Label ID="Labelemail" runat="server" Text="Name" ForeColor="White" Font-Size="15px"></asp:Label>
                     </HeaderTemplate>
                     <ItemTemplate> 
                               <asp:Label ID="lblfree1" runat="server" Text='<%#Eval("cname") %>' ToolTip="Name"  ForeColor="Black"></asp:Label>
                     </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                 </asp:TemplateField>
            <asp:TemplateField ControlStyle-Width="100px"  HeaderStyle-Width="100px" FooterStyle-Width="100px"  HeaderStyle-HorizontalAlign="Center"
             ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" >
               <HeaderTemplate>
                        <asp:Label ID="LblListName" runat="server" Text="Number" ForeColor="White" Font-Size="15px"></asp:Label>
               </HeaderTemplate>
              <ItemTemplate> 
                         <asp:Label ID="lblLName" runat="server" Text='<%#Eval("number") %>' ToolTip="Number" ForeColor="Black"></asp:Label>
              </ItemTemplate>
              <FooterTemplate>
              </FooterTemplate>
           </asp:TemplateField>

           <asp:TemplateField  ControlStyle-Width="200px"  HeaderStyle-Width="200px" FooterStyle-Width="200px"  HeaderStyle-HorizontalAlign="Center"
            ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate>
                    <asp:Label ID="Labname" runat="server" Text="Add Date" ForeColor="White" Font-Size="15px"></asp:Label>
           </HeaderTemplate>    
           <ItemTemplate>
              <asp:Label ID="lblfname1" runat="server" Text='<%#Eval("postdate") %>'  ForeColor="Black"></asp:Label>
            </ItemTemplate>
              <FooterTemplate >
               </FooterTemplate>
         </asp:TemplateField>
          <asp:TemplateField ControlStyle-Width="80px" HeaderStyle-Width="80px" FooterStyle-Width="80px"  HeaderStyle-HorizontalAlign="Center"
           ItemStyle-HorizontalAlign="Center" >
                        <HeaderTemplate>
                                <asp:Label ID="Labeloptions" runat="server" Text="Options" ForeColor="White" Font-Size="15px"></asp:Label>
                       </HeaderTemplate>
                      <ItemTemplate>
                      <table>
                        <tr>
                          <td>
                          <asp:Button ID="btnEdit1" runat="server" Height="23px" Width="40px" ToolTip="Edit"  Text="Edit" OnClick="edit_click" OnClientClick="return ConfirmDelete1();" /> 
                          </td>
                           <td>
                             <asp:Button ID="btndel" Height="23px" Width="40px" runat="server"  Text="Delete" ToolTip="Delete"  OnClientClick="return ConfirmDelete();" OnClick="btndel_Click"     />
                          </td>
                        </tr>
                      </table>
                      </ItemTemplate>
                      <FooterTemplate>        
                     </FooterTemplate>
                   </asp:TemplateField>

 
    </Columns>
    <EmptyDataTemplate>No Lists Found</EmptyDataTemplate>
    <EmptyDataRowStyle Font-Size="Large" ForeColor="Red" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D"  ForeColor="White" Font-Names="Arial" Font-Size="18px" Height="30px" /> 
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
    </asp:GridView>
        </td>
      </tr>
   </table>

        <table id="listname" runat="server" height="120px"  align="center" width="60%" >
         <tr> 
             <td align="center" style="background-color: #0985c5; line-height:22px; font-size:19px; font-style:oblique" class="rounded-corners"   width="60%">
               <span style="color:White;"> Create List</span>
             </td>
          </tr>
           <tr>
               <td  style="line-height:24px;">
               <asp:Label ID="lbllistname" runat="server" Width="200px" Text="Enter List Name" ForeColor="Black"></asp:Label>  
                : <asp:TextBox ID="txtlistname" runat="server" Width="200px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtlistname"
                    ErrorMessage="Provide Name" ValidationGroup="RegForm1"><span >*</span></asp:RequiredFieldValidator> 
               </td>
           </tr>
           <tr>
             <td align="center">
               <%--<asp:Button ID="btnadd1" runat="server" Text="Add"  ValidationGroup="RegForm1"  
                     Width="50px" Height="30px" onclick="btnadd1_Click"/>--%>
                     <asp:ImageButton ID="btnadd1" runat="server" onclick="btnadd1_Click" ValidationGroup="RegForm1" ImageUrl="~/images/add.png" />
             </td>
           </tr>
        </table>

        <table id="import"  runat="server" height="150px" align="center">
          <tr>
           <td align="center" style="background-color: Gray; line-height:22px; font-size:19px; font-style:oblique" width="100%" colspan="3">
               Upload Numbers to List
             </td>
          </tr>
          <tr>
             <td> Select List </td>
             <td>  <asp:DropDownList ID="ddlimport" runat="server"  Width="150px" Height="26px" >
                   <asp:ListItem>Select List</asp:ListItem> </asp:DropDownList>
             </td>
         </tr>
         <tr>
           <td> Upload Mobile Numbers</td>
            <td>
                <asp:FileUpload ID="upload1" runat="server" />    
             </td>
          </tr>
          <tr>
          <td></td>
            <td>
              upload multiple Numbers with comma(,)sepateted in notepad file or
            </td>
          </tr>
          <tr>
          <td></td>
            <td>
              Excel sheet(.xls) with mobile column name
            </td>
          </tr>

          <tr>
           <td> &nbsp;</td>
            <td>  <%--<asp:Button ID="btnsubmit" runat="server" Text="Upload" 
                    onclick="btnsubmit_Click" />--%>   
                    <asp:ImageButton  ID="btnsubmit" runat="server"
                    onclick="btnsubmit_Click" ImageUrl="~/images/upload.png" />  </td>
          </tr>
        </table>
       
            
     
          <br />
      
             <table id="export" runat="server" height="120px" align="center">
             <tr>
         
             <td align="center" style="background-color: Gray; line-height:22px; font-size:19px; font-style:oblique" width="100%" colspan="3">
               Export Numbers From List
             </td>
          </tr>
         <tr>
             <td > Select List </td>
             <td>  <asp:DropDownList ID="ddlexport" runat="server"  Width="150px" Height="26px">
                   <asp:ListItem>Select List</asp:ListItem> </asp:DropDownList>
             </td>
         </tr>
           <tr>
           <td> &nbsp;</td>
            <td>  
                <%--<asp:Button ID="btnexport" runat="server" Text="Download" onclick="btnexport_Click"/>--%>   
                
                <asp:ImageButton   ID="btnexport" runat="server" Text="Download" onclick="btnexport_Click" ImageUrl="~/images/download2.png" /> </td>
          </tr>
          </table>
         
        

     </td>
    </tr>

   </table>

  <%-- //btnEdit1--%>
    <input id="btnedit" runat="server" type="button" style="display: none" />
        <ajax:modalpopupextender ID="ModalPopupExtender2" runat="server" TargetControlID="btnedit"
            BackgroundCssClass="modalBackground" CancelControlID="btnUpdatecancel" DropShadow="false"
            PopupControlID="pnledit" PopupDragHandleControlID="pnleditlist" 
          OkControlID="Button2">
            
</ajax:modalpopupextender>
        <asp:Panel ID="pnledit" runat="server" BackColor="White" Height="230px" Width="450px" >
                    
                <table width="100%" style="border:Solid 3px #5D7B9D; width:100%; height:100%" cellpadding="0" cellspacing="0">
                    <tr style="background-color:#5D7B9D">
                            <td colspan="2" style=" height:10%; color:White; font-weight:bold; font-size:larger" align="center"> 
                                 Edit Contact
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="X" ForeColor="white" Font-Bold="true" BorderStyle="None"
                                BackColor="#5D7B9D" />
                            </td>
                   </tr>
                   <tr>
                        <td>&nbsp;</td>
                  </tr>
                   <tr>
                        <td align="right" style="color:#5D7B9D; font-weight:bold;" width="30%">
                             Contact  Name :&nbsp;
                      </td>
                       <td width="50%">
                              <asp:TextBox ID="txteditlname" runat="server" Width="300px"></asp:TextBox>
                       </td> 
                        <td style="padding-right:10px"> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txteditlname" ValidationGroup="val1"
                                ErrorMessage="Create list">*</asp:RequiredFieldValidator>
                      <br />
                       </td>
                  </tr>

                   <tr>
                    <td align="right" style="color:#5D7B9D; font-weight:bold;" width="40%">
                      Number :&nbsp;
                    </td>
                    <td width="60%">
                         <asp:TextBox ID="txteditdesc" runat="server" Width="300px"  ></asp:TextBox></td>
                               <td style="padding-right:10px"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txteditdesc" ValidationGroup="val1"
                                ErrorMessage="Enter Number">*</asp:RequiredFieldValidator>
                      <br />
                       </td>
                            </tr>
                       <tr>
                       <td>&nbsp;</td>
                       <td width="60%">
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txteditdesc" ForeColor="Red"
                        ErrorMessage="Mobile Number must be 10 digits"  ValidationGroup="val1" SetFocusOnError="True"
                Display="dynamic" ValidationExpression="^[0-9]{10}$" > </asp:RegularExpressionValidator>
                      <br />
                       </td>
                       </tr>
             
                   <tr>
                        <td>
                            &nbsp;
                        </td>
                   </tr>

                   <tr>
                        <td align="center" colspan="2">
                            <asp:ImageButton ID="btnUpdate" runat="server"  ValidationGroup="val1"
                                    ImageUrl="~/images/save.png"  Width="57px" Height="23px" onclick="btnUpdate_Click"  AlternateText="UPDATE" ToolTip="UPDATE"/>  &nbsp;
                           <asp:ImageButton ID="btnUpdatecancel" runat="server" 
                                ImageUrl="~/images/cancel.png" Width="57px" Height="23px" 
                                AlternateText="CANCEL" ToolTip="CANCEL" onclick="btnUpdatecancel_Click" OnClientClick="window.history.go(-1);return false;" />

</td>
</tr>
 <tr>
    <td>
     <asp:Label ID="lbleditlst" runat="server" Visible="false"></asp:Label>
    </td>
  </tr>
</table>            
        </asp:Panel>
        </div>
  
 

</asp:Content>

