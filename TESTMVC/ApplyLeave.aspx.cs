using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;

namespace TESTMVC
{
    public partial class ApplyLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LabelName.Text = Session["New"].ToString();

            if (((string)Session["New"]) == "steve")
            {
                Response.Redirect("LeaveReq.aspx");
            }

            if (Session["New"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            //testing.Visible = false;
            testing.Style["display"] = "none";
            //populate employee leavebalance left..
            MySqlConnection load = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            load.Open();
            string checkleave = "select Emp_LeaveBalance from employee where Emp_name= '" + Session["New"].ToString() + "'";
            MySqlCommand leave = new MySqlCommand(checkleave, load);
            MySqlDataReader readleave = leave.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (readleave.Read())
            {
                TextBox2.Text = readleave["Emp_LeaveBalance"].ToString();
            }
            load.Close();
        }

        public void DateChange(object sender, EventArgs e)
        {
            TextBoxDate.Text = Calendar1.SelectedDate.Year.ToString() + '-' + Calendar1.SelectedDate.Month.ToString() + '-' + Calendar1.SelectedDate.Day.ToString();
            DateTime date1 = new DateTime(Calendar1.SelectedDate.Year, Calendar1.SelectedDate.Month, Calendar1.SelectedDate.Day);
        }
        public void DateChange1(object sender, EventArgs e)
        {
            TextBoxLastDate.Text = Calendar2.SelectedDate.Year.ToString() + '-' + Calendar2.SelectedDate.Month.ToString() + '-' + Calendar2.SelectedDate.Day.ToString();
            DateTime date2 = new DateTime(Calendar2.SelectedDate.Year, Calendar2.SelectedDate.Month, Calendar2.SelectedDate.Day);
            DateTime sdt = Calendar1.SelectedDate; //to get number of days between dates.
            DateTime edt = Calendar2.SelectedDate;
            int f = (edt - sdt).Days;
            TextBox1.Text = f.ToString();
            //to minus with the textbox to get hw mny the employee leavebalance left...
            int lil = Convert.ToInt32(TextBox2.Text) - Convert.ToInt32(TextBox1.Text);
            TextBox2.Text = lil.ToString();
            //int test = Convert.ToInt32(TextBox1.Text);
        }
        //apply leave.
        protected void SubmitLeave_Click(object sender, EventArgs e)
        {
            //remember to change the violation of primary key, username same cannot apply leave byk kali.
            string un = Session["New"].ToString();
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into leavework (Leave_Date,Leave_EndDate,Leave_Desc,Emp_name,Leave_Type) values (@LD ,@LED ,@LDS,@Un,@LT)";
            MySqlCommand com = new MySqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@Un", un);
            com.Parameters.AddWithValue("@LD", TextBoxDate.Text);
            com.Parameters.AddWithValue("@LED", TextBoxLastDate.Text);
            com.Parameters.AddWithValue("@LDS", TextAreaRe.Text);
            com.Parameters.AddWithValue("@LT", DropDownList1.Text);
            com.ExecuteNonQuery();
            conn.Close();

            //alert script...
            string message = "You have apply leave, an sms will be send to you once your leave is approve/rejected. Thank You.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            testing.Style["display"] = "inline";
        }
    }
}