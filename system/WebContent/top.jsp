<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myc.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  .h2{
    text-shadow:#FF0000 0 0 10px;
    color:white;
    font-size:45px
}
.text{
   font-size:20px;
   float:left;
   -webkit-box-reflect: below 10px 
   -webkit-linear-gradient(transparent,transparent 50%,rgba(255,255,255,.5));
}

</style>  <!-- css的字体设计 -->
</head>
<body>
<%
	String logout = "|<a href='logout.jsp' target='_parent'>注销</a>";
%><div>
	<div align="left" class="text">欢迎您登录</div><br>
	<div align="center" class="h2">学生管理系统</div>
	<div  align="right">  <a href='login.jsp' target='_parent'>注销</a>  </div>
		
	</div>
</body>
</html>