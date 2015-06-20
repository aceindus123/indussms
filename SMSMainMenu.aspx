<%@ Page Title=": : SMSMainMenu : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSMainMenu.aspx.cs" Inherits="SMSMainMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="main">

        <div class="container" style="border:none;">

            <div class="one" style="margin-left: -0.7px;">
                <h3>
                    <img src="images/missedcall.png" />
                    Missed call alert
                </h3>
                <p>
                    It is a platform that can be widely used by business organizations to generate a
                    healthy feedback from customers.
                </p>
                <div class="read">
                    <a href="MissedCall.aspx">Read more</a></div>
            </div>

            <div class="one">
                <h3>
                    <img src="images/voice.png" />
                    Voice Bulk SMS
                </h3>
                <p>
                    Voice calls are pre recorded messages which can be easily send to mobiles and landlines
                    across the country with IndiaSMS.
                </p>
                <div class="read">
                    <a href="Compose VoiceSMS.aspx">Read more</a></div>
            </div>

            <div class="one">
                <h3>
                    <img src="images/message.png" width="31" height="32" />
                    Events SMS
                </h3>
                <p>
                     Whether the event is a wedding or an election campaign, you can easily send sms to your network with Events SMS option
                </p>
                <div class="read">
                    <a href="SMSEvent.aspx">Read more</a></div>
            </div>

            <div class="one">
                <h3>
                    <img src="images/watch.png" width="31" height="32"  />
                    Schedule SMS</h3>
                <p>
                    Schedule an SMS so that it is sent at a future date with this application. Choose the date and then enter the phone number and a message.<br />
                </p>
                <div class="read">
                    <a href="ScheduleSMS.aspx">Read more</a></div>
            </div>
        </div>
      
        <div class="content">
            <div class="one" style="margin-left: -0.7px;">
                <h3>
                    <img src="images/contact.png" />
                    Contacts 
                </h3>
                <p>
                    Build your list of contacts easily and effectively. You can also import and export contacts<br /><br />
                </p>
                <div class="more">
                    <a href="ContactBook.aspx" >
                        <img src="images/moreinfo.png" alt="More Info" /></a></div>
            </div>

            <div class="one">
                <h3>
                    <img src="images/sms-senderid1.png" />
                    Sender Id
                </h3>
                <p>
                    Maintain and track the list of sender id’s who have sent you SMS text messages. Name and number will be shown.<br />
                </p>
               <div class="more">
                    <a href="Sender_id.aspx" >
                        <img src="images/moreinfo.png" alt="More Info" /></a></div>
            </div>

            <div class="one">
                <h3>
                    <img src="images/Fall-in-Rupee.png" width="31" height="32" />
                    Balance
                </h3>
                <p>
                     Easily check your balance amount and number of SMSes left. You can also buy a new plan <br /><br />
                </p>
                <div class="more">
                    <a href="Balance.aspx" >
                        <img src="images/moreinfo.png" alt="More Info" /></a></div>
            </div>

            <div class="one">
                <h3>
                    <img src="images/call.png" />
                   Support</h3>
                <p>
                    A dedicated customer support team to help you with all your SMS related queries as and when required<br /><br />
                </p>
               
                <div class="more">
                    <a href="Help.aspx">
                        <img src="images/moreinfo.png" alt="More Info" /></a></div>
            </div>
        </div>

 </div>

</asp:Content>

