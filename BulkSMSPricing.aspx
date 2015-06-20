<%@ Page Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="BulkSMSPricing.aspx.cs" Inherits="BulkSMSPricing" Title=": : SMS Bulk Pricing : :" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--<! container starts here!>-->
<div>

<div class="about">

<h1><span class="btext"> You are here:</span>
<ul class="ulbld">
     <%--<li> <a href="Default.aspx">  » Home </a> </li>--%>
     <li> <asp:LinkButton ID="lnkhome" runat="server" Text=" >> Home" 
             Font-Underline="false" onclick="lnkhome_Click"></asp:LinkButton> </li>  <li> >> Bulk Sms Pricing </li>
 </ul>
</h1>  
 

<div id="about-content"> Bulk Sms Pricing </div>

<p>
IndusSMS offers an ideal promotional bulk SMS service to your business which can directly generate sales and leads for your organization. A promotional message is a gateway to drive crazy benefits for your brand. All what matters is the content you send to your audience to educate them about your offer, product or services. We believe that promotional SMS works as a bingo to brands. Our dedicated team of professionals considers all such points and helps you in best possible way to make your messaging campaign a big hit for your business.
</p>

<img src="images/bulk.jpg"  id="imgbulk"  alt=""  />


<table>
 <tr>
   <td>
    Pricing List
   </td>
 </tr>
</table>



<ul class="list">
       <li>Useful for the promotional activities.</li>
       <li>Sender id will be like e.g. <strong>LM-234516</strong>, digits will be random system generated number.</li>
        <li>No documents required for activation of account.</li>
        <li>Push message between <strong>9:00 a.m. to 9:00 p.m.</strong></li>
         <li>Message will not delivered on DND numbers.</li>
       <li>DND messages will not be charged and they will be <strong>refund in 48 hours</strong>.</li>
                        </ul>
</div>

<!--<! about ends here!>-->


</div>
<!--<! container ends here!>-->
</asp:Content>

