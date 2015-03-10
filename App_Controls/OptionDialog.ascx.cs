using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OptionDialog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public string BehaviorID
    {
        set{
            modExtender.BehaviorID = value;
        }
    }
    public string Title { set { lblTitle.Text = value; } }
    public string btnOneText { set { btn1.Text = value; } }
    public string btnTwoText { set { btn2.Text = value; } }
    public string TargetID { set { modExtender.TargetControlID = value; } }

    public EventHandler btn1_Clicked;

    public void Show() {
        modExtender.Show();
    }
    public bool btn2Eye { set { btn2.Visible = value; } }
    public bool btn1Eye { set { btn1.Visible = value; } }


    protected void btn1_Click(object sender, EventArgs e)
    {
        if (btn1_Clicked != null)
            btn1_Clicked(this, EventArgs.Empty);
    }

    void Page_Init()
    {
        if (messageTemplate != null)
        {
            MessageContainer container = new MessageContainer("Some more articles here.");
            //TemplateControl container = new TemplateControl("Some more articles here.");
            messageTemplate.InstantiateIn(container);
            phldrMessage.Controls.Add(container);
        }
    }
    
    private ITemplate messageTemplate = null;

    //[TemplateContainer(typeof(MessageContainer))]
    //[PersistenceMode(PersistenceMode.InnerProperty)]
     //Browsable(false),
     //   MergableProperty(false),
    [
        PersistenceMode(PersistenceMode.InnerProperty),
          TemplateContainer(typeof(MessageContainer)),
          TemplateInstance(TemplateInstance.Single)]
    public ITemplate MessageTemplate
    {
        get
        {
            return messageTemplate;
        }
        set
        {
            messageTemplate = value;
        }
    }
    public class MessageContainer : Control, INamingContainer
    {
        private String m_message;
        internal MessageContainer(String message)
        {
            m_message = message;
        }

        public String Message
        {
            get
            {
                return m_message;
            }
        }
    }

    public string ValidationGroup {
        set {
            btn1.ValidationGroup = value;
        }
    }
}