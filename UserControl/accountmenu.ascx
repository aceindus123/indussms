<%@ Control Language="C#" AutoEventWireup="true" CodeFile="accountmenu.ascx.cs" Inherits="UserControl_accountmenu" %>

<div >
     
    
<ul id="menu2">
    <li id="profile" runat="server"  > <img src="images/profile_white.png" style="vertical-align:middle; width:23; height:23; float:left"  /></span><a  href="AccountInfo.aspx">My Profile</a></li>
    <li id="balance" runat="server"><img src="images/balance.png" style="vertical-align:middle;"  /><a  href="Balance.aspx">Balance</a></li>
    <li id="address_book" runat="server" ><img src="images/address_book.png" style="vertical-align:middle;"  /><a   href="ContactBook.aspx" >Phonebook</a></li>
	<li id="shopping_cart" runat="server"><img src="images/shopping_cart.png" style="vertical-align:middle;"  /><a   href="ShoppingCart.aspx"  >Cart </a></li>
    <li id="notifications" runat="server"><img src="images/notifications.png" style="vertical-align:middle;"  /><a   href="Notifications.aspx"  >Notifications<span id="span_notifications"></span></a></li>
	<li id="Helpdesk" runat="server"><a  href="Help.aspx">Helpdesk</a></li>
</ul>
    
</div>

