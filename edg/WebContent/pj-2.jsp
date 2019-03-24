<%@ page language="java" contentType="text/html charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shi yan 2</title>
</head>
<body>
	单机链接，删除学生
	<table border="1">
	<tr bgcolor=pink>
	<th>学号</th>
	<th>姓名</th>
	<th>性别</th>
	<th>删除</th>
	</tr>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String USER = "root";
	String PASS = "19980110";
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sql01","root","19980110");

	String sql="select stuno,stuname,stusex from table01";
	
	Statement stat= conn.createStatement();
	ResultSet rs = stat.executeQuery(sql);
	while(rs.next()){
		String stuno=rs.getString("stuno");
		out.println("<tr>");
		out.println("<td>"+stuno+"</tr>");
		out.println("<td>"+rs.getString("stuname")+"</td>");
		out.println("<td>"+rs.getString("stusex")+"</td>");
		out.println("<td><a href='deleteStu.jsp?stuno="+stuno+"'>删除</a></td>");
		out.println("</tr>");
	}
	
	stat.close();
	conn.close();
	%>
	</table>
</body>
</html>