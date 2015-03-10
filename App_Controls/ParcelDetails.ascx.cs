using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ParcelDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e){}
    
    public EventHandler btnBck_Clicked;
    public EventHandler btnNxt_Clicked;
    protected void btnNxt_Click(object sender, EventArgs e)
    {
        if (btnNxt_Clicked != null)
            btnNxt_Clicked(this, EventArgs.Empty);
    }
    protected void btnBck_Click(object sender, EventArgs e)
    {
        if (btnBck_Clicked != null)
            btnBck_Clicked(this, EventArgs.Empty);
    }
    public string ValidationGroup
    {
        set
        {
            reqTxtContDesc.ValidationGroup = value;
            regTxtDecVal.ValidationGroup = value;
            regTxtWeight.ValidationGroup = value;

            reqTxtContDesc.ValidationGroup = value;
            reqTxtDecVal.ValidationGroup = value;
            reqTxtWeight.ValidationGroup = value;
        }
    }

    public string[] Parcel
    {
        get
        {
            return new string[]{
            txtContDesc.Text,
            txtDecVal.Text,
            txtWeight.Text,
            txtFreightCharge.Text};
        }
        set
        {
            txtContDesc.Text = value[0];
            txtDecVal.Text = value[1];
            txtWeight.Text = value[2];
            txtFreightCharge.Text = value[3];
        }
    }
}