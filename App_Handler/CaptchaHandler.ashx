<%@ WebHandler Language="C#" Class="CaptchaHandler" %>

using System;
using System.Web;
using System.Drawing.Imaging;
using System.Drawing;
using Link;
using Link.Security.Cryptography;

public class CaptchaHandler : IHttpHandler 
{
    public void ProcessRequest (HttpContext context) 
    {
        context.Response.ContentType = "image/jpeg";
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        context.Response.BufferOutput = false;
        
        // Get text
        string s = "No Text";
        if (context.Request.QueryString["c"] != null &&
            context.Request.QueryString["c"] != "")
        {
            string enc = context.Request.QueryString["c"].ToString();
            
            // space was replaced with + to prevent error
            enc = enc.Replace(" ", "+");
            try
            {
                s = Encryptor.Decrypt(enc, "srgerg$%^bg", Convert.FromBase64String("srfjuoxp"));
            }
            catch {  }
        }
        // Get dimensions
        int w = 120;
        int h = 50;
        // Width
        if (context.Request.QueryString["w"] != null &&
            context.Request.QueryString["w"] != "")
        {
            try
            {
                w = Convert.ToInt32(context.Request.QueryString["w"]);
            }
            catch { }
        }
        // Height
        if (context.Request.QueryString["h"] != null &&
            context.Request.QueryString["h"] != "")
        {
            try
            {
                h = Convert.ToInt32(context.Request.QueryString["h"]);
            }
            catch { }
        }
        // Color
        Color Bc = Color.White;
        if (context.Request.QueryString["bc"] != null &&
            context.Request.QueryString["bc"] != "")
        {
            try
            {
                Bc = ColorTranslator.FromHtml(context.Request.QueryString["bc"].ToString().Insert(0, "#"));
            }
            catch { }
        }
        CaptchaImage ci; //Declare new Captcha Image
        //Forground Color and Generate image
        if (context.Request.QueryString["fc"] != null &&
            context.Request.QueryString["fc"] != "")
        {   // Width Custom Forground Color
            ci = new CaptchaImage(s, Bc, w, h,
                ColorTranslator.FromHtml(context.Request.QueryString["fc"].ToString().Insert(0, "#")));
        }
        else
        {  // Width Random Forgound Color
            ci = new CaptchaImage(s, Bc, w, h);
        }
        // Return
        ci.Image.Save(context.Response.OutputStream, ImageFormat.Jpeg);
        // Dispose
        ci.Dispose();
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}