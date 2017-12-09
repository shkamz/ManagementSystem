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
    public partial class NewHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to check hw mny leave pending, to assign to badge.....
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            conn.Open();
            string checkattendance = "select Count(Emp_name) from leavework where Leave_Status = 'Pending' ";
            MySqlCommand coms = new MySqlCommand(checkattendance, conn);
            Int32 row = Convert.ToInt32(coms.ExecuteScalar());
            coms.Dispose();
            spnMyTask.InnerText = row.ToString();
            conn.Close();

            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }
        }
        private void BindRepeater()
        {

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT Username,Date,Title,Message,ImagePath FROM Announcement order by ID desc", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                }con.Close();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            string querys = "insert into attendance" + "(Emp_name,LogIn_Time,date) values (@Emp_name,@LogIn_Time,@date)";

            using (MySqlCommand cmd = new MySqlCommand(querys))
            {
                string name = Session["New"].ToString();
                cmd.Connection = cons;
                //cmd.Parameters.AddWithValue("@ID", 1);
                cmd.Parameters.AddWithValue("@Emp_name", name);
                cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@LogIn_Time", DateTime.Now.ToString("HH:mm:ss tt"));
                cons.Open();
                cmd.ExecuteNonQuery();
                cons.Close();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string name = Session["New"].ToString();
            string datecheck = DateTime.Now.ToString("yyyy-MM-dd");
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            conn.Open();
            string query = ("select LogIn_Time from attendance where Emp_name = '" + Session["New"].ToString() + "' AND date = '" + datecheck + "'"); //this is to get the login time for subtract with checkout time. 
            MySqlCommand com = new MySqlCommand(query, conn);
            MySqlDataReader read = com.ExecuteReader();
            string gettime = "7:00 AM";
            if (read.Read())
            {
                gettime = read["LogIn_time"].ToString();  // for welcolme mesage. 
                read.Close();
                conn.Close();
            }
            //TextBox1.Text = gettime;
            MySqlCommand cmd = new MySqlCommand("update attendance Set LogOut_Time = @LogOut_Time, Hours_Worked = @Hours_Worked where Emp_name = @Emp_name AND date=@date", conn);
            string startTime = gettime;
            string endTime = DateTime.Now.ToString();
            TimeSpan duration = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
            string time = duration.ToString();
            cmd.Parameters.AddWithValue("@Emp_name", name);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@LogOut_Time", DateTime.Now.ToString("HH:mm:ss tt")); //HH means for 24h format.
            cmd.Parameters.AddWithValue("@Hours_Worked", time);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            //double test = double.Parse(duration.Minutes.ToString());
            // double durationn = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
            //TextBox1.Text = test;

        }
        //send announcement
        protected void Button3_Click(object sender, EventArgs e)
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
                    cmd.Parameters.AddWithValue("@title", TextBoxTitle.Text);
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
                    cmd.Parameters.AddWithValue("@title", TextBoxTitle.Text);
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