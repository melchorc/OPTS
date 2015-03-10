using System;
using Link.Security.Cryptography;

public delegate void CaptchaEventHandler();

public partial class CaptchaControl : System.Web.UI.UserControl
{
    private string color = "#ffffff";
    private string fcolor;
    protected string style;
    private event CaptchaEventHandler success;
    private event CaptchaEventHandler failure;

    public string ValidationGroup
    {
        set { reqTxtCaptcha.ValidationGroup = value; }
    }


    public string Message
    {
        // We don't set message in page_load, because it prevents us from changing message in failure event
        set { lblCMessage.Text = value; }
        get { return lblCMessage.Text;  }
    }
    public string BackgroundColor
    {
        set { color = value.Trim("#".ToCharArray()); }
        get { return color; }
    }
    public string ForgroundColor
    {
        set { fcolor = value.Trim("#".ToCharArray()); }
    }
    public string Style
    {
        set { style = value; }
        get { return style; }
    }
    public event CaptchaEventHandler Success
    {
        add { success += value; }
        remove { success += null; }
    }
    public event CaptchaEventHandler Failure
    {
        add { failure += value; }
        remove { failure += null; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
            SetCaptcha();
            txtCaptcha.Text = "";
        //}
    }

    
    private void SetCaptcha()
    {
        // Set image
        string s = RandomText.Generate();

        // Encrypt
        string ens = Encryptor.Encrypt(s, "srgerg$%^bg", Convert.FromBase64String("srfjuoxp"));

        // Save to session
        Session["captcha"] = s.ToLower();
        
        // Set url
        if (fcolor == null)
            imgCaptcha.ImageUrl = "~/App_Handler/CaptchaHandler.ashx?w=305&h=92&c=" + ens + "&bc=" + color;
        else
            imgCaptcha.ImageUrl = "~/App_Handler/CaptchaHandler.ashx?w=305&h=92&c=" + ens + "&bc=" + color + "&fc=" + fcolor;
    }
    protected void btnSubmit_Click(object s, EventArgs e)
    {
        if (Session["captcha"] != null && txtCaptcha.Text.ToLower() == Session["captcha"].ToString())
        {
            if (success != null)
            {
                success();
            }
        }
        else
        {
            txtCaptcha.Text = "";
            SetCaptcha();

            if (failure != null)
            {
                failure();
            }
        }
    }
    protected void lnkReload_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        SetCaptcha();
        txtCaptcha.Text = "";
    }
}