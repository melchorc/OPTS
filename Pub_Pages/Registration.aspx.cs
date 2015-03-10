using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Four.Entity;
using Three.Business;

public partial class Pub_Pages_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        dlgEmailVerication.btn1_Clicked += new EventHandler(CheckEmailVerification);
    }
    protected void CheckEmailVerification(object sender, EventArgs e)
    {
        //Display the Dialog again if the Email is Verified
        bool EmailVerificationLinkREceived = true;
        if (EmailVerificationLinkREceived)
        {
            Response.Redirect("~/Pub_Pages/Home.aspx");
            return;
        }
  //      dlgEmailVerification.Show();
    }
    protected void sendLinktoEmail(object sender, EventArgs e)
    {
        sendToEmail();
    }

    private void sendToEmail() {
        //Checks the timer for a clicked Resend of Email.

        //Verify the Email in this Server Side
        //txtEmail.Text;
        //Send an Email to a Website, eg. Yahoo.com

        //Counts the number of Sends
        //IF sends reaches a maximum of 3 the system will take a count to 10mins 
        //to enable Email sending again for following 2 max attemps. 
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //REgister User on Account
        ENUser ent = new ENUser();
        ent.User_AccessLevel = 1;
        ent.User_Name = txtUserName.Text;
        ent.User_FName = pdPersonalDetails.FirstNameValue;
        ent.User_LName = pdPersonalDetails.LastNameValue;

        string[] values = pdPersonalDetails.Address;
        ent.User_HouseNo = Convert.ToInt32(values[0]);
        ent.User_SPS = values[1];
        ent.User_Loc = Convert.ToInt32(values[3]);

        ent.User_Password = Link.Security.Cryptography.Encryptor.EncryptIt(txtRetypePassword.Text, "srgerg$%^bg", Convert.FromBase64String("nvuiwjda"));

        values = ClientContactInfo.ContactInfo;
        ent.User_Email = values[0];
        ent.User_Landline = Convert.ToInt32(values[2]);
        ent.User_Mobile = Convert.ToInt64(values[1]);

        if (new BSUser().Add(ent) <= 0)
        {
            //Error Message
            return;
        }
        dlgEmailVerication.Show();
    }
    protected void dlgEmailVerification_Load(object sender, EventArgs e)
    {
        
    }
}