using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;

namespace TESTMVC
{
    public partial class ViewAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // TextBox2.Text = "01/01/2001";
            //TextBox3.Text = "31/12/2030";
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
            TextBoxDate.Visible = false;
            TextBoxTotal.Visible = false;
           
        }
        
        private void BindGrid()
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * from attendance  order by date"))
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
                        }
                    }
                }con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT Emp_name,LogIn_Time,LogOut_Time,date,Hours_Worked,Days from attendance where Emp_name ='" + TextBox1.Text + "'AND date >= '" + TextBox2.Text + "' AND date <= '" + TextBox3.Text + "' order by date "))
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
                        }
                    }
                }con.Close();
            }
            //to pouplate to textbox number of attendance...
            // remember to handle error when row return null....
            TextBoxDate.Visible = true;
            TextBoxTotal.Visible = true;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            conn.Open();
            string checkattendance = "select Count(Emp_name) from attendance where Emp_name ='" + TextBox1.Text + "'AND date >= '" + TextBox2.Text + "' AND date <= '" + TextBox3.Text + "' ";
            MySqlCommand coms = new MySqlCommand(checkattendance, conn);
            Int32 row = Convert.ToInt32(coms.ExecuteScalar());
            coms.Dispose();
            TextBoxDate.Text = row.ToString();
            conn.Close();
            //this is to get number of hour worked..
            conn.Open();
            string checkhour = "select SUM(Hours_Worked) from attendance where Emp_name ='" + TextBox1.Text + "'AND date >= '" + TextBox2.Text + "' AND date <= '" + TextBox3.Text + "'";
            MySqlCommand comss = new MySqlCommand(checkhour, conn);

            var gethour = comss.ExecuteScalar();
            double over = 0;
            if (gethour != DBNull.Value)
            {
                over = Convert.ToDouble(gethour);
                comss.Dispose();
                TextBoxTotal.Text = over.ToString();
            }
            //Int32 roww = Convert.ToInt32(comss.ExecuteScalar());
            //coms.Dispose();
            //TextBoxTotal.Text = roww.ToString();
            conn.Close();


        }
        //ltak sini tadi
        //this is to export to excel....
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();

        }
        protected void ExportToExcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                //GridView1.AllowPaging = false;
                //this.BindGrid();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void ShowAll(object sender, EventArgs e)
        {
            TextBoxDate.Text = "";
            TextBoxTotal.Text = "";
            //TextBox2.Text = "01-01-2001";
            //TextBox3.Text = "01-01-2025";
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT Emp_name,LogIn_Time,LogOut_Time,date,Hours_Worked,Days from attendance where date >= '" + TextBox2.Text + "' AND date <= '" + TextBox3.Text + "'"))
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
                        }
                    }
                }
                con.Close();
            }
        }
    }
}