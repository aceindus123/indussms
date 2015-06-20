<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Balance.aspx.cs" Inherits="admin_Balance" %>
<%@ Register Src="~/admin/UserControl/Menu.ascx" TagName="header" TagPrefix="head" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Admin : Balance : :</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />

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
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <br />
    <head:header ID="head1" runat="server" />
    <br />
     <br />
        <table>
           <tr>
              <td align="center" id="View" runat="server" >
                  <font size="5" color="green"><strong> Balance Sheet</strong></font>
              <br /><br /></td>
            </tr>
             <tr><td align="center">
              <asp:RadioButton ID="rdschedulesms" runat="server" 
                Text="Balance update" AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="rdschedulesms_CheckedChanged" 
                />
                &nbsp;
                <asp:RadioButton ID="rdvoicesms" runat="server" 
                Text=" SMS Rates" AutoPostBack="true"  GroupName="rd1" Checked="false" oncheckedchanged="rdvoicesms_CheckedChanged" 
                 />
            
        </td></tr>
        <tr>
         <td>
         &nbsp;
         </td>
        </tr>

            <tr><td>
                <table id="update" runat="server">
                <tr><td><font size="3"><strong>Enter UserName : </strong></font></td>    
                <td style="padding-left:60px;"><asp:TextBox ID="txtuname" runat="server" Width="180px" onkeypress="return onlyNos(event,this);" MaxLength="10"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="req" runat="server" ErrorMessage="Please Enter The UserName." ControlToValidate="txtuname" ValidationGroup="bal"><span style="color:Red;">*</span></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td><br /><font size="3"><strong>Enter Amount : </strong></font></td>
                <td style="padding-left:60px;"><br /><asp:TextBox ID="txtamount" runat="server" Width="180px" onkeypress="return onlyNos(event,this);" MaxLength="6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="req1" runat="server" ErrorMessage="Please Enter The Amount." ControlToValidate="txtamount" ValidationGroup="bal"><span style="color:Red;">*</span></asp:RequiredFieldValidator></td>
                </tr>

      
                <tr>
                <td valign="top"><br /><font size="3"><strong>Select SMS Type : </strong></font></td>
                <td style="padding-left:60px;"><br /><asp:DropDownList ID="dropsmstype" runat="server" Width="181px">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Text SMS</asp:ListItem>
                <asp:ListItem>Voice SMS</asp:ListItem>
                </asp:DropDownList></td>
                </tr>
                <tr>
                <td colspan="2" style="padding-left:130px;"><br /><asp:Button ID="btnaccept" 
                        runat="server" Text="Accept" Height="30px" Width="80px" 
                        onclick="btnaccept_Click" ValidationGroup="bal"/>
                        <asp:ValidationSummary ID="validation" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="bal"/></td>
                </tr>
                </table>
            </td></tr>

            <tr>
             <td>
             <table id="rates" runat="server" visible="false">            <tr>
              <td align="right">
                <asp:Label ID="lbl1" runat="server" Text="Text SMS Rate (per 1 Message) :"></asp:Label>
              </td>
              <td align="left">
                <asp:TextBox ID="txttext" runat="server" Width="180px" onkeypress="return onlyNos(event,this);" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter The Amount." ControlToValidate="txttext" ValidationGroup="bal"><span style="color:Red;">*</span></asp:RequiredFieldValidator>

              </td>
            </tr>
            <tr>
              <td align="right">
                <asp:Label ID="lbl2" runat="server" Text="Voice SMS Rate (per 1 Message) :"></asp:Label>
              </td>
              <td align="left">
                <asp:TextBox ID="txtvoice" runat="server" Width="180px" onkeypress="return onlyNos(event,this);" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter The Amount." ControlToValidate="txtvoice" ValidationGroup="bal"><span style="color:Red;">*</span></asp:RequiredFieldValidator>

              </td>
            </tr>
            <tr>
              <td>
                &nbsp;
              </td>
            </tr>
            <tr>
              <td>
                &nbsp;
              </td>
              <td align="left">
                <asp:Button ID="btnsubmit"   runat="server" Text="Update" Height="30px" Width="80px"    ValidationGroup="bal" onclick="btnsubmit_Click" />
                 <asp:Button ID="btncancel"   runat="server" Text="Cancel" Height="30px" Width="80px" onclick="btncancel_Click" />
              </td>
            </tr>

            <tr>
              <td><br /><br /></td>
            </tr>

            <tr><td colspan="4">
              <asp:GridView ID="gvusers" runat="server"   Width="600px"  
                    AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  
                    Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                 Font-Underline="False"   BackColor="White" AllowPaging="True"   PagerStyle-Mode="NumericPages"
                   PagerStyle-BackColor="White"  ShowHeaderWhenEmpty="true" 
                    onpageindexchanging="gvusers_PageIndexChanging" RowStyle-Height="20px" 
                    onrowcancelingedit="gvusers_RowCancelingEdit" onrowediting="gvusers_RowEditing" 
                    onrowupdating="gvusers_RowUpdating"   >
                    <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
                   <HeaderStyle Font-Bold="True"  ForeColor="#003399" Height="30px" BackColor="#bfbfbf" Font-Size="14px" Font-Names="Arial" /> 
                                  <Columns>
                                  <asp:TemplateField>
                                  <HeaderTemplate>S No</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="Medium"/>
                                  <ItemTemplate><asp:Label ID="lblid" runat="server" Text='<%# Eval("Cid") %>'  /></ItemTemplate>
                                  </asp:TemplateField>
                          
                                  <asp:TemplateField>
                                  <HeaderTemplate>Text SMS</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="Medium"/>
                                  <ItemTemplate><asp:Label ID="lblemail" runat="server" Text='<%# Eval("textsms") %>' /></ItemTemplate>
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("textsms") %>' ></asp:TextBox>
                                  </EditItemTemplate>
                                  </asp:TemplateField>

                                  <asp:TemplateField>
                                  <HeaderTemplate>Voice SMS</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="Medium"/>
                                  <ItemTemplate><asp:Label ID="lblpwd" runat="server" Text='<%# Eval("voicesms") %>' /></ItemTemplate>
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("voicesms") %>'  ></asp:TextBox>
                                  </EditItemTemplate>
                                  </asp:TemplateField>

                                  <asp:TemplateField>
                                  <HeaderTemplate>Posted Date</HeaderTemplate>
                                  <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center" Font-Size="Medium"/>
                                  <ItemTemplate><asp:Label ID="lblpno" runat="server" Text='<%# Eval("updaterate") %>' /></ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Edit" ShowHeader="false" ItemStyle-Font-Size="Medium" ItemStyle-Width="100px" >
               <ItemTemplate>
                   <asp:LinkButton ID="btnedit" runat="server" 
			CommandName="Edit" Text="Edit" ></asp:LinkButton>
               </ItemTemplate>
               <EditItemTemplate>
                   <asp:LinkButton ID="btnupdate" runat="server" 
			CommandName="Update" Text="Update" ></asp:LinkButton>
                   <asp:LinkButton ID="btncancel" runat="server" 
			CommandName="Cancel" Text="Cancel"></asp:LinkButton>
               </EditItemTemplate>
            </asp:TemplateField>
                                 <%--  <asp:TemplateField>--%>
                               
                                 <%-- <ItemStyle ForeColor="Gray" BorderColor="#CCCCCC" HorizontalAlign="Center"/>
                                  <ItemTemplate><asp:Button ID="btnupdate" runat="server" Text="Update" /></ItemTemplate>
                                  </asp:TemplateField>--%>

                                  </Columns>
                </asp:GridView>
            </td></tr>
            </table>

             </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
