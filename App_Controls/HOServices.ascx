<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HOServices.ascx.cs" Inherits="App_Controls_HOServices" %>
<%@ Register TagName="OptionDialog" Src="~/App_Controls/OptionDialog.ascx" TagPrefix="ctr" %>
<script type="text/javascript" >
    function ShowEditService() {
        var grid = document.getElementById('<%=gvServices.ClientID %>');
        if (rowIndex !=null) {
            var labels = grid.rows[rowIndex].cells[0].getElementsByClassName("Label");
            var hiddenID = grid.rows[rowIndex].cells[0].getElementsByTagName("input");
            document.getElementById('<%=txtServiceName.ClientID %>').value = labels[0].innerHTML;
            document.getElementById('<%=txtMinWeight.ClientID %>').value = labels[2].innerHTML;
            document.getElementById('<%=txtMaxWeight.ClientID %>').value = labels[3].innerHTML;
            document.getElementById('<%=txtPrice.ClientID %>').value = labels[5].innerHTML;
            document.getElementById('<%=txtServiceDesc.ClientID %>').value = labels[7].innerHTML;
            document.getElementById('<%=hdnJSValue.ClientID %>').value = hiddenID[0].value;
            $find("mpe").show();
        } else {
            alert("Please select a service to edit.");
        }
        return false;
    }

    function ClearFormFields() {
        document.getElementById('<%=txtServiceName.ClientID %>').value = "";
        document.getElementById('<%=txtMinWeight.ClientID %>').value = "";
        document.getElementById('<%=txtMaxWeight.ClientID %>').value = "";
        document.getElementById('<%=txtPrice.ClientID %>').value = "";
        document.getElementById('<%=txtServiceDesc.ClientID %>').value = "";
        document.getElementById('<%=hdnJSValue.ClientID %>').value = "";
    }

    var oldgridSelectedColor;
    function setMouseOverColor(element) {
        oldgridSelectedColor = element.style.backgroundColor;
        element.style.backgroundColor = 'rgba(255,255,255,0.9)';
        element.style.cursor = 'hand';
    }

    function setMouseOutColor(element) {
        element.style.backgroundColor = oldgridSelectedColor;
        element.style.textDecoration = 'none';
    }

    var row = null;
    var rowIndex = null;

    function GetSelectedRow(lnk) {
        row = lnk.parentNode.parentNode;
        rowIndex = row.rowIndex;
        return false;
    }

</script>
<fieldset>
    <legend></legend>
    <table>
        <tr>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td><asp:Button ID="btnRemoveService" SkinID="Button8" runat="server" Text="Remove" UseSubmitBehavior="False" CausesValidation="false" OnClick="btnRemoveService_Click" /></td>
                        <td><asp:Button ID="btnAddService"  SkinID="Button8" runat="server" Text="Add" CausesValidation="false" UseSubmitBehavior="True" OnClientClick="return ClearFormFields()" /></td>
                        <td><asp:Button ID="btnEditService"  SkinID="Button8" runat="server" Text="Edit" CausesValidation="false" OnClientClick="return ShowEditService()" UseSubmitBehavior="True" />
                            <asp:ConfirmButtonExtender ID="conBtnRemoveService" ConfirmText="Do you want to Remove this Service?" TargetControlID="btnRemoveService" runat="server"></asp:ConfirmButtonExtender>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvServices" ShowHeader="false" AutoGenerateColumns="false" runat="server" Style="width: 400px" OnSelectedIndexChanged="gvServices_SelectedIndexChanged"
                    OnRowDataBound="gvServices_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton Font-Bold="true" OnClientClick="return GetSelectedRow(this)" style="text-align:center !important" ID="lnkBtnServiceName" runat="server" CommandName="Select" Text='<%# Eval("Service_Name", "{0} (Select)") %>'></asp:LinkButton>
                                <asp:HiddenField ID="hdnServiceID" Value='<%# Bind("Service_ID") %>' runat="server" />
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="Range weight:&nbsp;" Font-Bold="true"></asp:Label>
                                <asp:Label ID="lblMinWgt" runat="server" Text='<%# Bind("MinWgt") %>'></asp:Label>kg-
                                                    <asp:Label ID="lblMaxWgt" runat="server" Text='<%# Bind("MaxWgt") %>'></asp:Label>kg
                                                    <br />
                                <asp:Label ID="Label8" runat="server" Text="Price:&nbsp;₱" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="Description:" Font-Bold="true"></asp:Label>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblServiceDesc" runat="server" Text='<%# Bind("Service_Desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</fieldset>
<ctr:OptionDialog ID="opdServices" Title="Service" BehaviorID="mpe" btnOneText="Ok" btnTwoText="Cancel" TargetID="btnAddService" runat="server" ValidationGroup="valServices" >
    <MessageTemplate>
        <asp:Table ID="Table13" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblServiceName" runat="server" Text="Service Name:"></asp:Label>
                            <asp:HiddenField ID="hdnJSValue" runat="server" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtServiceName" MaxLength="20" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqServiceName" ValidationGroup="valServices" ControlToValidate="txtServiceName" SkinID="ask" runat="server"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblMinWeight" runat="server" Text="MinWgt(kg):"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMinWeight" MaxLength="7" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtMinWeight" ValidationGroup="valServices" ControlToValidate="txtMinWeight" SkinID="ask" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regTxtMinWeight" ValidationGroup="valServices" runat="server" ValidationExpression="\d{0,7}(.\d{1,4})?" ControlToValidate="txtMinWeight"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblMaxWeight" runat="server" Text="MaxWgt(kg):"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMaxWeight" MaxLength="7" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtMaxWeight" ValidationGroup="valServices" ControlToValidate="txtMaxWeight" SkinID="ask" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regTxtMaxWeight" ValidationGroup="valServices" runat="server" ValidationExpression="\d{0,7}(.\d{1,4})?" ControlToValidate="txtMaxWeight"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPrice" runat="server" Text="Service Price(Php):"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPrice" MaxLength="7" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtPrice" ValidationGroup="valServices" ControlToValidate="txtPrice" SkinID="ask" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regTxtPrice" ValidationGroup="valServices" runat="server" ValidationExpression="\d{0,7}(.\d{1,4})?" ControlToValidate="txtPrice"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblServiceDesc" runat="server" Text="Service Description:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtServiceDesc" TextMode="MultiLine" Height="90px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtServiceDesc" ValidationGroup="valServices" ControlToValidate="txtServiceDesc" runat="server"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
    </MessageTemplate>
</ctr:OptionDialog>
