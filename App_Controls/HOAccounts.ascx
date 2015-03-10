<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HOAccounts.ascx.cs" Inherits="App_Controls_HOAccounts" %>
<%@ Register Assembly="obout_ComboBox" Namespace="Obout.ComboBox" TagPrefix="cc1" %>
<%@ Register TagName="ContactInformation" Src="~/App_Controls/ContactInformation.ascx" TagPrefix="ctr" %>
<%@ Register TagName="AddressDetails" Src="~/App_Controls/AddressDetails.ascx" TagPrefix="ctr" %>
<%@ Register TagName="PersonalDetails" Src="~/App_Controls/PersonalDetails.ascx" TagPrefix="ctr" %>
<script type="text/javascript">
    function AddEventOnCMBox(sender, selectedIndex) {
        alert("Testing Appearance men!");
        try {
            var dval = document.getElementById('<%=cmbUserType.ClientID %>');
            var val = cmbUserType.options[selectedIndex].value;
             document.getElementById('<%=hdnUserTypeValue.ClientID %>').value = val;
        } catch (Err) { }
    }
</script>
<asp:MultiView ID="muvAccountView" runat="server">
    <asp:View ID="viewHeadOperation" runat="server">
        <h5>
            <asp:Label ID="lblAccountsTitle" runat="server" Text="User Accounts"></asp:Label></h5>
        <hr />
        <asp:Label ID="lblMngAcc" runat="server" Text="Manage Accounts:" Font-Size="Medium"></asp:Label>
        <asp:RadioButton ID="rbtnEmployees" Text="Employees" CausesValidation="false" runat="server" AutoPostBack="true" OnCheckedChanged="rbtn_EmpCheckedChanged" GroupName="Account" Font-Size="Medium" />
        <asp:RadioButton ID="rbtnClients" Text="Clients" CausesValidation="false" runat="server" AutoPostBack="true" OnCheckedChanged="rbtn_ClientCheckedChanged" GroupName="Account" Font-Size="Medium" />
        <asp:Table ID="tblDataView" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblSearch" runat="server" Text="UserName or ID:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" SkinID="Button8" Height="22px" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:GridView ID="gvDataGrid" runat="server" AutoGenerateColumns="False" EmptyDataText="No Data" ShowHeaderWhenEmpty="True" AutoGenerateSelectButton="True">
            <EmptyDataTemplate></EmptyDataTemplate>
                <Columns>
                    <asp:BoundField NullDisplayText="NO Data" DataField="User_Name" InsertVisible="False" ReadOnly="True" HeaderText="User Name" />
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_LName") %>'></asp:Label>
                            ,<asp:Label ID="Label4" runat="server" Text='<%# Bind("User_FName") %>'></asp:Label>
                            <%--<asp:Label ID="Label6" runat="server" Visible="false" Text='<%# Bind("User_HouseNo") %>'></asp:Label>
                            <asp:Label ID="Label7" runat="server" Visible="false" Text='<%# Bind("User_SPS") %>'></asp:Label>
                            <asp:Label ID="Label8" runat="server" Visible="false" Text='<%# Bind("User_Loc") %>'></asp:Label>--%>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="User_Email" HeaderText="Email" NullDisplayText="NO EMAIL!" />
                    <asp:BoundField DataField="User_Mobile" HeaderText="Mobile No." NullDisplayText="n/a" />
                    <asp:BoundField DataField="User_Landline" HeaderText="Telephone" NullDisplayText="n/a" />
                    <asp:TemplateField HeaderText="AccessLevel">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("AccessLevel_Desc") %>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Visible="false" Text='<%# Bind("User_AccessLevel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
        <asp:Table ID="Table11" runat="server">
            <asp:TableRow ID="TableRow2" runat="server">
                <asp:TableCell ID="TableCell1" runat="server">
                    <asp:Button ID="btnAddEmployee" runat="server" Text="Add" CausesValidation="false" UseSubmitBehavior="False" OnClick="btnAddEmployee_Click" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnEditEmployee" runat="server" Text="Edit" CausesValidation="false" UseSubmitBehavior="False" OnClick="btnEditEmployee_Click" />
                </asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server">
                    <asp:Button ID="btnRemoveEmployee" OnClick="btnRemoveEmployee_Click" runat="server" Text="Remove" CausesValidation="false" UseSubmitBehavior="False" />
                    <asp:ConfirmButtonExtender ID="conBtnRemoveEmp" TargetControlID="btnRemoveEmployee" ConfirmText="Are you sure you want to remove this User?"  runat="server"></asp:ConfirmButtonExtender>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:View>
    <asp:View ID="viewAddEmployee" runat="server">
        <div style="padding: 0 50px 0 50px">
            <%--<asp:GridView ID="gvView" runat="server"></asp:GridView>--%>
            <h5>
                <asp:Label ID="Label3" runat="server" Text="Account Management"></asp:Label></h5>
            <ctr:PersonalDetails runat="server" ID="perAccounts" ValidationGroup="valAccount" />
            <table style="margin-left: 100px">
                <tr>
                    <td>
                        <asp:Label ID="lblUserType" runat="server" Text="User Type:"></asp:Label>
                    </td>
                    <td>
                        <cc1:ComboBox ID="cmbUserType" runat="server">
                            <ClientSideEvents OnSelectedIndexChanged="AddEventOnCMBox"/>
                            <ItemTemplate>
<%--                            <cc1:ComboBoxItem  Value="34294" Text="Courier Representative"></cc1:ComboBoxItem>
                            <cc1:ComboBoxItem  Value="7033" Text ="Global Client Office Agent"></cc1:ComboBoxItem>
                            <cc1:ComboBoxItem  Value="721234" Text="Senior Support Operations Specialist"></cc1:ComboBoxItem>
                            <cc1:ComboBoxItem  Value="409312" Text="District Supervisor"></cc1:ComboBoxItem>
                            <cc1:ComboBoxItem  Value="32120" Text="Logistics Assistant"></cc1:ComboBoxItem>
                            <cc1:ComboBoxItem  Value="9821011" Text="Head of Operations"></cc1:ComboBoxItem>--%>
                                </ItemTemplate>
                        </cc1:ComboBox>
                        <%--<asp:ComboBox ID="cmbUserType" runat="server">
                            <asp:ListItem Value="34294" Text="Courier Representative"></asp:ListItem>
                            <asp:ListItem Value="7033" Text ="Global Client Office Agent"></asp:ListItem>
                            <asp:ListItem Value="721234" Text="Senior Support Operations Specialist"></asp:ListItem>
                            <asp:ListItem Value="409312" Text="District Supervisor"></asp:ListItem>
                            <asp:ListItem Value="32120" Text="Logistics Assistant"></asp:ListItem>
                            <asp:ListItem Value="9821011" Text="Head of Operations"></asp:ListItem>
                        </asp:ComboBox>--%>
                        <asp:HiddenField ID="hdnUserTypeValue" Value="1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUserName" runat="server" Text="User Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" ValidationGroup="valAccount" MaxLength="17" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="valAccount" ID="reqTxtUserName" SkinID="ask" ControlToValidate="txtUserName" runat="server"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="valAccount" ID="regTxtUserName" ControlToValidate="txtUserName" ValidationExpression="[a-z]{4,15}(\d){0,3}" runat="server"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <h5>
                <asp:Label ID="Label1" runat="server" Text="Contact Information"></asp:Label>
            </h5>
            <ctr:ContactInformation runat="server" ID="EmpContactInfo" ValidationGroup="valAccount" />
            <asp:Table runat="server" ID="tblBtnsEmployee">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" ValidationGroup="valAccount" OnClick="btnAddOrEdit_Click" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Right">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </asp:View>
</asp:MultiView>