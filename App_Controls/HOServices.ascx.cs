using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Four.Entity;
using Three.Business;

public partial class App_Controls_HOServices : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        opdServices.btn1_Clicked += new EventHandler(opdServices_Ok);
        UpdateServicesGrid();
    }
    private void UpdateServicesGrid(){
        BSServices BsServ = new BSServices();
        gvServices.DataSource = BsServ.Load();
        gvServices.DataBind();
        //gvServices.SelectedIndex = 0;
    }
    protected void opdServices_Ok(object sender, EventArgs e)
    {
        //Label1.Text = ((Label)opdServices.NamingContainer.FindControl("txtServiceName")).Text;
        ENServices serv = new ENServices();
        serv.Service_Name = txtServiceName.Text;
        serv.Service_Desc = txtServiceDesc.Text;
        serv.MaxWgt = Convert.ToDecimal(txtMaxWeight.Text);
        serv.MinWgt = Convert.ToDecimal(txtMinWeight.Text);
        serv.Price = Convert.ToDecimal(txtPrice.Text);
        if (String.IsNullOrEmpty(hdnJSValue.Value))
        {
            new BSServices().Add(serv);
        }
        else
        {
            serv.Service_ID = Convert.ToInt32(hdnJSValue.Value);
            new BSServices().Edit(serv);
        }
        UpdateServicesGrid();
    }
    protected void gvServices_SelectedIndexChanged(object sender, EventArgs e)
    {
        //opdServices.Show();
    }
    protected void gvServices_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
        //    e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);";
        //    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(this.gvServices, "Select$" + e.Row.RowIndex);
        //}
    }
    protected void btnRemoveService_Click(object sender, EventArgs e)
    {
        if (new BSServices().Delete(Convert.ToInt32(((HiddenField)gvServices.SelectedRow.Cells[0].FindControl("hdnServiceID")).Value)) == 0)
        {
            // Popup Error.
        }
        else
        {
            UpdateServicesGrid();
        }
    }
}