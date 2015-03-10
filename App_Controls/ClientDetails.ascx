<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClientDetails.ascx.cs" Inherits="ClientDetails" %>
<%@ Register TagPrefix="ctr" TagName="PersonalDetails" Src="~/App_Controls/PersonalDetails.ascx"%>
<%@ Register TagPrefix="ctr" TagName="ContactInformation" Src="~/App_Controls/ContactInformation.ascx"%>
<ctr:PersonalDetails ID="ClientPersonalDetails" runat="server"/>
<h5><asp:Label ID="lblContactInfo" runat="server" Text="Contact Information"></asp:Label></h5>
<ctr:ContactInformation ID="ClientContactInfo" runat="server"></ctr:ContactInformation>
<asp:Table ID="Table11" runat="server">
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Left">
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" UseSubmitBehavior="false" CausesValidation="false" />
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right">
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" UseSubmitBehavior="false" CausesValidation="true"  />
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>