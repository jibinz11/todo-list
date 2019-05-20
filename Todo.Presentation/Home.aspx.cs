using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Todo.Presentation
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserName.InnerText = this.User.Identity.Name;
        }

        protected void btnLogout_Click(object sender, ImageClickEventArgs e)
        {
            FormsAuthentication.SignOut();
        }
    }
}