<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master" AutoEventWireup="true" CodeFile="UserAccount(LA).aspx.cs" Inherits="UserAccount_LA" %>

<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<%@ MasterType VirtualPath="~/AccountSite.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="M" runat="Server">
    <asp:UpdatePanel ID="updAccountContent" runat="server">
        <ContentTemplate>
            <h1>
                <asp:Label ID="lblPageTitle" runat="server" Text="My Account"></asp:Label></h1>
            <asp:TabContainer ID="TabContainer4" runat="server" ActiveTabIndex="0" UseVerticalStripPlacement="True">
                <asp:TabPanel ID="TabPanel8" runat="server" HeaderText="TabPanel8">
                    <HeaderTemplate>Shipment Assignments</HeaderTemplate>
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                        <asp:Table ID="Table6" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnCheckBatchLogistics" runat="server" Text="Check Batch" UseSubmitBehavior="false" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="btnUndoBatchLogistics" runat="server" Text="Undo Batch" UseSubmitBehavior="false" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="btnCancelBatchLogistics" runat="server" Text="Cancel Batch" UseSubmitBehavior="false" OnClientClick="return false;" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <ctr:OptionDialog runat="server" ID="opdCancelBatch" TargetID="btnCancelBatchLogistics" btnOneText="Ok" btnTwoText="Cancel" Title="Change Batch Order">
                            <MessageTemplate>
                                <p>
                                    <asp:Label ID="lblParcelStatusLogistics" runat="server" Text="Parcel Status:"></asp:Label>
                                    <asp:ComboBox ID="cmbParcelStatusLogistics" runat="server">
                                        <asp:ListItem>Damaged</asp:ListItem>
                                        <asp:ListItem>Unknown Address</asp:ListItem>
                                        <asp:ListItem>No Consignee</asp:ListItem>
                                    </asp:ComboBox>
                                </p>
                                <asp:Label ID="lblParcelDescLogistics" runat="server" Text="Description:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtParcelDescLogistics" runat="server" TextMode="MultiLine" Height="150px" Width="200px"></asp:TextBox>
                            </MessageTemplate>
                        </ctr:OptionDialog>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

