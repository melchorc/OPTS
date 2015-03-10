using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactInformation : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string ValidationGroup
    {
        set {
            reqTxtEmailAddress.ValidationGroup = value;
            //cusTxtTelMobNum.ValidationGroup = value;
            mulMobileLand.ValidationGroup = value;
            regTxtEmailAddress.ValidationGroup = value;
            //MaskedEditValidator2.ValidationGroup = value;
            regTxtMobileNum.ValidationGroup = value;
            regTxtTelNum.ValidationGroup = value;
        }
    }

    public string[] ContactInfo
    {
        get
        {
            return new string[]{
                txtEmailAddress.Text,
                txtMobileNum.Text,
                sliptNAppend(txtTelNum.Text)
            };
        }
        set
        {
            txtEmailAddress.Text = value[0];
            txtMobileNum.Text = value[1].Insert(0,"0");
            txtTelNum.Text = placeHyphen(value[2]);
        }
    }

    private string sliptNAppend(string s)
    {
        if(s.Contains('-')){
            string[] ar = s.Split('-');
            string eNew = "";
            for (int i = 0; i < ar.Length; i++)
            {
                eNew += ar[i];
            }
            return eNew;
        }
        return s;
    }
    private static string ReverseString(string s)
    {
        char[] arr = s.ToCharArray();
        Array.Reverse(arr);
        return new string(arr);
    }
    private string placeHyphen(string s)
    {
        if (!s.Contains('-'))
        {
            char[] asas = s.ToCharArray();
            string eNew = "";
            for (int i = asas.Length - 1; i >= 0; i-- )
            {
                if ((i == asas.Length - 5)||(i == asas.Length - 8))
                {
                    eNew += '-';
                }
                eNew += asas[i];
            }
            return ReverseString(eNew);
        }
        return s;
    }

}