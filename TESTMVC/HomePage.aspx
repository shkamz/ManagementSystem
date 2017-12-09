<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TESTMVC.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 200px;
        }
        </style>
</head>
<body>
    <link href="HomePage.css" rel="stylesheet" type="text/css"/>
    <form id="form1" runat="server">
        <div id ="top">
            <p style="font-size:20px; position:center; color:white;" class="auto-style1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                (User)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
        <div = "menu">
            <ul>
              <li><a class="active" href="#home">Home</a></li>
              <li><a href="MyInfoDesign.aspx">MyDetails</a>
                  <%--<ul class ="drop1">
                      <li><a href="#">Update My Details</a></li>
                  </ul>--%>
              </li>
              <li><a href="ViewMyWork.aspx">View Work</a></li>
              <li><a href="ApplyLeaveDesign.aspx">Apply Leave</a></li>
                <li><a href="#">My Leave Status</a></li>
               <li><a href="#about">View Attendance</a></li>
            </ul>
         </div>
        <div id="announ" style="padding:1px 16px;" class="auto-style2">
              <h2>    <center>Announcement </center>
              </h2>
            <asp:Repeater ID="Repeater1" runat="server">
                  
                  <ItemTemplate>
            <hr />
               <b><label>By: <asp:Label ID="Label1" runat="server" class="text-primary" Text='<%#Eval("Username") %>'></asp:Label></label></b>
                
                <label>Date: <asp:Label ID="Label3" runat="server" class="text-muted" Text='<%#Eval("time") %>'></asp:Label></label>
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
        <div id="left"> 
            <center> 
            <asp:Calendar ID="Calendar1" runat="server" Height="200px" Width="290px" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" ShowGridLines="True">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </center>
            <p>
            <asp:Button ID="Button1" runat="server" Text="Check In" OnClick="Button1_Click" Class="CheckButton" /></p>
            <asp:Button ID="Button2" runat="server" Text="Check Out" OnClick="Button2_Click"  Class="CheckButton" />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>

    </form>
</body>
</html>
