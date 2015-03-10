<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Payment_Registration.ascx.cs" Inherits="Payment_Registration" %>
<%@ Register TagPrefix="ctr" TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" %>
<%@ Register TagPrefix="ctr" TagName="Captcha" Src="~/App_Controls/Captcha.ascx" %>
<h5>
    <asp:Label ID="Label2" runat="server" Text="Payment"></asp:Label></h5>
<asp:Table ID="Table6" runat="server">
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblPayment" runat="server" Text="Payment Type:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:ComboBox ID="cmbPaymentType" runat="server" MaxLength="0">
                <asp:ListItem>Dragon Play</asp:ListItem>
                <asp:ListItem>PayPal</asp:ListItem>
            </asp:ComboBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="Label22" runat="server" Text="Card Number:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtCardNumber" runat="server"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="Label23" runat="server" Text="Expiration Date:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtExpirationDate" runat="server"></asp:TextBox>
            <asp:Panel ID="pnlCalendar" runat="server">
                <asp:Calendar ID="calExpirationDate" runat="server" OnSelectionChanged="calExpirationDate_SelectionChanged"></asp:Calendar>
            </asp:Panel>
            <asp:PopupControlExtender ID="popTxtExpiration" TargetControlID="txtExpirationDate" PopupControlID="pnlCalendar" runat="server"></asp:PopupControlExtender>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="Label24" runat="server" Text="Card Security Code:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtCSC" runat="server"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<h5>
    <asp:Label ID="Label9" runat="server" Text="Verification"></asp:Label></h5>
<asp:Table ID="Table3" runat="server">
    <asp:TableRow>
        <asp:TableCell>
            <ctr:Captcha runat="server" ID="capPayment" BackgroundColor="#1279c0" ForgroundColor="#ffffff"/>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<asp:Table ID="Table7" runat="server">
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Left">
            <asp:Button ID="btnBackPayment" runat="server" Text="Back" OnClick="btnBack_Click" UseSubmitBehavior="False" CausesValidation="false" />
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Center">
            <asp:Button ID="btnCancelPayment" runat="server" Text="Cancel" CausesValidation="false" UseSubmitBehavior="true" OnClientClick="return false;"/>
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
            <asp:Button ID="btnSubmitPayment" runat="server" Text="Submit"  UseSubmitBehavior="true" OnClick="btnSubmitPayment_Click"/>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<ctr:OptionDialog ID="dlgCancel" runat="server" Title="Cancel Booking" 
    btnOneText="Yes" btnTwoText="No" TargetID="btnCancelPayment" OnLoad="dlgCancel_Load">
    <MessageTemplate>
        <asp:Label runat="server">Do you want to cancel booking?</asp:Label>
    </MessageTemplate>
</ctr:OptionDialog>
<asp:HiddenField ID="hdnField" runat="server" />
<ctr:OptionDialog ID="dlgSubmit" runat="server" Title="Booking Successful" 
    btnOneText="Ok" btn2Eye="false" TargetID="hdnField" OnLoad="dlgSubmit_Load">
    <MessageTemplate>
        <asp:Label ID="Label1" runat="server">Your Tracking Number</asp:Label>
        <h1><asp:Label ID="Label3" runat="server" Text="1234-5678-9012"></asp:Label></h1>
    </MessageTemplate>
</ctr:OptionDialog>


