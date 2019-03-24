<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.myc.tools.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生信息</title>
<%
	/*Object o = session.getAttribute(Constance.SESSION_STU_INFO);
	if(o == null){
		response.sendRedirect("login.jsp");
	}*/

%>
</head>
<body>
<%
Connection conn = null;
Statement state = null;
ResultSet rs = null;
String ID = request.getParameter("ID");  //获取选择修改学生的ID
System.out.println( ID +"-------");
try{
	conn = DButil.getDBConnection();
	state = conn.createStatement();
	rs = state.executeQuery("select * from tb_student where NO = " + ID);
	if(rs.next()){
%>

<div align="center">
		<h3>修改学生信息</h3>
		<hr>
	</div>
	<div align="center">
		<form action="student_update_do.jsp" method="post">
		<input type="hidden" name="ID" value="<%=ID%>">  <!-- 一个隐藏的属性 -->
		<table>
			<tr>
				<td>学生编号：</td><td><input type="text" name="number" value="<%=rs.getString("stu_id")%>"> </td>
			</tr>
			<tr>
				<td>学生姓名：</td><td><input type="text" name="name" value="<%=rs.getString("stu_name")%>"> </td>
			</tr>
			<tr>
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;别：</td><td><input type="radio" name="sex" value="男" <%=rs.getString("stu_sex").equals("男")? "checked" : ""%>>男<input type="radio" name="sex" value="女"  <%=rs.getString("stu_sex").equals("女")? "checked" : ""%>>女 </td>
			</tr>
			<tr>
				<td>年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td><td><input type="text" name="age" value="<%=rs.getInt("stu_age")%>"> </td>
			</tr>
			<tr>
				<td>专&nbsp;&nbsp;&nbsp;&nbsp;业</td><td><input type="text" name="major" value="<%=rs.getString("stu_major")%>"> </td>
			</tr>
			<tr>
				<td>学&nbsp;&nbsp;&nbsp;&nbsp;期</td><td><input type="text" name="sdept" value="<%=rs.getString("stu_sdept")%>"> </td>
			</tr>
			<tr>
				<td>电&nbsp;&nbsp;&nbsp;&nbsp;话：</td><td><input type="text" name="Tel" value="<%=rs.getString("stu_phone")%>"> </td>
			<tr>
				<td colspan='2' align='center'><input type="submit" value="提交"> <input type="reset" value="重置"> </td>
			</tr>
		</table>
		</form>
	</div>
	<%
		}
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("ERRORINFO", e);
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}finally{
		DButil.closeResultSet(rs);
		DButil.closeStatement(state);
		DButil.closeConnection(conn);
	}
	
	%>
</body>
</html>