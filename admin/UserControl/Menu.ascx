<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="admin_UserControl_Menu" %>

 <div class="adminlogo1" align="center"  width="100%" >
          <img src="images/bulk-sms3.jpg" />

          <table width="80%"  style="margin-top:-38px">
            <tr >
            &nbsp;  &nbsp; <td align="left" valign="bottom"  width="2%">
                  <img src="images/icon.png"  height="28px"/>
                     </td>
                  <td align="left"  width="58%" >
                 <asp:Label ID="lbluser" runat="server"  Font-Bold="true"  ForeColor="White" Width="100px"  ></asp:Label>
              </td>
              <td align="right "  width="10%" >
                 <asp:LinkButton ID="lnklogout" runat="server" Font-Underline="false"  
                      Text="Logout" Font-Bold="true"  ForeColor="White"  
                      onclick="lnklogout_Click"></asp:LinkButton>
              </td>

            </tr>
          </table>

            <br />
        <table align="center" width="80%" >
                      <tr>
                            <td align="center" width="16%"  >    
                                <asp:LinkButton ID="lnkhome" runat="server" Text="Home" Font-Underline="false"  CausesValidation="false"
                                     class="datalp9" onclick="lnkhome_Click" ></asp:LinkButton>
                             </td>
                      
                        <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"   width="16%" >    
                                <asp:LinkButton ID="lnkclient" runat="server" Text="Clients" Font-Underline="false"  CausesValidation="false"
                                     class="datalp9" onclick="lnkclient_Click"   ></asp:LinkButton>
                             </td>

                        <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"  id="new1" runat="server"  width="16%" >
                              <asp:LinkButton ID="lnknew" runat="server" Text="Voice SMS & Lists" Font-Underline="false" CausesValidation="false"
                                 CssClass="datalp9" onclick="lnknew_Click"      ></asp:LinkButton>
                        </td>
                        <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                        <td align="center"   width="16%">    
                                <asp:LinkButton ID="lnksupport" runat="server" Text="Login Status" Font-Underline="false"  CausesValidation="false"
                                     class="datalp9" onclick="lnksupport_Click"   ></asp:LinkButton>
                             </td>
                       <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"   width="16%">    
                                <asp:LinkButton ID="lnkpost" runat="server" Text="Contact Us" Font-Underline="false"  CausesValidation="false"
                                     class="datalp9" onclick="lnkpost_Click"   ></asp:LinkButton>
                             </td>
                        <td style="font-size:16px;  font-weight:bold;">&nbsp;|</td>
                        <td align="center"   width="16%">    
                                <asp:LinkButton ID="lnkusers" runat="server" Text="Users" 
                                    Font-Underline="false"  CausesValidation="false"
                                     class="datalp9" onclick="lnkusers_Click"    ></asp:LinkButton>
                             </td>
                       
             
                          </tr>

                      <tr>
                        <td align="center"   >            
                           <asp:LinkButton ID="lnkbuy" runat="server" Text="Balance" Font-Underline="false" 
                                 CssClass="datalp9" onclick="lnkbuy_Click"   CausesValidation="false"
                               ></asp:LinkButton>
                        </td>

                        <td style="font-size:16px; font-weight:bold;" >&nbsp;|</td>
                      <td align="center"><asp:LinkButton ID="lnkads" runat="server" 
                              Text="Missed Alerts" Font-Underline="false"  CausesValidation="false" ValidationGroup="ss"
                                 CssClass="datalp9" onclick="lnkads_Click"  ></asp:LinkButton>
                        </td>
                        <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                             <td align="center"  >    
                                <asp:LinkButton ID="lnkjobfairs" runat="server" Text="Offers"  CausesValidation="false"
                                     Font-Underline="false"  class="datalp9" onclick="lnkjobfairs_Click" 
                                     ></asp:LinkButton>
                                    
                        </td>
                                    <td style="font-size:16px; font-weight:bold;">&nbsp;|</td>
                          <td align="center"  width="16%" >    
                                <asp:LinkButton ID="lnkjobseeker" runat="server" Text="Permissions" 
                                    Font-Underline="false"  CausesValidation="false"
                                     class="datalp9" onclick="lnkjobseeker_Click"></asp:LinkButton>
                             </td>
                             
                
                        <td style="font-size:16px; font-weight:bold;" >&nbsp;|</td>
                       <td align="center"  >
                              <asp:LinkButton ID="lnkreports" runat="server" Text="Reports" CausesValidation="false"
                                  Font-Underline="false"   class="datalp9" onclick="lnkreports_Click"
                                    ></asp:LinkButton>

                        </td>
                               <td style="font-size:16px; font-weight:bold;" >&nbsp;|</td>
                       <td align="center"  >
                              <asp:LinkButton ID="lnkerror" runat="server" Text="Support" CausesValidation="false"
                                  Font-Underline="false"   class="datalp9" 
                                  onclick="lnkerror_Click"               ></asp:LinkButton>

                        </td>
                </tr>
  </table>
   </div>
