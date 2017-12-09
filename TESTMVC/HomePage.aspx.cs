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
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if the user is admin, bring this to adminhomepage
            if (((string)Session["New"]) == "steve")
            {
                Response.Redirect("AdminHomePage.aspx");
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
                using (MySqlCommand cmd = new MySqlCommand("SELECT Username,time,Title,Message,ImagePath FROM Announcement order by ID desc", con))
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

        //insert to login time....
        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            string querys = "insert into attendance" + "(Emp_name,LogIn_Time,date,Days) values (@Emp_name,@LogIn_Time,@date,@days)";

            using (MySqlCommand cmd = new MySqlCommand(querys))
            {
                string name = Session["New"].ToString();
                cmd.Connection = cons;
                //cmd.Parameters.AddWithValue("@ID", 1);
                cmd.Parameters.AddWithValue("@Emp_name", name );
                cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@LogIn_Time", DateTime.Now.ToString("HH:mm:ss tt"));
                cmd.Parameters.AddWithValue("@days", DateTime.Now.ToString("dddd"));
                cons.Open();
                cmd.ExecuteNonQuery();
                cons.Close(); 
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string name = Session["New"].ToString() ;
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
            MySqlCommand cmd = new MySqlCommand("update attendance Set LogOut_Time = @LogOut_Time, Hours_Worked = @Hours_Worked, Overtime=@Overtime where Emp_name = @Emp_name AND date=@date", conn);
            string startTime = gettime ;
            string endTime = DateTime.Now.ToString();
            TimeSpan duration = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
            int hour = duration.Hours;
            int min = duration.Minutes;
            int secs = duration.Seconds;
            string time = duration.ToString();
            // get number of overtime .....
            int overtime;
            if (hour >= 8)
            {
                overtime = hour - 8;
            }
            else
            {
                overtime = 0;
            }
            cmd.Parameters.AddWithValue("@Emp_name", name);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@LogOut_Time", DateTime.Now.ToString("HH:mm:ss tt")); //HH means for 24h format.
            cmd.Parameters.AddWithValue("@Hours_Worked", hour); // tuka hour to time if kalau nk tgk total hours with seconds......
            cmd.Parameters.AddWithValue("@Overtime", overtime);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            
            
            //double test = double.Parse(duration.Minutes.ToString());
            // double durationn = DateTime.Parse(endTime).Subtract(DateTime.Parse(startTime));
            //TextBox1.Text = test;

        }
    }
}