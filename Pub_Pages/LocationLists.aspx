<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/PublicSite.master" %>

<script runat="server">
    protected void Page_PreInit(object sender, EventArgs e)
    {
        UserAccountMgm.Check(this);
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="M" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        <asp:Label ID="Label8" runat="server" Text="Location Lists/Branches"></asp:Label></h1>
    <h2>
        <asp:Label ID="Label2" runat="server" Text="Cordillera Administrative Region"></asp:Label></h2>
    <table>
        <tr>
            <%--            <td><asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label></td>
                <td><asp:TextBox ID="txtLocationField" runat="server"></asp:TextBox></td>--%>
            <td>
                <asp:Label ID="lblProvince" runat="server" Text="Province:"></asp:Label></td>
            <td>
                <asp:ComboBox ID="cmbProvince" runat="server">
                    <asp:ListItem>Abra</asp:ListItem>
                    <asp:ListItem>Apayao</asp:ListItem>
                    <asp:ListItem>Benguet</asp:ListItem>
                    <asp:ListItem>Ifugao</asp:ListItem>
                    <asp:ListItem>Kalinga</asp:ListItem>
                    <asp:ListItem>Mt. Province</asp:ListItem>
                </asp:ComboBox>
            </td>
            <%--<td><asp:Button ID="btnSearch" runat="server" Text="Search" SkinID="Button8"/></td>--%>
        </tr>
    </table>
    <div style="padding: 0 100px 0 100px;">
        <h3>
            <asp:Label ID="Label9" runat="server" Text="Benguet"></asp:Label></h3>
        <asp:Table ID="tblContents" runat="server">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <h5>Baguio City</h5>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="Address:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    746 Dianne Bldg, Rizal Ave. Extn. Luna Street
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="Business Hours:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>Monday-Fridays 9:00AM-5:00PM / Saturday 9:00AM-4:00PM</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="Contact No:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>(2) 364-3217</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <h5>La Trinidad</h5>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label5" runat="server" Text="Address:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    746 Dianne Bldg, Rizal Ave. Extn. Luna Street
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server" Text="Business Hours:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>Monday-Fridays 9:00AM-5:00PM / Saturday 9:00AM-4:00PM</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label7" runat="server" Text="Contact No:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>(2) 364-3217</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
