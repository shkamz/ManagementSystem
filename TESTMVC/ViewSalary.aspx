<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalary.aspx.cs" Inherits="TESTMVC.ViewSalary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        
    </style>
</head>

    <body>
    <form id="form1" runat="server">
        
        <link href="ViewSalary.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> Process Salary </h2></center>
          </div> 
        <div id ="top">
           <center> <h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp<asp:Label ID="LabelName" runat="server" ></asp:Label></h3></font>
            <ul>
                    <li><a href="AdminHomePage.aspx"><font color="white"><span><img src="home icon.png" width="20" height="20" alt ="test"/></span>&nbsp Home &nbsp</font></a></li>
                    <li><a href="MyInfoDesign.aspx"><font color="white"><span><img src="profile.png" width="20" height="20" alt ="profile"/></span>&nbsp MyDetails</font></a> </li>
                 
                    <li><a href="ViewAttendance.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="ApplyLeaveDesign.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp Apply Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="LogIn.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >
        <div id ="view">
            <p>
                <center>
                    <label>Search Employee:</label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <label>Date: </label><asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                    <label>Until: </label><asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" ></asp:Button>
                    <asp:Button ID="Button2" runat="server" Text="Show All" ></asp:Button>
                </center>
            </p>
            <p>
                <center>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" PageSize="20" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" width="800px" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found"
                 AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" OnRowEditing="OnRowEditing"  CssClass="table table-striped table-bordered table-hover" >

                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    <Columns>
                       <asp:BoundField HeaderText="Employee Name" DataField="Salary_ID" ItemStyle-Width="200px" ReadOnly="true"  SortExpression="Salary_Id"/>
                        <asp:BoundField HeaderText="Employee Name" DataField="Emp_name" ItemStyle-Width="200px"  />
                        <asp:BoundField HeaderText="Amount" DataField="Gross_Salary" ItemStyle-Width="200px" ReadOnly="true"/>
                        <asp:BoundField HeaderText="Amount" DataField="Salary_Amount" ItemStyle-Width="200px"  />
                        <asp:BoundField HeaderText="Bonus" DataField="Salary_Bonus" ItemStyle-Width="200px" ReadOnly="true"/>
                        <asp:BoundField HeaderText="Total EPF" DataField="EPF" ItemStyle-Width="200px"/>
                         <asp:BoundField HeaderText="Income Tax" DataField="IncomeTax" ItemStyle-Width="200px" ReadOnly="true"/>
                        <asp:BoundField HeaderText="Month" DataField="Salary_Date" DataFormatString="{0:MMMM/yyyy}" ItemStyle-Width="200px" ReadOnly="true"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton Text="Edit" runat="server" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton Text="Update" runat="server"  OnClick="OnUpdate"/>
                                <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
                </center>
            </p>
            <p>
               
            </p>
            <p>
              
            </p>
            <p>
                <center> <asp:Button ID="Button3" runat="server" Text="Process Salary" /> <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" /></center>
            </p>
        </div>
        </form>
</body>
</html>

