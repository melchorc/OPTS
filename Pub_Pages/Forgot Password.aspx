<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/PublicSite.master" %>
<%@ Register TagName="Captcha" TagPrefix="ctr" Src="~/App_Controls/Captcha.ascx" %>
<script runat="server">

</script>

<asp:Content ID="Header" ContentPlaceHolderID="H" Runat="Server">

</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="M" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release"></asp:ToolkitScriptManager>
    <h1><asp:Label ID="Label8" runat="server" Text="Forgot Password"></asp:Label></h1>
    <div class="formLayoutContainer">
        <asp:Table ID="ForgotPasswordForm" runat="server" Height="25px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblUserName" runat="server" Text="User Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtUserName" ValidationGroup="valForgotPassword" runat="server" ControlToValidate="txtUserName" SkinID="ask"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtEmailAddress" ValidationGroup="valForgotPassword" runat="server" ControlToValidate="txtEmailAddress" SkinID="ask"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <ctr:Captcha ID="capForgotPassword" ValidationGroup="valForgotPassword" runat="server" BackgroundColor="#1279c0" ForgroundColor="#ffffff"/>
        <%--<asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text="Message Text" ></asp:Label>--%>
        <p><asp:Button ID="btnSubmit" ValidationGroup="valForgotPassword" runat="server" Text="Submit" /></p>
    </div>
</asp:Content>

