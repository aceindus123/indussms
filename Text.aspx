<%@ Page Title="" Language="C#" MasterPageFile="~/voicesmsmaster.master" AutoEventWireup="true" CodeFile="Text.aspx.cs" Inherits="Text" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript">
    $(function () {
        //Normal Configuration
        $("[id*=txtsms]").MaxLength({ MaxLength: 160 });

    });
    </script>
      <script  src="css/MaxLength.min.js"  type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div align="center" >
<br />

<table><tr>
<td style="background: url(images/Anjianna.jpg); background-repeat:no-repeat; width:350px; height:220px;"  align="right" colspan="2" width="50%"></td>

<td><table style="width: 112%" >
   <tr>
      <td valign="middle">
        <span style="font-family:Segoe UI;color:Black"> Enter Your Messge :  </span></td>
<td><asp:TextBox ID="txtsms" runat="server" TextMode="MultiLine" Height="62px" 
        Width="255px" /></td>
</tr>
<tr>
<td></td>
<td><br /><%--<asp:Button ID="btnconvert" runat="server" Text="Convert" Height="30px" 
        Width="80px" onclick="btnconvert_Click" />--%>
        
        <asp:ImageButton ID="btnconvert" runat="server"  onclick="btnconvert_Click"   ImageUrl="~/images/convert.png"/></td>
</tr>
</table></td>

</tr></table>

<br />
<br />
</div>
</asp:Content>

