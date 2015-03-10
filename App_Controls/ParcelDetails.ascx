<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ParcelDetails.ascx.cs" Inherits="ParcelDetails" %>
<h5>
    <asp:Label ID="Label1" runat="server" Text="Details about your Parcel"></asp:Label></h5>
<asp:Table ID="Table5" runat="server">
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
<asp:Table ID="Table2" runat="server">
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Left">
            <asp:Button ID="btnBck" runat="server" Text="Back" OnClick="btnBck_Click" UseSubmitBehavior="false" CausesValidation="false" />
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
            <asp:Button ID="btnNxt" runat="server" Text="Next" OnClick="btnNxt_Click" UseSubmitBehavior="false" />
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
