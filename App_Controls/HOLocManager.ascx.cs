using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Four.Entity;
using Three.Business;

public partial class App_Controls_HOLocManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BSProvince BSProv = new BSProvince();
        gvProvinces.DataSource = BSProv.Provinces();
        gvProvinces.DataBind();
    }
    protected void lbProvinces_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gvProvinces_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvProvinces.EditIndex = e.NewEditIndex;
        gvProvinces.DataBind();
    }
    protected void gvProvinces_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvProvinces.SetEditRow(-1);
        gvProvinces.DataBind();
    }
    protected void gvProvinces_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //ENProvince prov = new ENProvince();
        //prov.Province_Desc = ((TextBox)gvProvinces.HeaderRow.Cells[0].FindControl("txtAddProvince")).Text;
        //if(new BSProvince().InsertProvince(prov)==0){
        //    // Pop-up error
        //}else{
        //    UpdateProvinces();
        //}

    }
    protected void gvProvinces_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateProvinces();
    }
    private void UpdateProvinces()
    {
        if (gvProvinces.SelectedIndex != -1)
        {
            BSLocation loc = new BSLocation();
            Label LL = (Label)gvProvinces.SelectedRow.FindControl("lblProvinceID");
            BSProvince BSProv = new BSProvince();
            gvProvinces.DataSource = BSProv.Provinces();
            gvProvinces.DataBind();
            int YO = Convert.ToInt32(LL.Text);
            gvMCnZip.DataSource = loc.Load(YO);
            gvMCnZip.DataBind();
            // btnAddLocations.Enabled = true;
        }
        else
        {
            //btnAddLocations.Enabled = false;
        }
    }
    protected void gvMCnZip_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        if (new BSLocation().Delete(Convert.ToInt32(((Label)gvMCnZip.Rows[e.RowIndex].FindControl("lblLocID")).Text)) == 0)
        {
            //Popup error
        }
        else
        {
            UpdateProvinces();   
        }
    }
    protected void gvMCnZip_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvMCnZip.EditIndex = e.NewEditIndex;
        gvMCnZip.DataBind();

        UpdateProvinces();
    }
    protected void gvMCnZip_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvMCnZip.PageIndex = e.NewPageIndex;
        gvMCnZip.DataBind();
    }
    protected void gvProvinces_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvProvinces.PageIndex = e.NewPageIndex;
        gvProvinces.DataBind();
    }
    protected void gvMCnZip_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ENLocation ent = new ENLocation();
        ent.Loc_ID = Convert.ToInt32(((Label)gvMCnZip.Rows[gvMCnZip.EditIndex].Cells[1].FindControl("lblLocID")).Text);
        ent.Loc_Province = Convert.ToInt32(((Label)gvMCnZip.Rows[gvMCnZip.EditIndex].Cells[1].FindControl("lblProvince")).Text);
        ent.Loc_ZipCode = Convert.ToDecimal(((TextBox)gvMCnZip.Rows[gvMCnZip.EditIndex].Cells[1].FindControl("txtEditZC")).Text);
        ent.Loc_Desc = ((TextBox)gvMCnZip.Rows[gvMCnZip.EditIndex].Cells[1].FindControl("txtEditMC")).Text;
        if (new BSLocation().Edit(ent) == 0)
        {
            //Popup Error
        }
        else
        {
            gvMCnZip.SetEditRow(-1);
            gvMCnZip.DataBind();
            UpdateProvinces();
        }
    }
    protected void gvMCnZip_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvMCnZip.SetEditRow(-1);
        gvMCnZip.DataBind();
        UpdateProvinces();
    }
    protected void gvMCnZip_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        ENLocation ent = new ENLocation();
        //ent.Loc_ID = Convert.ToInt32((Label)gvMCnZip.Rows[gvMCnZip.EditIndex].Cells[1].FindControl("lblLocID"));
        ent.Loc_Province = Convert.ToInt32(((Label)gvProvinces.SelectedRow.FindControl("lblProvinceID")).Text);
        ent.Loc_ZipCode = Convert.ToDecimal(((TextBox)gvMCnZip.HeaderRow.FindControl("txtZipCode")).Text);
        ent.Loc_Desc = ((TextBox)gvMCnZip.HeaderRow.FindControl("txtMunicipalityCity")).Text;
        if (new BSLocation().Add(ent) == 0)
        {
            //Popup Error
        }
        UpdateProvinces();
    }
    protected void gvProvinces_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ENProvince prov = new ENProvince();
        prov.Province_ID = Convert.ToInt32(((Label)gvProvinces.Rows[gvProvinces.EditIndex].FindControl("lblProvinceID")).Text);
        prov.Province_Desc = ((TextBox)gvProvinces.Rows[gvProvinces.EditIndex].FindControl("txtProvince")).Text;
        if(new BSProvince().Edit(prov)==0){
            // Popup Error
        }else{
            gvProvinces.SetEditRow(-1);
            UpdateProvinces();
        }
    }
    protected void gvProvinces_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (new BSProvince().Delete(Convert.ToInt32(((Label)gvProvinces.SelectedRow.Cells[0].FindControl("lblProvinceID")).Text)) == 0)
        {
            // Popup Error
        }
        else
        {
            UpdateProvinces();
        }
    }
    protected void btnProvince_Click(object sender, EventArgs e)
    {
        ENProvince prov = new ENProvince();
        prov.Province_Desc = ((TextBox)gvProvinces.HeaderRow.Cells[0].FindControl("txtAddProvince")).Text;
        if (new BSProvince().Add(prov) == 0)
        {
            // Pop-up error
        }
        else
        {
            
        }
        UpdateProvinces();
    }
}