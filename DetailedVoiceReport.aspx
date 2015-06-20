<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="DetailedVoiceReport.aspx.cs" Inherits="DetailedVoiceReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div style="text-align:center;">
<asp:ImageButton ID="img1" runat="server" ImageUrl="~/images/download2.png" 
        onclick="img1_Click" /></div>
<br />

  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#0985c5" HeaderStyle-Height="30px" 
             HeaderStyle-ForeColor="White" RowStyle-Height="30px" CssClass="rounded-corners"   HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large"
           BorderColor="red"     BorderWidth="2px" CellPadding="3" Font-Bold="False" Font-Italic="False"   Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"    AllowPaging="True" GridLines="None" AlternatingRowStyle-BackColor="#F7F8E0"  
                PagerStyle-Mode="NumericPages"   PagerStyle-BackColor="White"   PageSize="10"  OnRowDataBound="grd_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging"    >

           <PagerStyle  ForeColor="#003399" HorizontalAlign="Center" Height="25px" Width="100%" CssClass="letterspace" BackColor="#bfbfbf"/>
         <Columns>
         <asp:TemplateField HeaderText="User" ControlStyle-Font-Size="Medium"  ItemStyle-VerticalAlign="Middle" >
         <ItemTemplate>
             &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LinkButton1" runat="server" Text='<%#Eval("UserName") %>'   ForeColor="#003399" Font-Underline="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>

          <asp:TemplateField HeaderText="Recipient" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
            &nbsp;&nbsp; <asp:Label ID="LinkButton2" runat="server" Text='<%#Eval("tonumber") %>'   ForeColor="#003399" Font-Underline="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>

             <asp:TemplateField HeaderText="Voice Clip" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
            &nbsp;&nbsp;<asp:Label ID="LinkButton3" runat="server" Text='<%#Eval("voiceclip") %>'   ForeColor="#003399" Font-Underline="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
             <asp:TemplateField HeaderText="Time" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
          &nbsp;&nbsp; <asp:Label ID="LinkButto4" runat="server" Text='<%#Eval("senttime") %>'   ForeColor="#003399" Font-Underline="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
          <asp:TemplateField HeaderText="From Number" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
           &nbsp;&nbsp;<asp:Label ID="LinkButton5" runat="server" Text='<%#Eval("from1") %>'   ForeColor="#003399" Font-Underline="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
             <asp:TemplateField HeaderText="Status" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
           &nbsp;&nbsp; <asp:Label ID="LinkButton6" runat="server" Text='<%#Eval("Status") %>'   ForeColor="#003399" Font-Underline="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Reason" ControlStyle-Font-Size="Medium"  Visible="false">
         <ItemTemplate>
            <asp:Label ID="LinkButton7" runat="server" Text='<%#Eval("endreason") %>'   ForeColor="#003399" Font-Underline="false" Visible="false" ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>

             <asp:TemplateField HeaderText="Responce" ControlStyle-Font-Size="Medium" >
         <ItemTemplate>
           &nbsp;&nbsp; <asp:Label ID="lbl3" runat="server"   ForeColor="#003399" Font-Underline="false"  ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Eid" ControlStyle-Font-Size="Medium" Visible="false" >
         <ItemTemplate>
             &nbsp;&nbsp;<asp:Label ID="lbl4" runat="server" Text='<%#Eval("eid") %>'   ForeColor="#003399" Font-Underline="false"  Visible="false"  ></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>
      
        <asp:TemplateField HeaderText="Charge(Rs)" ControlStyle-Font-Size="Medium" ItemStyle-HorizontalAlign="Center">
         <ItemTemplate>
            &nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Text='<%#Eval("amount") %>' ForeColor="#003399"></asp:Label>
         </ItemTemplate>
         </asp:TemplateField>

         </Columns>
         </asp:GridView>

         <br />
</asp:Content>

