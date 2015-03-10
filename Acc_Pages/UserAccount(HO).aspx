<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<%@ Register TagName="DataView" Src="~/App_Controls/DataView.ascx" TagPrefix="ctr" %>
<%@ Register TagName="AddressDetails" Src="~/App_Controls/AddressDetails.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Report" Src="~/App_Controls/Report.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Locations" Src="~/App_Controls/HOLocManager.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Statuses" Src="~/App_Controls/HOStatus.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Services" Src="~/App_Controls/HOServices.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Accounts" Src="~/App_Controls/HOAccounts.ascx" TagPrefix="ctr" %>

<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master"
    AutoEventWireup="true" CodeFile="UserAccount(HO).aspx.cs" Inherits="UserAccount_HO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="M" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server" ScriptMode="Release">
        <%--            <ControlBundles>
                    <asp:ControlBundle Name="Calendar" />
            </ControlBundles>    --%>
    </asp:ToolkitScriptManager>
    <asp:TabContainer ID="tabHOControl" runat="server" UseVerticalStripPlacement="true" OnActiveTabChanged="tabHOControl_ActiveTabChanged" AutoPostBack="true">
        <asp:TabPanel ID="tabTrack" runat="server" HeaderText="Track">
            <HeaderTemplate>Track</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="updATrack" runat="server" style="height: 100%" ViewStateMode="Disabled">
                    <ContentTemplate>
                        <asp:PlaceHolder ID="phdHOTrack" runat="server">
                        </asp:PlaceHolder>
                        <%--<ctr:DataView ID="dvTrack" runat="server" SearchButton="Track" SearchTitle="Tracking No." />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabReports" runat="server" HeaderText="TabPanel1">
            <HeaderTemplate>Reports</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="updHOReport" runat="server" style="height: 100%" ViewStateMode="Disabled">
                    <ContentTemplate>
                        <asp:PlaceHolder ID="phdHOReport" runat="server">

                        </asp:PlaceHolder>
                        <%--<ctr:Report ID="HOReport" runat="server" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabAccounts" runat="server" HeaderText="TabPanel9">
            <HeaderTemplate>Accounts</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="updHOAccounts" runat="server" style="height: 100%">
                    <ContentTemplate>
                        <asp:PlaceHolder ID="phdHOAccounts" runat="server"></asp:PlaceHolder>
                        <%--<ctr:Accounts runat="server" ID="AccUser" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="pnlServices" runat="server" HeaderText="TabPanel9">
            <HeaderTemplate>Services</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="updHOServices" runat="server" style="height: 100%" ViewStateMode="Disabled">
                    <ContentTemplate>
                        <h5>
                            <asp:Label ID="Label6" runat="server" Text="Services"></asp:Label></h5>
                        <hr />
                        <asp:PlaceHolder ID="phdHOServices" runat="server"></asp:PlaceHolder>
                        <%--<ctr:Services ID="ServicesFileMain" runat="server" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="pnlLocation" runat="server" HeaderText="TabPanel9">
            <HeaderTemplate>Locations</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="updHOLocation" runat="server" style="height: 100%">
                    <ContentTemplate>
                        <h5>
                            <asp:Label ID="Label2" runat="server" Text="Locations"></asp:Label></h5>
                        <asp:PlaceHolder ID="phdHOLocation" runat="server"></asp:PlaceHolder>
                        <%--<ctr:Locations ID="LocationFileMain" runat="server" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="pnlStations" runat="server" HeaderText="TabPanel9">
            <HeaderTemplate>Stations</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" style="height: 100%" ViewStateMode="Disabled">
                    <ContentTemplate>
                        <ctr:OptionDialog runat="server" ID="OptionDialog2" ValidationGroup="valStations" TargetID="Button5" btnOneText="Ok" btnTwoText="Cancel" Title="Add New Location">
                            <MessageTemplate>
                                <ctr:AddressDetails runat="server" ID="addNewStations" ValidationGroup="valStations" />
                            </MessageTemplate>
                        </ctr:OptionDialog>
                        <ctr:DataView SearchTitle="Search" runat="server" ID="DataView7" />
                        <asp:Table runat="server" ID="Table14">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Button ID="Button5" runat="server" Text="Add" CausesValidation="false" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right">
                                    <asp:Button ID="Button8" runat="server" Text="Edit" CausesValidation="false" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="pnlStatuses" runat="server">
            <HeaderTemplate>Parcel/Shipment Status</HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="updStatuses" runat="server" style="height: 100%" ViewStateMode="Disabled">
                    <ContentTemplate>
                        <h5>
                            <asp:Label ID="lblTitlePS" runat="server" Text="Parcel/Shipment Status"></asp:Label></h5>
                        <asp:PlaceHolder ID="phdHOStatuses" runat="server"></asp:PlaceHolder>
                        <%--<ctr:Statuses ID="StatusFileMain" runat="server" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabAccessLevels" runat="server">
            <HeaderTemplate>Access Levels</HeaderTemplate>
            <ContentTemplate>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>

</asp:Content>
