<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="VoiceClips.aspx.cs" Inherits="VoiceClips" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
    function CheckOnes(spanChk) {

        var oItem = spanChk.children;
        var theBox = (spanChk.type == "radio") ?
spanChk : spanChk.children.item[0];

        xState = theBox.unchecked;
        elm = theBox.form.elements;

        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "radio" &&
elm[i].id != theBox.id) {
                elm[i].checked = xState;
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
    var TotalChkBx;
    var Counter;

    window.onload = function () {
        //Get total no. of CheckBoxes in side the GridView.
        TotalChkBx = parseInt('<%= this.dlnumbers.Rows.Count %>');

        //Get total no. of checked CheckBoxes in side the GridView.
        Counter = 0;
    }

    function HeaderClick(CheckBox) {
        //Get target base & child control.
        var TargetBaseControl =
                   document.getElementById('<%= this.dlnumbers.ClientID %>');
        var TargetChildControl = "chkone";

        //Get all the control of the type INPUT in the base control.
        var Inputs = TargetBaseControl.getElementsByTagName("input");

        //Checked/Unchecked all the checkBoxes in side the GridView.
        for (var n = 0; n < Inputs.length; ++n)
            if (Inputs[n].type == 'checkbox' &&
                            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                Inputs[n].checked = CheckBox.checked;

        //Reset Counter
        Counter = CheckBox.checked ? TotalChkBx : 0;
    }

    function ChildClick(CheckBox, HCheckBox) {
        //get target control.
        var HeaderCheckBox = document.getElementById(HCheckBox);

        //Modifiy Counter; 
        if (CheckBox.checked && Counter < TotalChkBx)
            Counter++;
        else if (Counter > 0)
            Counter--;

        //Change state of the header CheckBox.
        if (Counter < TotalChkBx)
            HeaderCheckBox.checked = false;
        else if (Counter == TotalChkBx)
            HeaderCheckBox.checked = true;
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

<div>
    
    <table style="width:80%; background-color:#f5f3f4; border:1px solid #c8c8c8 " align="center">
                       <tr>
                          <td colspan="2" style=" line-height:15px;height:40px" bgcolor="#0985c5"  align="center">
                             <asp:Label ID="lblbalance" Text="Balance Amount : " runat="server" ForeColor="White" Font-Names="Segoe UI" Font-Size="17px"  /> 
                             <asp:Label ID="lblamount" runat="server"   ForeColor="White" Font-Names="Segoe UI"  Font-Size="17px"/><br />
                          </td>
                      </tr>

                      <tr><td><br /></td></tr>

                      <tr>
                         <td colspan="2" align="center" valign="top">
                             <table align="center" style="width:100%">
                                 <tr>
                                    <td style="padding-left:50px;" valign="top" id="wrapperclass">
                                       <table align="left" style="width: 161px"  >
                                       <tr><td><br /><br /></td></tr>              
                                          <tr>
                       <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat; background-position:bottom; background-position:left;">
                         <strong>
                         <asp:LinkButton ID="linkcall" Text="Call to Record" CssClass="simple"
                               runat="server" onclick="linkcall_Click"></asp:LinkButton></strong>
                        </td>
                  </tr>       
                                          <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                          <strong><asp:LinkButton ID="linkupload" Text="Upload File" CssClass="simple"
                               runat="server" onclick="linkupload_Click"></asp:LinkButton></strong>

                        </td>
                  </tr>
                                          <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                        <strong>
                        <asp:LinkButton ID="linksppech" Text="Text to Speech" CssClass="simple"
                               runat="server" onclick="linksppech_Click"></asp:LinkButton></strong>
                        </td></tr>
                                          <tr>
                    <td height="35" align="left" valign="top" style="background:url(images/nav_line_strip.png); background-repeat:no-repeat;">
                         <strong>
                         <asp:LinkButton ID="linkclips" Text="My Clips" CssClass="simple"
                               runat="server" onclick="linkclips_Click"></asp:LinkButton></strong>
            </td>
                  </tr>                          
                                       </table>
                                    </td>

                                    <td valign="top" align="center" >
                                        <table align="center" style="text-align:left">
                                             <tr>
                                               <td align="center">
                                                    <asp:Panel ID="pan4" runat="server" Width="700px">
                                                        <table align="left">
<tr><td style="padding-left:20px;"><strong><h3><U> Previous Clips</U></h3></strong></td></tr>
<tr><td style="padding-left:20px;" align="center"><br />
   <asp:DataList ID="voicedata" runat="server" Width="600px" DataKeyField="SmsNo"
        ondeletecommand="voicedata_DeleteCommand" 
           onitemdatabound="voicedata_ItemDataBound1"
           onitemcommand="voicedata_ItemCommand" ShowFooter="false" 
         oneditcommand="voicedata_EditCommand">
           
    <ItemTemplate>
    <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rdb" runat="server"/></td>
     <td><%# DataBinder.Eval(Container.DataItem,"SmsName") %></td>
     <td>
    <object type="application/x-shockwave-flash" data='dewplayer-vol.swf?mp3=VoiceSms/<%# Eval("SmsName") %>'
                        width="240" height="20" id="dewplayer">
                        <param name="wmode" value="transparent" />
                        <param name="movie" value='dewplayer-vol.swf?mp3=VoiceSms/<%# Eval("SmsName") %>'/>
                    </object>

 <%--     <object type="application/x-shockwave-flash" data="dewplayer.swf" width="200" height="20" id="dewplayer" name="dewplayer">
       <param name="wmode" value="transparent" />
          <param name="movie" value="dewplayer-mini.swf" /> <param name="flashvars" value="mp3=" /> </object>--%>

      <%--     <object type="application/x-shockwave-flash" data='dewplayer-vol.swf?mp3=FileCS.ashx?Id=<%# Eval("Id") %>'
                    width="240" height="20" id="dewplayer">
                    <param name="wmode" value="transparent" />
                    <param name="movie" value='dewplayer-vol.swf?mp3=FileCS.ashx?Id=<%# Eval("Id") %>'/>

                </object>--%>
                    </td>
         <td>
             <asp:ImageButton ID="ib2" runat="server" ImageUrl="~/images/edit.jpg" width="25" height="21"/>            
             <asp:Panel ID="pan7" runat="server" HorizontalAlign="Center">
              <table width="150%" bgcolor="#33ccff" align="center">
             <tr><td align="right">
                 <asp:ImageButton ID="btnimcan" runat="server" ImageUrl="~/images/close.jpg" width="25" height="21"/></td></tr>
             </table>
             <table width="150%" bgcolor="white" align="center">
             <tr><td><br /><strong> Change VoiceSMS Name :    </strong><asp:TextBox ID="txtsms" Height="25px" Width="180px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SmsName") %>' />
              <br />
              <asp:RegularExpressionValidator ID="rqrsms" runat="server" ErrorMessage="only accept mp3,mp4 & wma formats" ControlToValidate="txtsms"  ValidationExpression="(.+\.([Mm][Pp][3])|.+\.([Mm][Pp][4])|.+\.([Ww][Mm][Aa]))$"></asp:RegularExpressionValidator>
             <br />
             <asp:Button ID="btnsubmit" runat="server" Text="submit"  Height="30px" Width="70px" CommandArgument='<%# Eval("SmsName") %>'/>
             <br /><br /><br />
             </td></tr>
             </table>          
    </asp:Panel>
    <asp:ModalPopupExtender ID="ModalPopupExtender1"  runat="server" TargetControlID="ib2" CancelControlID="btnimcan" ViewStateMode="Disabled" PopupControlID="pan7" DropShadow="true" BackgroundCssClass="LoginBackground">
    </asp:ModalPopupExtender>
             </td>
             <td>
                 <asp:ImageButton ID="ib3" runat="server" ImageUrl="~/images/delete.jpg" width="25" height="21" CommandName="Delete"/></td>
                 <td>
                     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/download.png"  width="25" height="21" OnClick="download" CommandArgument='<%# Eval("SmsName") %>'/></td></tr>
    </ItemTemplate>

    </asp:DataList>
</td></tr>
</table>
                                                        <table style="padding-left:20px;">
<tr>
<td><asp:Label ID="lbldatalist" runat="server" Visible="false" ForeColor="Black" Font-Size="Medium" Font-Bold="true"  /></td>
</tr>
</table>
                                                         <br />
                                                        <table class="style1">
        <tr>
            <td class="style2">
                <strong><asp:LinkButton ID="linkprevoius" Font-Underline="false" runat="server" onclick="linkprevoius_Click"
                >Previous</asp:LinkButton></strong>
            </td>
            <td align="center">
                
                <strong>&nbsp; <asp:LinkButton ID="linknext" runat="server" Font-Underline="false" onclick="linknext_Click" 
                >Next</asp:LinkButton></strong>
            </td>
        </tr>
    </table> 
                                                    </asp:Panel>
                                               </td>
                                            </tr>
                                            <tr><td><br /><br /></td></tr>
                                            <tr>
                                              <td>
                                                  <asp:Panel ID="pan5" runat="server">
                                                     <table style="padding-left:20px;" align="center">
                                                     <tr>
                                                            <td valign="top" class="padding">
                                                                <table width="450px" style="padding-left:70px;" runat="server" id="tblcnct">
                                                                   <tr>
                                                                      <td valign="top">
                                                                          <strong>Your Phone Book</strong>
                                                                      </td>
                                                                      <td align="right" valign="top" class="padding">
                                                                            <asp:DropDownList ID="droplist" runat="server"  AutoPostBack="true"
                                                                                onselectedindexchanged="droplist_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="padding-left:10px;">
                                                                        <td colspan="2">
                                                                            <asp:GridView ID="dlnumbers" runat="server" AutoGenerateColumns="False" 
                                                                                DataKeyNames="mno"  Width="400px"
                                                                                onpageindexchanging="dlnumbers_PageIndexChanging" PageSize="5" 
                                                                                onrowcreated="dlnumbers_RowCreated" AllowPaging="True">
                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                                <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
        
                                                                               <Columns>
                                                                                    <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <asp:CheckBox ID="chkall" runat="server" onclick="javascript:HeaderClick(this);" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                                    <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkone" runat="server" />
                                                                                    </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                    <HeaderTemplate>Names</HeaderTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                                    <ItemTemplate>
                                                                                    <asp:Label ID="lblname" runat="server" ForeColor="Black" Text='<%# Eval("cname") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                    <HeaderTemplate>Numbers</HeaderTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblno" runat="server" ForeColor="Black" Text='<%# Eval("number") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                             </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><br /></td></tr>
                                                                    <tr align="center">
                                                                       <td colspan="2">
                                                                       <%--   <asp:Button ID="btnselect" runat="server" Text="Select" Height="25px" 
                                                                               Width="70px" onclick="btnselect_Click" />--%>

                                                                        <asp:ImageButton ID="btnselect" runat="server" onclick="btnselect_Click"  ImageUrl="~/images/select12.png" />

                                                                       </td>
                                                                    </tr>
                                                                 </table>
                                                            </td>
                                                       
                                                     </tr>
                                                     <tr><td><br /></td></tr>
                                                         <tr>
                                                            <td>
                                                                 <table >
<tr><td>
 <span style="font-family:Segoe UI;color:Black"> Enter Your Numbers :  </span></td>
<td valign="top" align="left"><asp:TextBox ID="txtnumbers" runat="server" TextMode="MultiLine" Height="80px" Width="300px"></asp:TextBox>
 <asp:FilteredTextBoxExtender runat="server" ID="ans" ValidChars="0123456789,"  FilterType="Custom, Numbers"
                    TargetControlID="txtnumbers" ></asp:FilteredTextBoxExtender>
<asp:RequiredFieldValidator ID="reqtxt" runat="server" ErrorMessage="Please Enter The Number(s)." ControlToValidate="txtnumbers" ValidationGroup="send"><span style="color:Red;">*</span></asp:RequiredFieldValidator>
<asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" TargetControlID="txtnumbers" WatermarkText="Enter Multiple Numbers Separated By(,) Comma" runat="server" WatermarkCssClass="water"  /><br /></td></tr>
</table>
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td colspan="2">
                                                                <asp:Panel ID="pan6" runat="server" Visible="false" align="center" Width="700px">
                                                                <br />
                                                                <table width="100%" style="padding-left:300px;">
                                                                     <tr>
                                                                        <td>
                                                                           <strong>Your SMS Schedule Time 9A.M To 9P.M</strong>
                                                                        </td>
                                                                     </tr>
                                                                </table>
                                                                <table width="100%">
                                                                  <tr>
                                                                    <td>
                                                                      <strong>Enter Your SMS Sending Time : </strong>
                                                                    <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdate">
                                                                    </asp:CalendarExtender>
                                                                    &nbsp;
                                                                    <asp:DropDownList ID="DropDownList3" runat="server">
                                                                    <asp:ListItem>Select Hours</asp:ListItem>
                                                                    <asp:ListItem>01</asp:ListItem>
                                                                    <asp:ListItem>02</asp:ListItem>
                                                                    <asp:ListItem>03</asp:ListItem>
                                                                    <asp:ListItem>04</asp:ListItem>
                                                                    <asp:ListItem>05</asp:ListItem>
                                                                    <asp:ListItem>06</asp:ListItem>
                                                                    <asp:ListItem>07</asp:ListItem>
                                                                    <asp:ListItem>08</asp:ListItem>
                                                                    <asp:ListItem>10</asp:ListItem>
                                                                    <asp:ListItem>11</asp:ListItem>
                                                                    <asp:ListItem>12</asp:ListItem>
                                                                    <asp:ListItem>13</asp:ListItem>
                                                                    <asp:ListItem>14</asp:ListItem>
                                                                    <asp:ListItem>15</asp:ListItem>
                                                                    <asp:ListItem>16</asp:ListItem>
                                                                    <asp:ListItem>17</asp:ListItem>
                                                                    <asp:ListItem>18</asp:ListItem>
                                                                    <asp:ListItem>19</asp:ListItem>
                                                                    <asp:ListItem>20</asp:ListItem>
                                                                    <asp:ListItem>21</asp:ListItem>
                                                                    <asp:ListItem>22</asp:ListItem>
                                                                    <asp:ListItem>23</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    &nbsp;
                                                                    <asp:DropDownList ID="DropDownList4" runat="server">
                                                                    <asp:ListItem>Select Minites</asp:ListItem>
                                                                    <asp:ListItem>00</asp:ListItem>
                                                                    <asp:ListItem>05</asp:ListItem>
                                                                    <asp:ListItem>10</asp:ListItem> 
                                                                    <asp:ListItem>15</asp:ListItem>
                                                                    <asp:ListItem>20</asp:ListItem>
                                                                    <asp:ListItem>25</asp:ListItem> 
                                                                    <asp:ListItem>30</asp:ListItem>
                                                                    <asp:ListItem>35</asp:ListItem>
                                                                    <asp:ListItem>40</asp:ListItem>
                                                                    <asp:ListItem>45</asp:ListItem>
                                                                    <asp:ListItem>50</asp:ListItem>
                                                                    <asp:ListItem>55</asp:ListItem>
                                                                    </asp:DropDownList>&nbsp; <asp:Button ID="btncancel" runat="server" 
                                                                        Text="Cancel" Height="30px" Width="70px" onclick="btncancel_Click" />
                                                                  </td>
                                                                </tr>
                                                                </table>

                                                                </asp:Panel>
                                                             </td>
                                                          </tr>
                                                          <tr align="center">
                                                              <td colspan="2">
                                                                 <%--   <asp:Button  Height="30px" Text="SendNow" CssClass="buttonStyle1"
                                                                        Width="85px" />--%>
                                                                        <asp:ImageButton ID="btnsendnow" runat="server" onclick="btnsendnow_Click" ValidationGroup="send" ImageUrl="~/images/sendnow.png" />
                                                                        <asp:ValidationSummary ID="validation" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="send"/>
                                                                  
                                                               </td>
                                                          </tr>
                                                     </table>
                                                  </asp:Panel>
                                             </td>
                                          </tr>
                                        </table>
                                   </td>
                                </tr>
                                <tr>
                                        <td></td>
                                </tr>
                            </table>
                        </td>
                     </tr>
    </table>

</div>
</asp:Content>

