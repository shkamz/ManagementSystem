<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="TESTMVC.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="Link1" rel="stylesheet" runat="server" media="screen" href="StyleSheet1.css" /> 
</head>
<body>
     <div class="container">
       <form id="form1" runat="server">
          <div class="form-input">

              <asp:TextBox ID="TextBoxUserName" class="input" runat="server" placeholder="Enter Username" autofocus=""></asp:TextBox>
          </div>
          <div class="form-input">
              <%--<input type ="password" name ="password" placeholder="password"/>--%>
              <asp:TextBox ID="TextBoxPassword" class="input" runat="server" placeholder="Enter password" TextMode="Password" ></asp:TextBox>
             
          </div>
            <asp:Button ID="Button1" class="btnlogin" runat="server" OnClick="Button1_Click" Text="Log In"  Width="120px" /><br/>
           
           <asp:Button ID="Button2" runat="server" class="btnRegister" Text="Register" Width="120px" OnClick="Button2_Click" /><br/>
           
       </form>
       <a href="#">Forget Password?</a>
   </div> 
</body>
</html>
