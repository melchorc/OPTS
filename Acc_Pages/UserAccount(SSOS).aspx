<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master" AutoEventWireup="true" CodeFile="UserAccount(SSOS).aspx.cs" Inherits="UserAccount_SSOS" %>

<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<%@ Register TagName="DataView" Src="~/App_Controls/DataView.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Report" Src="~/App_Controls/Report.ascx" TagPrefix="ctr" %>
<%@ MasterType VirtualPath="~/AccountSite.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="M" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server" ScriptMode="Release">
        <%--            <ControlBundles>
                    <asp:ControlBundle Name="Calendar" />
            </ControlBundles>    --%>
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="updAccountContent" runat="server">
        <ContentTemplate>
            <h1>
                <asp:Label ID="lblPageTitle" runat="server" Text="My Account"></asp:Label></h1>
            <asp:TabContainer ID="TabContainer5" runat="server">
                <asp:TabPanel ID="TabPanel9" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>Reports</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:Report ID="SSOSReport" runat="server" />
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

