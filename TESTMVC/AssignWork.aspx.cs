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
using System.Globalization;
using Nexmo.Api;

namespace TESTMVC
{
    public partial class AssignWork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*LabelName.Text = Session["New"].ToString();

            if (((string)Session["New"]) != "steve")
            {
                Response.Redirect("ViewMyWork.aspx");
            }*/
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
                            //DropDownList1.DataSource = ds.Tables[0];
                            //DropDownList1.DataTextField = "Emp_Name";
                            //DropDownList1.DataValueField = "Emp_Name";
                            //DropDownList1.DataBind();
                            ListBox1.DataSource = ds.Tables[0];
                            ListBox1.DataTextField = "Emp_Name";
                            ListBox1.DataValueField = "Emp_Name";
                            ListBox1.DataBind();
                        }
                    }
                    con.Close();
                }
               // DropDownList1.Items.Insert(0, new ListItem("--Select Employee--", "0"));
                //Select1.Items.Insert(0, new ListItem("--Select TaskName--", "0"));

            }
            if (!this.IsPostBack)
            {
                //populate to dropdownlist.
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT DISTINCT(TaskName) from work where status = 'Ongoing'"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            DropBoxCurrentTask.DataSource = ds.Tables[0];
                            DropBoxCurrentTask.DataTextField = "TaskName";
                            DropBoxCurrentTask.DataValueField = "TaskName";
                            DropBoxCurrentTask.DataBind();
                        }
                    }
                    con.Close();
                }
                DropBoxCurrentTask.Items.Insert(0, new ListItem("--Select Task--", ""));
                //Select1.Items.Insert(0, new ListItem("--Select TaskName--", "0"));
            }
        }

        //protected void DateChange(object sender, EventArgs e)
        //{
        //    TextBoxStartDate.Text = Calendar1.SelectedDate.Year.ToString() + '-' + Calendar1.SelectedDate.Month.ToString() + '-' + Calendar1.SelectedDate.Day.ToString();
        //}
        //protected void DateChange1(object sender, EventArgs e)
        //{
        //    TextBoxEndDate.Text = Calendar2.SelectedDate.Year.ToString() + '-' + Calendar2.SelectedDate.Month.ToString() + '-' + Calendar2.SelectedDate.Day.ToString();
        //}
        //populate current task description to the textbox.....
        protected void DropBoxTask_SelectedIndexChanged(object sender, EventArgs e)
        {
            string u = DropBoxCurrentTask.SelectedValue;
            TextBoxName.Enabled = false;
            if (u == "") { TextBoxName.Enabled = true; }
            MySqlConnection load = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            load.Open();
            string checkuser = "select TaskDescription,StartDate,EndDate from work where TaskName = '" + u + "' ";
            MySqlCommand com = new MySqlCommand(checkuser, load);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBoxDesc.Text = read["TaskDescription"].ToString();
                DateTime fd = DateTime.Parse(read["StartDate"].ToString()); // <<assign date to date textmode...
                DateTime d = DateTime.Parse(read["EndDate"].ToString());
                TextBoxStartDate.Text = fd.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                TextBoxEndDate.Text = d.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

                //TextBoxDob.Text = read["DOB"].ToString();
                read.Close();
            }
            load.Close();
        }
        protected void Upload(object sender, EventArgs e)
        {
            //string u = DropDownList1.SelectedValue;
            string f = DropBoxCurrentTask.SelectedValue;
            //string f = Select1.DataTextField;
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            string TaskName = TextBoxName.Text + f;
            /*string querys = "insert into work" + "(TaskName,TaskDescription,StartDate,EndDate,Username) values (@TaskName,@TaskDescription,@StartDate,@EndDate,@UN)";
            using (MySqlCommand cmd = new MySqlCommand(querys))
            {
                cmd.Connection = cons;
                string TaskName = TextBoxName.Text + f;
                //cmd.Parameters.AddWithValue("@ID", 1);
                cmd.Parameters.AddWithValue("@TaskName", TaskName);
                cmd.Parameters.AddWithValue("@TaskDescription", TextBoxDesc.Text);
                cmd.Parameters.AddWithValue("@StartDate", TextBoxStartDate.Text);
                cmd.Parameters.AddWithValue("@EndDate", TextBoxEndDate.Text);
                cmd.Parameters.AddWithValue("@UN", u);
                cons.Open();
                cmd.ExecuteNonQuery();
                cons.Close();
            }*/

            MySqlConnection conss = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);

            string insertwork = "insert into work" + "(TaskName,TaskDescription,StartDate,EndDate,Username) values (@TaskName,@TaskDescription,@StartDate,@EndDate,@UN)";
            using (MySqlCommand cmd = new MySqlCommand(insertwork))
            {
                cmd.Connection = conss;
                foreach (ListItem item in ListBox1.Items)
                {
                    if (item != null && item.Selected)
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@TaskName", TaskName);
                        cmd.Parameters.AddWithValue("@TaskDescription", TextBoxDesc.Text);
                        cmd.Parameters.AddWithValue("@StartDate", TextBoxStartDate.Text);
                        cmd.Parameters.AddWithValue("@EndDate", TextBoxEndDate.Text);
                        cmd.Parameters.AddWithValue("@UN", item.Text);
                        conss.Open();
                        cmd.ExecuteNonQuery();
                        conss.Close();


                        cons.Open();
                        string ul = item.Text;
                        string tel = string.Empty;
                        //TextBox1.Text = ul;
                        string queryss = "select Tel from employee where Emp_name = '" + ul + "'";
                        MySqlCommand comss = new MySqlCommand(queryss, cons);
                        MySqlDataReader read = comss.ExecuteReader();
                        if (read.Read())
                        {
                            tel = read["Tel"].ToString();
                            //TextBox1.Text = read["Tel"].ToString();
                            read.Close();
                        }
                        //TextBox2.Text = tel;

                        //send sms here
                        var creds = new Nexmo.Api.Request.Credentials
                        {
                            ApiKey = "f0ae072d",
                            ApiSecret = "8512c6e1f2f50310"
                        };

                        // both execution methods work:
                        var client = new Nexmo.Api.Client(creds);
                        client.SMS.Send(new SMS.SMSRequest
                        {
                            from = "NEXMO",
                            to = tel,
                            text = "You have been assigned to a new work, please login to view your work."
                        });

                        SMS.Send(new SMS.SMSRequest
                        {
                            from = "NEXMO NUMBER",
                            to = "YOUR NUMBER",
                            text = "hey there!!!"
                        }, creds); cons.Close();
                    }
                }
            }



            //send sms
            /*cons.Open();
            string ul = DropDownList1.SelectedValue;
            string tel = string.Empty;
            //TextBox1.Text = ul;
            string queryss = "select Tel from employee where Emp_name = '" + ul + "'";
            MySqlCommand comss = new MySqlCommand(queryss, cons);
            MySqlDataReader read = comss.ExecuteReader();
            if (read.Read())
            {
                tel = read["Tel"].ToString();
                //TextBox1.Text = read["Tel"].ToString();
                read.Close();
            }
            //TextBox2.Text = tel;

            //send sms here
            using (System.Net.WebClient client = new System.Net.WebClient())
            {
                try
                {
                    string msg = "Your have been assigned to a new work. Login to the system to view the details!";
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
            cons.Close();*/

            //this is to upload to files to datbaase. 
            //remmeber to do .HasFile to check fileupload got file or not....
            string g = DropBoxCurrentTask.SelectedValue;
            string NameTask = TextBoxName.Text + g;
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string contentType = FileUpload1.PostedFile.ContentType;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);

                        using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                        {
                            string query = "insert into filework" + "(name,ContentType,Data,TaskName) values (@Name, @ContentType, @Data,@Task)";
                            using (MySqlCommand cmd = new MySqlCommand(query))
                            {
                                cmd.Connection = con;
                                //cmd.Parameters.AddWithValue("@ID", 1);
                                cmd.Parameters.AddWithValue("@Name", filename);
                                cmd.Parameters.AddWithValue("@ContentType", contentType);
                                cmd.Parameters.AddWithValue("@Data", bytes);
                                cmd.Parameters.AddWithValue("@Task", NameTask);
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
    }
}