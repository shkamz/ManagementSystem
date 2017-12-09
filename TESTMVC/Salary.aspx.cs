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
using System.Globalization;

namespace TESTMVC
{
    public partial class Salary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxMonth.Text = DateTime.Now.ToString("MMMM yyyy");
            TextBoxAllowance.Text = "100";
            TextBoxOthers.Text = "0";
            //TextBoxBonus.Attributes.Add("onclick", this.Page.ClientScript.GetPostBackEventReference(this.btnTextBoxEventHandler, ""));
            if (!this.IsPostBack)
            {
                //populate to dropdownlist.
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT distinct(Emp_name) from attendance")) // if nk all tuka to select from employee
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
                    }
                    con.Close();
                }
                DropDownList1.Items.Insert(0, new ListItem("--Select Employee--", "0"));
            }
        }
        decimal last;
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            //this is to call the value selected from jquery.
            string u = DropDownList1.SelectedValue;
            TextBoxBonus.Text = "0";
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);

            conn.Open();
            //add below here to search more from database.
            string checkuser = "select Emp_salary,Allowance,Emp_name,Emp_Position,Emp_Department  from employee where Emp_name = '" + u + "'";
            MySqlCommand com = new MySqlCommand(checkuser, conn);
            MySqlDataReader read = com.ExecuteReader();
            //TextBoxName.Text = checkuser;
            if (read.Read())
            {
                TextBoxSalary.Text = read["Emp_salary"].ToString();
                TextBoxAllowance.Text = read["Allowance"].ToString();
                TextBoxName.Text = read["Emp_name"].ToString();
                TextBoxPosition.Text = read["Emp_Position"].ToString();
                TextBoxDept.Text = read["Emp_Department"].ToString();
                read.Close();
                conn.Close();
            }
            conn.Close();
            
          




            //remember to check bug if xde attendance dia crash.......databse return null......
            //this is to check hw mnay the employee attend to work each month.
            conn.Open();
            
            DateTime now = DateTime.Now;
            DateTime startDate = new DateTime(now.Year, now.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);
            startDate.ToString("MM / dd / yyyy");
            string f = startDate.ToString("yyyy-MM-dd");
            string g = endDate.ToString("yyyy-MM-dd");
            string checkattendance = "select Count(Emp_name) from attendance where Emp_name = '" + u + "' AND date >= '"+ TextBox2.Text + "' AND date <= '" + TextBox1.Text + "' "; //if nk auto tuka textbox2 jadi 'f', textbox1 jadi 'g'
            MySqlCommand coms = new MySqlCommand(checkattendance, conn);
            //var get = coms.ExecuteScalar();
            //int row = 0;
            //if (get != DBNull.Value)
            //{
            //     row = Convert.ToInt32(get);
            //}
            Int32 row = Convert.ToInt32(coms.ExecuteScalar());
            coms.Dispose();
            TextBoxAttendance.Text = row.ToString();
            conn.Close();

            //this is to get number of hour worked..
            conn.Open();
            string checkhour = "select SUM(Hours_Worked) from attendance where Emp_name ='" + u + "' AND date >= '" + TextBox2.Text + "' AND date <= '" + TextBox1.Text + "'"; //if nk auto tuka textbox2 jadi 'f', textbox1 jadi 'g'
            MySqlCommand comss = new MySqlCommand(checkhour, conn);
            //var obj = comss.ExecuteScalar();
            //int peopleinrestaurant = comss.ExecuteScalar() == null ? 0 : (int)comss.ExecuteScalar();
            var get = comss.ExecuteScalar();
            int roww = 0;
            if (get != DBNull.Value)
            {
                 roww = Convert.ToInt32(get);
                coms.Dispose();
                TextBoxTotal.Text = roww.ToString();
            }
            //Int32 roww = Convert.ToInt32(comss.ExecuteScalar());
            
            conn.Close();

            //this is to check overtime
            conn.Open();
            string checkovertime = "select SUM(Overtime) from attendance where Emp_name ='" + u + "' AND date >= '" + TextBox2.Text + "' AND date <= '" + TextBox1.Text + "'"; //if nk auto tuka textbox2 jadi 'f', textbox1 jadi 'g'
            MySqlCommand comover = new MySqlCommand(checkovertime, conn);
            var gett = comover.ExecuteScalar();
            double over = 0;
            if (gett != DBNull.Value)
            {
                over = Convert.ToDouble(gett);
                comover.Dispose();
                TextBoxOvertime.Text = over.ToString();
            }
            //double over = Convert.ToDouble(comover.ExecuteScalar());
           
            conn.Close();

            //get hourly rate for overtime....
            double salaryy = Convert.ToDouble(TextBoxSalary.Text);
            double hourlyrate = (salaryy / 4) / 40;
            double totalover = (hourlyrate*1.5) * over;
            TextBoxRate.Text = totalover.ToString();

            //calculate sosco..
            if (salaryy <= 3000)
            {
                TextBoxSosco.Text = "19.50";
            }
            else
            {
                TextBoxSosco.Text = "0";
            }

            //remember to add other allowance... like others......
            //kalau text null bole hang, check the bug please...
            //to minus all the neccesary tax,epf etc2......
            // remember to buat if slary <5k no need to minus tax...
            decimal salary = Convert.ToDecimal(TextBoxSalary.Text);
            decimal allowance = Convert.ToDecimal(TextBoxAllowance.Text);
            decimal others = Convert.ToDecimal(TextBoxOthers.Text);
            TextBoxGross.Text = "RM " + salary.ToString();
            if (salary >= 5000)
            {
                decimal epf = (salary * (11m / 100m)); 
                TextBoxEPF.Text = epf.ToString("#.##");
                decimal tax = (salary * (1m / 100m)); // no need to minus if tax <5k.....
                decimal netpay = (salary - epf - tax) + Convert.ToDecimal(totalover) + allowance  + others;
                last = netpay;
                TextBoxDeduct.Text =  tax.ToString(); 
                TextBoxNetPay.Text =   netpay.ToString();
                
            }
            else
            {
                decimal epf = (salary * (11m / 100m)); 
                TextBoxEPF.Text = "RM " + epf.ToString("#.##");
                 decimal netpay = (salary - epf) + Convert.ToDecimal(totalover) + allowance + others  ;
                netpay = netpay - Convert.ToDecimal(TextBoxSosco.Text);
                TextBoxDeduct.Text = "RM 0";
                TextBoxNetPay.Text =  netpay.ToString();
                last = netpay;
            }


        }


        //add with bonuss.....
        protected void Button2_Click(object sender, EventArgs e)
        {
            decimal getbonus = 0;
            decimal getnet = 0;
           
            decimal.TryParse( TextBoxNetPay.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out getnet);
            decimal.TryParse(TextBoxBonus.Text, out getbonus);
            decimal finaltotal = getnet + getbonus;
            Label1.Text = "RM " + finaltotal.ToString();
            TextBoxNetPay.Text = "RM " + finaltotal.ToString();

            string u = DropDownList1.SelectedValue;
            MySqlConnection cons = new MySqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            string querys = "insert into salary" + "(Emp_name,Salary_Amount,Salary_Date,Salary_DateEnd,Salary_Bonus,EPF,IncomeTax) values (@Emp_name,@Salary_Amount,@Salary_Date,@Salary_DateEnd,@Salary_Bonus,@EPF,@IncomeTax)";

            using (MySqlCommand cmd = new MySqlCommand(querys))
            {
                cmd.Connection = cons;
                //cmd.Parameters.AddWithValue("@ID", 1);
                cmd.Parameters.AddWithValue("@Emp_name", u);
                cmd.Parameters.AddWithValue("@Salary_Amount", finaltotal);
                cmd.Parameters.AddWithValue("@Salary_Date", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Salary_DateEnd", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Salary_Bonus", getbonus);
                cmd.Parameters.AddWithValue("@EPF", TextBoxEPF.Text);
                cmd.Parameters.AddWithValue("@IncomeTax", TextBoxDeduct.Text);
                cons.Open();
                cmd.ExecuteNonQuery();
                cons.Close();
            }
        }
        
    }
}