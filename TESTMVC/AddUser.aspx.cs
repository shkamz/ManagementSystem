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
using System.Net;
using System.Net.Mail;

namespace TESTMVC
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
                string querys = "insert into employee" + "(Emp_name,Emp_Department,Emp_Age,Email,Password,Tel,Race,Religion,NRIC,Nationality,DOB,Gender,FirstName,LastName,Emp_Position,Role,Address,Emp_Salary,Emp_LeaveBalance) values (@Emp_name,@Emp_Department,@Emp_Age,@Email,@Password,@Tel,@Race,@Religion,@NRIC,@Nationality,@DOB,@Gender,@FirstName,@LastName,@Emp_Position,@Role,@Address,@Emp_Salary,@Emp_LeaveBalance)";

                using (MySqlCommand cmd = new MySqlCommand(querys))
                {
                    string u = "6" + TextBoxTel.Text;
                    cmd.Connection = cons;
                    //cmd.Parameters.AddWithValue("@ID", 1);
                    cmd.Parameters.AddWithValue("@Emp_name", TextBoxName.Text);
                    cmd.Parameters.AddWithValue("@Emp_Department", DropDownListDept.Text);
                    cmd.Parameters.AddWithValue("@Emp_Age", TextBoxAge.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBoxEn.Text);
                    cmd.Parameters.AddWithValue("@Password", TextBoxPass.Text);
                    cmd.Parameters.AddWithValue("@Tel", u);
                    cmd.Parameters.AddWithValue("@Race", DropDownListRace.Text);
                    cmd.Parameters.AddWithValue("@Religion", DropDownListRel.Text);
                    cmd.Parameters.AddWithValue("@NRIC", TextBoxIC.Text);
                    cmd.Parameters.AddWithValue("@Nationality", DropDownListNan.Text);
                    cmd.Parameters.AddWithValue("@DOB", TextBoxDOB.Text);
                    cmd.Parameters.AddWithValue("@Gender", DropDownListGen.Text);
                    cmd.Parameters.AddWithValue("@FirstName", TextBoxFn.Text);
                    cmd.Parameters.AddWithValue("@LastName", TextBoxLn.Text);
                    cmd.Parameters.AddWithValue("@Emp_Position", TextBoxPos.Text);
                    cmd.Parameters.AddWithValue("@Role", DropDownListRole.Text);
                    cmd.Parameters.AddWithValue("Address", TextBoxAddress.Text);
                    cmd.Parameters.AddWithValue("Emp_Salary", TextBoxSalary.Text);
                    cmd.Parameters.AddWithValue("Emp_LeaveBalance", 20);

                    cons.Open();
                    cmd.ExecuteNonQuery();
                    cons.Close();

                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("fyptest2017mmu@gmail.com", "babi12345");
                    MailMessage msgobj = new MailMessage();
                    msgobj.To.Add(TextBoxEn.Text);
                    msgobj.From = new MailAddress("fyptest2017mmu@gmail.com");
                    msgobj.Subject = "Login Information ";
                    msgobj.Body = "Login Info \n  Username : " + TextBoxName.Text + " Password: " + TextBoxPass.Text;
                    client.Send(msgobj);
                    string message = "You have added a new employee";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += Request.Url.AbsoluteUri;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }


            catch (Exception ex)
            {
                //Response.Write("Error"+ ex.ToString());
                Response.Write("coulndt send " + ex.Message);
            }  
        }
    }
}