using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for UserAcccountManager
/// </summary>
public class UserAccountMgm
{
    public UserAccountMgm()
	{
	}
    public static void Check(System.Web.UI.Page p)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) {
            if (UserAccountSession.Current.UserName != "Client")
            {
                //p.MasterPageFile = "~/AccountSite.master";
                FormsAuthentication.SignOut();
                if (p.Session != null) { p.Session.Clear(); }
                p.Response.Redirect("~/Pub_Pages/Home.aspx");
            }
            else
            {
                p.MasterPageFile = "~/PublicSite.master";
            }
        }else{
            p.MasterPageFile = "~/PublicSite.master";
        }
    }
    public static void CheckOn(System.Web.UI.Page p)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            if (UserAccountSession.Current.UserName != "Client")
            {
                p.MasterPageFile = "~/AccountSite.master";
            }
            else
            {
                p.MasterPageFile = "~/PublicSite.master";
            }
        }
        else
        {
            p.MasterPageFile = "~/PublicSite.master";
        }
    }
    public static void loadCheck(System.Web.UI.MasterPage masterPage)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            if (UserAccountSession.Current.UserName == "Client")
            {
                MultiView m = (MultiView)masterPage.FindControl("LogView");
                m.SetActiveView((View)masterPage.FindControl("LogOutView"));
            }
        }
        else
        {
            MultiView m = (MultiView)masterPage.FindControl("LogView");
            m.SetActiveView((View)masterPage.FindControl("LogInView"));
        }

    }
    public static void setLogin(System.Web.UI.MasterPage masterPage, string username, string password)
    {
        //string continueUrl = Request.QueryString["ReturnUrl"];
        // Save to session
        //Session["userlogin"] = txtLogin.Text.ToLower();
        //Response.Redirect("~/Acc_Pages/UserAccount.aspx?acc=" + user); 
        string user = Link.Security.Cryptography.Encryptor.Encrypt(username, "srgerg$%^bg", Convert.FromBase64String("isqwertl"));//srfjuoxp
        password = "";
        username = "";
        masterPage.Response.Redirect("~/App_Handler/UserType.ashx?acc=" + user + "&attempt=1");
    }
    public static void setLogOut(System.Web.UI.MasterPage masterPage)
    {
        FormsAuthentication.SignOut();
        if (masterPage.Session != null) { masterPage.Session.Clear(); }
        masterPage.Response.Redirect("~/Pub_Pages/Home.aspx");
    }
}