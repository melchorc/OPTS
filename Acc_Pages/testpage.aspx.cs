using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Three.Business;

public partial class Acc_Pages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
       // App_Controls_OnlineBooking aco = (App_Controls_OnlineBooking)LoadControl("~/App_Controls/OnlineBooking.ascx");
        
       // PlaceHolder1.Controls.Add(aco);
        //http://ubweb1.pinnacle.com.ph/aims/process/current_grade.php?studNo=20122144&deptType=C&SY=1415&Sem=A
        //BSUser obj = new BSUser();
        //gvDataView.DataSource = obj.Load();
        //gvDataView.DataBind();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDataView.PageIndex = e.NewPageIndex;
        gvDataView.DataBind();
    }

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    LoadControls_OnlingBooking();
    //}

    //private void LoadControls_OnlingBooking()
    //{
    //    Response.Write(tabOnlineBooking.ActiveTabIndex);
    //    //Disable inactive Tabs
    //    foreach (AjaxControlToolkit.TabPanel p in tabOnlineBooking.Tabs)
    //    {
    //        if (!tabOnlineBooking.ActiveTab.Equals(p))
    //            p.Enabled = false;
    //        else
    //            p.Enabled = true;
    //    }
    //    //Place dynamic Web User Controls
    //    switch (tabOnlineBooking.ActiveTabIndex)
    //    {
    //        case 0:
    //            ClientDetails ctrShipper = (ClientDetails)LoadControl("~/App_Controls/ClientDetails.ascx");
    //            ((Button)ctrShipper.FindControl("btnBack")).Visible = false;
    //            ctrShipper.btnNext_Clicked = new EventHandler(btnClickNext);
    //            pnlShipper.Controls.Add(ctrShipper);
    //            break;
    //        case 1:
    //            ClientDetails ctrConsgnee = (ClientDetails)LoadControl("~/App_Controls/ClientDetails.ascx");
    //            ctrConsgnee.btnBack_Clicked = new EventHandler(btnClickBack);
    //            ctrConsgnee.btnNext_Clicked = new EventHandler(btnClickNext);
    //            pnlConsignee.Controls.Add(ctrConsgnee);
    //            break;
    //        case 2:
    //            ParcelDetails ctrParcel = (ParcelDetails)LoadControl("~/App_Controls/ParcelDetails.ascx");
    //            ctrParcel.btnBack_Clicked = new EventHandler(btnClickBack);
    //            ctrParcel.btnNext_Clicked = new EventHandler(btnClickNext);
    //            pnlParcel.Controls.Add(ctrParcel);
    //            break;
    //        case 3:
    //            Payment_Registration ctrPayment = (Payment_Registration)LoadControl("~/App_Controls/Payment_Registration.ascx");
    //            ctrPayment.btnBack_Clicked = new EventHandler(btnClickBack);
    //            ctrPayment.btnCancel_Clicked = new EventHandler(btnClickLast);
    //            ctrPayment.btnSubmitOk_Clicked = new EventHandler(btnClickLast);
    //            pnlPayment.Controls.Add(ctrPayment);
    //            break;
    //    }
    //}
    //protected void btnClickBack(object sender, EventArgs e)
    //{
    //    tabOnlineBooking.ActiveTabIndex -= 1;
    //    LoadControls_OnlingBooking();
    //}
    //protected void btnClickNext(object sender, EventArgs e)
    //{
    //    tabOnlineBooking.ActiveTabIndex += 1;
    //    LoadControls_OnlingBooking();
    //}
    //protected void btnClickLast(object sender, EventArgs e)
    //{
    //    tabOnlineBooking.ActiveTabIndex = 0;
    //    LoadControls_OnlingBooking();
    //}
}