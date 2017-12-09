<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyLeave.aspx.cs" Inherits="TESTMVC.ApplyLeave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 176px;
        }
        .auto-style4 {
            width: 109px;
        }

* {
    padding: 0px;
    margin: 0px;
}


        .auto-style13 {
            width: 176px;
            height: 60px;
        }
        .auto-style14 {
            width: 350px;
            height: 60px;
        }
        .auto-style15 {
            width: 109px;
            height: 60px;
        }
        .auto-style16 {
            height: 60px;
        }
        .auto-style17 {
            width: 176px;
            height: 80px;
        }
        .auto-style18 {
            width: 350px;
            height: 80px;
        }
        .auto-style19 {
            width: 109px;
            height: 80px;
        }
        .auto-style20 {
            height: 80px;
        }
        .auto-style21 {
            width: 350px
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
            <link id="Link1" rel="stylesheet" runat="server" media="screen" href="ApplyLeave.css" /> 
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> Apply Leave </h2></center>
          </div> 
        <div id ="top">
           <center> <h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp<asp:Label ID="LabelName" runat="server" Text="Label"></asp:Label></h3></font>
            <ul>
                    <li><a href="AdminHomePage.aspx"><font color="white"><span><img src="home icon.png" width="20" height="20" alt ="test"/></span>&nbsp Home &nbsp</font></a></li>
                    <li><a href="MyInfoDesign.aspx"><font color="white"><span><img src="profile.png" width="20" height="20" alt ="profile"/></span>&nbsp MyDetails</font></a> </li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="ApplyLeave.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp View Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >
        <div id ="content">

             <asp:Button ID="Button1" runat="server"  Text="View My Leave Request" class="btn btn-primary dropdown-toggle" OnClick="Button1_Click" />
            <p></p>
            <center>
            <table>
                <tr>
                    <td class="auto-style17">Date:</td>
                    <td class="auto-style18">
                    <asp:TextBox ID="TextBoxDate" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                     <p></p>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="DateChange" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        </asp:Calendar>
                    </td>
                    <td class="auto-style19">Until:</td>
                    <td class="auto-style20">
                    <asp:TextBox ID="TextBoxLastDate" runat="server" class="form-control input-sm" Width="400px" ></asp:TextBox><p></p>
                        <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="DateChange1" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                            <DayStyle BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                            <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">Number of Day Selected:</td>
                    <td class="auto-style18"><asp:TextBox id="TextBox1" runat="server" class="form-control input-sm" Width="250px" /></td>
                    <td class="auto-style19">Your Leave Balance</td>
                    <td class="auto-style20"><asp:TextBox id="TextBox2" runat="server" class="form-control input-sm" Width="250px" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Leave Type:</td>
                    <td class="auto-style14">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-sm" Width="300px">
                        <asp:ListItem>Emergency</asp:ListItem>
                        <asp:ListItem>Medical</asp:ListItem>
                        <asp:ListItem>Annual Leave</asp:ListItem>
                        <asp:ListItem>Half Day</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style13">Reason:</td>
                    <td class="auto-style14"> <asp:TextBox id="TextAreaRe" TextMode="multiline" Columns="40" Rows="3" runat="server" class="form-control input-sm" Width="300px" /></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
                </center>
            <div id="testing" runat="server" >
                <h1>bodo!111</h1>
            </div>
             <center><asp:Button ID="SubmitLeave" runat="server" OnClick="SubmitLeave_Click" Text="Submit Leave" class="btn btn-primary dropdown-toggle" /></center>
    
           
    </form>
</body>
</html>
