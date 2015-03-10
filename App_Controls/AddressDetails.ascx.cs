using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Four.Entity;
using Obout.ComboBox;
using Three.Business;

public partial class AddressDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadProvinces();
    }

    public void loadProvinces()
    {

        cmbProvinceDet.Items.Clear();
        IEnumerable<ENProvince> OO = new BSProvince().Provinces();
        foreach (ENProvince i in OO)
        {
            ComboBoxItem li = new ComboBoxItem(i.Province_Desc, i.Province_ID.ToString());
            //li.Attributes.Add("P", i.Province_ID.ToString());
            cmbProvinceDet.Items.Add(li);
        }
        // Page.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:cmbProvinceDet_Change(); ", true);
        //cmbProvinceDet.Attributes["propertyChanged"];
    }

    //[System.Web.Services.WebMethod]
    //public IEnumerable<ENLocation> GetProvinces()
    //{
    //  //  return ;
    //}


    public string ValidationGroup { 
        set{
            regStreetPurok.ValidationGroup = value;
            regTxtBarangay.ValidationGroup = value;
            //regTxtCityDet.ValidationGroup = value;
            regTxtHouseNum.ValidationGroup = value;
            regZipCodeDet.ValidationGroup = value;
            mulSPSnBar.ValidationGroup = value;
            //reqStreetPurok.ValidationGroup = value;
            //reqTxtBarangay.ValidationGroup = value;
            reqTxtCityDet.ValidationGroup = value;
            reqTxtHouseNum.ValidationGroup = value;
            reqZipCodeDet.ValidationGroup = value;
        }
    }
    protected void cmbProvinceDet_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Display Available Locations on that Province
        
    }
     
    public string[] Address
    {
        get { return new string[]{
            (txtHouseNum.Text.Replace('#',' ')),
            txtStreetPurok.Text +"|"+ txtBarangay.Text,
            txtZipCodeDet.Text,
            hdnLocIDStore.Value,
            cmbProvinceDet.SelectedValue
        };
        }
        set {
            txtHouseNum.Text = (value[0].Insert(0,"#"));
            try { 
                string[] sefa = value[1].Split('|');
                txtStreetPurok.Text = sefa[0];
                txtBarangay.Text = sefa.Length != 1 ? sefa[1] : "";
            }
            catch(NullReferenceException)
            {
                txtStreetPurok.Text = "";
                txtBarangay.Text = "";
            }
            txtZipCodeDet.Text = value[2];
            cmbCityDet.SelectedValue = value[3];
            hdnLocIDStore.Value = value[3];
            try { cmbProvinceDet.SelectedValue = value[4].ToString(); }
            catch (Exception) { };
        }
    }
    protected void cmbCityDet_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (cmbCityDet.OpenOnFocus)
        {
            IEnumerable<ENLocation> OO = new BSLocation().SearchLocation(cmbCityDet.SelectedText + "%");
            foreach (ENLocation i in OO)
            {
                ComboBoxItem li = new ComboBoxItem(i.Loc_Desc, i.Loc_ID.ToString());
                li.Attributes.Add("p", i.Loc_Province.ToString());
                li.Attributes.Add("z", i.Loc_ZipCode.ToString());
                cmbCityDet.Items.Add(li);
            }
            e.ItemsLoadedCount = 10;
            e.ItemsCount = 10;
        }
    }
}