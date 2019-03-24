<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myc.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理系统</title>
</head>
<%
	/*Object o = session.getAttribute(Constance.SESSION_STU_INFO);
	if(o == null){
		response.sendRedirect("login.jsp");
	}*/

%>
<frameset rows='120,*'>   
    <frame src='top.jsp'/>
    <frameset cols='150,*'>
    	<frame src='menu_student.jsp'/>
    	<frame name='show'/>
    </frameset>
    <noframes>
    <body>
    <p>当前网页不支持frameset操作！</p>
    </body>
    </noframes>
</frameset>	
</html>