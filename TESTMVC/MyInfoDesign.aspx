<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyInfoDesign.aspx.cs" Inherits="TESTMVC.MyInfoDesign" %>

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
            width: 131px;
        }
        .auto-style7 {
            width: 270px;
        }
        .auto-style9 {
            width: 86px;
        }
        .auto-style10 {
            width: 131px;
            height: 60px;
        }
        .auto-style11 {
            width: 270px;
            height: 60px;
        }
        .auto-style12 {
            width: 86px;
            height: 60px;
        }
        .auto-style13 {
            height: 60px;
        }
        .auto-style18 {
            width: 131px;
            height: 71px;
        }
        .auto-style19 {
            width: 270px;
            height: 71px;
        }
        .auto-style20 {
            width: 86px;
            height: 71px;
        }
        .auto-style21 {
            height: 71px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <link id="Link1" rel="stylesheet" runat="server" media="screen" href="MyInfoDesign.css" /> 
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
                 
                    <li><a href="Test.aspx"><font color="white"><span><img src="attendance.png" width="20" height="20" alt ="profile"/></span>&nbsp Attendance</font></a></li>
                    <li><a href="AssignWork.aspx"><font color="white"><span><img src="work.png" width="20" height="20" alt ="profile"/></span>&nbsp Assign Work</font></a></li>
                    <li><a href="Search.aspx"><font color="white"><span><img src="searchicon.png" width="20" height="20" alt ="profile"/></span>&nbsp Search</font></a></li>
                    <li><a href="Test.aspx"><font color="white"><span><img src="appraisal.png" width="20" height="20" alt ="profile"/></span>&nbsp Appraisal</font></a></li>
                    <li><a href="ViewLeave.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp View Leave</font></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div>
            <div id ="info">
            <center>
                <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound" Height="100px" Width="200px" OnSelectedIndexChanged="gvImages_SelectedIndexChanged" >
                    <Columns>
                        <asp:TemplateField HeaderText = "Image">

                            <ItemTemplate>
                                 <asp:Image ID="Image1" runat="server" Height="200" Width="250" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                 </asp:GridView>
                </center>
         <div id ="label">
            <p>
                <label>ID:&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></label><hr />
            </p>
            <p> <label>Name : <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label> </label> </p> <hr />
            <p> <label>Department : <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label> </label> </p><hr />
            <p> <label>Status : <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label> </label> </p><hr />
            <p> <label>NRIC : <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label> </label> </p><hr />
            <p> <label>Tel : <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label> </label> </p><hr />
            <p> <label>Email : <asp:Label ID="Label8" runat="server"></asp:Label> </label> </p><hr />
          </div>
        </div>

            <div id="details">
            

            
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style10">Title:</td>
                        <td class="auto-style11"><asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style13"></td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Name:</td>
                        <td class="auto-style11"> <asp:TextBox ID="TextBoxUn"   runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style12">Join Date:</td>
                        <td class="auto-style13"><asp:TextBox ID="TextBoxDOB" runat="server" class="form-control input-lg" Width="250px" ></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">First Name:</td>
                        <td class="auto-style11"><asp:TextBox ID="TextBoxFn" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style12">Last Name:</td>
                        <td class="auto-style13"><asp:TextBox ID="TextBoxLn" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Religion:</td>
                        <td class="auto-style11"> <asp:TextBox ID="TextBoxRel" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style12">Race:</td>
                        <td class="auto-style13"> <asp:TextBox ID="TextBoxRace" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Nationality:</td>
                        <td class="auto-style11"><asp:TextBox ID="TextBoxNan" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style12">Age:</td>
                        <td class="auto-style13"><asp:TextBox ID="TextBoxAge" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Address:</td>
                        <td class="auto-style11"><asp:TextBox ID="TextBoxAdd" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style12">Position:</td>
                        <td class="auto-style13">
                          <asp:TextBox ID="TextBoxPos" runat="server"  class="form-control input-lg" Width="250px" ReadOnly="True" ></asp:TextBox>  
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">Department:</td>
                        <td class="auto-style19"><asp:TextBox ID="TextBoxDept" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style20">Leave Balance:</td>
                        <td class="auto-style21">
                            <asp:TextBox ID="TextBoxBalance" runat="server"  class="form-control input-lg" Width="250px" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style18">Ic Number:</td>
                        <td class="auto-style19"><asp:TextBox ID="TextBoxIC" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style20">Birth Date:</td>
                        <td class="auto-style21"><asp:TextBox ID="TextBoxBirthDate" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style18">Gender:</td>
                        <td class="auto-style19"><asp:TextBox ID="TextBoxGen" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                        <td class="auto-style20">Tel Number:</td>
                        <td class="auto-style21"><asp:TextBox ID="TextBoxTel" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style18">Change Password</td>
                        <td class="auto-style19"><asp:TextBox ID="TextBoxPass" runat="server" class="form-control input-lg" Width="250px" ></asp:TextBox></td>
                        <td class="auto-style20">Confirm Password</td>
                        <td class="auto-style21"><asp:TextBox ID="TextBoxConfirm" runat="server" class="form-control input-lg" Width="250px"  TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Email:</td>
                        <td class="auto-style11"><asp:TextBox ID="TextBoxEn" runat="server" class="form-control input-lg" Width="250px"></asp:TextBox> </td>
                        <td class="auto-style12">Upload Image:</td>
                        <td class="auto-style13"><asp:FileUpload ID="FileUpload1" runat="server"  class="form-control input-sm" Width="250px" /></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style7">
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update Profile"  class="btn btn-success" OnClientClick="return confirm('Are you sure?')"/>
                        </td>
                        <td class="auto-style9">
                            <asp:Button ID="Button1" runat="server" Text="Update Picture Only" OnClick="Button1_Click"  class="btn btn-success" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                        <td class="auto-style9">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>     
        </div>

        </div>
    </form>
</body>
</html>

