<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMyWork.aspx.cs" Inherits="TESTMVC.ViewMyWork" %>

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
            width: 115px;
        }
        
        .auto-style3 {
            width: 115px;
            height: 44px;
        }
        .auto-style4 {
            height: 70px;
        }
        .auto-style5 {
            width: 115px;
            height: 70px;
        }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <link href="ViewMyWork.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> My Work </h2></center>
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
                    <li><a href="ApplyLeave.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp Apply Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >
        
        <div id="worktab">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">Task ID</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxID" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Task Name</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxName" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Task Description</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxDesc" TextMode="multiline" cols="20" rows="5" runat="server" class="form-control input-sm" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Start Date</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxDate" runat="server" class="form-control input-sm" Width="200px" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">End Date</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxDateEnd" runat="server" class="form-control input-sm" Width="200px" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Status</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxStatus" runat="server" class="form-control input-sm" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Mark As Done!" class="btn btn-success"/>
                    </td>
                </tr>
            </table>
            <p>
                <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
                <h4>Downloadable File</h4>
                <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
                    <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
                            AutoGenerateColumns="false" class="table table-striped table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="File Name"/>
                                <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            </p>
        </div>
        <div id ="boxname">
          <center>  <h3>ChatBox</h3> </center>
            <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
        </div>
        <div id="chat" class="auto-style3">
            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
               
                <ContentTemplate>
                        <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate> <asp:Timer runat="server" Interval="10000" OnTick="Unnamed1_Tick"></asp:Timer>
                        <hr />
                           <label>By:<asp:Label ID="Label3" runat="server" Font-Bold="true" Text='<%#Eval("Username") %>'></asp:Label></label>
                            <label>Time:<asp:Label ID="Label4" runat="server" class="text-muted" Font-Bold="true" Text='<%#Eval("time") %>'></asp:Label></label>
                            <br />
                          <div runat="server" innerText='<%#Eval("Comment") %>'></div>
                           </ItemTemplate>
                        </asp:Repeater>
                </ContentTemplate>

            </asp:UpdatePanel>

        </div>
        <div id="chatbox">
            <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
            <asp:TextBox ID="Com" TextMode="multiline" Columns="35" Rows="5" runat="server" Width="100%"></asp:TextBox>
            
            <p>
                <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" class="btn btn-success"/>
            </p>

        </div>
        <div id="member">
            <h4>Your Colleague</h4>
            <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" PageSize="20" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"  ShowHeaderWhenEmpty="True" EmptyDataText="No records Found"
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
                       
                        <asp:BoundField HeaderText="Employee Name" DataField="Username" ItemStyle-Width="100%"  />
                        
                    </Columns>
                </asp:GridView>
        </div>
    </form>
</body>
</html>

