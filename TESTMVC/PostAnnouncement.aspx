<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostAnnouncement.aspx.cs" Inherits="TESTMVC.PostAnnouncement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color:ghostwhite;
        }
        .auto-style2 {
            width: 287px;
            background-color:ghostwhite;
        }
    </style>
</head>

    <body>
    <form id="form1" runat="server">
        
        <link href="Announcement.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> Post Announcement </h2></center>
          </div> 
        <div id ="top">
           <center> <h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp<asp:Label ID="LabelName" runat="server" ></asp:Label></h3></font>
            <ul>
                    <li><a href="AdminHomePage.aspx"><font color="white"><span><img src="home icon.png" width="20" height="20" alt ="test"/></span>&nbsp Home &nbsp</font></a></li>
                    <li><a href="MyInfoDesign.aspx"><font color="white"><span><img src="profile.png" width="20" height="20" alt ="profile"/></span>&nbsp MyDetails</font></a> </li>
                 
                    <li><a href="ViewAttendace.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="LeaveReq.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp Apply Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >

        <div id="announcement">
           <center>
            <table class="auto-style1">
                
                <tr>
                    <td class="auto-style2">
           
            <label>Title</label></td>
                    <td>
           
            <label><asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg"></asp:TextBox></label>
                       
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Message</td>
                    <td>
                         <asp:TextBox ID="TextBoxMsg" runat="server" TextMode="multiline" cols="60" rows="10" Width="500px" class="form-control input-lg"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">Upload Picture</td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" class="form-control input-lg"/></td>
                </tr>
                <tr>
                    <td class="auto-style2">To: </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-lg">
                            <asp:ListItem>All</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" class="btn btn-success" />
                    </td>
                </tr>
            </table></center>
        </div>
        </form>
</body>
</html>
