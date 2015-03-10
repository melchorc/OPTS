<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/PublicSite.master"
    AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Pub_Pages_Registration" %>
<%@ Register TagPrefix="ctr" TagName="PersonalDetails" Src="~/App_Controls/PersonalDetails.ascx" %>
<%@ Register TagPrefix="ctr" TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" %>
<%@ Register TagPrefix="ctr" TagName="ContactInformation" Src="~/App_Controls/ContactInformation.ascx"%>
<%@ Register TagName="Captcha" TagPrefix="ctr" Src="~/App_Controls/Captcha.ascx" %>

<asp:Content ID="Main" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="M" runat="Server">
    <div style="padding: 0px 150px 0px 125px">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release">
            <Services>
                <asp:ServiceReference Path="~/App_WebService/DisplayLocation.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="~/App_WebService/DisplayLocation.js" />
            </Scripts>
        </asp:ToolkitScriptManager>
        
        <h1><asp:Label ID="lblReg" runat="server" Text="Registration"></asp:Label></h1>
        <ctr:PersonalDetails runat="server" ID="pdPersonalDetails" ValidationGroup="ValRegistration" ClientIDMode="Predictable" />
        <h5><asp:Label ID="lblAu" runat="server" Text="Authorization Data"></asp:Label></h5>
        <ctr:ContactInformation  ClientIDMode="Predictable" ID="ClientContactInfo" ValidationGroup="ValRegistration"  runat="server"></ctr:ContactInformation>
        <asp:Table runat="server" ID="tblAuthorizationData">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblUserName" runat="server" Text="User Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <asp:TextBox ID="txtUserName" ValidationGroup="ValRegistration" MaxLength="17" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtUserName" ValidationGroup="ValRegistration" SkinID="ask" ControlToValidate="txtUserName" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regTxtUserName" ValidationGroup="ValRegistration" ControlToValidate="txtUserName" ValidationExpression="[a-z]{2,}[a-z_.]?([a-z\d]){0,4}?" runat="server"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" ValidationGroup="ValRegistration"  TextMode="Password" MaxLength="30" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtPassword" ValidationGroup="ValRegistration"  SkinID="ask" runat="server" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regTxtPassword" ValidationGroup="ValRegistration"  ControlToValidate="txtPassword" ValidationExpression=".{6,30}" runat="server"></asp:RegularExpressionValidator>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <asp:PasswordStrength ID="pssPasswordStrength" TargetControlID="txtPassword" runat="server">
                    </asp:PasswordStrength>
                    <asp:Label ID="lblPassStrength" runat="server" Text="Password Safety"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="tlblRetypePassword" runat="server" Text="Confirm Password:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtRetypePassword" ValidationGroup="ValRegistration"  TextMode="Password" MaxLength="30" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtRetypePassword" ValidationGroup="ValRegistration"  runat="server" SkinID="ask" ControlToValidate="txtRetypePassword"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <h5>
            <asp:Label ID="lblVeri" runat="server" Text="Verification"></asp:Label></h5>
        <asp:Table runat="server" ID="Table1">
            <asp:TableRow>
                <asp:TableCell>
                    <ctr:Captcha  ClientIDMode="Predictable" runat="server" ValidationGroup="ValRegistration"  ID="capRegistration" BackgroundColor="#1279c0" ForgroundColor="#ffffff"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table runat="server" ID="tblButtons">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Button ID="btnRegisterUserAcc" ValidationGroup="ValRegistration" UseSubmitBehavior="false" runat="server" OnClick="btnSubmit_Click" Text="Submit"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <%--<ctr:OptionDialog ID="dlgEmailVerification" runat="server" Title="Email Verification" TargetID="btnRegister" btn2Eye="false" btnOneText="Ok">
        <MessageTemplate>
            <asp:Label ID="lblMessage" runat="server" Text="An email verification has been sent to your Email Account.<br/>Having troubles? Please click "></asp:Label>
            <%--<asp:LinkButton ID="lnkResendEmail" OnClick="sendLinktoEmail" runat="server">this link to resend.</asp:LinkButton>--
        </MessageTemplate>
    </ctr:OptionDialog>--%><asp:HiddenField ID="HDNdUMMY" runat="server" />
    </div>
    <ctr:OptionDialog  ClientIDMode="Predictable" ID="dlgEmailVerication" runat="server" Title="Email Verification"
        btnOneText="Ok" TargetID="HDNdUMMY" btnTwoText="Close" OnLoad="dlgEmailVerification_Load">
        <MessageTemplate>
            <asp:Label ID="lblMessage" runat="server" Text="An email verification has been sent to your Email Account.<br/>Having troubles? Please click "></asp:Label>
            <asp:LinkButton ID="lnkResendEmail" OnClick="sendLinktoEmail" runat="server">this link to resend.</asp:LinkButton>
        </MessageTemplate>
    </ctr:OptionDialog>
</asp:Content>
