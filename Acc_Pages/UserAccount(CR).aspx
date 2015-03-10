<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master" AutoEventWireup="true" CodeFile="UserAccount(CR).aspx.cs" Inherits="UserAccount_CR" %>

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
            <asp:TabContainer ID="TabContainer3" runat="server" ActiveTabIndex="0" UseVerticalStripPlacement="True">
                <asp:TabPanel ID="TabPanel6" runat="server" HeaderText="TabPanel8">
                    <HeaderTemplate>Shipment Assignment</HeaderTemplate>
                    <ContentTemplate>
                        <asp:GridView ID="gvOrderList" runat="server"></asp:GridView>
                        <asp:Image ID="Image2" ImageUrl="~/IMAGES/dummy_order.PNG" Style="" runat="server" />
                        <asp:Table ID="Table5" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnCheckOrder" runat="server" Text="Check Order" UseSubmitBehavior="false" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="btnUndoOrder" runat="server" Text="Undo Order" UseSubmitBehavior="false" />
                                </asp:TableCell><asp:TableCell>
                                    <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel Order" OnClientClick="return false;" UseSubmitBehavior="false" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Button ID="btnChangePrice" runat="server" Text="Change Price" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <ctr:OptionDialog runat="server" ID="opdCancelOrder" TargetID="btnCancelOrder" btnOneText="Ok" btnTwoText="Cancel" Title="Change Order Status">
                            <MessageTemplate>
                                <p>
                                    <asp:Label ID="lblOrderStatus" runat="server" Text="Order Status:"></asp:Label>
                                    <asp:ComboBox ID="cmbOrderStatus" runat="server">
                                        <asp:ListItem>Delayed</asp:ListItem>
                                        <asp:ListItem>No Shipper</asp:ListItem>
                                        <asp:ListItem>Unknown Address</asp:ListItem>
                                    </asp:ComboBox>
                                </p>
                                <asp:Label ID="lblOrderDesc" runat="server" Text="Description:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtOrderDesc" runat="server" TextMode="MultiLine" Height="150px" Width="200px"></asp:TextBox>
                            </MessageTemplate>
                        </ctr:OptionDialog>
                        <ctr:OptionDialog runat="server" ID="OptionDialog1" TargetID="btnChangePrice" btnOneText="Ok" btnTwoText="Cancel" Title="Change Shipment Price">
                            <MessageTemplate>
                                <asp:Table ID="Table1" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblContDesc" runat="server" Text="Content Description:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ColumnSpan="2">
                                            <asp:TextBox ID="txtContDesc" runat="server" TextMode="MultiLine" MaxLength="175" Height="40px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqTxtContDesc" runat="server" ControlToValidate="txtContDesc"></asp:RequiredFieldValidator>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblDecVal" runat="server" Text="Total Declared value (Php):"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ColumnSpan="2">
                                            <asp:TextBox ID="txtDecVal" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqTxtDecVal" ControlToValidate="txtDecVal" runat="server"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regTxtDecVal" ControlToValidate="txtDecVal" ValidationExpression="[1-9]\d{2,11}" runat="server"></asp:RegularExpressionValidator>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblWeight" runat="server" Text="Total Weight (kg):"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqTxtWeight" ControlToValidate="txtWeight" runat="server"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regTxtWeight" ControlToValidate="txtWeight" ValidationExpression="(([1-5]\d)|([6][0-8])|[1-9])([.]\d{1,4})?|0[.]\d{1,4}" runat="server"></asp:RegularExpressionValidator>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblServiceApplied" runat="server" Text="Service Type:&nbsp;" SkinID="ForceLeft"></asp:Label>
                                            <asp:Label ID="lblServiceName" ForeColor="#1279c0" runat="server" Text="Bulilit" SkinID="ForceLeft"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label19" runat="server" Text="Freight Charge (Php):"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell ColumnSpan="2">
                                            <asp:TextBox ID="txtFreightCharge" ForeColor="#989898" runat="server"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </MessageTemplate>
                        </ctr:OptionDialog>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel12" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>Reports</HeaderTemplate>
                    <ContentTemplate>
                        <ctr:Report ID="GCOAReport" runat="server" />
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
