<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发生错误</title>
</head>
<body>
	<div align="center">
		<h3>操作失败</h3>
		ERROR INFO ： <%=request.getAttribute("ERRORINFO") %>
	</div>
</body>
</html>