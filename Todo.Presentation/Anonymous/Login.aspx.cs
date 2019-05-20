using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Todo.Domain;

namespace Todo.Presentation
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var entity = new UserEntity();
            Tuple<bool,string,string> result = entity.Authenticate(txtUserName.Text.Trim(), txtPassword.Text.Trim());
            if (result.Item1)
            {
                Response.SetCookie(new HttpCookie("at", result.Item3));
                FormsAuthentication.RedirectFromLoginPage(result.Item2, rememberMeChkBox.Checked);
            }
            else
            {
                lblError.Text = result.Item2;
                lblError.Visible = true;
            }

        }
    }
}