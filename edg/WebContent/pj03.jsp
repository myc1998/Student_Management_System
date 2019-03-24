<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>tangyun</title>
</head>
<body>
<%	String srcStuname="hello,唐云	";
	String urlStuname=URLEncoder.encode(srcStuname,"utf-8");
%>
	<a href="pj03.jsp?stuname=<%=urlStuname %>">唐云链接</a>
	<%
	urlStuname =request.getParameter("stuname");
	if(urlStuname!=null){
		String resStuname=
				URLDecoder.decode(urlStuname,"utf-8");
		out.println(resStuname);
	}
		%>
</body>
</html>