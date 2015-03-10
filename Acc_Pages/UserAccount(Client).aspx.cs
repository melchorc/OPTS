using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Three.Business;

public partial class UserAccount_Client : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check User Cookie for Authentication rights to Access this Page
        //if (UserAccountSession.Current.UserURL == "Client")
        //{
       // }
       // else
       // {
       //     Response.Redirect("~/Default.aspx");
       // }
        
    }
}