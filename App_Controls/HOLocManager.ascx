<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HOLocManager.ascx.cs" Inherits="App_Controls_HOLocManager" %>
<asp:Table ID="Table16" runat="server">
    <asp:TableRow HorizontalAlign="Left">
        <asp:TableCell VerticalAlign="Top">
            <fieldset>
                <legend>&nbsp;
                                                        <asp:Label ID="lblLegendProvince" runat="server" Text="Provinces"></asp:Label>
                </legend>
                <asp:GridView ID="gvProvinces" runat="server" Width="200px" AutoGenerateColumns="False"
                    OnRowEditing="gvProvinces_RowEditing"
                    OnRowCancelingEdit="gvProvinces_RowCancelingEdit"
                    OnSelectedIndexChanging="gvProvinces_SelectedIndexChanging"
                    OnSelectedIndexChanged="gvProvinces_SelectedIndexChanged"
                    OnPageIndexChanging="gvProvinces_PageIndexChanging"
                    OnRowUpdating="gvProvinces_RowUpdating"
                    OnRowDeleting="gvProvinces_RowDeleting"
                    ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnProvince" ValidationGroup="valAddProvince" CommandName="Add" runat="server" SkinID="Button8" Text="Add" OnClick="btnProvince_Click" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAddProvince" ValidationGroup="valAddProvince" runat="server" SkinID="Free" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <asp:RequiredFieldValidator ID="reqTxtAddProvince" SkinID="White" ValidationGroup="valAddProvince" ControlToValidate="txtAddProvince" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regTxtAddProvince" SkinID="White" runat="server" ValidationGroup="valAddProvince" ControlToValidate="txtAddProvince" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})"></asp:RegularExpressionValidator>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Panel CssClass="popupMenu" ID="PopupMenu" runat="server">
                                    <div style="border: 1px outset white; padding: 2px;">
                                        <div>
                                            <asp:LinkButton ID="btnEditProvince" CausesValidation="false" runat="server" CommandName="Edit" Text="Edit" />
                                        </div>
                                        <div>
                                            <asp:LinkButton ID="btnDeleteProvince" CausesValidation="false" runat="server" CommandName="Delete" Text="Delete" />
                                            <asp:ConfirmButtonExtender ID="conDeleteProvince" TargetControlID="btnDeleteProvince" ConfirmText="Are you sure you want to remove this Province." runat="server"></asp:ConfirmButtonExtender>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlProvinceDesc" runat="server">
                                    <asp:Label ID="lblProvinceID" runat="server" Text='<%# Bind("Province_ID") %>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="lnkProvinceDesc" SkinID="ForceLeft" CausesValidation="false" runat="server" CommandName="Select" Text='<%# Bind("Province_Desc") %>' />
                                </asp:Panel>
                                <asp:HoverMenuExtender ID="hme2" runat="Server"
                                    HoverCssClass="popupHover"
                                    PopupControlID="PopupMenu"
                                    PopupPosition="Left"
                                    TargetControlID="pnlProvinceDesc"
                                    PopDelay="25" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Panel ID="Panel9" runat="server" Width="80%">
                                    <asp:Label ID="lblProvinceID" runat="server" Text='<%# Bind("Province_ID") %>' Visible="false"></asp:Label>
                                    <asp:TextBox ID="txtProvince" SkinID="Free" Style="width: 100%;" ValidationGroup="valProvinces" Text='<%# Bind("Province_Desc") %>' runat="server"></asp:TextBox>
                                </asp:Panel>
                                <asp:HoverMenuExtender ID="hme1" runat="Server"
                                    TargetControlID="Panel9"
                                    PopupControlID="PopupMenu"
                                    HoverCssClass="popupHover"
                                    PopupPosition="Right" />
                                <asp:Panel ID="PopupMenu" runat="server" CssClass="popupMenu" Width="80">
                                    <div style="border: 1px outset white">
                                        <asp:LinkButton ID="LinkButton2" runat="server"
                                            CausesValidation="False" ValidationGroup="valProvinces" CommandName="Cancel" SkinID="ForceLeft" Text="Cancel" />
                                        <br />
                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                            CausesValidation="True" ValidationGroup="valProvinces" CommandName="Update" SkinID="ForceLeft" Text="Update" />
                                    </div>
                                </asp:Panel>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="lblPrMessage" runat="server" SkinID="ForceLeft" Text="Populate provinces on this Section"></asp:Label>
                        <asp:LinkButton ID="lnkAddProvince" runat="server">Add New</asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:GridView>
            </fieldset>
        </asp:TableCell>
        <asp:TableCell VerticalAlign="Top">
            <fieldset>
                <legend>&nbsp;
                                                        <asp:Label ID="lblLocation" runat="server" Text="Municipality/City"></asp:Label>
                </legend>
                <table>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="gvMCnZip" AutoGenerateColumns="false" runat="server" Style="width: 225px"
                                OnSelectedIndexChanging="gvMCnZip_SelectedIndexChanging"
                                OnRowDeleting="gvMCnZip_RowDeleting"
                                OnRowEditing="gvMCnZip_RowEditing"
                                OnPageIndexChanging="gvMCnZip_PageIndexChanging"
                                OnRowUpdating="gvMCnZip_RowUpdating"
                                OnRowCancelingEdit="gvMCnZip_RowCancelingEdit"
                                ShowHeaderWhenEmpty="true">
                                <EmptyDataTemplate>
                                    <asp:Label ID="lblLocMessage" runat="server" SkinID="ForceLeft" Text="Populate locations on this Section"></asp:Label>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Button ID="btnAddLocations" SkinID="Button8" runat="server" Text="Add" CommandName="Select" ValidationGroup="valLocations" CausesValidation="true" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnEditLoc" CausesValidation="false" runat="server" CommandName="Edit" Text="Edit" /></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnDeleteLoc" CausesValidation="false" runat="server" CommandName="Delete" Text="Delete" />
                                                        <asp:ConfirmButtonExtender ID="conDeleteLoc" ConfirmText="Are you sure you want to Delete this Item?" TargetControlID="btnDeleteLoc" runat="server"></asp:ConfirmButtonExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnCancelLoc" CausesValidation="false" runat="server" CommandName="Cancel" Text="Cancel" /></td>
                                                    <td><asp:LinkButton ID="btnUpdateLoc" CausesValidation="true" ValidationGroup="valEditLocation" runat="server" CommandName="Update" Text="Update" /></td>
                                                </tr>
                                            </table>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Font-Size="Small" SkinID="ForceLeft" Text="Zip Code"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Font-Size="Small" SkinID="ForceLeft" Text="Municipality/City"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtZipCode" SkinID="Free" Width="100px" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ValidationGroup="valLocations" ID="reqTxtZipCode" ControlToValidate="txtZipCode" SkinID="White" runat="server"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ValidationGroup="valLocations" ID="regTxtZipCode" ControlToValidate="txtZipCode" SkinID="White" ValidationExpression="(0[7-9]\d\d)|([1-8]\d{3})|(9[0-8]\d\d)" runat="server"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtMunicipalityCity" SkinID="Free" Width="100px" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ValidationGroup="valLocations" ID="reqTxtMunicipalityCity" ControlToValidate="txtMunicipalityCity" SkinID="White" runat="server"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ValidationGroup="valLocations" ID="regTxtMunicipalityCity" ControlToValidate="txtMunicipalityCity" SkinID="White" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})" runat="server"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblZipCode" runat="server" Text='<%# Bind("Loc_ZipCode") %>' SkinID="ForceLeft"></asp:Label>
                                            <asp:Label ID="lblMC" runat="server" Text='<%# Bind("Loc_Desc") %>'></asp:Label>
                                            <asp:Label ID="lblProvince" runat="server" Text='<%# Bind("Loc_Province") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblLocID" runat="server" Text='<%# Bind("Loc_ID") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RequiredFieldValidator ValidationGroup="valEditLocation" ID="reqTxtEditZC" ControlToValidate="txtEditZC" runat="server"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ValidationGroup="valEditLocation" ID="regTxtEditZC" ControlToValidate="txtEditZC" ValidationExpression="(0[7-9]\d\d)|([1-8]\d{3})|(9[0-8]\d\d)" runat="server"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txtEditZC" Style="width: 100px !important" ValidationGroup="valEditLocation" Text='<%# Bind("Loc_ZipCode") %>' runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ValidationGroup="valEditLocation" ID="reqTxtEditMC" ControlToValidate="txtEditMC" runat="server"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ValidationGroup="valEditLocation" ID="regTxtEditMC" ControlToValidate="txtEditMC" ValidationExpression="([A-ZÑ][a-zñ]+).?(([ ]?[A-ZÑ]([a-zñ])+){0,2})" runat="server"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txtEditMC" Style="width: 100px !important" ValidationGroup="valEditLocation" Text='<%# Bind("Loc_Desc") %>' runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="lblProvince" runat="server" Text='<%# Bind("Loc_Province") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblLocID" runat="server" Text='<%# Bind("Loc_ID") %>' Visible="false"></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr></tr>
                </table>
            </fieldset>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
