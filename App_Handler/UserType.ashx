<%@ WebHandler Language="C#" Class="UserType" %>

using System;
using System.Web;

public class UserType : IHttpHandler, System.Web.SessionState.IRequiresSessionState  {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //context.Response.BufferOutput = false;
        //context.Response.Write("Hello World");
       if (!String.IsNullOrEmpty(context.Request.QueryString["acc"]))
        {
            //try
            //{
           //Verifies the UserName for UserType
            String UserValue = context.Request.QueryString["acc"];
            UserValue = UserValue.Replace(" ", "+");
            String UserName = Link.Security.Cryptography.Encryptor.Decrypt(UserValue, "srgerg$%^bg", Convert.FromBase64String("isqwertl"));//srfjuoxp
            //Sets the Access Level
                //String UserName = Encryptor.Decrypt(Uservalue, "srgerg$%^bg", Convert.FromBase64String("isqwertl"));//srfjuoxp
            String URL = "";
            String UserMenu = "";
                switch (UserName)
                {
                    case "Client": URL = "~/Acc_Pages/UserAccount(Client).aspx"; UserMenu = "Booking"; break;
                    case "CR": URL = "~/Acc_Pages/UserAccount(CR).aspx"; UserMenu = "Account"; break;
                    case "GCOA": URL = "~/Acc_Pages/UserAccount(GCOA).aspx"; UserMenu = "Account"; break;
                    case "SSOS": URL = "~/Acc_Pages/UserAccount(SSOS).aspx"; UserMenu = "Account"; break;
                    case "DS": URL = "~/Acc_Pages/UserAccount(DS).aspx"; UserMenu = "Account"; break;
                    case "HO": URL = "~/Acc_Pages/UserAccount(HO).aspx"; UserMenu = "Admin"; break;
                    case "LA": URL = "~/Acc_Pages/UserAccount(LA).aspx"; UserMenu = "Account"; break;
                    default:
                        context.Response.Redirect("~/Pub_Pages/LoginAttemp.aspx?attempt=1"); 
                        //context.Response.Redirect("~/Pub_Pages/LoginAttemp.aspx"); 
                        return;
                }
                System.Web.Security.FormsAuthentication.SetAuthCookie(UserName, false);
                UserAccountSession.Current.UserName = UserName;
                UserAccountSession.Current.UserURL = URL;
                UserAccountSession.Current.UserMenu = UserMenu;
                context.Response.Redirect(URL);
            //}
            //catch(Exception) {
            //    //context.Response.Redirect("~/Pub_Pages/LoginAttemp.aspx"); 
            //}
        }
        else
        {
            context.Response.Redirect("~/Pub_Pages/LoginAttemp.aspx");
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}