<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top-Usercontrol.ascx.cs" Inherits="UserControl_Top_Usercontrol" %>
<div style="padding-top:5px;width:1000px">
<div>
           <table  width="100%">
                                 <tr><td style="width:20%">
                   
                        <img src="images/logo.png" width="233" height="80" alt="0" />
                       
                                 </td>
                                   <td align="right" style="width:80%" valign="top">
                                    <table width="100%">
                                    <tr>
                                               <td  runat="server"  align="right" colspan="5">
                                  <asp:LinkButton ID="lnkprofile" runat="server" Text="Profile"   
                                         Font-Names="Segoe UI" ForeColor="#191919"  Font-Bold="true" onclick="lnkprofile_Click"></asp:LinkButton>
                               &nbsp; &nbsp;
                                                   <asp:Label ID="ipadd" runat="server"  ForeColor="#3366FF" ></asp:Label>&nbsp;&nbsp;&nbsp;
                                       <asp:Label ID="welcome1" runat="server" Text="Wel Come :"  Font-Names="Segoe UI" ForeColor="#191919" ></asp:Label>
                                         <asp:Label ID="lblnumber" runat="server" Visible="false"  ForeColor="#0B614B" ></asp:Label>
                                    &nbsp; &nbsp;<asp:LinkButton ID="lnklogout" runat="server" Text="Logout"    Font-Names="Segoe UI"  ForeColor="#191919"
                                           onclick="lnklogout_Click1"></asp:LinkButton>
                                     &nbsp; &nbsp; <asp:Image alt="Sign Up"  runat="server" ID="signup2"  ImageUrl="~/images/signup.png" />
                                         <asp:LinkButton ID="signup1" runat="server" Text="Sign Up"  Font-Underline="false" Font-Names="Segoe UI"  ForeColor="#191919"
                                           onclick="signup1_Click"></asp:LinkButton>
                                       &nbsp; &nbsp;<asp:Image alt="Login"  runat="server" ID="login2"   ImageUrl="~/images/login.png" />
                                         <asp:LinkButton ID="login1" runat="server" Text="Login"   Font-Underline="false" Font-Names="Segoe UI"  ForeColor="#191919"
                                            onclick="login1_Click"  ></asp:LinkButton>
                                            
                                            </td>
                                           
                                  </tr>
                                  <tr>
                                    <td  colspan="5" align="right" style="margin-top:5px;">
                                           <div class="social_icons" style="margin-top:5px;">
                        <p>  For Enquiry Sales Support  9177 62 6226</p>
                         <a href="https://www.facebook.com/" target="_blank">
                        <img src="images/facebook.png" alt="0" /></a> <a href="https://twitter.com/login"  target="_blank">
                        <img src="images/twitter.png" alt="0" /></a> <a href="https://plus.google.com/" target="_blank">
                        <img src="images/google.png" alt="0" /></a>
                    </div>
                                    </td>
                                  </tr>
                                  </table>
                                  </td>

                                 </tr>
                             </table>

</div>

                  

                     <div class="menu" style="color:#191919;" >
                     <table width="100%" align="center" style="padding:10px 10px 0 30px; color:#191919;">
  <tr style="color:#191919;">
    <td >
       <asp:LinkButton ID="lnk1" runat="server" Text="HOME" Font-Underline="false"  
            onclick="lnk1_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton1" runat="server" Text="REPORTS"   
            Font-Underline="false" onclick="LinkButton1_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton2" runat="server" Text="BULK SMS PRICING" 
            Font-Underline="false"   onclick="LinkButton2_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton3" runat="server" Text="BE A RESELLER" 
            Font-Underline="false"   onclick="LinkButton3_Click"></asp:LinkButton>
    </td>
    <td width="70px">
       <asp:LinkButton ID="LinkButton4" runat="server" Text="FAQ" 
            Font-Underline="false"   onclick="LinkButton4_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton5" runat="server" Text="HOW TO BUY" 
            Font-Underline="false"   onclick="LinkButton5_Click"> </asp:LinkButton>
    </td>
  </tr>
</table>
</div>
          
</div>



