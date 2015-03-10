<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Captcha.ascx.cs" Inherits="CaptchaControl" %> 
<asp:UpdatePanel ID="CaptchaView" runat="server" UpdateMode="Conditional">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lnkReload" />
    </Triggers>
    <ContentTemplate>
        <table border="0" cellpadding="0" cellspacing="5" style="<% =style %>">
            <tr>
                <td style="font-size: 10pt; height: 16px">
                    <asp:Label ID="lblCMessage" runat="server" Text="Please enter text shown below:"
                        SkinID="ForceLeft"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-size: 10pt; height: 16px">
                    <asp:Image ID="imgCaptcha" runat="server" Height="92px" Width="305px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="lnkReload" SkinID="ForceLeft" runat="server" 
                        onclick="lnkReload_Click" CausesValidation="false">
                        <asp:ImageMap ID="btnReload" CssClass="CaptchaReload" runat="server" Width="32px"
                            Height="32px" ImageUrl="~/IMAGES/blank.svg" />
                        <asp:Label ID="lblReloadMessage" runat="server" ForeColor="Black" Text="Show another code"></asp:Label>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="font-size: 10pt; height: 16px">
                    <asp:TextBox ID="txtCaptcha" runat="server" Width="298px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtCaptcha" runat="server" ControlToValidate="txtCaptcha"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server" Text="by clicking 'Submit' you agree to the policy and terms of use and service."
                        SkinID="ForceLeft"></asp:Label>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="CaptchaProgress" AssociatedUpdatePanelID="CaptchaView" runat="server" DisplayAfter="0">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0;
            right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/Loading.gif"
                AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed;
                top: -2147483648%; left: 50%;" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
