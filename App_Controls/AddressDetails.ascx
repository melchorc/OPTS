<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddressDetails.ascx.cs" Inherits="AddressDetails" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc2" %>
<%@ Register Assembly="obout_ComboBox" Namespace="Obout.ComboBox" TagPrefix="cc1" %>
<%@ Register TagPrefix="atv" Namespace="AdamTibi.Web.UI.Validators" Assembly="AdamTibi.Web.UI.Validators" %>
<script type="text/javascript">
    function cmbProvinceDetItems(sender, selectedIndex) {
        var value = cmbProvinceDet.options[selectedIndex].value;
        //alert(value);
    }

    function cmbCityDetItems(sender, selectedIndex) {
        try{
            var dval = document.getElementById('<%=cmbCityDet.ClientID %>');
            var val = cmbCityDet.options[selectedIndex].value;
            document.getElementById('<%=hdnLocIDStore.ClientID %>').value = val;
        }catch(Err){}
        //
        //Auto Select Province
        try{
            var combo = document.getElementById('<%=cmbCityDet.ClientID %>_ob_CbocmbCityDetItemsContainer');
            var combolist = combo.getElementsByTagName('li');
            var selectedZip = combolist[selectedIndex].getAttribute('z');
            document.getElementById('<%=txtZipCodeDet.ClientID %>').value = selectedZip;
            var selectedValue = combolist[selectedIndex].getAttribute('p');
            cmbProvinceDet.value(selectedValue);
        } catch (Err) { }
        //DisplayProvince(selectedValue);
        //alert(selectedValue);
        
    }

    //function ZipCodeOnChange(sender, newText) {
        
    //}
</script>
<asp:Table ID="tblAddress" runat="server" SkinID="Unbordered">
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblHouseNum" runat="server" Text="House No.:*"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtHouseNum" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqTxtHouseNum" ControlToValidate="txtHouseNum" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="regTxtHouseNum" ValidationExpression="#?(\d?){3}[1-9]" ControlToValidate="txtHouseNum" runat="server"></asp:RegularExpressionValidator>
        </asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="lblStreetPurok" runat="server" Text="Street/Purok/Sitio:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtStreetPurok" runat="server"></asp:TextBox>
            <%--<asp:TextBoxWatermarkExtender WatermarkText=" Accurate Address Please " ID="txtWaterMark" runat="server" Enabled="True" TargetControlID="txtLocalAddress" />--%>
            <%--<asp:RequiredFieldValidator ID="reqStreetPurok" ControlToValidate="txtStreetPurok" runat="server" SkinID="ask"></asp:RequiredFieldValidator>--%>
            <br />
            <asp:RegularExpressionValidator ID="regStreetPurok" ControlToValidate="txtStreetPurok" ValidationExpression="(([A-ZÑ][.][ ])?([A-ZÑ][A-ZÑa-zñ]{1,29}).?( ?[1-9]\d{0,3})? ?){1,4}" runat="server"></asp:RegularExpressionValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblBarangay" runat="server" Text="Barangay:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="txtBarangay" runat="server"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="reqTxtBarangay" ControlToValidate="txtBarangay" runat="server" SkinID="ask"></asp:RequiredFieldValidator>--%>
            <br />
            <asp:RegularExpressionValidator ID="regTxtBarangay" ControlToValidate="txtBarangay" ValidationExpression="(([A-ZÑ][.][ ])?([A-ZÑ][A-ZÑa-zñ]{1,29}).?( ?[1-9]\d{0,3})? ?){1,3}" runat="server"></asp:RegularExpressionValidator>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <atv:MultipleFieldsValidator ID="mulSPSnBar" runat="server" Condition="OR" ControlsToValidate="txtStreetPurok,txtBarangay" Text="At least (1) of Barangay or Street/Purok/Sitio is Required." ForeColor="Red"></atv:MultipleFieldsValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblCityDet" runat="server" Text="Municipality/City:*"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <%--<asp:TextBox ID="txtCityDet" runat="server"></asp:TextBox>--%>
            <cc1:ComboBox ID="cmbCityDet" 
                runat="server" 
                EnableLoadOnDemand="true"
                AllowEdit="true"
                SelectionMode="Single"
                OnLoadingItems="cmbCityDet_LoadingItems" 
                DataTextField = "Loc_Desc"
                DataValueField = "Loc_Province"
                Height="150px">
                <ClientSideEvents OnSelectedIndexChanged="cmbCityDetItems"/>
            </cc1:ComboBox>
            <asp:RequiredFieldValidator ID="reqTxtCityDet" ControlToValidate="cmbCityDet" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
            <%--<br />--%>
            <%--<asp:RegularExpressionValidator ID="regTxtCityDet" ControlToValidate="cmbCityDet" ValidationExpression="([A-ZÑ][a-zñ]+).?( [A-ZÑ][a-zñ]+){0,2}" runat="server"></asp:RegularExpressionValidator>--%>
        </asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="lblZipCodeDet" runat="server" Text="Zip Code:*"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <%--<cc2:OboutTextBox ID="txtZipCodeDet" runat="server">
                <ClientSideEvents OnTextChanged="ZipCodeOnChange"/>
            </cc2:OboutTextBox>--%>
            <asp:TextBox MaxLength="4" ID="txtZipCodeDet" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqZipCodeDet" ControlToValidate="txtZipCodeDet" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtZipCodeDet" FilterType="Numbers" runat="server"></asp:FilteredTextBoxExtender>
            <br />
            <asp:RegularExpressionValidator ID="regZipCodeDet" ControlToValidate="txtZipCodeDet" ValidationExpression="(0[7-9]\d\d)|([1-8]\d{3})|(9[0-8]\d\d)" runat="server"></asp:RegularExpressionValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="lblProvinceDet" runat="server" Text="Province:*"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <cc1:ComboBox ID="cmbProvinceDet" 
                runat="server"
                EnableLoadOnDemand="true">
                <ClientSideEvents OnSelectedIndexChanged="cmbProvinceDetItems" />
            </cc1:ComboBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<asp:HiddenField ID="hdnLocIDStore" Value="" runat="server" />
