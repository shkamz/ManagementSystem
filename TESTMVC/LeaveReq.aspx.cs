using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;
using System.Drawing;
using System.Globalization;

namespace TESTMVC
{
    public partial class LeaveReq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = Session["New"].ToString();
            BuildSocialEventTable();

            if (!this.IsPostBack)
            {
                //populate to dropdownlist.
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT Emp_name,Leave_Id FROM leavework where leave_status = 'Pending' Group By Emp_name "))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            ddlCustomers.DataSource = ds.Tables[0];
                            ddlCustomers.DataTextField = "Emp_Name";
                            ddlCustomers.DataValueField = "Emp_Name"; // kalau x jadi tuka to leave_ID
                            ddlCustomers.DataBind();
                        }
                    }
                    con.Close();
                }
                ddlCustomers.Items.Insert(0, new ListItem("--Select Id--", "0"));
            }
        }

        //for populate to calendar
        private void BuildSocialEventTable()
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            con.Open();
            MySqlDataAdapter sda = new MySqlDataAdapter("select Leave_Date,Leave_EndDate,Emp_name,Leave_Desc from leavework", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            socialEvents = ds.Tables[0];
            con.Close();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string where = "Leave_Date >= '" + e.Day.Date.ToString("dd-MMM-yyyy") + "' AND Leave_Date <'" + e.Day.Date.AddDays(1).ToString("dd-MMM-yyyy") + "'";

            DataRow[] rows = socialEvents.Select(where);



            foreach (DataRow row in rows)
            {
                System.Web.UI.WebControls.Image image;
                image = new System.Web.UI.WebControls.Image();
                image.ImageUrl = "dot.gif";
                image.ToolTip = row["Leave_Desc"].ToString(); //change here kalau nk letak nama.
                e.Cell.BackColor = Color.Wheat;
                e.Cell.Controls.Add(image);
                e.Cell.BackColor = Color.Blue;
            }
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string where = "Leave_Date >= '" + Calendar1.SelectedDate.ToString("dd-MMM-yyyy") + "' AND Leave_Date <'" + Calendar1.SelectedDate.AddDays(1).ToString("dd-MMM-yyyy") + "'";

            System.Data.DataView view = socialEvents.DefaultView;

            view.RowFilter = String.Format(where);

            if (view.Count > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = view;
                GridView1.DataBind();
            }
            else
            {
                GridView1.Visible = false;
            }
        }

        protected System.Web.UI.WebControls.DataGrid DataGrid1;
        private DataTable socialEvents;
        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.Calendar1.DayRender += new System.Web.UI.WebControls.DayRenderEventHandler(this.Calendar1_DayRender);
            this.Calendar1.SelectionChanged += new System.EventHandler(this.Calendar1_SelectionChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        //for populate to dropdown and textbox.
        protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string u = ddlCustomers.SelectedValue;
            MySqlConnection load = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            load.Open();
            string checkuser = "select Emp_name,Leave_Date,Leave_EndDate,Leave_Desc,Leave_Type,Leave_Status from leavework where Emp_name= '" + u + "' AND Leave_status = 'Pending' ";
            MySqlCommand com = new MySqlCommand(checkuser, load);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBoxName.Text = read["Emp_name"].ToString();
                //TextBoxDate.Text = read["Leave_Date"].ToString();
                //TextBoxEndDate.Text = read["Leave_EndDate"].ToString();
                DateTime fd = DateTime.Parse(read["Leave_Date"].ToString()); // <<assign date to date textmode...
                DateTime d = DateTime.Parse(read["Leave_EndDate"].ToString());
                TextBoxReason.Text = read["Leave_Desc"].ToString();
                TextBoxType.Text = read["Leave_Type"].ToString();
                TextBoxStatus.Text = read["Leave_Status"].ToString();
                //TextBoxDob.Text = read["DOB"].ToString();
                read.Close();
                TextBoxDate.Text = fd.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                TextBoxEndDate.Text = d.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                //string f = TextBoxEndDate.ToString("yyyy-MM-dd");
            }
            load.Close();

            //check leave balance....
            load.Open();
            string checkleave = "select Emp_LeaveBalance from employee where Emp_name= '" + u + "'";
            MySqlCommand leave = new MySqlCommand(checkleave, load);
            MySqlDataReader readleave = leave.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (readleave.Read())
            {
                TextBoxLeave.Text = readleave["Emp_LeaveBalance"].ToString();
            }
            load.Close();
            int leavebalance = Convert.ToInt32(TextBoxLeave.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string u = ddlCustomers.SelectedValue;
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            cons.Open();
            string query = "Update leavework set leave_status = 'Approved', Leave_EndDate= '" + TextBoxEndDate.Text +"' where Emp_Name= '" + u + "' AND Leave_Desc = '" + TextBoxReason.Text + "'";
            MySqlCommand coms = new MySqlCommand(query, cons);
            coms.ExecuteNonQuery();
            cons.Close();
            
            //check how many days employee selected...
            DateTime sdt = DateTime.Parse(TextBoxDate.Text);
            DateTime edt = DateTime.Parse(TextBoxEndDate.Text);
            int f = (edt - sdt).Days;
            int leavebalance = Convert.ToInt32(TextBoxLeave.Text);
            int left = leavebalance - f;

            //update emplyoee leavebalance
            cons.Open();
            string queryleave = "Update employee set Emp_LeaveBalance = '" + left + "' where Emp_Name= '" + u + "'";
            MySqlCommand comleave = new MySqlCommand(queryleave, cons);
            comleave.ExecuteNonQuery();
            cons.Close();


            //send sms
            string tel = string.Empty;
            cons.Open();
            string ul = ddlCustomers.SelectedValue;
            TextBox2.Text = ul;
            string querys = "select Tel from employee where Emp_name = '" + ul + "'";
            MySqlCommand comss = new MySqlCommand(querys, cons);
            MySqlDataReader read = comss.ExecuteReader();
            if (read.Read())
            {
                tel = read["Tel"].ToString();
                TextBox2.Text = read["Tel"].ToString();
                read.Close();
            }
            TextBox2.Text = tel;

            //send sms here
            using (System.Net.WebClient client = new System.Net.WebClient())
            {
                try
                {
                    string msg = "Your Leave is approved from! ";
                    string url = "http://smsc.vianett.no/v3/send.ashx?" +
                        "src=" + tel + "&" +
                        "dst=" + tel + "&" +
                        "msg=" + System.Web.HttpUtility.UrlEncode(msg, System.Text.Encoding.GetEncoding("ISO-8859-1")) + "&" +
                    //"username=" + "shukriarmizi@yahoo.com" + "&" +
                    //"password=" + "pjz8l";  //"fyptest2017mmu@gmail.com" "bvun"
                    "username=" + System.Web.HttpUtility.UrlEncode("shukriarmizi@yahoo.com") + "&" +
                    "password=" + System.Web.HttpUtility.UrlEncode("pjz8l");
                    string result = client.DownloadString(url);
                    if (result.Contains("OK"))
                        Response.Write("Send");
                    else
                        Response.Write("Failed");

                }
                catch (System.Net.WebException ex)
                {
                    //Error occurred while connecting to server.
                    Response.Write(ex.Message);
                }
            }cons.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string u = ddlCustomers.SelectedValue;
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            cons.Open();
            string query = "Update leavework set leave_status = 'Rejected' where Emp_name= '" + u + "' AND Leave_Desc = '" + TextBoxReason.Text + "'";
            MySqlCommand coms = new MySqlCommand(query, cons);
            coms.ExecuteNonQuery();
            cons.Close();
            string tel = string.Empty;
            cons.Open();
            //check how many days employee selected...
            DateTime sdt = DateTime.Parse(TextBoxDate.Text);
            DateTime edt = DateTime.Parse(TextBoxEndDate.Text);
            int f = (edt - sdt).Days;
            //send sms.
            string ul = ddlCustomers.SelectedValue;
            TextBox2.Text = ul;
            string querys = "select Tel from employee where Emp_name = '" + ul + "'";
            MySqlCommand comss = new MySqlCommand(querys, cons);
            MySqlDataReader read = comss.ExecuteReader();
            if (read.Read())
            {
                tel = read["Tel"].ToString();
                TextBox2.Text = read["Tel"].ToString();
                read.Close();
            }
            TextBox2.Text = tel;

            //send sms here
            using (System.Net.WebClient client = new System.Net.WebClient())
            {
                try
                {
                    string msg = "Your Leave is Rejected!";
                    string url = "http://smsc.vianett.no/v3/send.ashx?" +
                        "src=" + tel + "&" +
                        "dst=" + tel + "&" +
                        "msg=" + System.Web.HttpUtility.UrlEncode(msg, System.Text.Encoding.GetEncoding("ISO-8859-1")) + "&" +
                    //"username=" + "shukriarmizi@yahoo.com" + "&" +
                    //"password=" + "pjz8l";  //"fyptest2017mmu@gmail.com" "bvun"
                    "username=" + System.Web.HttpUtility.UrlEncode("shukriarmizi@yahoo.com") + "&" +
                    "password=" + System.Web.HttpUtility.UrlEncode("pjz8l");
                    string result = client.DownloadString(url);
                    if (result.Contains("OK"))
                        Response.Write("Send");
                    else
                        Response.Write("Failed");

                }
                catch (System.Net.WebException ex)
                {
                    //Error occurred while connecting to server.
                    Response.Write(ex.Message);
                }
            }
            cons.Close();
        }
    }
}