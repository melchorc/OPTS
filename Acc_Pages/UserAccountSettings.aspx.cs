using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccountSettings : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        UserAccountMgm.CheckOn(this);
        //
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //UserAccountMgm.Check(this);
    }
    protected void onBtnSave_Click(object sender, EventArgs e)
    {
        //Modify Database Contents
        Response.Redirect(UserAccountSession.Current.UserURL);
    }
    protected void btnSaveCont_Click(object sender, EventArgs e)
    {
        Response.Redirect(UserAccountSession.Current.UserURL);
    }
    protected void btnSaveSecu_Click(object sender, EventArgs e)
    {
        Response.Redirect(UserAccountSession.Current.UserURL);
    }
}