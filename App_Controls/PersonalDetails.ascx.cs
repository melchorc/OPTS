using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PersonalDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public bool ShowNames {
        set {
            lblName.Visible = value;
            txtFirstName.Visible = value;
            txtLastName.Visible = value;
        }
    }
    public string ValidationGroup
    {
        set {
            reqLastName.ValidationGroup = value;
            regLastName.ValidationGroup = value;
            reqTxtFirstName.ValidationGroup = value;
            regTxtFirstName.ValidationGroup = value;
            PersonalAddress.ValidationGroup = value;
        }
    }
    public string FirstNameValue
    {
        get { 
            return txtFirstName.Text;
        }
        set {
            txtFirstName.Text = value;
        }
    }

    public string LastNameValue
    {
        get
        {
            return txtLastName.Text;
        }
        set
        {
            txtLastName.Text = value;
        }
    }

    public string[] Address
    {
        get { return PersonalAddress.Address; }
        set { PersonalAddress.Address = value; }
    }
    public void loadProvinces()
    {
        PersonalAddress.loadProvinces();
    }
}