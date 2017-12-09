<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="TESTMVC.AdminHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <link href="AdminHomePage.css" rel="stylesheet" type="text/css"/>
    <form id="form1" runat="server">
        <div id ="top">
            <p style="font-size:20px; position:center; color:white;" class="auto-style1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                <li><a href="Search.aspx">Search Employee</a></li>
              <li><a href="AssignWork.aspx">Assign Work</a></li>
                <li><a href="#about">View Work Progress</a></li>
              <li><a href="LeaveReq.aspx">View Leave Request</a></li>
               <li><a href="#about">View Attendance</a></li>
                
                <li><a href="#about">View Appraisal Feedback</a></li>
                <li><a href="PostAnnouncement.aspx">Post Announcement</a></li>
            </ul>
         </div>
        <div id="announ" style="padding:1px 16px;" class="auto-style2">
              <h2>    <center>Announcement </center>
              </h2>
            <asp:Repeater ID="Repeater1" runat="server">
                  
                  <ItemTemplate>
            <hr />
               <b><label>By: <asp:Label ID="Label1" runat="server" Text='<%#Eval("Username") %>'></asp:Label></label></b>
                
                <label>Date: <asp:Label ID="Label3" runat="server" Text='<%#Eval("time") %>'></asp:Label></label>
                <br />
                <label>Title: <asp:Label ID="Label2" runat="server" Font-Bold="true" Text='<%#Eval("Title") %>'> </asp:Label></label>
                <br />
                <label>Message:<asp:Label ID="Label4" runat="server" Font-Bold="true" Text='<%#Eval("Message") %>'> </asp:Label></label>
                <%--<label>Message:<div runat="server"  innerText='<%#Eval("Message") %>'></div></label>--%>
               </ItemTemplate>
            </asp:Repeater>
            
        
            
              
&nbsp;&nbsp;             
        </div>
        <div id="left"> 
            <center> 
            <asp:Calendar ID="Calendar1" runat="server" Height="200px" Width="250px" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" ShowGridLines="True">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
                </center>
        </div>
    </form>
</body>
</html>
