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
		    <li><a href='pageServlet' target='show'>学生信息管理</a></li>
		    <!-- <a> 标签定义超链接，用于从一张页面链接到另一张页面。 <a> 元素最重要的属性是 href 属性，它指示链接的目标 -->
			<li><a href='BMS_admain_grade.jsp' target='show'>学生成绩管理</a></li> 
			<li><a href='BMS_admain_course.jsp' target='show'>课程信息管理</a></li>	
		</ul>
	</div>
</body>
</html>