<%@ Page Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" Title=": : SMS FAQ : :" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--<! container starts here!>-->
<div >

<div class="about">

<h1><span class="btext"> You are here:</span>
<ul class="ulbld">
    <li> 
         <asp:LinkButton ID="lnkhome" runat="server" Text=" >> Home" 
             Font-Underline="false" onclick="lnkhome_Click"></asp:LinkButton> </li>
     <li> >> FAQ </li>
 </ul>
</h1>  
 

<div id="about-content"> FAQ </div>

<p>
Indus SMS is an emerging leader in selective mass communication systems for sending SMS alerts. For resellers, India SMS is the ideal provider of bulk SMS gateways for sending text message alerts to cell phones and mobile devices.
</p>

<p>
We are soliciting enquiries from channel partners across the country in Metros as well as the 'A' and 'B' class cities to enable high penetration in mobile SMS messaging software and services markets as there is a huge untapped potential waiting to be explored. Our Partner Program's objective is to leverage our strengths along with our Partners to help achieve quick growth in the business of providing SMS Solutions to customers.
</p>


</div>
<!--<! about ends here!>-->


</div>
<!--<! container ends here!>-->
</asp:Content>

