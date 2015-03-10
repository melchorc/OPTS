using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Three.Business;

public partial class App_Controls_HOStatus : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BSParcelStatus BS = new BSParcelStatus();
        gvParcelStatus.DataSource = BS.Load();
        gvParcelStatus.DataBind();

        BSShipmentStatus SS = new BSShipmentStatus();
        gvShipmentStatus.DataSource = SS.Load();
        gvShipmentStatus.DataBind();
    }
    protected void gvParcelStatus_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvParcelStatus.EditIndex = e.NewEditIndex;
        gvParcelStatus.DataBind();
    }
    protected void gvParcelStatus_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvParcelStatus.SetEditRow(-1);
        gvParcelStatus.DataBind();
    }
    protected void gvParcelStatus_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }
    protected void gvParcelStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvParcelStatus.PageIndex = e.NewPageIndex;
        gvParcelStatus.DataBind();
    }
    protected void gvShipmentStatus_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvShipmentStatus.EditIndex = e.NewEditIndex;
        gvShipmentStatus.DataBind();
    }
    protected void gvShipmentStatus_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }
    protected void gvShipmentStatus_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvShipmentStatus.SetEditRow(-1);
        gvShipmentStatus.DataBind();
    }
    protected void gvShipmentStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvShipmentStatus.PageIndex = e.NewPageIndex;
        gvShipmentStatus.DataBind();
    }
}