using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using MySql.Data.MySqlClient;

namespace TESTMVC
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*)  from employee where Emp_name= '" + TextBoxUserName.Text + "'";
            MySqlCommand com = new MySqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                conn.Open();
                string checkPw = "select Password from employee where Emp_name = '" + TextBoxUserName.Text + "' ";
                MySqlCommand passComm = new MySqlCommand(checkPw, conn);
                string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                if (password == TextBoxPassword.Text)
                {
                    Session["New"] = TextBoxUserName.Text;
                    Response.Write("Password is correct");

                    if (TextBoxUserName.Text == "Steve" || TextBoxUserName.Text == "steve")
                    {
                        conn.Close();
                        Response.Redirect("AdminHomePage.aspx");
                        
                    }
                    else
                    {
                        conn.Close();
                        Response.Redirect("HomePage.aspx");
                    }

                }
                else
                {
                    Response.Write("Password is incorrect");
                }
            }
            else
            {
                Response.Write("Password is incorrect");
            }
            //conn.Close();

            /*Response.Redirect("Home.aspx")*/

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }
    }
}