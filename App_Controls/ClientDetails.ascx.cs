using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public EventHandler btnBack_Clicked;
    public EventHandler btnNext_Clicked;

    protected void btnNext_Click(object sender, EventArgs e) {
        if (btnNext_Clicked != null)
            btnNext_Clicked(this, EventArgs.Empty);
    }
    protected void btnBack_Click(object sender, EventArgs e) {
        if (btnBack_Clicked != null)
            btnBack_Clicked(this, EventArgs.Empty);
    }
    public string ValidationGroup
    {
        set {
            btnNext.ValidationGroup = value;
            ClientPersonalDetails.ValidationGroup = value;
            ClientContactInfo.ValidationGroup = value;
        }
    }
}