<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.myc.tools.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生成绩信息</title>
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
String ID = request.getParameter("ID");
try{
	conn = DButil.getDBConnection();
	state = conn.createStatement();
	rs = state.executeQuery("select * from tb_student_course where NO = " + ID);
	if(rs.next()){
%>

<div align="center">
		<h3>修改学生成绩信息</h3>
		<hr>
	</div>
	<div align="center">
		<form action="grade_update_do.jsp" method="post">
		<input type="hidden" name="ID" value="<%=ID%>">
		<table>
			<tr>
				<td>学生编号：</td><td><input type="text" name="stu_id" value="<%=rs.getString("stu_id")%>"> </td>
			</tr>
			<tr>
				<td>学生姓名：</td><td><input type="text" name="stu_name" value="<%=rs.getString("stu_name")%>"> </td>
			</tr>
			<tr>
				<td>课程编号：</td><td><input type="text" name="course_id" value="<%=rs.getString("course_id")%>"> </td>
			</tr>
			<tr>
				<td>课程名称：</td><td><input type="text" name="course_name" value="<%=rs.getString("course_name")%>"> </td>
			</tr>
			<tr>
				<td>成绩：</td><td><input type="text" name="grade" value="<%=rs.getString("grade")%>"> </td>
			</tr>
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