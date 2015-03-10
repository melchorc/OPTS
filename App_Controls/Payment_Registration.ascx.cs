using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment_Registration : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e){

    }
    public EventHandler btnBack_Clicked;
    public EventHandler btnSubmitOk_Clicked;
    public EventHandler btnCancel_Clicked;

    protected void dlgCancel_Load(object sender, EventArgs e)
    {
        dlgCancel.btn1_Clicked += new EventHandler(btnCancel_Click);
    }

    protected void btnSubmitOk_Click(object sender, EventArgs e)
    {
        if (btnSubmitOk_Clicked != null)
            btnSubmitOk_Clicked(this, EventArgs.Empty);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (btnBack_Clicked != null)
            btnBack_Clicked(this, EventArgs.Empty);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (btnCancel_Clicked != null)
        {
            btnCancel_Clicked(this, EventArgs.Empty);
        }
    }
    protected void dlgSubmit_Load(object sender, EventArgs e)
    {
        //Request Server for Generating a Tracking Number.
        dlgSubmit.btn1_Clicked += new EventHandler(btnSubmitOk_Click);
    }
    protected void btnSubmitPayment_Click(object sender, EventArgs e)
    {
        dlgSubmit.Show();
    }
    protected void calExpirationDate_SelectionChanged(object sender, EventArgs e)
    {
        txtExpirationDate.Text = calExpirationDate.SelectedDate.Date.ToString();
    }

    public string ValidationGroup
    {
        set
        {
            btnSubmitPayment.ValidationGroup = value;
        }
    }
}