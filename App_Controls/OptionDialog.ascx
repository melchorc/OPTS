<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OptionDialog.ascx.cs" Inherits="OptionDialog" %>
<asp:Panel ID="pnlForm" runat="server" CssClass="modalDialog">
<asp:Panel ID="pnlTitleBar" runat="server" CssClass="modTitle">
    <h5 style="padding:5px 30px 5px 30px"><asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h5>
</asp:Panel>
    <table runat="server" ID="tblForm" style="margin: 10px 30px 5px 30px">
        <tr>
            <td style="padding:15px 0px 30px 0px" colspan="2">
                <asp:PlaceHolder ID="phldrMessage" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td class="btn1Container">
                <asp:Button ID="btn1" runat="server" Text="" OnClick="btn1_Click" /></td>
            <td class="btn2Container" align="right">
                <asp:Button ID="btn2" runat="server" Text="" /></td>
        </tr>
    </table>
</asp:Panel>
<asp:ModalPopupExtender ID="modExtender" runat="server" PopupControlID="pnlForm" CancelControlID="btn2" 
    PopupDragHandleControlID="pnlTitleBar">
</asp:ModalPopupExtender>
