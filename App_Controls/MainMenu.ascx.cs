using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Controls_MainMenu : System.Web.UI.UserControl
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (NavMenu.Items.Count == 4 && System.Web.HttpContext.Current.User.Identity.IsAuthenticated){
            NavMenu.Items[NavMenu.Items.Count - 1].NavigateUrl = UserAccountSession.Current.UserURL;
            NavMenu.Items[NavMenu.Items.Count - 1].Text = UserAccountSession.Current.UserMenu;
        }
    }

    //private string accMenuUrl;

    //public string AccMenuUrl
    //{
    //    set
    //    {
    //        accMenuUrl = value;
    //        if (NavMenu.Items.Count == 4 && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
    //        {
    //            NavMenu.Items[NavMenu.Items.Count - 1].NavigateUrl = accMenuUrl;
    //        }
    //    }
    //}

    public bool MenuOnLoggedIn {
        set {
            if (NavMenu.Items.Count == 3 && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
            if(value){
                MenuItem miBooking = new MenuItem();
                miBooking.Text = "Booking";
                miBooking.Value = "Booking";
                NavMenu.Items.Add(miBooking);
            }
            }
        }
    }
}