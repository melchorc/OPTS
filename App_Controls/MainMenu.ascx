<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainMenu.ascx.cs" Inherits="App_Controls_MainMenu" %>
<asp:Menu ID="NavMenu" runat="server" Orientation="Horizontal" StaticSubMenuIndent="16px" SkinID="MainMenu">
    <Items>
        <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Pub_Pages/Home.aspx"></asp:MenuItem>
        <asp:MenuItem Text="About" Value="About" NavigateUrl="~/Pub_Pages/About.aspx">
            <asp:MenuItem Text="History" Value="History" 
                NavigateUrl="~/Pub_Pages/History.aspx"></asp:MenuItem>
        </asp:MenuItem>
        <asp:MenuItem Text="Services" Value="Services" NavigateUrl="~/Pub_Pages/Services.aspx"></asp:MenuItem>
    </Items>
</asp:Menu>
