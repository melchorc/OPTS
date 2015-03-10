<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master" AutoEventWireup="true" CodeFile="UserAccount(DS).aspx.cs" Inherits="UserAccount_DS" %>

<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<%@ Register TagName="DataView" Src="~/App_Controls/DataView.ascx" TagPrefix="ctr" %>
<%@ MasterType VirtualPath="~/AccountSite.master"  %>
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
            <asp:TabContainer ID="TabContainer6" runat="server">
                <asp:TabPanel ID="TabPanel10" runat="server" HeaderText="TabPanel9">
                    <HeaderTemplate>Employee Account</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:DataView ID="dvEmployees" runat="server" SearchButton="Search" SearchTitle="Employee Name or ID:" />
                        <asp:Table ID="Table10" runat="server">
                            <asp:TableRow ID="TableRow1" runat="server">
                                <asp:TableCell ID="TableCell1" runat="server"><asp:Button ID="btnRefreshData" runat="server" Text="Refresh Data" UseSubmitBehavior="False" />
</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

