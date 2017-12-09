using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Services;
using MySql.Data.MySqlClient;
using System.Web.Script.Services;
using System.Data;

namespace TESTMVC
{
    public partial class ViewWorkProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to populate dropdwon..
            if (!this.IsPostBack)
            {
                //populate to dropdownlist.
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT DISTINCT(TaskName) from work where status = 'Ongoing' "))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            DropDownList1.DataSource = ds.Tables[0];
                            DropDownList1.DataTextField = "TaskName";
                            DropDownList1.DataValueField = "TaskName";
                            DropDownList1.DataBind();
                            con.Close();
                        }
                    }
                }
                DropDownList1.Items.Insert(0, new ListItem("--Select Task--", "0"));
                //Select1.Items.Insert(0, new ListItem("--Select TaskName--", "0"));
            }
        }

        protected void SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //this is to call the value selected from jquery.
            string u = DropDownList1.SelectedValue;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "Select TaskName,TaskDescription,StartDate,EndDate,Status,Comment from work where TaskName = '" + u + "'";
            MySqlCommand com = new MySqlCommand(checkuser, conn);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBox1.Text = read["TaskName"].ToString();
                TextBox2.Text = read["TaskDescription"].ToString();
                TextBox3.Text = read["StartDate"].ToString();
                TextBox4.Text = read["EndDate"].ToString();
                TextBox5.Text = read["Status"].ToString();
                TextBox6.Text = read["Comment"].ToString();
                read.Close();
                conn.Close();
            }
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT Username from work where TaskName = '" + u + "'"))
                {
                    using (MySqlDataAdapter da = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        da.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            da.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            con.Close();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //this is to call the value selected from jquery.
            string u = DropDownList1.SelectedValue;
            //MySqlConnection conn = new MySqlConnection(@"server=127.0.0.1;user id=root;database=fyp");
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            conn.Open();
            string checkuser = "Select TaskName,TaskDescription,StartDate,EndDate,Status,Comment from work where TaskName = '" + u + "'";
            MySqlCommand com = new MySqlCommand(checkuser, conn);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBox1.Text = read["TaskName"].ToString();
                TextBox2.Text = read["TaskDescription"].ToString();
                TextBox3.Text = read["StartDate"].ToString();
                TextBox4.Text = read["EndDate"].ToString();
                TextBox5.Text = read["Status"].ToString();
                TextBox6.Text = read["Comment"].ToString();
                
                read.Close();
                conn.Close();
            }

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT Username from work where TaskName = '" + u + "'"))
                {
                    using (MySqlDataAdapter da = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        da.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            da.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            con.Close();
                        }
                    }
                }
            }
        }
    }
}