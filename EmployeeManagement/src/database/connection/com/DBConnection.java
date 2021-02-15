package database.connection.com;

import java.sql.*;

import java.util.*;


import database.connection.bean.DBbean;


public class DBConnection {
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	public static int save(DBbean u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into emp1(empid,password,fname,lname,email) values(?,?,?,?,?)");
			ps.setString(1,u.getempid());
			ps.setString(2,u.getpassword());
			ps.setString(3,u.getfname());
			ps.setString(4,u.getlname());
			ps.setString(5,u.getemail());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
public static int update(DBbean u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("update emp1 set password=?,fname=?,lname=?,email=? where empid=?");
			ps.setString(1,u.getpassword());
			ps.setString(2,u.getfname());
			ps.setString(3,u.getlname());
			ps.setString(4,u.getemail());
			ps.setString(5,u.getempid());
		
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
public static int delete(DBbean u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from emp1 where empid=?");
		ps.setString(1,u.getempid());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}

	return status;
}
public static List<DBbean> getAllRecords(){
	List<DBbean> list=new ArrayList<DBbean>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from emp1");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			DBbean u=new DBbean();
			u.setempid(rs.getString("empid"));
			u.setpassword(rs.getString("password"));
			u.setfname(rs.getString("fname"));
			u.setlname(rs.getString("lname"));
			u.setemail(rs.getString("email"));
			
			list.add(u);
		}
	}catch(Exception e){System.out.println(e);}
	return list;
}
public static DBbean getRecordByempid(String empid){
	DBbean u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from emp1 where empid=?");
		ps.setString(1,empid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			u=new DBbean();
			u.setempid(rs.getString("empid"));
			u.setpassword(rs.getString("password")); 
			u.setfname(rs.getString("fname"));
			u.setlname(rs.getString("lname"));
			u.setemail(rs.getString("email"));
			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
}
}
