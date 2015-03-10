<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataView.ascx.cs" Inherits="DataView" %>
<script type="text/javascript" language="javascript">
    //    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    //    function EndRequestHandler(sender, args){
    //        if (args.get_error() != undefined){
    //            alert(args.get_error().message.substr(args.get_error().name.length + 2));
    //            args.set_errorHandled(true);
    //        }
    //    }
</script>
<asp:UpdatePanel ID="dataViewUpdatePnl" runat="server" ChildrenAsTriggers="true"
    UpdateMode="Conditional" EnableViewState="false">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="gvDataView" />
        <asp:AsyncPostBackTrigger ControlID="btnSearch" />
    </Triggers>
    <ContentTemplate>
        <asp:Table ID="tblDataView" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblSearch" runat="server" Text="Some Label:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" SkinID="Button8" Height="22px"
                        OnClick="btnSearch_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:GridView ID="gvDataView" runat="server" Width="330px" AllowPaging="True" AllowSorting="True"
            Height="100px" AlternatingRowStyle-Wrap="True" CellPadding="4" ForeColor="#333333"
            GridLines="None" PageSize="10" OnPageIndexChanging="gvDataView_OnPageIndexChanging">
            <AlternatingRowStyle Wrap="True" BackColor="White"></AlternatingRowStyle>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#1279c0" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1279c0" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:UpdateProgress ID="DataViewProgress" AssociatedUpdatePanelID="dataViewUpdatePnl"
            runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0;
                    right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/Loading.gif"
                        AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed;
                        top: 45%; left: 50%;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </ContentTemplate>
</asp:UpdatePanel>
