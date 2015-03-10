<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/AccountSite.master" AutoEventWireup="true" CodeFile="testpage.aspx.cs" Inherits="Acc_Pages_Default" %>
<%@ Register TagName="OnlineBooking" Src="~/App_Controls/OnlineBooking.ascx" TagPrefix="ctr"%>
<%@ Register TagName="DataView" Src="~/App_Controls/DataView.ascx" TagPrefix="ctr" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="H" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="M" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release"></asp:ToolkitScriptManager>
    <table style="margin:5px; padding: 10px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Login:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="22px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="AllanCut:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    
    <asp:GridView ID="gvDataView" runat="server" Width="330px" AllowPaging="True" 
            AllowSorting="True" Height="100px" AlternatingRowStyle-Wrap="True"
             CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="2" 
             OnPageIndexChanging="GridView1_PageIndexChanging">
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

    <%--<ctr:DataView runat="server" ID="shipmentData" />--%>

    <%--<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <ctr:OnlineBooking ID="onBook" runat="server" />
        </asp:View>
    </asp:MultiView>
<%--    <asp:TabContainer ID="tabOnlineBooking" runat="server">
    <asp:TabPanel ID="pnlShipper" runat="server">
        <HeaderTemplate>
            Shipper&#39;s Details
        </HeaderTemplate>
        <ContentTemplate>

        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="pnlConsignee" runat="server" HeaderText="TabPanel2">
        <HeaderTemplate>
            Consignee&#39;s Information
        </HeaderTemplate>
        <ContentTemplate>
  
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="pnlParcel" runat="server" HeaderText="TabPanel3">
        <HeaderTemplate>
            Parcel Details
        </HeaderTemplate>
        <ContentTemplate>

        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="pnlPayment" runat="server" HeaderText="TabPanel4">
        <HeaderTemplate>
            Payment/Shipment Registration
        </HeaderTemplate>
        <ContentTemplate>

        </ContentTemplate>
    </asp:TabPanel>
</asp:TabContainer>--%>
</asp:Content>

