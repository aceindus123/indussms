<%@ Page Title=": : SMSAboutUs : :" Language="C#" MasterPageFile="~/SMSMasterPage.master" AutoEventWireup="true" CodeFile="SMSAboutUs.aspx.cs" Inherits="SMSAboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div  >
      <div class="about">
        <h1><span class="btext"> You are here: </span>
            <ul class="ulbld">
                    <li> <asp:LinkButton ID="lnkhome" runat="server" Text=" >> Home"  Font-Underline="false" onclick="lnkhome_Click"></asp:LinkButton> </li> 
               <li > >> About Us </li>
            </ul>
        </h1>  
 
        <div id="about-content"> About Us</div>
           <img src="images/about.jpg" width="284" height="197" align="right" alt="" style=" margin-top:5px;" />

        <p>
          IndusSMS is an information provider in the field of Technology Services & Advertisement Solutions in English and 15 Indian 
          Languages worldwide. In such a short span of time that we have been around, we already have a client base comprising over a 545 happy and satisfied clients.
        </p>

        <p>
           Our goal is to achieve IT services leadership by facilitating value-added top quality marketing solutions for
            our clients in particular horizontal as well as vertical sectors, by combining our technology skills; domain expertise; with a commitment that would help us to establish long-term relationship with our clients.
       </p>

        <p>
          We are committed Quality, Time and Commitment – which helps us in facilitating reliable, 
          secure and great value products and services ably supported with excellent after sales support.
        </p>

        <p>
          We at IndiaSMS spend a great deal of time, effort, & money in updating our technical and media skills 
          to bring safe and reliable resolutions for our clients.
       </p>

        <p> 
           We are a marketing and IT solutions organization rolled into one, working towards offering unique strategy integration; 
           technological and creative implementation; which can have maximum impact on the business of our clients' business performance.
        </p>

        <p> 
           We are proud to share with our readers that we have been fortunate to have climbed and crossed many milestones and it has 
          been our constant endeavour to identify new avenues and innovations and it would not be long before we move towards acquiring ISO certifications
           for services offered by us!
       </p>
    </div>
  </div>

</asp:Content>

