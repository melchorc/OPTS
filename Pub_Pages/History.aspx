<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/PublicSite.master" %>

<script runat="server">
    protected void Page_PreInit(object sender, EventArgs e)
    {
        UserAccountMgm.Check(this);
    }
</script>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="H">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="M">
    <h1>
        <asp:Label ID="Label1" runat="server" Text="  History"></asp:Label>
    </h1>
    <p>
        Put content here.
    </p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
</asp:Content>

