using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pub_Pages_LoginAttemp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lnkbtnRegisterNow.PostBackUrl = "Registration.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            FormsAuthentication.SignOut();
        }
        if (!String.IsNullOrEmpty(Request.QueryString["attempt"]))
        {
            phlMessage.Visible = true;
        }
        else
        {
            phlMessage.Visible = false;
        }
    }
    protected void LoginFormAttemp_Authenticate(object sender, AuthenticateEventArgs e)
    {
        //FormsAuthentication.SetAuthCookie(LoginFormAttemp.UserName, false);

        string continueUrl = Request.QueryString["ReturnUrl"];
        string user = Link.Security.Cryptography.Encryptor.Encrypt(LoginFormAttemp.UserName, "srgerg$%^bg", Convert.FromBase64String("isqwertl"));//srfjuoxp
        if (String.IsNullOrEmpty(continueUrl))
        {
            //Load
            //continueUrl = "~/Acc_Pages/UserAccount.aspx?UN=" + LoginFormAttemp.UserName;
            continueUrl = "~/App_Handler/UserType.ashx?acc=" + user;
        }
        Response.Redirect("~/App_Handler/UserType.ashx?acc=" + user + "&ReturnUrl=" + continueUrl);
        // Save to session
        //Session["userlogin"] = LoginFormAttemp.UserName.ToLower();
        //FormsAuthentication.RedirectFromLoginPage(LoginFormAttemp.UserName.ToLower(), false);
    }
}