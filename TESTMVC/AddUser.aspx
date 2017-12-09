<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="TESTMVC.AddUser" %>

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
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 93px;
        }
        .auto-style3 {
            width: 225px;
        }
        .auto-style4 {
            width: 133px;
        }
        .auto-style5 {
            width: 93px;
            height: 100px;
        }
        .auto-style6 {
            width: 225px;
            height: 100px;
        }
        .auto-style7 {
            width: 133px;
            height: 100px;
        }
        .auto-style8 {
            height: 100px;
        }
        .auto-style9 {
            height: 100px;
            width: 271px;
        }
        .auto-style10 {
            width: 271px;
        }
        .auto-style11 {
            width: 101px;
            height: 100px;
        }
        .auto-style12 {
            width: 101px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <link href="AddUser.css" rel="stylesheet" type="text/css"/>
       <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> Add New Employee </h2></center>
          </div> 
        <div id ="top">
           <center> <h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp<asp:Label ID="LabelName" runat="server" Text="Label"></asp:Label></h3></font>
            <ul>
                    <li><a href="AdminHomePage.aspx"><font color="white"><span><img src="home icon.png" width="20" height="20" alt ="test"/></span>&nbsp Home &nbsp</font></a></li>
                    <li><a href="MyInfoDesign.aspx"><font color="white"><span><img src="profile.png" width="20" height="20" alt ="profile"/></span>&nbsp MyDetails</font></a> </li>
                 
                    <li><a href="ViewAttendance.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="LeaveReq.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp View Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >
        
        <div id ="bar">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">Username:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBoxName" runat="server" class="form-control input-lg" Width="200px" placeholder="Username" required="on"></asp:TextBox>
                    </td>
                    <td class="auto-style7">Telephone Number</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBoxTel" runat="server"  class="form-control input-lg" Width="200px" placeholder="Tel Number"></asp:TextBox>
                    </td>
                    <td class="auto-style11">
                        Position</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBoxPos" runat="server" class="form-control input-lg" Width="200px" placeholder="Position"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style5">First Name:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBoxFn" runat="server" class="form-control input-lg" Width="200px" placeholder="First Name"></asp:TextBox></td>
                    <td class="auto-style7">Last Name:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBoxLn" runat="server" class="form-control input-lg" Width="200px" placeholder="Last Name"></asp:TextBox></td>
                    <td class="auto-style11">
                        Address</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBoxAddress" runat="server" class="form-control input-lg" Width="200px" rows="5" placeholder="Address"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style5">Age</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBoxAge" runat="server" class="form-control input-lg"  Width="200px" placeholder="Age"></asp:TextBox>
                    </td>
                    <td class="auto-style7">Race</td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="DropDownListRace" runat="server" class="form-control input-lg" Width="200px">
                            <asp:ListItem>Malay</asp:ListItem>
                            <asp:ListItem>Chinese</asp:ListItem>
                            <asp:ListItem>Indian</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        Role</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DropDownListRole" runat="server" class="form-control input-lg" Width="200px" >
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>Employee</asp:ListItem>
                            <asp:ListItem>Human Resource</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style5">Department</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownListDept" runat="server" class="form-control input-lg"  Width="200px">
                            <asp:ListItem>IT</asp:ListItem>
                            <asp:ListItem>Account</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">Religion</td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="DropDownListRel" runat="server" class="form-control input-lg" Width="200px">
                            <asp:ListItem>Islam</asp:ListItem>
                            <asp:ListItem>Buddhist</asp:ListItem>
                            <asp:ListItem>Hindu</asp:ListItem>
                            <asp:ListItem>Christian</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        Gender</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DropDownListGen" runat="server" class="form-control input-lg"  Width="200px">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">NRIC</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBoxIC" runat="server" class="form-control input-lg"  Width="200px" placeholder="Ic Number"></asp:TextBox>
                    </td>
                    <td class="auto-style7">Nationality</td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="DropDownListNan" runat="server" class="form-control input-lg"  Width="200px">
                            <asp:ListItem>Malaysia</asp:ListItem>
                            <asp:ListItem>Singapore</asp:ListItem>
                            <asp:ListItem>Thailand</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        DOB</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBoxDOB" runat="server" TextMode="Date" class="form-control input-lg"  Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Basic Salary</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBoxSalary" runat="server" class="form-control input-lg"  Width="200px" placeholder="Enter Salary" required="on"></asp:TextBox></td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style11">
                        &nbsp;</td>
                    <td class="auto-style8">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Email</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBoxEn" runat="server" class="form-control input-lg"  Width="200px" placeholder="Email" required="on" TextMode="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style4">Password</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBoxPass" runat="server" class="form-control input-lg"  Width="200px" placeholder="Password" required="on" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        Confirm Password: </td>
                    <td>
                        <asp:TextBox ID="TextBoxConfirm" runat="server" class="form-control input-lg"  Width="200px" placeholder="Confirm Password" required="on" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                       
                    </td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <center> <asp:Button ID="Button1" runat="server" Text="Add New Employee" OnClick="Button1_Click" class="btn btn-success"/></center>
        </div>
    </form>
</body>
</html>
