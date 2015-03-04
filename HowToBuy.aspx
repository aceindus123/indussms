<%@ Page Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="HowToBuy.aspx.cs" Inherits="HowToBuy" Title=": : SMS How To Buy : :" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--<! container starts here!>-->
<div>

<div class="about">

<h1><span class="btext"> You are here:</span>
<ul class="ulbld">
     <li> 
         <asp:LinkButton ID="lnkhome" runat="server" Text=" >> Home" 
             Font-Underline="false" onclick="lnkhome_Click"></asp:LinkButton> </li>
     <li> >> How To Buy  </li>
 </ul>
</h1>  
 

<div id="about-content"> How To Buy   </div>

<p>
Indus SMS is an emerging leader in selective mass communication systems for sending SMS alerts. For resellers, India SMS is the ideal provider of bulk SMS gateways for sending text message alerts to cell phones and mobile devices.
</p>

<div id="about-content">Procedure for buying Promotional SMS Package  </div>

<p> <b>  STEP ONE: </b>  </p>
<p> Email all the following details: </p>
<ul class="list">
                            <li>Desired Username: (Provide 2 – 3 options, username is subject to availability)</li>
                            <li>Name:</li>
                            <li>Company name:</li>
                            <li>Mobile Number:</li>
                            <li>Email ID:</li>
                            <li>Complete Billing Address:</li>
                            <li>Mention the SMS Package you want to buy:</li>
                        </ul>

<p> <b>  STEP TWO: </b> </p>
<p> Deposit amount into our bank account either CASH or Cheque (subject to realization)
</p>

<p> <b> STEP THREE: </b> </p>
<p> Once payment is reflected in our account we will activate your account within 4 working hours. </p>

</div>
<!--<! about ends here!>-->


</div>
<!--<! container ends here!>-->
</asp:Content>

