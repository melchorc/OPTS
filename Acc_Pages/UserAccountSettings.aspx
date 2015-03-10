<%@ Page Title="Account Settings" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master"
    AutoEventWireup="true" CodeFile="UserAccountSettings.aspx.cs" Inherits="UserAccountSettings" %>
<%@ Register TagName="ContactInformation" TagPrefix="ctr" Src="~/App_Controls/ContactInformation.ascx" %>
<%@ Register TagName="PersonalDetails" TagPrefix="ctr" Src="~/App_Controls/PersonalDetails.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="M" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release">
    </asp:ToolkitScriptManager>
    <h1>
        <asp:Label ID="lblTitle" runat="server" Text="My Account Settings"></asp:Label></h1>
    <div style="padding: 0 50px 0 50px">
        <asp:TabContainer ID="tbcAccountSettings" runat="server" UseVerticalStripPlacement="True">
            <asp:TabPanel runat="server" ID="tabPersonalDetails" HeaderText="PersonalDetails">
                <ContentTemplate>
                    <ctr:PersonalDetails ID="pdPersonalDetails" runat="server" />
                    <asp:Table runat="server" ID="Table2">
                        <asp:TableRow runat="server">
                            <asp:TableCell HorizontalAlign="Center" runat="server"><asp:Button ID="btnSavePers" OnClick="onBtnSave_Click" runat="server" Text="Save" />
</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel runat="server" ID="tabContactDetails" HeaderText="ContactDetails">
                <ContentTemplate>
                    <h5>
                        <asp:Label ID="lblContactDetails" runat="server" Text="Contact Details"></asp:Label></h5>
                    <ctr:ContactInformation ID="contactInfo" runat="server" />
                    <asp:Table runat="server" ID="Table1">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Button ID="btnSaveCont" runat="server" OnClick="btnSaveCont_Click" Text="Save" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel runat="server" ID="tabSecurity" HeaderText="Security">
                <ContentTemplate>
                    <h5>
                        <asp:Label ID="lblSecurity" runat="server" Text="Security"></asp:Label></h5>
                    <asp:Table runat="server" ID="tblPassword">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblOldPassword" runat="server" Text="Old Password:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqOldPassword" ControlToValidate="txtOldPassword" runat="server"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblNewPassword" runat="server" Text="New Password:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqNewPassword" ControlToValidate="txtNewPassword" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regNewPassword" ControlToValidate="txtNewPassword" ValidationExpression=".{6,30}" runat="server"></asp:RegularExpressionValidator>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="2">
                                <asp:PasswordStrength ID="pssPasswordStrength" TargetControlID="txtNewPassword" runat="server"></asp:PasswordStrength>
                                <asp:Label ID="lblPassStrength" runat="server" Text="Password Safety"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqConfirmPassword" ControlToValidate="txtConfirmPassword" runat="server"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" ID="tblButtons">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Button ID="btnSaveSecu" OnClick="btnSaveSecu_Click" runat="server" Text="Save" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>
</asp:Content>
