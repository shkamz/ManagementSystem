using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using MySql.Data.MySqlClient;
using System.Web.Script.Services;
using System.Data;

namespace TESTMVC
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to populate dropdwon..
            if (!this.IsPostBack)
            {
                //populate to dropdownlist.
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT Emp_name from employee"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            DropDownList1.DataSource = ds.Tables[0];
                            DropDownList1.DataTextField = "Emp_Name";
                            DropDownList1.DataValueField = "Emp_Name";
                            DropDownList1.DataBind();
                        }
                    }con.Close();
                }
                DropDownList1.Items.Insert(0, new ListItem("--Select Employee--", "0"));
                //Select1.Items.Insert(0, new ListItem("--Select TaskName--", "0"));
            }
        }

        //this is for autocomplete using jquery.
        [WebMethod]
        public static List<string> GetCities(string cityname)
        {
            List<string> City = new List<string>();
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            string query = string.Format("SELECT Emp_name FROM employee WHERE Emp_name LIKE '%{0}%'", cityname);
            //Note: you can configure Connection string in web.config also.
            MySqlCommand cmd = new MySqlCommand(query, con);
            con.Open();
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                City.Add(reader.GetString(0));
            }
            return City;
        }


        //this is for search and value populated in text box.
        protected void Button1_Click(object sender, EventArgs e)
        {
            //this is to call the value selected from jquery.
            string u = DropDownList1.SelectedValue;
            //string customerName = Request.Form[TextBox1.UniqueID];
            // string customerId = Request.Form[hfCustomerId.UniqueID];
            //TextBoxUn.Text = customerName;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            conn.Open();
            //add below here to search more from database.
            string checkuser = "select Emp_name, Race, DOB, Religion, NRIC, Tel, Emp_ID, Emp_Department, Email, Nationality, Gender,Emp_Age  from employee where Emp_name = '" + u + "'";
            MySqlCommand com = new MySqlCommand(checkuser, conn);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBoxUn.Text = read["Emp_name"].ToString();
                TextBoxEn.Text = read["Email"].ToString();
                TextBoxDOB.Text = read["DOB"].ToString();
                TextBoxRace.Text = read["Race"].ToString();
                TextBoxTel.Text = read["Tel"].ToString();
                TextBoxNRIC.Text = read["NRIC"].ToString();
                TextBoxDept.Text = read["Emp_Department"].ToString();
                TextBoxRel.Text = read["Religion"].ToString();
                TextBoxNan.Text = read["Nationality"].ToString();
                TextBoxAge.Text = read["Emp_Age"].ToString();
                read.Close();
                conn.Close();
            }
            conn.Close();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SELECT Content FROM Files where Emp_name= '" + u + "'";
                    cmd.Connection = con;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
                    }
                }con.Close();
            }
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                byte[] bytes = (byte[])(e.Row.DataItem as DataRowView)["Content"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                (e.Row.FindControl("Image1") as Image).ImageUrl = "data:image/png;base64," + base64String;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //this is to call the value selected from jquery.
            string u = DropDownList1.SelectedValue;
            //string customerName = Request.Form[TextBox1.UniqueID];
            // string customerId = Request.Form[hfCustomerId.UniqueID];
            //TextBoxUn.Text = customerName;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            conn.Open();
            //add below here to search more from database.
            string checkuser = "select Emp_ID,Emp_name,FirstName,LastName,Emp_Position,Status, Race, DOB, Religion, NRIC, Tel, Emp_ID, Emp_Department, Email, Nationality, Gender,Emp_Age,Address  from employee where Emp_name = '" + u + "'";
            MySqlCommand com = new MySqlCommand(checkuser, conn);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBoxUn.Text = read["Emp_name"].ToString();
                TextBoxID.Text = read["Emp_ID"].ToString();
                TextBoxEn.Text = read["Email"].ToString();
                TextBoxFn.Text = read["FirstName"].ToString();
                TextBoxLn.Text = read["LastName"].ToString();
                TextBoxDOB.Text = read["DOB"].ToString();
                TextBoxRace.Text = read["Race"].ToString();
                TextBoxTel.Text = read["Tel"].ToString();
                TextBoxNRIC.Text = read["NRIC"].ToString();
                TextBoxDept.Text = read["Emp_Department"].ToString();
                TextBoxRel.Text = read["Religion"].ToString();
                TextBoxNan.Text = read["Nationality"].ToString();
                TextBoxGen.Text = read["Gender"].ToString();
                TextBoxAge.Text = read["Emp_Age"].ToString();
                TextBoxStat.Text = read["Status"].ToString();
                TextBoxPos.Text = read["Emp_Position"].ToString();
                //int g = Convert.ToInt32(read["Emp_ID"]); this is to conver value fromd atabase to int...

                read.Close();
                conn.Close();
            }
            conn.Close();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SELECT Content FROM Files where Emp_name= '" + u + "'";
                    cmd.Connection = con;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
                    }
                }con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string name = DropDownList1.SelectedValue;
            using (MySqlConnection cone = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                cone.Open();
                string query = "update employee set Emp_name=@Emp_name,FirstName=@FirstName,LastName=@LastName,Race=@Race,Religion=@Religion,Nationality=@Nationality,Gender=@Gender,Email=@Email,Tel=@Tel,NRIC=@NRIC,Emp_Position=@Emp_Position where Emp_name = '" + name + "'";
                //MySqlCommand cmd = new MySqlCommand("update employee set Emp_name=@Emp_name,FirstName=@FirstName,LastName=@LastName,Race=@Race,DOB=@DOB,Religion=@Religion,NRIC=@NRIC,Tel=@Tel,Email=@Email,Nationality=@Nationality,Gender=@Gender,Address=@Address,Emp_Age=@Emp_Age where Emp_name= '" + Session["New"].ToString() + "'", con);  
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = cone;
                    cmd.Parameters.AddWithValue("@Emp_name", TextBoxUn.Text);
                    cmd.Parameters.AddWithValue("@FirstName", TextBoxFn.Text);
                    cmd.Parameters.AddWithValue("@LastName", TextBoxLn.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBoxEn.Text);
                    cmd.Parameters.AddWithValue("@Race", TextBoxRace.Text);
                    cmd.Parameters.AddWithValue("@Religion", TextBoxRel.Text);
                    cmd.Parameters.AddWithValue("@Nationality", TextBoxNan.Text);
                    cmd.Parameters.AddWithValue("@Gender", TextBoxGen.Text);
                    //cmd.Parameters.AddWithValue("@Address", TextBoxAdd.Text);
                    cmd.Parameters.AddWithValue("@Tel", TextBoxTel.Text);
                    cmd.Parameters.AddWithValue("@NRIC", TextBoxNRIC.Text);
                    cmd.Parameters.AddWithValue("@Emp_Position", TextBoxPos.Text);
                    cmd.ExecuteNonQuery();
                    cone.Close();
                }

            }
        }
    }
}