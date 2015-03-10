<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagName="ClientDetails" Src="~/App_Controls/ClientDetails.ascx" TagPrefix="ctr" %>
<%@ Register TagName="ParcelDetails" Src="~/App_Controls/ParcelDetails.ascx" TagPrefix="ctr" %>
<%@ Register TagName="Payment_Registration" Src="~/App_Controls/Payment_Registration.ascx" TagPrefix="ctr" %>
<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<%@ Register TagName="PersonalDetails" Src="~/App_Controls/PersonalDetails.ascx" TagPrefix="ctr" %>
<%@ Register TagPrefix="ctr" TagName="ContactInformation" Src="~/App_Controls/ContactInformation.ascx"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OnlineBooking.ascx.cs"
    Inherits="OnlineBooking" %>
<asp:UpdatePanel ID="udpOnlineBooking" runat="server" OnLoad="udpOnlineBooking_Load"
    UpdateMode="Conditional">
    <ContentTemplate>
        <asp:TabContainer ID="tabOnlineBooking" runat="server">
            <asp:TabPanel ID="pnlShipper" runat="server">
                <HeaderTemplate>
                    Shipper&#39;s Details
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="pnlConsignee" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>
                    Consignee&#39;s Information
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="pnlParcel" runat="server" HeaderText="TabPanel3">
                <HeaderTemplate>
                    Parcel Details
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="pnlPayment" runat="server" HeaderText="TabPanel4">
                <HeaderTemplate>
                    Payment/Shipment Registration
                </HeaderTemplate>
                <ContentTemplate>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="DataViewProgress" AssociatedUpdatePanelID="udpOnlineBooking"
    runat="server">
    <ProgressTemplate>
        <div style="background-color: #FFFFFF; opacity: 0.7;">
            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/Loading.gif"
                AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: inherit;
                top: 45%; left: 50%;" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
