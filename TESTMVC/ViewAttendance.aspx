<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAttendance.aspx.cs" Inherits="TESTMVC.ViewAttendance" %>


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
        
        <link href="ViewAttendance.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> View Attendance </h2></center>
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
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click"></asp:Button>
                    <asp:Button ID="Button2" runat="server" Text="Show All" OnClick="ShowAll"></asp:Button>
                </center>
            </p>
            <p>
                <center>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" PageSize="20" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" width="800px" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found"
                 AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging"  CssClass="table table-striped table-bordered table-hover">

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
                       
                        <asp:BoundField HeaderText="Employee Name" DataField="Emp_name" ItemStyle-Width="200px"  />
                        <asp:BoundField HeaderText="Days" DataField="Days" ItemStyle-Width="200px" />
                        <asp:BoundField HeaderText="LogIn Time" DataField="LogIn_Time" ItemStyle-Width="200px" />
                        <asp:BoundField HeaderText="LogOut Time" DataField="LogOut_Time" ItemStyle-Width="200px"/>
                        <asp:BoundField HeaderText="Date" DataField="date" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="200px" />
                        <asp:BoundField HeaderText="Hours Worked" DataField="Hours_Worked" ItemStyle-Width="200px"/>
                    </Columns>
                </asp:GridView>
                </center>
            </p>
            <p>
               
            </p>
            <p>
               <center><label>Days Attends:</label><asp:TextBox ID="TextBoxDate" runat="server" ></asp:TextBox> <label>Total Hours:</label><asp:TextBox ID="TextBoxTotal" runat="server" ></asp:TextBox></center>
            </p>
            <p>
                <center>  <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" /></center>
            </p>
        </div>
        </form>
</body>
</html>
