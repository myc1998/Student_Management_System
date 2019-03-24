<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课程</title>
<%
	/*Object o = session.getAttribute(Constance.SESSION_STU_INFO);
	if(o == null){
		response.sendRedirect("login.jsp");
	}
*/
%>
</head>
<body>
	<div align='center'>	
		<h3>添加课程</h3>
	</div>
	<div align="center">
	<form action="course_add_do.jsp" method="post">
		<table border='1px' cellpadding='0px' cellspacing="0px" >
			
			<tr>
				<td>课程号</td><td><input type="text" name='course_id'></td>
			</tr>
			<tr>
				<td>课程名称</td><td><input type="text" name='course_name'></td>
			</tr>
			<tr>
				<td>学分</td><td><input type="text" name='course_credit'></td>
			</tr>
			<tr>
				<td>开课学期</td><td><input type="text" name='course_semester'></td>
			</tr>
			
			<tr align='center'>
				<td colspan='2'><input type="submit" value="提交"><input type="reset" value="重置"></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>