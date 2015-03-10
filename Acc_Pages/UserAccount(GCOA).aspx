<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master" AutoEventWireup="true" CodeFile="UserAccount(GCOA).aspx.cs" Inherits="UserAccount_GCOA" %>

<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<%@ Register TagName="DataView" Src="~/App_Controls/DataView.ascx" TagPrefix="ctr" %>
<%@ Register TagName="OnlineBooking" Src="~/App_Controls/OnlineBooking.ascx" TagPrefix="ctr" %>
<%@ Register TagName="AddressDetails" Src="~/App_Controls/AddressDetails.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Report" Src="~/App_Controls/Report.ascx" TagPrefix="ctr" %>
<%@ MasterType VirtualPath="~/AccountSite.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="M" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server" ScriptMode="Release">
        <%--            <ControlBundles>
                    <asp:ControlBundle Name="Calendar" />
            </ControlBundles>    --%>
    </asp:ToolkitScriptManager>
    <h1><asp:Label ID="lblPageTitle" runat="server" Text="My Account"></asp:Label></h1>
    <asp:UpdatePanel ID="updAccountContent" runat="server">
        <ContentTemplate>
            <asp:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0" UseVerticalStripPlacement="True">
                <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel8">
                    <HeaderTemplate>Online Booking</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:OnlineBooking ID="OnlineBooking1" runat="server" />
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>Shipment Records</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:DataView ID="DataView1" runat="server" SearchTitle="Search Shipments" />
                        <asp:Table ID="Table1" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnRefreshData" runat="server" Text="Refresh Data" UseSubmitBehavior="false" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>Track</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:DataView ID="dvOngoingShipments" runat="server" SearchTitle="Search Shipments" />
                        <asp:Table ID="Table2" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnReroute" runat="server" Text="Retoute" UseSubmitBehavior="false" OnClientClick="return false;" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="btnAbortShipment" runat="server" Text="Abort Shipment" UseSubmitBehavior="false" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <ctr:OptionDialog runat="server" ID="OptionDialog1" TargetID="btnReroute" btnOneText="Ok" btnTwoText="Cancel" Title="Reroute Parcel Destination">
                            <MessageTemplate>
                                <ctr:AddressDetails runat="server" ID="rerouteLocation" />
                                <%--                                        <asp:Label ID="Label5" runat="server" Text="Reason for changes are made:" SkinID="ForceLeft"></asp:Label>
                                        <asp:TextBox ID="TextBox2" runat="server" Height="100px" Width="500px" TextMode="MultiLine"></asp:TextBox>--%>
                            </MessageTemplate>
                        </ctr:OptionDialog>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel11" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>Reports</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:Report ID="GCOAReport" runat="server" />
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

