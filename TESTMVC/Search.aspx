<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="TESTMVC.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script> 
    
    <link href="jquery-ui.css" rel="stylesheet" type="text/css" />  
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>
   
    <%--all this script is for to autocomplete--%>    <%--<script type="text/javascript">  
        $(function () {
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    var param = { cityname: $('#TextBox1').val() };
                    $.ajax({
                        url: '<%=ResolveUrl("~/Search.aspx/GetCities") %>',
                        data: JSON.stringify(param),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataFilter: function (data) { return data; },
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    value: item
                                }
                            }))
                        },
                        select: function (e, i) {
                            //this is to select the value selected
                            $("#<%=TextBox1 %>").val(i.item.val); 
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(errorThrown);
                        }
                    });
                },
                minLength: 1//minLength as 1, it means when ever user enter 2 character in TextBox the AutoComplete method will fire and get its source data. 
            });
        });--%> 
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    
        
    <style type="text/css">
       
        .auto-style2 {
            width: 213px
        }
        .auto-style5 {
            width: 213px;
            height: 60px;
        }
        .auto-style6 {
            height: 60px;
        }
       
        .auto-style7 {
            height: 60px;
            width: 459px;
        }
        .auto-style8 {
            width: 459px;
        }
       
        .auto-style9 {
            width: 213px;
            height: 60px;
        }
        .auto-style10 {
            height: 60px;
            width: 459px;
        }
        .auto-style11 {
            height: 60px;
        }
       
    </style>
        
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
            <link id="Link1" rel="stylesheet" runat="server" media="screen" href="Search.css" /> 
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> My Information </h2></center>
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
        </div>
            
            <div id ="info">
            <center>  <asp:DropDownList ID="DropDownList1" runat="server" class="btn btn-primary dropdown-toggle"> </asp:DropDownList> <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click1" class="btn btn-success"></asp:Button>
                <p>
                <label><asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound" Height="100px" Width="200px" >
                    <Columns>
                        <asp:TemplateField HeaderText = "Image">

                            <ItemTemplate>
                                 <asp:Image ID="Image1" runat="server" Height="200" Width="250" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                 </asp:GridView></label></p>
        </center>
        <p> </p>
        
                <table class="table table-striped">
                    <tr>
                        <td class="auto-style9">Username</td>
                        <td class="auto-style10">
                            <asp:TextBox ID="TextBoxUn" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style11">ID</td>
                        <td class="auto-style11"><asp:TextBox ID="TextBoxID" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Name</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxFn" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Last Name:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBoxLn" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Email</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxEn" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Tel</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBoxTel" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Department</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxDept" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">NRIC</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBoxNRIC" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Age</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxAge" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Position</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBoxPos" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Religion</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxRel" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Nationality</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBoxNan" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Race</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxRace" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Status</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TextBoxStat" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Date Joined</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="TextBoxDOB" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Gender</td>
                        <td class="auto-style6"><asp:TextBox ID="TextBoxGen" runat="server" class="form-control input-lg" Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style8">
                           
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                    <center> <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update Employee Profile" class="btn btn-success" /></center>
       </div>
        
        
       
        
       

    </form>
</body>
</html>
