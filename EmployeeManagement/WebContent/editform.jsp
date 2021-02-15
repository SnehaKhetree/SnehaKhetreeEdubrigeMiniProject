<%@page import="database.connection.com.DBConnection, database.connection.bean.DBbean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String empid=request.getParameter("empid");
DBbean u=DBConnection.getRecordByempid(empid);
%>


<h1>Upadte Employee Details</h1>
<form action="edituser.jsp" method="post">

<input type="hidden" name="empid" value="<%= u.getempid() %>"/>
<table>
<tr><td>Password</td><td><input type="password" name="password" value="<%= u.getpassword()%>"/></td></tr>
<tr><td>First Name</td><td><input type="text" name="fname" value="<%= u.getfname()%>"/></td></tr>
<tr><td>Last Name</td><td><input type="text" name="lname" value="<%= u.getlname()%>"/></td></tr>
<tr><td>Email</td><td><input type="email" name="email" value="<%= u.getemail()%>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Update"/></td></tr>
</table>
</form>

</body>
</html>
