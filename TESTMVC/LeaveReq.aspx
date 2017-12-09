<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveReq.aspx.cs" Inherits="TESTMVC.LeaveReq" %>

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
        .auto-style3 {
            height:70px;
        }
        .auto-style4 {
            height:90px;
        }
        .auto-style5{
            height:40px;
        }
    </style>
</head>
<body>
    <link id="Link1" rel="stylesheet" runat="server" media="screen" href="Design.css" /> 
    <form id="form1" runat="server">
        <div id ="topbar">
             <center><h3 style="font-family:clear 'MS Gothic'; color:white;"> Leave Management System </h3></center>
          </div> 
        <div id ="top">
            <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3></font>
            <ul>
                    <li><a href="AdminHomePage.aspx"><font color="white"><span><img src="home icon.png" width="20" height="20" alt ="test"/></span>&nbsp Home &nbsp</font></a></li>
                    <li><a href="MyInfoDesign.aspx"><font color="white"><span><img src="profile.png" width="20" height="20" alt ="profile"/></span>&nbsp MyDetails</font></a> </li>
                 
                    <li><a href="Test.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork1.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="Design.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp View Leave</font></a></li>
                    <li><a href="Registration.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div>
         
        <div id="content">
            <center><asp:Calendar ID="Calendar1" runat="server" Height="400px" Width="700px"  OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar></center>
            <p>
                <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-bordered table-hover"></asp:GridView>
            </p>
        </div>
        <div id="box">
            <p><label> Select Employee: &nbsp&nbsp&nbsp&nbsp <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged" class="btn btn-primary dropdown-toggle"></asp:DropDownList> </label> </p>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Name:</td>
                    <td><asp:TextBox ID="TextBoxName" runat="server" class="form-control input-sm" Width="200px" Height="40px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style3">Start Date:</td>
                    <td><asp:TextBox ID="TextBoxDate" runat="server" TextMode="Date" class="form-control input-sm" Width="200px" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style3">EndDate:</td>
                    <td><asp:TextBox ID="TextBoxEndDate" runat="server" TextMode="Date" class="form-control input-sm" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style4">Reason:</td>
                    <td><asp:TextBox ID="TextBoxReason" runat="server" class="form-control input-sm" Width="200px" TextMode="MultiLine" Columns="5" Rows="4" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style4">Type:</td>
                    <td> <asp:TextBox ID="TextBoxType" runat="server" class="form-control input-sm" Width="200px" Height="40px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style5">Status:</td>
                    <td><asp:TextBox ID="TextBoxStatus" runat="server" class="form-control input-sm" Width="200px" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style5">LeaveBalance: &nbsp;&nbsp;</td>
                    <td><asp:TextBox ID="TextBoxLeave" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td><asp:Button ID="Button1" runat="server" Text="Approve" OnClick="Button1_Click" class="btn btn-success"/>  
                &nbsp;<asp:Button ID="Button2" runat="server"  Text="Rejected" OnClick="Button2_Click" class="btn btn-success"/></td> 
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>

        </div>
        
    </form>
</body>
</html>
