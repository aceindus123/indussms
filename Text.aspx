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
 <div align="center" class="container">
<br />
<table width="50%" align="center">
   <tr>
      <td valign="middle">
         <strong>Enter Your Messge : </strong></td>
<td><asp:TextBox ID="txtsms" runat="server" TextMode="MultiLine" Height="62px" 
        Width="255px" /></td>
</tr>
<tr>
<td></td>
<td><br /><asp:Button ID="btnconvert" runat="server" Text="Convert" Height="30px" 
        Width="80px" onclick="btnconvert_Click" /></td>
</tr>
</table>
<br />
<br />
</div>
</asp:Content>

