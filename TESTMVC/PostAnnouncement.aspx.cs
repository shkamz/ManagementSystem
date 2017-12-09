using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TESTMVC
{
    public partial class PostAnnouncement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            if (FileUpload1.HasFile)
            {
                MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
                string querys = "insert into announcement" + "(Username,title,Message,ImageName,ImagePath,time,Date) values (@Uname,@title,@Message,@ImageName,@ImagePath,@time,@Date)";
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/images/" + filename));
                using (MySqlCommand cmd = new MySqlCommand(querys))
                {
                    cmd.Connection = cons;
                    //cmd.Parameters.AddWithValue("@ID", 1);
                    cmd.Parameters.AddWithValue("@Uname", "steve");
                    cmd.Parameters.AddWithValue("@title", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Message", TextBoxMsg.Text);
                    cmd.Parameters.AddWithValue("@ImageName", filename);
                    cmd.Parameters.AddWithValue("@ImagePath", "images/" + filename);
                    cmd.Parameters.AddWithValue("@time", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Today);
                    cons.Open();
                    cmd.ExecuteNonQuery();
                    cons.Close();
                }
            }
            else
            {
                MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
                string querys = "insert into announcement" + "(Username,title,Message,time,Date) values (@Uname,@title,@Message,@time,@Date)";

                using (MySqlCommand cmd = new MySqlCommand(querys))
                {
                    cmd.Connection = cons;
                    //cmd.Parameters.AddWithValue("@ID", 1);
                    cmd.Parameters.AddWithValue("@Uname", "steve");
                    cmd.Parameters.AddWithValue("@title", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Message", TextBoxMsg.Text);
                    cmd.Parameters.AddWithValue("@time", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Today);
                    cons.Open();
                    cmd.ExecuteNonQuery();
                    cons.Close();
                }
            }
        }
    }
    
}