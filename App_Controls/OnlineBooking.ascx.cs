using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnlineBooking : System.Web.UI.UserControl
{
    protected void PreLoad(object sender, EventArgs e)
    {
        //setClientMode();
        //LoadControls_OnlingBooking();
    }
    protected void Page_Load(object sender, EventArgs e)
    { 
        //if(!IsPostBack)
        //    setClientMode();
        //else
            LoadControls_OnlingBooking();
    }
    
    public bool ClientMode{
        set { 
            clientMode = value;
            //pnlShipper.Visible = (value==true?false:true);
            //setClientMode();
        }
    }

    //private void setClientMode(){
    //    if (clientMode)
    //    {
    //        tabOnlineBooking.ActiveTabIndex = 1;
    //        LoadControls_OnlingBooking();
    //    }
    //    else
    //    {
    //        tabOnlineBooking.ActiveTabIndex = 0;
    //        LoadControls_OnlingBooking();
    //    }
    //}

    private bool clientMode = false;

    private void LoadControls_OnlingBooking()
    {
        //Disable inactive Tabs
        foreach (AjaxControlToolkit.TabPanel p in tabOnlineBooking.Tabs)
        {
            if (!tabOnlineBooking.ActiveTab.Equals(p))
                p.Enabled = false;
            else
                p.Enabled = true;
        }
        //System.Threading.Thread.Sleep(2000);
        //Place dynamic Web User Controls
        switch (tabOnlineBooking.ActiveTabIndex)
        {
            case 0:
                    ClientDetails ctrShipper = (ClientDetails)LoadControl("~/App_Controls/ClientDetails.ascx");
                    ((Button)ctrShipper.FindControl("btnBack")).Visible = false;
                    if (clientMode)
                    {
                        ASP.app_controls_personaldetails_ascx PD = ((ASP.app_controls_personaldetails_ascx)ctrShipper.FindControl("ClientPersonalDetails"));
                        PD.ShowNames = false;
                        ((Label)PD.FindControl("lblShipPersonal")).Text = "Pick-up Location";
                        ((ContactInformation)ctrShipper.FindControl("ClientContactInfo")).Visible = false;
                        ((Label)ctrShipper.FindControl("lblContactInfo")).Visible = false;
                    }
                    ctrShipper.ValidationGroup = "valShipperDetails";
                    ctrShipper.btnNext_Clicked = new EventHandler(btnClickNext);
                    pnlShipper.Controls.Add(ctrShipper);
                break;
            case 1:
                ClientDetails ctrConsgnee = (ClientDetails)LoadControl("~/App_Controls/ClientDetails.ascx");
                //if (clientMode)
                //{
                //    ((Button)ctrConsgnee.FindControl("btnBack")).Visible = false;
                //}
                //else {
                //    
                //}
                ctrConsgnee.ValidationGroup = "valConsgneeDetails";
                ctrConsgnee.btnBack_Clicked = new EventHandler(btnClickBack);
                ctrConsgnee.btnNext_Clicked = new EventHandler(btnClickNext);
                pnlConsignee.Controls.Add(ctrConsgnee);
                break;
            case 2:
                ParcelDetails ctrParcel = (ParcelDetails)LoadControl("~/App_Controls/ParcelDetails.ascx");
                ctrParcel.ValidationGroup = "valParcelDetails";
                ctrParcel.btnBck_Clicked = new EventHandler(btnClickBack);
                ctrParcel.btnNxt_Clicked = new EventHandler(btnClickNext);
                pnlParcel.Controls.Add(ctrParcel);
                break;
            case 3:
                Payment_Registration ctrPayment = (Payment_Registration)LoadControl("~/App_Controls/Payment_Registration.ascx");
                ctrPayment.ValidationGroup = "valPayment";
                ctrPayment.btnBack_Clicked = new EventHandler(btnClickBack);
                ctrPayment.btnCancel_Clicked = new EventHandler(btnClickLast);
                ctrPayment.btnSubmitOk_Clicked = new EventHandler(btnClickLast);
                pnlPayment.Controls.Add(ctrPayment);
                break;
        }
    }
    protected void btnClickBack(object sender, EventArgs e)
    {
        tabOnlineBooking.ActiveTabIndex -= 1;
        LoadControls_OnlingBooking();
    }
    protected void btnClickNext(object sender, EventArgs e)
    {
        tabOnlineBooking.ActiveTabIndex += 1;
        LoadControls_OnlingBooking();
    }
    protected void btnClickLast(object sender, EventArgs e)
    {
        //setClientMode();
        tabOnlineBooking.ActiveTabIndex = 0;
        LoadControls_OnlingBooking();
    }
    protected void udpOnlineBooking_Load(object sender, EventArgs e)
    {
        //LoadControls_OnlingBooking()
    }
}