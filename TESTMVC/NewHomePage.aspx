<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewHomePage.aspx.cs" Inherits="TESTMVC.NewHomePage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 55%;
            height: 700px;
        }
    </style>
</head>

    <body>
    <form id="form1" runat="server">
        
        <link href="NewHomePage.css" rel="stylesheet" type="text/css"/>
        
        
            <div id ="topbar">
           <center><h2 style="font-family:clear 'MS Gothic'; color:white;"> HomePage </h2></center>
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
                    <li><a href="ApplyLeave.aspx"><font color="white"><span><img src="status.png" width="20" height="20" alt ="profile"/></span>&nbsp Apply Leave &nbsp&nbsp</font><span id="spnMyTask" runat="server" class="badge"></span></a></li>
                    <li><a href="AddUser.aspx"><font color="white"><span><img src="add.png" width="20" height="20" alt ="profile"/></span>&nbsp Add Employee</font></a></li>
                    <li><a href="Login.aspx"><font color="white"><span><img src="sign out.png" width="20" height="20" alt ="profile"/></span>&nbsp Sign Out</font></a></li>
                </ul>
        </div >
        <div id="content">
            <center>
             <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Button ID="btnShow" runat="server" Text="Post Announcement" />
 
                <!-- ModalPopupExtender -->
                <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
                    CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none">
    
            <table class="auto-style1">
                
                <tr>
                    <td class="auto-style2">
           
            <label>Title</label></td>
                    <td>
           
            <label><asp:TextBox ID="TextBoxTitle" runat="server" class="form-control input-lg"></asp:TextBox></label>
                       
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
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Send" class="btn btn-success" />
                    </td>
                </tr>
            </table>
    <asp:Button ID="btnClose" runat="server" Text="Close" />
</asp:Panel></center>
<!-- ModalPopupExtender -->
            <asp:Repeater ID="Repeater1" runat="server">
                  
            <ItemTemplate>
            <hr />
               <b><label>By: <asp:Label ID="Label1" runat="server" class="text-primary" Text='<%#Eval("Username") %>'></asp:Label></label></b>
                
                <label>Date: <asp:Label ID="Label3" runat="server" class="text-muted" Text='<%#Eval("Date", "{0:d}")%>'> </asp:Label></label>
                <br />
                <label>Title: <asp:Label ID="Label2" runat="server" Font-Bold="true" class="text-muted"  Text='<%#Eval("Title") %>'> </asp:Label></label>
                <br />
                <label>Message:<asp:Label ID="Label4" runat="server" Font-Bold="true" Text='<%#Eval("Message") %>'> </asp:Label></label></br>
                      <center>
                      <a href='<%#Eval("ImagePath") %>' target="_blank"><asp:Image ID="Label5" runat="server" Visible='<%#Eval("ImagePath") != DBNull.Value %>' ImageUrl='<%#Eval("ImagePath") %>' Height="200px" Width="550px">  </asp:Image></a>
                      </center>
                     <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
                <%--<label>Message:<div runat="server"  innerText='<%#Eval("Message") %>'></div></label>--%>
               </ItemTemplate>
            </asp:Repeater>

        </div>
            <asp:Button ID="Button1" runat="server" Text="Check In" OnClick="Button1_Click" Class="CheckButton" />
            <asp:Button ID="Button2" runat="server" Text="Check Out" OnClick="Button2_Click"  Class="CheckButton" />
           <%-- <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
    </form>
</body>
</html>
