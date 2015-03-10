<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactInformation.ascx.cs" Inherits="ContactInformation" %>
<%@ Register TagPrefix="atv" Namespace="AdamTibi.Web.UI.Validators" Assembly="AdamTibi.Web.UI.Validators" %>
<asp:Table ID="tblContactInfo" runat="server">
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="Label7" runat="server" Text="E-mail:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="60"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqTxtEmailAddress" runat="server" SkinID="ask" ControlToValidate="txtEmailAddress"></asp:RequiredFieldValidator>
            <asp:TextBoxWatermarkExtender ID="wtrTxtEmailAddress" WatermarkText=" opts@domain.com" TargetControlID="txtEmailAddress" runat="server"></asp:TextBoxWatermarkExtender>
            <br/>
            <%--<asp:MaskedEditValidator ID="mskTxtEmailAddress" ValidationExpression="([a-zA-Z0-9_\-\.]+)@(([0-9]{1,3}\.){3}|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})" ControlToValidate="txtEmailAddress" runat="server"></asp:MaskedEditValidator>--%>
            <asp:RegularExpressionValidator ID="regTxtEmailAddress" runat="server" ControlToValidate="txtEmailAddress" ValidationExpression="([a-zA-Z0-9_\-\.]+)@(([0-9]{1,3}\.){3}|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})"></asp:RegularExpressionValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblTel" runat="server" Text="Telephone #:"></asp:Label>
            
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox MaxLength="15" ID="txtTelNum" runat="server"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" WatermarkText=" xxx-xxxx" TargetControlID="txtTelNum" runat="server"></asp:TextBoxWatermarkExtender>
            <br/>
            <%--<asp:MaskedEditValidator ID="mskTxtTelNum" ValidationExpression="((([0]?([3-9]\d|))|(0?2)|(9\d\d)|(\d?\d{4}))-)?(\d{3})-\d{4}" ControlToValidate="txtTelNum" runat="server"></asp:MaskedEditValidator>--%>
            <asp:RegularExpressionValidator ID="regTxtTelNum" runat="server" ControlToValidate="txtTelNum" ValidationExpression="((([0]?([3-9]\d|))|(0?2)|(9\d\d)|(\d?\d{4}))-)?(\d{3})-\d{4}"></asp:RegularExpressionValidator>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtTelNum" FilterType="Custom, Numbers" ValidChars="-" runat="server"></asp:FilteredTextBoxExtender>
        </asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="Label1" runat="server" Text="Mobile #:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtMobileNum" runat="server" MaxLength="11"></asp:TextBox>
             <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" WatermarkText=" 09XXXXXXXXX" TargetControlID="txtMobileNum" runat="server"></asp:TextBoxWatermarkExtender>
            <br/>
            <asp:RegularExpressionValidator ID="regTxtMobileNum" runat="server" ControlToValidate="txtMobileNum" ValidationExpression="0[98]\d{9}"></asp:RegularExpressionValidator>

            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtMobileNum" FilterType="Numbers" runat="server"></asp:FilteredTextBoxExtender>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<atv:MultipleFieldsValidator ID="mulMobileLand" runat="server" Condition="OR" ControlsToValidate="txtMobileNum,txtTelNum" Text="At least (1) of Telephone Number or Mobile Number is Required." ForeColor="Red"></atv:MultipleFieldsValidator>
<%--<asp:CustomValidator ID="cusTxtTelMobNum" ClientValidationFunction="valTelMob" ControlToValidate="txtTelNum" runat="server">
    <asp:Label ID="lblErrorMes" runat="server" Text="At least (1) of Telephone Number or Mobile Number is Required."></asp:Label>
</asp:CustomValidator>--%>