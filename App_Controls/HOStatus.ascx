<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HOStatus.ascx.cs" Inherits="App_Controls_HOStatus" %>
<asp:Table ID="tblPS" runat="server">
    <asp:TableRow>
        <asp:TableCell VerticalAlign="Top">
            <fieldset>
                <legend>Parcel Status</legend>
                <asp:GridView ID="gvParcelStatus" runat="server"
                    Width="200px" AutoGenerateColumns="False"
                    OnRowEditing="gvParcelStatus_RowEditing"
                    OnRowCancelingEdit="gvParcelStatus_RowCancelingEdit"
                    OnSelectedIndexChanging="gvParcelStatus_SelectedIndexChanging"
                    OnPageIndexChanging="gvParcelStatus_PageIndexChanging"
                    ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Button ID="btnParcelStatus" ValidationGroup="valAddParcelStatus" CommandName="Select" runat="server" SkinID="Button8" Text="Add" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnEditParcel" CausesValidation="false" runat="server" CommandName="Edit" Text="Edit" /></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnDeleteParcel" CausesValidation="false" runat="server" CommandName="Delete" Text="Delete" />
                                                        <asp:ConfirmButtonExtender ID="conDeleteLoc" ConfirmText="Are you sure you want to Delete this Item?" TargetControlID="btnDeleteParcel" runat="server"></asp:ConfirmButtonExtender>
                                                    </td>
                                                </tr>
                                            </table>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <table>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnCancelParcel" CausesValidation="false" runat="server" CommandName="Cancel" Text="Cancel" /></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnUpdateParcel" CausesValidation="true" ValidationGroup="valEditParcelStatus" runat="server" CommandName="Update" Text="Update" /></td>
                                                        
                                                </tr>
                                            </table>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:TextBox ID="txtAddParcelStatus" ValidationGroup="valAddParcelStatus" runat="server" SkinID="Free" Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtAddParcelStatus" SkinID="White" ValidationGroup="valAddParcelStatus" ControlToValidate="txtAddParcelStatus" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regtxtAddParcelStatus" SkinID="White" runat="server" ValidationGroup="valAddParcelStatus" ControlToValidate="txtAddParcelStatus" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})"></asp:RegularExpressionValidator>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblParcelDesc" SkinID="ForceLeft" runat="server" Text='<%# Bind("ParcelStatus_Desc") %>'></asp:Label>
                                <asp:Label ID="lblParcelID" runat="server" Text='<%# Bind("ParcelStatus_ID") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ValidationGroup="valEditParcelStatus" ID="reqTxtEditMC" ControlToValidate="txtEditParcel" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="valEditParcelStatus" ID="regTxtEditMC" ControlToValidate="txtEditParcel" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})" runat="server"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtEditParcel" Style="width: 100px !important" ValidationGroup="valEditParcelStatus" Text='<%# Bind("ParcelStatus_Desc") %>' runat="server"></asp:TextBox>
                                <asp:Label ID="lblParcelID" runat="server" Text='<%# Bind("ParcelStatus_ID") %>' Visible="false"></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </fieldset>
        </asp:TableCell>
        <asp:TableCell VerticalAlign="Top">
                                               <fieldset>
                                                   <legend>Shipment Status</legend>
                                               
            <asp:GridView ID="gvShipmentStatus" runat="server"
                    Width="200px" AutoGenerateColumns="False"
                    OnRowEditing="gvShipmentStatus_RowEditing"
                    OnRowCancelingEdit="gvShipmentStatus_RowCancelingEdit"
                    OnSelectedIndexChanging="gvShipmentStatus_SelectedIndexChanging"
                    OnPageIndexChanging="gvShipmentStatus_PageIndexChanging"
                    ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Button ID="btnShipmentStatus" ValidationGroup="valAddShipmentStatus" CommandName="Select" runat="server" SkinID="Button8" Text="Add" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnEditShipment" CausesValidation="false" runat="server" CommandName="Edit" Text="Edit" /></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnDeleteShipment" CausesValidation="false" runat="server" CommandName="Delete" Text="Delete" />
                                                        <asp:ConfirmButtonExtender ID="conDeleteLoc" ConfirmText="Are you sure you want to Delete this Item?" TargetControlID="btnDeleteShipment" runat="server"></asp:ConfirmButtonExtender>
                                                    </td>
                                                </tr>
                                            </table>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <table>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnCancelShipment" CausesValidation="false" runat="server" CommandName="Cancel" Text="Cancel" /></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnUpdateShipment" CausesValidation="true" ValidationGroup="valEditShipmentStatus" runat="server" CommandName="Update" Text="Update" /></td>
                                                        
                                                </tr>
                                            </table>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:TextBox ID="txtAddShipmentStatus" ValidationGroup="valAddShipmentStatus" runat="server" SkinID="Free" Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtxtAddShipmentStatus" SkinID="White" ValidationGroup="valAddShipmentStatus" ControlToValidate="txtAddShipmentStatus" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regtxtAddShipmentStatus" SkinID="White" runat="server" ValidationGroup="valAddShipmentStatus" ControlToValidate="txtAddShipmentStatus" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})"></asp:RegularExpressionValidator>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblShipmentDesc" runat="server" SkinID="ForceLeft" Text='<%# Bind("ShipmentStatus_Desc") %>'></asp:Label>
                                <asp:Label ID="lblShipmentID" runat="server" Text='<%# Bind("ShipmentStatus_ID") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ValidationGroup="valEditShipmentStatus" ID="reqTxtEditMC" ControlToValidate="txtEditShipment" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="valEditShipmentStatus" ID="regTxtEditMC" ControlToValidate="txtEditShipment" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})" runat="server"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtEditShipment" Style="width: 100px !important" ValidationGroup="valEditShipmentStatus" Text='<%# Bind("ShipmentStatus_Desc") %>' runat="server"></asp:TextBox>
                                <asp:Label ID="lblShipmentID" runat="server" Text='<%# Bind("ShipmentStatus_ID") %>' Visible="false"></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </fieldset>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
