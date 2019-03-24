<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myc.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<%
	/*Object o = session.getAttribute(Constance.SESSION_STU_INFO);
	if(o == null){
		response.sendRedirect("login.jsp");
	}*/

%>
</head>
<body>
	<div>
	<div align="center"> <%= "功能栏" %></div>
		<ul>
			<li><a href='BMS_teacher_infor.jsp' target='show'>查看学生信息</a></li> 
			<li><a href='BMS_teacher_grade.jsp' target='show'>查看学生成绩</a></li>	
			<li><a href='BMS_teacher_course_grade.jsp' target='show'>查看课程成绩</a></li>	
		</ul>
	</div>
</body>
</html>