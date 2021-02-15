<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body, html {
  height:100%;
  margin: 0;
}

.bg {
  /* The image used */
  background-image: url("regs.jpg");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
background-position: bottom;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>

<%
String empid=request.getParameter("empid");
//session.putValue("userid",userid);

String password=request.getParameter("password");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","root");
Statement stmt = con.createStatement();
ResultSet rs;
int i=stmt.executeUpdate("insert into  emp1 values ('"+empid+"','"+password+"','"+fname+"','"+lname+"','"+email+"')");

out.println("Registered Successfully...");

%>
<br><br>
<font color="black" size="5">
<a href="Login.html">SignIn</a>
<a href="index.html">Home</a>
</center>
<div class="bg"></div>

</body>
</html>
