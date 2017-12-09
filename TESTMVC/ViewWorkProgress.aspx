<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewWorkProgress.aspx.cs" Inherits="TESTMVC.ViewWorkProgress" %>

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
            width: 100%;
        }
        .auto-style5 {
            width: 152px;
            height: 70px;
        }
        .auto-style6 {
            height: 70px;
        }
    </style>
</head>

    <body>
    <form id="form1" runat="server">
        
        <link href="ViewWorkProgress.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> View Work Progress </h2></center>
          </div> 
        <div id ="top">
           <center> <h2 style="font-family:clear 'MS Gothic'; color:white;"> EMS </h2></center>
            
        </div>
        
        <div id ="menu">
            <font color="white"><h3>&nbsp Welcome &nbsp<asp:Label ID="LabelName" runat="server" ></asp:Label></h3></font>
            <ul>
                    <li><a href="AdminHomePage.aspx"><font color="white"><span><img src="home icon.png" width="20" height="20" alt ="test"/></span>&nbsp Home &nbsp</font></a></li>
                    <li><a href="MyInfoDesign.aspx"><font color="white"><span><img src="profile.png" width="20" height="20" alt ="profile"/></span>&nbsp MyDetails</font></a> </li>
                 
                    <li><a href="Test.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="ApplyLeave.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp Apply Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >

        <div id="announcement">
           <center>
                
               <label>Select Task Name:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged ="SelectedIndexChanged" class="form-control input-lg" Width="300px"></asp:DropDownList></label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" class="btn btn-success" />
               <table class="auto-style3">
                   <tr>
                       <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Task Name:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style5">&nbsp;&nbsp; Task Description:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextBox2" runat="server" Width="400px" class="form-control input-lg" TextMode="MultiLine" Rows="4" Columns="5" ></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start Date:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextBox3" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Date:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextBox4" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextBox5" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comment:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextBox6" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                       </td>
                   </tr>
               </table>
               <p>
                   <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" width="800px" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" 
                       CssClass="table table-striped table-bordered table-hover">

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
                        <asp:BoundField HeaderText="Employee Name" DataField="Username" ItemStyle-Width="200px"  />
                    </Columns>
                </asp:GridView>
               </p>
            </center>
        </div>
        </form>
</body>
</html>

