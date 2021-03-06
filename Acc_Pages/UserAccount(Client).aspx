﻿<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/PublicSite.master" AutoEventWireup="true" CodeFile="UserAccount(Client).aspx.cs" Inherits="UserAccount_Client" %>

<%@ Register TagName="OnlineBooking" Src="~/App_Controls/OnlineBooking.ascx" TagPrefix="ctr" %>
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
            <asp:TabContainer ID="clientTab" runat="server" ActiveTabIndex="0" UseVerticalStripPlacement="True">
                <asp:TabPanel ID="tpOnlineBooking" runat="server" HeaderText="TabPanel8">
                    <HeaderTemplate>Online Booking</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:OnlineBooking ID="onbClient" runat="server" ClientMode="true" />
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1" Height="500px">
                    <HeaderTemplate>Shipments</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:DataView runat="server" ID="shipmentData" />
                        <asp:Image ID="Image2" ImageUrl="~/IMAGES/dummy_shipment.png" style="" runat="server" />
                        <asp:Table ID="Table4" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnDeleteShipment" runat="server" Text="Delete" UseSubmitBehavior="false" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="btnProduceReport" runat="server" Text="Produce Reports" UseSubmitBehavior="false" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

