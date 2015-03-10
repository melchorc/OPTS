﻿<%@ Page Theme="Default" Title="Home Page" Language="C#" MasterPageFile="~/PublicSite.master" ClientIDMode="Static" %>

<script runat="server">
    protected void Page_PreInit(object sender, EventArgs e)
    {
        UserAccountMgm.Check(this);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        phdHomeSlide.Controls.Clear();
        LiteralControl litCon = new LiteralControl();
        litCon.Text = "<iframe src='Home_Slide.html' style='height: 300px; width: 519px;' scrolling='no'></iframe>";
        phdHomeSlide.Controls.Add(litCon);
    }
    protected void btnTrack_Click(object sender, EventArgs e)
    {
        Image1.Visible = true;
    }

    protected void Image2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Pub_Pages/Registration.aspx");
    }
</script>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="H">
    
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="M">
    <table>
        <tr class="RowContent">
            <td style="vertical-align:top; width:400px">
                <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release"></asp:ScriptManager>
                <div style="
                    background-color:white; 
                    margin-top:60px;
                    margin-right:30px; 
                    padding:2px 10px 15px 15px;
                    border-radius:10px;
                ">
                <h2>Track your Shipment</h2>
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
                    <%--<ContentTemplate>--%>
                    <table>
                        <tr>
                            <td><asp:TextBox  ID="txtTrackingNumber" runat="server" Height="34px" Width="180px" Font-Size="X-Large" Text="2444-5885-9889"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqTxtTrackingNumber" ControlToValidate="txtTrackingNumber" runat="server" SkinID="ask" ValidationGroup="valTrack"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="regTxtTrackingNumber" ControlToValidate="txtTrackingNumber" ValidationExpression="[1-9]\d{3}(-\d{4}){2}" ValidationGroup="valTrack" runat="server"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:Button ID="btnTrack" ValidationGroup="valTrack" runat="server" Text="TRACK" Height="35px" AutoPostBack="False" OnClick="btnTrack_Click" Width="100px" SkinID="Button8"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </div>
                <h3>Details:</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="400px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <p>Shipment Date:&nbsp;</p>
                                <p>Commitment Date: </p>
                                <p>Origin Station:</p>
                                <p>Destination Station: </p>
                                <p>Status:</p>
                                <p>Date of Delivery:</p>
                                <p>Time of Delivery:</p>
                                <p>Current Location:</p>
                                <p>Last Date Checked:</p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <p><asp:Label  ID="ASPxLabel1" runat="server" Text='<%# Bind("Date_Ship") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel2" runat="server" Text='<%# Bind("Date_Com") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel3" runat="server" Text='<%# Bind("Station_Orig") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel4" runat="server" Text='<%# Bind("Station_Des") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel5" runat="server" Text='<%# Bind("Status") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel6" runat="server" Text='<%# Bind("Date_Delivery") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel7" runat="server" Text='<%# Bind("Time_Delivery") %>'></asp:Label ></p>
                                <p><asp:Label  ID="ASPxLabel9" runat="server" Text='<%# Bind("Current_Location") %>'></asp:Label></p>
                                <p><asp:Label  ID="ASPxLabel10" runat="server" Text='<%# Bind("Last_date") %>'></asp:Label></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                        
                <asp:Image ID="Image1" ImageUrl="~/IMAGES/dummyTrack.png" Visible="false" runat="server" style="max-height:100%; max-width:100%" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                        <%--</ContentTemplate>--%>
                <%--</asp:UpdatePanel>--%>
                     <asp:ImageButton ID="Image2" runat="server" ImageUrl="~/IMAGES/OnlineBooking.jpg"
                         onclick="Image2_Click"   />
                <asp:LinkButton ID="LinkButton1" style="position:absolute; color:white; text-decoration:none; left:25%; top:80%;" Font-Size="X-Large" runat="server">Register Now >>></asp:LinkButton>

            </td>
            <td style="vertical-align:top;">
                <asp:PlaceHolder ID="phdHomeSlide" runat="server">
                    <asp:Image ID="imlod" style="text-align:center; margin:300px;" ImageUrl="~/IMAGES/Loading.gif" runat="server" />
                </asp:PlaceHolder>
                <h5><asp:Label ID="Label8" runat="server" Text="Rate Calculator"></asp:Label></h5>
                <asp:Table ID="RateCalculatorForm" runat="server" Height="25px" SkinID="US">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblWeight" runat="server" Text="Weight(Kg):"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtWeight" ValidationGroup="valRateCalulator" runat="server"></asp:TextBox>
                    <%--<asp:MaskedEditValidator ID="mskTxtWeight" ValidationExpression="(([1-5]\d)|([6][0-8]))([.]\d{1,4})?|0[.]\d{1,4}" ControlToValidate="txtWeight" runat="server" ErrorMessage="Error" InitialValue="0"></asp:MaskedEditValidator>--%>
                    <asp:RequiredFieldValidator ID="reqTxtWeight" ValidationGroup="valRateCalulator" ControlToValidate="txtWeight" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regTxtWeight" ValidationGroup="valRateCalulator" ValidationExpression="(([1-5]\d)|([6][0-8])|[1-9])([.]\d{1,4})?|0[.]\d{1,4}" ControlToValidate="txtWeight" runat="server"></asp:RegularExpressionValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblServiceType" runat="server" Text="Service Type:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblServiceStat" runat="server" SkinID="ForceLeft" Text="None"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblOriginProvice" runat="server" Text="Address From:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:ComboBox ID="cmbOriginProvice" runat="server">
                        <asp:ListItem>Abra</asp:ListItem>
                        <asp:ListItem>Apayao</asp:ListItem>
                        <asp:ListItem>Benguet</asp:ListItem>
                        <asp:ListItem>Ifugao</asp:ListItem>
                        <asp:ListItem>Kalinga</asp:ListItem>
                        <asp:ListItem>Mt. Province</asp:ListItem>
                     </asp:ComboBox>
                     <asp:RequiredFieldValidator ID="reqOriginProvice" ValidationGroup="valRateCalulator" ControlToValidate="cmbOriginProvice" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
                 </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblDestProvince" runat="server" Text="Address To:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:ComboBox ID="cmbDestProvince" runat="server">
                        <asp:ListItem>Abra</asp:ListItem>
                        <asp:ListItem>Apayao</asp:ListItem>
                        <asp:ListItem>Benguet</asp:ListItem>
                        <asp:ListItem>Ifugao</asp:ListItem>
                        <asp:ListItem>Kalinga</asp:ListItem>
                        <asp:ListItem>Mt. Province</asp:ListItem>
                    </asp:ComboBox>
                    <asp:RequiredFieldValidator ID="reqDestProvince" ValidationGroup="valRateCalulator" ControlToValidate="cmbDestProvince" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDecValue" runat="server" Text="Declared Value(Php):"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDecValue" ValidationGroup="valRateCalulator" runat="server"></asp:TextBox>
                    <%--<asp:MaskedEditValidator ID="mskDecValue" ValidationExpression="[1-9]\d{2,11}" ControlToValidate="txtDecValue" runat="server"></asp:MaskedEditValidator>--%>
                    <asp:RequiredFieldValidator ID="reqDecValue" ValidationGroup="valRateCalulator" ControlToValidate="txtDecValue" runat="server" SkinID="ask"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regDecValue" ValidationGroup="valRateCalulator" ValidationExpression="[1-9]\d{2,11}" ControlToValidate="txtDecValue" runat="server"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPrice" runat="server" Text="Price(Php):"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPrice" ValidationGroup="valRateCalulator" ForeColor="#989898" ReadOnly="true" Text="147" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblPriceVat" runat="server" Text="Price with VAT(Php):"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPriceVat" ValidationGroup="valRateCalulator" ForeColor="#989898" runat="server" Text="164.64" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
            </td>
        </tr>
    </table>
</asp:Content>

