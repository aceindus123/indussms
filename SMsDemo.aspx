<%@ Page Title="" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMsDemo.aspx.cs" Inherits="SMsDemo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <%--<script type="text/javascript" src="MaxLength.min.js"></script--%>
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


<ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajax:ToolkitScriptManager>

<div class="container1">

  <table width="100%">
     <tr>
        <td align="left" colspan="3">
           <asp:Image ID="img1" runat="server" ImageUrl="~/images/welcomenewuser.jpg" Width="1000px" Height="50px" />
       </td>
    </tr>
   </table >
   <br />

   <table width="1000px" style=" padding-left:70px; height:311px;">
     <tr>
       <td style="background: url(images/inner.png); background-repeat:no-repeat;width:1000px;padding-left:30px; height:350px;" >
             <table width="1000px">
     <tr>
         <td valign="top" style="padding-top:20px;width:100%"  align="center" >
           <table width="100%" >
              <tr> 
                <td  width="27%" valign="top" style="padding-top:30px;" >
                <table >
                  <tr>
                    <td>
                       <asp:Image ID="Image1" runat="server" ImageUrl="~/images/sms_img.png" /><br />
                    
                    </td>
                  </tr>
                  <tr>
                  <td align="left">
                       <asp:Label ID="Label14" runat="server" Text=" Balance Amount"  ForeColor="Black" CssClass="schlabel"  Font-Size="15px"></asp:Label>  
                    
                  </td>
                  <td align="left">
                     : <asp:Label ID="Label1" runat="server" Text="" ForeColor="#0066FF"  Font-Size="15px"></asp:Label>
                  </td>
                  </tr>
                  <tr>
                    <td align="left">
                       <asp:Label ID="Label10" runat="server" Text="Number Of SMS Left "  ForeColor="Black" CssClass="schlabel"  Font-Size="15px"></asp:Label>  
                    </td>
                    <td align="left">
                     : <asp:Label ID="Label2" runat="server" ForeColor="#0066FF"  Font-Size="15px"></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td align="left" colspan="4"><asp:Label ID="Label15" runat="server" Text="Expires On "  Font-Size="15px" ForeColor="Black" CssClass="schlabel"></asp:Label> 
                   : <asp:Label ID="Label3" runat="server" ForeColor="#0066FF"  Font-Size="15px" ></asp:Label>
                    <%--<asp:Label ID="Label12" runat="server" ForeColor="#0066FF"  Text="Your Sms Count is Low, Please purchased" Visible="false">--%><%--</asp:Label>--%>
                    </td>
                  </tr>
                </table>
                </td>

                <td valign="top" style="padding-top:30px;width:27%"  align="left">
                  <table>
                  <tr>
                    <td>
                       <asp:Image ID="Image2" runat="server" ImageUrl="~/images/voice1.png" />
                    
                    </td>
                  </tr>
                  <tr>
                  <td align="left">
                       <asp:Label ID="Label12" runat="server" Text=" Balance Amount"  ForeColor="Black" CssClass="schlabel"  Font-Size="15px"></asp:Label>  
                    
                  </td>
                  <td align="left">
                     : <asp:Label ID="Label4" runat="server" Text="" ForeColor="#0066FF"  Font-Size="15px"></asp:Label>
                  </td>
                  </tr>
                  <tr>
                    <td align="left">
                       <asp:Label ID="Label17" runat="server" Text="Number Of SMS Left "  ForeColor="Black" CssClass="schlabel"  Font-Size="15px"></asp:Label>  
                    </td>
                    <td>
                     :  <asp:Label ID="Label5" runat="server" ForeColor="#0066FF"  Font-Size="15px"></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td align="left" colspan="4"><asp:Label ID="Label19" runat="server" Text="Expires On " Font-Size="15px"  ForeColor="Black" CssClass="schlabel"></asp:Label> 
                   :<asp:Label ID="Label6" runat="server" ForeColor="#0066FF" Font-Size="15px"></asp:Label>
                    <%--<asp:Label ID="Label13" runat="server" ForeColor="#0066FF"  Text="Your Sms Count is Low, Please purchased" Visible="false">--%></asp:Label>
                    </td>
                  </tr>
                </table><br />
                     <%-- &nbsp;&nbsp;Balance Amount<strong>:</strong>&nbsp;<asp:Label ID="Label4" runat="server" Text="" ForeColor="#0066FF"></asp:Label><br /><br />
                      &nbsp;&nbsp;Number Of SMS Left<strong>:</strong>&nbsp;<asp:Label ID="Label5" runat="server" ForeColor="#0066FF"></asp:Label><br /><br />
                      &nbsp;&nbsp;Expires On<strong>:</strong>&nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#0066FF" ></asp:Label>
                      <asp:Label ID="Label13" runat="server" ForeColor="#0066FF"  Text="Your Sms Count is Low, Please purchased" Visible="false"></asp:Label>--%>
                 </td>

                <td valign="top" align="left" style="width:27%">
                      <table width="60%" align="left" >
            <tr >
               <td align="left" valign="top"> 
                  <asp:Label ID="Label8" runat="server" Font-Names="Segoe UI" Text=" Enter Mobile Numbers * : "  ForeColor="White" Font-Size="15px"></asp:Label>
               </td>
               </tr>
                <tr >
               <td align="left"  > 
                  <asp:TextBox ID="TextBox1" runat="server" Width="230px"  Height="56px" CssClass="textboxsch2"   AutoPostBack="true" TextMode="MultiLine"
                    ontextchanged="TextBox1_TextChanged" ></asp:TextBox>
                    <ajax:FilteredTextBoxExtender runat="server" ID="ans" ValidChars="0123456789,"  FilterType="Custom, Numbers"
                    TargetControlID="TextBox1" ></ajax:FilteredTextBoxExtender>
                   <asp:RequiredFieldValidator ID="mobileno" runat="server" ControlToValidate="TextBox1" ForeColor="Red"
                   ErrorMessage="*"  ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </td>
            </tr>

           <tr>
              <td align="left" style="width:250px">
                 <asp:Label ID="Label9" runat="server" Font-Names="Segoe UI" Text="Please Enter Valid Mobile Numbers with comma(,) separated"  ForeColor="White" Font-Size="15px" Width="250px"></asp:Label>
            </td>
          </tr>
     
          <tr id="validnumbers" runat="server" visible="false">
           
           <td ID="Label11" runat="server" width="250px"  align="left">
           <asp:Label ID="Label13" runat="server" Font-Names="Segoe UI"  ForeColor="White" Font-Size="15px" Text="Entered Valid Numbers:" Width="170px"  ></asp:Label>
              <asp:LinkButton ID="Label61" runat="server" Font-Names="Segoe UI" 
                   Text="Click Here"  ForeColor="#64FE2E" Font-Underline="false"   
                   Font-Size="15px" Width="70px" onclick="Label61_Click"></asp:LinkButton>
          </td>
       </tr>

       <tr>
         <td align="left" valign="top" > 
           <asp:Label ID="Label7" runat="server" Font-Names="Segoe UI" Text=" Enter Message * : "  ForeColor="White" Font-Size="15px"></asp:Label>
         </td>
           </tr>
                <tr >
          <td align="left">
                 <asp:TextBox ID="txtmobilesubject" runat="server" TextMode="MultiLine"    Width="230px"  Height="60px" CssClass="textboxsch2" 
                     AutoPostBack="true"  onkeyup="LimtCharacters(this,160,'lblcount');" 
                ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmobilesubject" ForeColor="Red" ErrorMessage="*" 
                        ValidationGroup="val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
         </td>
      </tr>
   
   
    
     </table>
                 </td>
                 <td style="width:19%;"></td>
            </tr>
         </table>
        </td>
      </tr>
   </table>
       </td>
     </tr>

     <tr>
        <td align="center" valign="top" style="padding-left:350px;" >
            <asp:ImageButton  ID="Button1" runat="server" ValidationGroup="val1" onclick="Button1_Click" ImageUrl="~/images/Send1.png" />
           
              <asp:ImageButton  ID="Button2" runat="server" onclick="Button2_Click" ImageUrl="~/images/cancel3.png" />

   </td>
     </tr>
   </table>
   <br />
</div>

<%--<asp:Button ID="btn1" Text="hai" runat="server" onclick="btn1_Click" />--%>
   <ajax:modalpopupextender ID="ModalPopupExtender2" runat="server" TargetControlID="Label61"   BackgroundCssClass="modalBackground1" 
        DropShadow="false" PopupControlID="pnledit"  OkControlID="btnclose"></ajax:modalpopupextender>


        <asp:Panel ID="pnledit" runat="server" BackColor="White" Height="270px" Width="450px"  style=" border:2px solid #dddddd;" Visible="false">
                <table width="100%" align="center" >     
             <tr>
            <td colspan="3"><h2><span style=" font-family:Segoe UI; color:Green;"> Valid Mobile Numbers </span> </h2></td>
            <td>
                 <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Large" />
            </td>
            </tr>
            <tr>
             <td>
                 <asp:Label ID="lblnum" runat="server"  Font-Size="Medium" ForeColor="Black" Font-Names="Segoe UI" />
            </td>
            </tr>
            </table>
         </asp:Panel>
<br />
</asp:Content>


