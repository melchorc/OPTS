using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public DataView(){}
    public DataView(string title, string searchbtn)
    {
        lblSearch.Text = title;
        btnSearch.Text = searchbtn;
    }
    public string SearchTitle { set { lblSearch.Text = value; }}
    public string SearchButton { set { btnSearch.Text = value; } }
    public IEnumerable<Four.Entity.ENUser> DataTable {
        set { gvDataView.DataSource = value; }
    }
    public void BindIt() {
        gvDataView.DataBind();
    }
    protected void gvDataView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDataView.PageIndex = e.NewPageIndex;
        BindIt();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
}