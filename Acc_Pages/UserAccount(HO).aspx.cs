using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class UserAccount_HO : System.Web.UI.Page
{
    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    if(){

    //    }
    //    this.MasterPageFile = "~/AccountSite.master";
    //    this.MasterPageFile = "~/PublicSite.master";
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_DynamicControls();
        //BSUser obj = new BSUser();
        //dvEmployees.DataTable = obj.Employees();
        //dvEmployees.BindIt();
        //lbProvinces.Items.Clear();
        //btnAddLocations.Enabled = false;
        //opdLocations.btn1_Clicked += new EventHandler(opdLocations_Ok);
    }
    private void ChangeMenuLinks()
    {

    }

    private void Load_DynamicControls()
    {

        switch (tabHOControl.ActiveTabIndex)
        {
            case 0:
                DataView dvHOTrack = (DataView)LoadControl("~/App_Controls/DataView.ascx");
               phdHOStatuses.Controls.Add(dvHOTrack);
                dvHOTrack.SearchButton = "Track";
               dvHOTrack.SearchTitle = "Tracking No.";
                break;
            case 1:
                App_Controls_Report HOReport = (App_Controls_Report)LoadControl("~/App_Controls/Report.ascx");
                phdHOReport.Controls.Add(HOReport);
                break;
            case 2:
                ASP.app_controls_hoaccounts_ascx HOAccount = (ASP.app_controls_hoaccounts_ascx)LoadControl("~/App_Controls/HOAccounts.ascx");
                phdHOAccounts.Controls.Add(HOAccount);
                break;
            case 3:
                ASP.app_controls_hoservices_ascx HOServices = (ASP.app_controls_hoservices_ascx)LoadControl("~/App_Controls/HOServices.ascx");
                phdHOServices.Controls.Add(HOServices);
                break;
            case 4:
                ASP.app_controls_holocmanager_ascx HOLocations = (ASP.app_controls_holocmanager_ascx)LoadControl("~/App_Controls/HOLocManager.ascx");
                phdHOLocation.Controls.Add(HOLocations);
                break;
            case 6:
                ASP.app_controls_hostatus_ascx HOStatus = (ASP.app_controls_hostatus_ascx)LoadControl("~/App_Controls/HOStatus.ascx");
                phdHOStatuses.Controls.Add(HOStatus);
                break;
            default:
                //Do nothing
                break;
        }
    }

    protected void tabHOControl_ActiveTabChanged(object sender, EventArgs e)
    {
        Load_DynamicControls();
    }
}