using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TESTMVC
{
    public partial class ViewSalary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * from salary order by Salary_Date"))
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
                            ViewState["dt"] = dt;
                        }
                    }
                }
                con.Close();
            }
        }

        //ltak sini tadi
        //this is to export to excel....
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            //this.BindGrid();

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

        //delete below to remove edit.....
        protected void BindGrid()
        {
            GridView1.DataSource = ViewState["dt"] as DataTable;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            //GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            string name = (row.Cells[1].Controls[0] as TextBox).Text;
            //string country = (row.Cells[1].Controls[0] as TextBox).Text;
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows[row.RowIndex]["Emp_name"] = name;
            //dt.Rows[row.RowIndex]["Country"] = country;
            ViewState["dt"] = dt;
            //string sRowID = (GridView1.Rows[0].FindControl[0] as TextBox).Text;
            //string LocName = GridView1.DataKeys[e.RowIndex].Values["Salary_ID"].ToString();
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE salary set Emp_name = '" + name + "' WHERE Emp_name = '" + row.Cells[1].Controls[0] + "'", con);
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            //this.BindGrid();
            this.BindGrid();
            con.Close();
            
        }

        protected void OnCancel(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }
    }
}