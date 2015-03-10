<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Report.ascx.cs" Inherits="App_Controls_Report" %>
<%@ Register Src="~/App_Controls/DataView.ascx" TagName="DataView" TagPrefix="ctr" %>
<asp:Table ID="Table9" runat="server" SkinID="TableUnbordered">
    <asp:TableRow ID="TableRow1" runat="server">
        <asp:TableCell runat="server" Width="150px">
            <h5><asp:Label ID="Label1" runat="server" Text="Delivery Reports"></asp:Label></h5>
        </asp:TableCell>
        <asp:TableCell>
            <asp:ComboBox ID="cmbReports" runat="server">
                <asp:ListItem>Parcel Status</asp:ListItem>
                <asp:ListItem>Shipment Status</asp:ListItem>
            </asp:ComboBox>
        </asp:TableCell>
        <asp:TableCell runat="server" HorizontalAlign="Left">
            <asp:Button ID="Button3" runat="server" Text="Produce Report" UseSubmitBehavior="False"  />
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<ctr:dataview id="DataView3" runat="server" searchbutton="Search" searchtitle="" />
<asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/dummy_Report.png" Style="" />

