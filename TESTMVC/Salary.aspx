<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="TESTMVC.Salary" %>

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
            height: 20px;
        }
        .auto-style2 {
            height: 20px;
            width: 232px;
        }
        .auto-style3 {
            width: 232px;
        }
        
        .auto-style4 {
            height: 20px;
            width: 365px;
        }
        .auto-style5 {
            width: 365px;
        }
        .auto-style6 {
            height: 20px;
            width: 100px;
        }
        .auto-style7 {
            width: 100px;
        }
        
        .auto-style8 {
            width: 187px;
        }
        
        .auto-style10 {
            width: 234px;
        }
        .auto-style11 {
            width: 191px;
        }
        
        .auto-style12 {
            width: 165px;
        }
        
    </style>
</head>

    <body>
    <form id="form1" runat="server">
        
        <link href="Salary.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> Salary Management </h2></center>
          </div> 
        <div id ="top">
           <center> <h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp</h3></font>
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
        <div id="content">
           
            
            <table class="nav-justified">
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp; Select Employee</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownList1" runat="server" Cssclass="btn btn-primary dropdown-toggle" >
                        </asp:DropDownList>
                        <asp:Button ID="Button1" runat="server" class="btn btn-success" OnClick="Button1_Click" Text="Search" />
                        
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" required=""></asp:TextBox>
                        
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" required=""></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp; Salary for Month:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxMonth" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        Name:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxName" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;Total Hour Worked</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxTotal" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        Position:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxPosition" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;Basic Salary</td>
                    <td class="auto-style5"><asp:TextBox ID="TextBoxSalary" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox></td>
                    <td class="auto-style7">Department:</td>
                    <td>
                        <asp:TextBox ID="TextBoxDept" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;Attendance this month:</td>
                    <td class="auto-style5"><asp:TextBox ID="TextBoxAttendance" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox></td>
                    <td class="auto-style7">Account:</td>
                    <td>
                        <asp:TextBox ID="TextBoxAccount" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                </table>
             <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
            <p></p>
               <h4 style="display:inline;">&nbsp;&nbsp;&nbsp;Deduction:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><h4 style="display:inline;margin-left:25%">Addition:</h4><hr style="width: 100%; color: black; height: 1px; background-color:black;" />
                <table>
                <tr>
                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;Income Tax:</td>
                    <td class="auto-style10"><asp:TextBox ID="TextBoxDeduct" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox></td>
                    <td class="auto-style8">Allowance:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBoxAllowance" runat="server" class="form-control input-sm" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">Bonus</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBoxBonus" runat="server" class="form-control input-sm" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;EPF:</td>
                    <td class="auto-style10"><asp:TextBox ID="TextBoxEPF" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox></td>
                    <td class="auto-style8">Others:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBoxOthers" runat="server" class="form-control input-sm" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;SosCo</td>
                    <td class="auto-style10"><asp:TextBox ID="TextBoxSosco" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox></td>
                   
                    <td class="auto-style8">Overtime Hour:</td>
                   
                    <td class="auto-style12"><asp:TextBox ID="TextBoxOvertime" runat="server" class="form-control input-sm" Width="50px"></asp:TextBox>
                        
                    </td>
                   
                </tr>
                <tr>

                    <td class="auto-style11">&nbsp;&nbsp;</td>
                   <td class="auto-style10">&nbsp;</td>
                   <td class="auto-style8">Overtime Rate:</td>
                   <td class="auto-style12"><asp:TextBox ID="TextBoxRate" runat="server" class="form-control input-sm" Width="100px"></asp:TextBox> </td>
                </tr>
                </table>
                
            <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
            
               <h4>&nbsp;&nbsp;&nbsp;Total: <asp:Label ID="Label1" runat="server" ></asp:Label> </h4>
               <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
                <table>
                    <tr>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;Gross Pay:</td>
                    <td class="auto-style5"><asp:TextBox ID="TextBoxGross" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox></td>
                    <td class="auto-style7">&nbsp;&nbsp;&nbsp;Net Pay</td>
                    <td><asp:TextBox ID="TextBoxNetPay" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                </table>
                
           <center> <asp:Button ID="Button2" runat="server" Text="Process Salary" OnClick="Button2_Click" class="btn btn-success"></asp:Button></center>
            
        </div>
            
    </form>
</body>
</html>