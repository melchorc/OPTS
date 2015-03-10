using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Three.Business;
using Four.Entity;
using Link.Security.Cryptography;
using System.Data.SqlClient;
using System.Data;
using Obout.ComboBox;
using System.Web.Configuration;

public partial class App_Controls_HOAccounts : System.Web.UI.UserControl
{
    public int CheckedCase
    {
        get { return _checkCase; }
    }
    private int _checkCase;

    private void UpdateUsersGridView()
    {
        if (rbtnEmployees.Checked)
        {
            BSUser user = new BSUser();
            gvDataGrid.DataSource = user.Employees();
            _checkCase = RadioButtonControl.SelectedEmployees;
        }
        if (rbtnClients.Checked)
        {
            BSUser user = new BSUser();
            gvDataGrid.DataSource = user.Clients();
            _checkCase = RadioButtonControl.SelectedClients;
        }
        gvDataGrid.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        muvAccountView.SetActiveView(viewHeadOperation);
        //rbtnEmployees.Checked = true;
        //BSUser user = new BSUser();
        //gvDataGrid.DataSource = user.Clients();
        UpdateUsersGridView();
    }

    protected void rbtn_EmpCheckedChanged(object sender, EventArgs e)
    {
        UpdateUsersGridView();
    }
    protected void rbtn_ClientCheckedChanged(object sender, EventArgs e)
    {    
        UpdateUsersGridView();
    }

    private void AccountFieldControl(bool value)
    {
        lblUserName.Visible = value;
        txtUserName.Visible = value;
        cmbUserType.Visible = value;
        lblUserType.Visible = value;
        if (value==true)
        {
            reqTxtUserName.ValidationGroup = "valAccount";
            //cmbUserType.Val = "valAccount";
            regTxtUserName.ValidationGroup = "valAccount";
        }
        else
        {
           //cmbUserType.ValidationGroup = "NotUsed";
            reqTxtUserName.ValidationGroup = "NotUsed";
            regTxtUserName.ValidationGroup = "NotUsed";
        }
    }

    protected void btnAddEmployee_Click(object sender, EventArgs e) /*=TO FillOUT FORM======*/
    {
        //lblPageTitle.Text = "Employee Account Management";
        btnAdd.Text = "Add";
        muvAccountView.SetActiveView(viewAddEmployee);
        perAccounts.FirstNameValue = "";
        perAccounts.LastNameValue = "";
        string[] temp = new string[perAccounts.Address.Length];
        for (int i = 0; i < temp.Length; i++)
        {
            temp[i] = "";
        }
        perAccounts.Address = temp;
        EmpContactInfo.ContactInfo = new String[] { "", "", "" };
        perAccounts.loadProvinces();
        /*==============================================================*/
        if (!rbtnClients.Checked)
        {
            cmbUserType.Visible = true;
            //Load UserAccount Types from the Database ; NO Stored Procedures Yet
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
            SqlCommand sql = new SqlCommand("SELECT * FROM tblAccessLevel WHERE NOT AccessLevel_ID=1", conn);
            SqlDataAdapter adap = new SqlDataAdapter(sql);
            DataTable table = new DataTable();
            adap.Fill(table);
            cmbUserType.Items.Clear();
            foreach (DataRow i in table.Rows)
            {
                ComboBoxItem li = new ComboBoxItem(i[1].ToString(), i[0].ToString());
                cmbUserType.Items.Add(li);
            }
        }
        else
        {
            cmbUserType.Visible = false;
        }
        /*==============================================================*/
        AccountFieldControl(true);
    }
    protected void btnEditEmployee_Click(object sender, EventArgs e)
    {
        
        // lblPageTitleText = "Employee Account Management";
        if (gvDataGrid.SelectedIndex != -1)
        {
            btnAdd.Text = "Edit";
            //perAccounts
            //EmpContactInfo
            //cmbUserType
            //Txtusername
            
            //List<ENUser> list = new List<ENUser>();
            //list.Add(user);
            //IEnumerable<ENUser> en = list;
            //gvView.DataSource = en;
            //gvView.DataBind();
            
            string username = gvDataGrid.Rows[gvDataGrid.SelectedIndex].Cells[1].Text;
            txtUserName.Text = username;
            ENUser user = (rbtnClients.Checked) ? new BSUser().ClientById(username) : new BSUser().EmployeeById(username);
            perAccounts.FirstNameValue = user.User_FName;
            perAccounts.LastNameValue = user.User_LName;
            string[] values = new string[5];
            values[0] = user.User_HouseNo.ToString();
            values[1] = user.User_SPS;
            ENLocation loc = new BSLocation().LoadById(user.User_Loc);
            values[2] = loc.Loc_ZipCode.ToString();
            values[3] = loc.Loc_ID.ToString();
            values[4] = loc.Loc_Province.ToString();//new BSProvince().ProvinceByID(loc.Loc_Province).Province_Desc;
            perAccounts.Address = values;
            string[] cont = new string[3];
            cont[0] = user.User_Email;
            cont[1] = user.User_Mobile.ToString();
            cont[2] = user.User_Landline.ToString();
            EmpContactInfo.ContactInfo = cont;
            try { cmbUserType.SelectedValue = user.User_AccessLevel.ToString(); }
            catch (Exception) { }
            //Display Something on forms
            muvAccountView.SetActiveView(viewAddEmployee);
            perAccounts.loadProvinces();
            AccountFieldControl(false);
            cmbUserType.Visible = rbtnClients.Checked ? true : false;
        }
        else
        {
            //Popup Error
        }
    }
    protected void btnAddOrEdit_Click(object sender, EventArgs e)
    {
        ENUser ent = new ENUser();
        if (!rbtnClients.Checked)
        {
            ent.User_AccessLevel = Convert.ToInt32(hdnUserTypeValue.Value);
        }
        else
        {
            ent.User_AccessLevel = 1;
        }
        ent.User_Name = txtUserName.Text;
        ent.User_FName = perAccounts.FirstNameValue;
        ent.User_LName = perAccounts.LastNameValue;

        string[] values = perAccounts.Address;
        ent.User_HouseNo = Convert.ToInt32(values[0]);
        ent.User_SPS = values[1];
        try
        {
            ent.User_Loc = Convert.ToInt32(values[3]);/*================*/
        }catch(Exception){
            ent.User_Loc = 403;
        }

        values = EmpContactInfo.ContactInfo;
        ent.User_Email = values[0];
        try
        {
            ent.User_Mobile = Convert.ToInt64(values[1]);
        }catch(Exception){
            ent.User_Mobile = 0;
        }
        try
        {
            ent.User_Landline = Convert.ToInt32(values[2]);
        }catch(Exception){
            ent.User_Landline = 0;
        }

        if (btnAdd.Text == "Add")
        {
            ent.User_Password = Link.Security.Cryptography.Encryptor.EncryptIt(RandomText.Generate(), "srgerg$%^bg", Convert.FromBase64String("nvuiwjda"));
            //Sends the Password to the Email of the User for followup email confirmation and verification.
            if (new BSUser().Add(ent) <= 0)
            {
                //Popup Error
                //return;
            }
        }
        else if (btnAdd.Text == "Edit")
        {
            if (new BSUser().Edit(ent) <= 0)
            {
                //Popup Error
                //return;
            }
        }
        muvAccountView.SetActiveView(viewHeadOperation);
        UpdateUsersGridView();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        muvAccountView.SetActiveView(viewHeadOperation);
    }
    protected void btnRemoveEmployee_Click(object sender, EventArgs e)
    {
        if (gvDataGrid.SelectedIndex != -1)
        {
            //ENUser user = new BSUser().ClientById(gvDataGrid.SelectedRow.Cells[0].Text);
            if (new BSUser().Delete(gvDataGrid.Rows[gvDataGrid.SelectedIndex].Cells[1].Text) <= 0)
            {
                //
                //Response.Write("<script>Alert('<%=gvDataGrid.SelectedIndex%>')</script>");
            }
            else
            {
                UpdateUsersGridView(); 
            }
        }
    }
}