<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Bottom-usercontrol.ascx.cs" Inherits="UserControl_Bottom_usercontrol" %>

<div>
<%--  <ul> 

<li><a href="Default.aspx">HOME</a></li>                       
<li><a href="SMSAboutUs.aspx">ABOUT US </a></li>  
<li><a href="BulkSMSPricing.aspx">BULK SMS PRICING </a></li>  
<li><a href="Reseller.aspx">BE A RESELLER </a></li>  
<li><a href="FAQ.aspx">FAQ </a></li>  
<li><a href="HowToBuy.aspx">HOW TOBUY  </a> </li>  
<li> <a href="Contactus1.aspx"> CONTACT US</a>  </li>

</ul>--%>

<table width="100%" align="center" style="padding:10px 10px 0 30px;" >
  <tr >
    <td>
       <asp:LinkButton ID="lnk1" runat="server" Text="HOME" Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" Font-Size="13px"
            onclick="lnk1_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton1" runat="server" Text="ABOUT US"   ForeColor="white"  Font-Names="Segoe UI" Font-Size="13px"
            Font-Underline="false" onclick="LinkButton1_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton2" runat="server" Text="BULK SMS PRICING" Font-Size="13px"
            Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" onclick="LinkButton2_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton3" runat="server" Text="BE A RESELLER" Font-Size="13px"
            Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" onclick="LinkButton3_Click"></asp:LinkButton>
    </td>
    <td width="70px">
       <asp:LinkButton ID="LinkButton4" runat="server" Text="FAQ" Font-Size="13px"
            Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" onclick="LinkButton4_Click"></asp:LinkButton>
    </td>
    <td>
       <asp:LinkButton ID="LinkButton5" runat="server" Text="HOW TO BUY" 
            Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" Font-Size="13px" onclick="LinkButton5_Click"> </asp:LinkButton>
    </td>
     <td>
       <asp:LinkButton ID="LinkButton6" runat="server" Text="CONTACT US"  Font-Size="13px"
            Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" onclick="LinkButton6_Click" > </asp:LinkButton>
    </td>

    <td>
       <asp:LinkButton ID="LinkButton7" runat="server" Text="FEEDBACK"  Font-Size="13px"
            Font-Underline="false"  ForeColor="white"  Font-Names="Segoe UI" 
            onclick="LinkButton7_Click"  > </asp:LinkButton>
    </td>

  </tr>
</table>

</div>