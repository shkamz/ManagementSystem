<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignWork.aspx.cs" Inherits="TESTMVC.AssignWork" %>

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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js" type="text/javascript"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(function () {
        $('#ListBox1').multiselect({
            includeSelectAllOption: true
        });
    });
</script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 201px;
        }
        .auto-style3 {
            width: 201px;
            height: 70px;
        }
        .auto-style4 {
            height: 70px;
        }
        .auto-style5 {
            width: 201px;
            height: 80px;
        }
        .auto-style6 {
            height: 80px;
        }
        .auto-style7 {
            width: 201px;
            height: 90px;
        }
        .auto-style8 {
            height: 90px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <link href="AssignWork.css" rel="stylesheet" type="text/css"/>
       <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> Task Management </h2></center>
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
                    <li><a href="ApplyLeave.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp View Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >
        
        <div id ="topwork">
            <center><h2>Assign Work</h2></center>
        </div>
        <div id ="work">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;Create New Task:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxName" runat="server" class="form-control input-sm" Width="500px" list="Select1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;Select Available Task:</td>
                    <td class="auto-style4">
                         <asp:DropDownList ID="DropBoxCurrentTask" runat="server" class="form-control input-sm" Width="500px" list="Select1" AutoPostBack="True" OnSelectedIndexChanged="DropBoxTask_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;&nbsp;&nbsp;Task Description</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBoxDesc" runat="server" class="form-control input-sm" TextMode="multiline" cols="20" rows="3" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;&nbsp;&nbsp;StartDate</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBoxStartDate" class="form-control input-sm" runat="server" TextMode="Date" Width="300px"></asp:TextBox>
                       
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;EndDate</td>
                    <td>
                        <asp:TextBox ID="TextBoxEndDate" class="form-control input-sm" runat="server" TextMode="Date" Width="300px"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;&nbsp;FileUpload</td>
                    <td class="auto-style4">
                        <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control input-sm"  Width="300px" Height="45px" />

                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;Select Available Employee:</td>
                    <td>
                        <%--<asp:DropDownList ID="DropDownList1"  runat="server" Width="400px" class="btn btn-primary dropdown-toggle">
                        </asp:DropDownList>--%>
                       <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Width="400px" ></asp:ListBox>

                    </td>
                </tr>
            </table>
            <p>
            <center>
             <asp:Button ID="btnUpload" runat="server" Text="Assign Work!" OnClick="Upload" class="btn btn-primary btn-md" />
            </center>
                </p>
        </div>
    </form>
</body>
</html>

