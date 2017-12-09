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
    public partial class MyInfoDesign : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["New"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    LabelName.Text = Session["New"].ToString();
                    conn.Open();
                    string checkuser = "select Emp_name,FirstName,LastName,Emp_Position,Emp_LeaveBalance,Race,DOB,Religion,NRIC,Tel,Emp_ID,Emp_Department,Email,Nationality,Gender,Address,Emp_Age,Status,Password  from employee where Emp_name= '" + Session["New"].ToString() + "'";

                    MySqlCommand com = new MySqlCommand(checkuser, conn);
                    MySqlDataReader read = com.ExecuteReader();
                    //TextBoxName.Text = checkuser;
                    if (read.Read())
                    {
                        LabelName.Text = read["Emp_name"].ToString();  // for welcolme mesage.
                        TextBoxUn.Text = read["Emp_name"].ToString();
                        TextBoxFn.Text = read["FirstName"].ToString();
                        TextBoxLn.Text = read["LastName"].ToString();
                        TextBoxRace.Text = read["Race"].ToString();
                        TextBoxDOB.Text = read["DOB"].ToString();
                        TextBoxRel.Text = read["Religion"].ToString();
                        TextBoxDept.Text = read["Emp_Department"].ToString();
                        TextBoxNan.Text = read["Nationality"].ToString();
                        TextBoxGen.Text = read["Gender"].ToString();
                        TextBoxAdd.Text = read["Address"].ToString();
                        TextBoxAge.Text = read["Emp_Age"].ToString();
                        TextBoxPos.Text = read["Emp_Position"].ToString();
                        TextBoxPass.Text = read["Password"].ToString();
                        TextBoxBalance.Text = read["Emp_LeaveBalance"].ToString();
                        TextBoxTel.Text = read["Tel"].ToString();
                        TextBoxIC.Text = read["NRIC"].ToString();
                        TextBoxEn.Text = read["Email"].ToString();
                        Label2.Text = read["Emp_ID"].ToString();
                        Label3.Text = read["Emp_name"].ToString();
                        Label4.Text = read["Emp_Department"].ToString();
                        Label5.Text = read["Status"].ToString();
                        Label6.Text = read["NRIC"].ToString();
                        Label7.Text = read["Tel"].ToString();
                        Label8.Text = read["Email"].ToString();
                        
                        read.Close();
                        conn.Close();
                    }
                }
            }
            if (!IsPostBack)
            {
                this.BindGrid();
            }
        }

        //for image
        private void BindGrid()
        {
            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SELECT Content FROM Files where Emp_name= '" + Session["New"].ToString() + "'";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            //this is to check if image is exist or not....
            if (gvImages.Rows.Count == 0)
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string contentType = FileUpload1.PostedFile.ContentType;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        //MySqlConnection cons = new MySqlConnection(@"server=localhost;user id=root;database=fyp");

                        using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                        {
                            string query = "INSERT INTO Files(Emp_name,FileName, ContentType, Content) VALUES (@Emp,@FileName, @ContentType, @Content)";
                            using (MySqlCommand cmd = new MySqlCommand(query))
                            {
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@Emp", TextBoxUn.Text);
                                cmd.Parameters.AddWithValue("@FileName", filename);
                                cmd.Parameters.AddWithValue("@ContentType", contentType);
                                cmd.Parameters.AddWithValue("@Content", bytes);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
            }
            else
            {
                //buat update profile here.
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string contentType = FileUpload1.PostedFile.ContentType;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        //MySqlConnection cons = new MySqlConnection(@"server=localhost;user id=root;database=fyp");

                        using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                        {
                            string query = "update files set Emp_name=@Emp,FileName=@FileName, ContentType=@ContentType, Content=@Content where Emp_name = '" + Session["New"].ToString() + "' ";
                            using (MySqlCommand cmd = new MySqlCommand(query))
                            {
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@Emp", TextBoxUn.Text);
                                cmd.Parameters.AddWithValue("@FileName", filename);
                                cmd.Parameters.AddWithValue("@ContentType", contentType);
                                cmd.Parameters.AddWithValue("@Content", bytes);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
            
        }

        protected void gvImages_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (MySqlConnection cone = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                cone.Open();
                string query = "update employee set Emp_name = @Emp_name,FirstName = @FirstName,LastName = @LastName,Race = @Race,Religion = @Religion,Nationality = @Nationality,Gender = @Gender,Address = @Address, Email=@Email, Tel=@Tel, NRIC=@NRIC where Emp_name = '" + Session["New"].ToString() + "'";
                //MySqlCommand cmd = new MySqlCommand("update employee set Emp_name=@Emp_name,FirstName=@FirstName,LastName=@LastName,Race=@Race,DOB=@DOB,Religion=@Religion,NRIC=@NRIC,Tel=@Tel,Email=@Email,Nationality=@Nationality,Gender=@Gender,Address=@Address,Emp_Age=@Emp_Age where Emp_name= '" + Session["New"].ToString() + "'", con);  
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    
                    cmd.Connection = cone;
                    cmd.Parameters.AddWithValue("@Emp_name", TextBoxUn.Text);
                    cmd.Parameters.AddWithValue("FirstName", TextBoxFn.Text);
                    cmd.Parameters.AddWithValue("@LastName", TextBoxLn.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBoxEn.Text);
                    cmd.Parameters.AddWithValue("@Race", TextBoxRace.Text);
                    cmd.Parameters.AddWithValue("@Religion", TextBoxRel.Text);
                    cmd.Parameters.AddWithValue("@Nationality", TextBoxNan.Text);
                    cmd.Parameters.AddWithValue("@Gender", TextBoxGen.Text);
                    cmd.Parameters.AddWithValue("@Address", TextBoxAdd.Text);
                    cmd.Parameters.AddWithValue("@Tel", TextBoxTel.Text);
                    cmd.Parameters.AddWithValue("@NRIC", TextBoxIC.Text);
                    cmd.ExecuteNonQuery();
                    cone.Close();
                }
            }
        }
    }
}