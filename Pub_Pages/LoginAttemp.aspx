<%@ Page Language="C#" Theme="Default" AutoEventWireup="true" CodeFile="LoginAttemp.aspx.cs" Inherits="Pub_Pages_LoginAttemp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 10% auto 0px auto; width: 450px; border-radius: 5px; border: 1px solid gray; padding: 10px 30px 30px 30px; background-color: rgba(255,255,255,0.9)">
            <h5>
                <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label></h5>
            <hr />
            <asp:PlaceHolder ID="phlMessage" runat="server">
                <div style="border: 1px solid #dd3c10; background-color: #ffebe8; margin: 10px; padding: 10px;">
                    <asp:Label ID="lblMessage1" runat="server" Text="UserName or Password Required" Font-Bold="True" Font-Size="Smaller"></asp:Label>
                    <br />
                    <asp:Label ID="lblMessage2" runat="server" Text="The UserName or Password is invalid." Font-Size="Smaller"></asp:Label>
                    <br />
                    <asp:Label Font-Size="Smaller" ID="lblMessage3" runat="server" Text="You can login using any username associated with your account.<br/> Make sure that it is typed correctly or "></asp:Label>
                    <asp:LinkButton ID="lnkbtnRegisterNow" runat="server" Font-Size="Smaller">Register</asp:LinkButton>
                    <%--PostBackUrl="~/Pub_Pages/Registration.aspx"--%>
                    <asp:Label ID="Label5" runat="server" Text="if you don't have an account." Font-Size="Smaller"></asp:Label>
                </div>
            </asp:PlaceHolder>
            <asp:Login PasswordRecoveryText="Forgot Your Password?" PasswordRecoveryUrl="~/Pub_Pages/Forgot Password.aspx" ID="LoginFormAttemp" runat="server" TitleText="" DisplayRememberMe="false" OnAuthenticate="LoginFormAttemp_Authenticate"></asp:Login>
        </div>
    </form>
</body>
</html>
