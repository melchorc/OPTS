<%@ Page Title="" Theme="Default" Language="C#" MasterPageFile="~/PublicSite.master" %>

<script runat="server">
    protected void Page_PreInit(object sender, EventArgs e)
    {
        UserAccountMgm.Check(this);
    }
</script>

<asp:Content ID="Header" ContentPlaceHolderID="H" runat="Server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="M" runat="Server">
    <div style="height: 414px" class="Label">
        <h1><asp:Label ID="Label1" runat="server" Text="Door to Door"></asp:Label></h1>
        <h3>&nbsp;Bulilit</h3>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Used for small and irregularly.
                                    <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;&nbsp; Maximum weight:</b> 3kg<br />

        <h3>Hebigat</h3>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Promo box for large and bulky packages.<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Range weight:</b> 10kg-25kg<br />

        <h3>Bigahe</h3>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Ship using your own packaging.
                                    <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Maximum weight:</b> 68kg
    </div>
</asp:Content>

