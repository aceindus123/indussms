<%@ Page Title=": : SMSMainMenu : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSMainMenu.aspx.cs" Inherits="SMSMainMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="container" style="border:none;">
            <div class="one" style="margin-left: -0.7px;">
                <h3>
                    <img src="images/missedcall.png" />
                    missed call alert
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
                    Wedding/Event SMS
                </h3>
                <p>
                    Wedding/Event SMS Where the wedding day is all about celebration and enjoyment of
                    every virtue a thing which
                </p>
                <div class="read">
                    <a href="SMSEvent.aspx?mode=wedding">Read more</a></div>
            </div>
            <div class="one">
                <h3>
                    <img src="images/election-campaign.png" />
                    Election Campaign</h3>
                <p>
                    Reach your voters directly through SMS. Provide Information regarding Political
                    campaigns.
                </p>
                <div class="read">
                    <a href="SMSEvent.aspx?mode=election">Read more</a></div>
            </div>
        </div>
        <!--<! container ends here!>-->
        <div class="content">
            <div class="second" style="margin-left: -0.6px">
                <h3>
                    Bulk SMS</h3>
                <img src="images/bulk-services.png" alt="0" style="border:1px solid #afafaf;" />
                <p>
                    BulkSmsMantra offer bulk sms services including bulk sms software, bulk voice calls,
                    short codes, and long codes for businesses & organizations.</p>
                <div class="more">
                   <%-- <a href="Default.aspx" >--%>
                    <asp:ImageButton ID="imaagsms" runat="server" ImageUrl="~/images/moreinfo.png" 
                        alt="More info" onclick="imaagsms_Click" />
                        <%--<img src="images/moreinfo.png" alt="More Info" /></a>--%></div>
            </div>
            <div class="second">
                <h3>
                    Email Marketing
                </h3>
                <img src="images/email-marketing.png" alt="More Info" style="border:1px solid #afafaf;" />
                <p>
                    BulkSmsMantra offer bulk sms services including bulk sms software, bulk voice calls,
                    short codes, and long codes for businesses & organizations.</p>
                <div class="more">
                    <a href="http://www.indusemail.com/" target="_blank">
                        <img src="images/moreinfo.png" alt="More Info"  /></a></div>
            </div>
            <div class="second">
                <h3>
                    Internal Messenger
                </h3>
                <img src="images/internal-messanger.png" alt="Internal Messanger"  style="border:1px solid #afafaf;"/>
                <p>
                    BulkSmsMantra offer bulk sms services including bulk sms software, bulk voice calls,
                    short codes, and long codes for businesses & organizations.</p>
                <div class="more">
                    <a href="images/comming-soon.jpg" target="_blank">
                        <img src="images/moreinfo.png" alt="More info"  align="middle"  /></a></div>
            </div>
            <div class="second" >
                <h3>
                    Schedule SMS</h3>
                <img src="images/schedulesms.jpg" alt="ScheduleSMS"   style="border:1px solid #afafaf;" />
                <p>
                    Schedule an SMS so that it is sent at a future date with this application. Choose the date and then enter the mobile phone number and a message.  </p>
                <div class="more">
                     <a href="SMSEvent.aspx?mode=schedule"> 
                        <img src="images/moreinfo.png" alt="More info"  align="middle"  /></a></div>
            </div>
        </div>
</asp:Content>

