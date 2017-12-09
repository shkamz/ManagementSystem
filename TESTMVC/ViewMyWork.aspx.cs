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
using System.Globalization;

namespace TESTMVC
{
    public partial class ViewMyWork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelName.Text = Session["New"].ToString();
            //populate to textbox.
            MySqlConnection load = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            load.Open();
            string checkuser = "select TaskName,TaskDescription,StartDate,EndDate,TaskID,Status from Work where Username= '" + Session["New"].ToString() + "' AND status = 'Ongoing' ";
            MySqlCommand com = new MySqlCommand(checkuser, load);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBoxName.Text = read["TaskName"].ToString();
                TextBoxDesc.Text = read["TaskDescription"].ToString();
                DateTime fd = DateTime.Parse(read["StartDate"].ToString()); // <<assign date to date textmode...
                DateTime d = DateTime.Parse(read["EndDate"].ToString());
                //TextBoxDate.Text = read["StartDate"].ToString();
                //TextBoxDateEnd.Text = read["EndDate"].ToString();
                TextBoxID.Text = read["TaskID"].ToString();
                TextBoxStatus.Text = read["Status"].ToString();
                //TextBoxDob.Text = read["DOB"].ToString();
                TextBoxDate.Text = fd.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                TextBoxDateEnd.Text = d.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                read.Close();
            }
            load.Close();
            //populate chatbox
            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }
            //for show downloadable file.
            if (!IsPostBack)
            {
                BindGrid();
            }
            //show member with same task.....
            if (!IsPostBack)
            {
                ShowMember();
            }
        }

        //populate chatbox
        private void BindRepeater()
        {

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT  * FROM comment where TaskName = '" + TextBoxName.Text + "' order by time desc", con))
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
        //insert chat to box. for same taskname...
        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection ins = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            ins.Open();
            MySqlCommand cmd = new MySqlCommand("insert into Comment" + "(ID,Username,Comment,time,TaskName) values (@ID,@Uname,@Com ,@time,@Task)", ins);

            cmd.Parameters.AddWithValue("ID", 1);
            cmd.Parameters.AddWithValue("@Uname", Session["New"].ToString());
            cmd.Parameters.AddWithValue("@Com", Com.Text);
            cmd.Parameters.AddWithValue("@time", DateTime.Now);
            cmd.Parameters.AddWithValue("@Task", TextBoxName.Text.ToString());
            cmd.ExecuteNonQuery();
            Response.Redirect(Request.Url.AbsoluteUri);
            ins.Close();
        }

        //for chatbox update every 1sec
        protected void Unnamed1_Tick(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT  * FROM comment where TaskName = '" + TextBoxName.Text + "' order by time desc ", con))
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
        private void BindGrid()
        {

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "select Id, Name from filework where TaskName = '" + TextBoxName.Text + "'  ";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "select Name, Data, ContentType from filework where Id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["Name"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string u = "Done";
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            cons.Open();
            MySqlCommand cmd = new MySqlCommand("Update work set Status = '" + u + "' where TaskID = '" + TextBoxID.Text + "' ", cons);
            cmd.ExecuteNonQuery();
            
            Response.Redirect(Request.Url.AbsoluteUri);
            cons.Close();
        }


        private void ShowMember()
        {

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "select Username from work where TaskName = '" + TextBoxName.Text + "'  ";
                    cmd.Connection = con;
                    con.Open();
                    GridView2.DataSource = cmd.ExecuteReader();
                    GridView2.DataBind();
                    con.Close();
                }
            }
        }
    }
}