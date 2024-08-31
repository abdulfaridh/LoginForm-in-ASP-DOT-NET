using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginForm_in_ASP_DOT_NET
{
    public partial class LOGIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox2.Attributes["type"] = "password";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-SPTVSQVM\\SQLEXPRESS;Initial Catalog=asplogin;Integrated Security=True;TrustServerCertificate=True");
            con.Open();
            string loginQuery = "select COUNT(username) FROM login WHERE username = @username AND password = @password";
            SqlCommand cmd = new SqlCommand(loginQuery, con);
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);
            int count = (int)cmd.ExecuteScalar();
            con.Close();
            if(count > 0 )
            {
                Response.Write("<script>alert('login succesfull');</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
            }
            else
            {
                Response.Write("<script>alert('invalid login');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}