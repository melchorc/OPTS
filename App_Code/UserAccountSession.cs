using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AccountSession
/// This Class Stores Session Values used for Navigation and Verification;
/// </summary>
public class UserAccountSession
{
	public UserAccountSession()
	{
        UserName = "";
        UserURL = "";
	}
    public static HttpSessionStateBase state
    {
        set {}
    }
    public static UserAccountSession Current
    {
        get
        {
            UserAccountSession session;
            if (HttpContext.Current.Session["__UserAccount__"] == null)
            {
                session = new UserAccountSession();
                HttpContext.Current.Session["__UserAccount__"] = session;
            }
            else {
                session = (UserAccountSession)HttpContext.Current.Session["__UserAccount__"];
            }
            return session;
        }
    }
    public void clearSessions(){
        Current.clearSessions();
    }
    public string UserName { get; set; }
    public string UserURL { get; set; }
    public string UserMenu { get; set; }
}
//if (HttpContext.Current.Session == null)
//{
//    //session = new UserAccountSession();
//    //HttpContext.Current.Session = state;
//    //HttpContext.Current.Session.Add("__UserAccount__", session);
//    //HttpContext.Current.Session["__UserAccount__"] = session;
//}
//else