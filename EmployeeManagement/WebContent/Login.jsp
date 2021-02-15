<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

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
  background-image: url("loginsu.png");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
background-position: bottom;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>

<meta charset="ISO-8859-1">
<title>Login Jsp</title>
</head>
<body>
<%
String empid=request.getParameter("empid");
//session.putValue("userid", userid);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","root");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from emp1 where empid='" +empid+ "' and password='"+password+"'");
if(rs.next()){
	if(rs.getString(2).equals(password)){
		out.println("welcome "+empid);
	}else
	{
		out.println("Invalid password try again");
	}
}
else


%>
<a href="viewuser.jsp">View Employees Details</a>

<a href="Logout.jsp">Logout</a>
<div class="bg"></div>

</body>

</html>