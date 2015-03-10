<%@ Register Src="~/App_Controls/AddressDetails.ascx" TagName="AddressDetails" TagPrefix="ctr" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PersonalDetails.ascx.cs" Inherits="PersonalDetails" %>
<h5>
    <asp:Label ID="lblShipPersonal" runat="server" Text="Personal Details"></asp:Label></h5>
<asp:Table ID="tblShipPersonal" runat="server">
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="3">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="60"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender WatermarkText=" First Name" ID="wtrTxtFirstName" runat="server" Enabled="True" TargetControlID="txtFirstName">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator ID="reqTxtFirstName" ControlToValidate="txtFirstName" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="regTxtFirstName" ControlToValidate="txtFirstName" ValidationExpression="([A-ZÑ][a-zñ]+)([ ][A-ZÑ][a-zñ]+){0,3}" runat="server"></asp:RegularExpressionValidator>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtFirstName" FilterType="UppercaseLetters,LowercaseLetters" runat="server"></asp:FilteredTextBoxExtender>
                        <%--<asp:DropDownExtender ID="DropDownExtender1" TargetControlID="txtName" runat="server"></asp:DropDownExtender>--%>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="60"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender WatermarkText=" Last Name" ID="txtLastName_TxtWaterMarkEx" runat="server" Enabled="True" TargetControlID="txtLastName">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator ID="reqLastName" ControlToValidate="txtLastName" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="regLastName" ControlToValidate="txtLastName" ValidationExpression="([A-ZÑ][a-zñ]+)([ -][A-ZÑ][a-zñ]+)?" runat="server"></asp:RegularExpressionValidator>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtLastName" FilterType="UppercaseLetters,LowercaseLetters" runat="server"></asp:FilteredTextBoxExtender>
                    </td>
                </tr>
            </table>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<ctr:AddressDetails runat="server" ID="PersonalAddress" />