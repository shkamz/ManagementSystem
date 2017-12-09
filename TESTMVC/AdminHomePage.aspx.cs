using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;
using System.Configuration;

namespace TESTMVC
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (((string)Session["New"]) != "steve")
            {
                Response.Redirect("HomePage.aspx");
            }
            this.Calendar1.SelectedDate = DateTime.Now.Date;
            if (Session["New"] != null)
            {
                Label1.Text = Session["New"].ToString();
            }
            Label2.Text = System.DateTime.Now.ToString();

            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }
        }

        private void BindRepeater()
        {

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT  * FROM Announcement", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                }
                con.Close();
            }
        }
    }
}