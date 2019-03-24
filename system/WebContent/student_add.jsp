<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生注册</title>
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
		<h3>学生注册</h3>
	</div>
	<div align="center">
	<form action="student_add_do.jsp" method="post">  <!-- action为目标文件  method为传值方法 -->
		<table border='1px' cellpadding='0px' cellspacing="0px" >
			<tr>
				<td>学生学号</td><td><input type="text" name='number'></td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;码</td><td><input type="password" name='password'></td>
			</tr>
			<tr>
				<td>学生姓名</td><td><input type="text" name='name'></td>
			</tr>
			<tr>
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;别</td><td><input type="radio" name='sex' value="男">男<input type="radio" name='sex' value="女">女</td>
			</tr>
			<tr>
				<td>年&nbsp;&nbsp;&nbsp;&nbsp;龄</td><td><input type="text" name='age'></td>
			</tr>
			<tr>
				<td>专&nbsp;&nbsp;&nbsp;&nbsp;业</td><td><input type="text" name='major'></td>
			</tr>
			<tr>
				<td>学&nbsp;&nbsp;&nbsp;&nbsp;期</td><td><input type="text" name='sdept'></td>
			</tr>
			<tr>
				<td>电&nbsp;&nbsp;&nbsp;&nbsp;话</td><td><input type="text" name='Tel'></td>
			</tr>
			<tr>
				<!--  <td>照片上传<td><input type="file" name="myFile">
			                  <input type="submit" value="上传" onclick="UploadServlet"></td> -->
			</tr>
			<tr align='center'>
				<td colspan='2'><input type="submit" value="提交"><input type="reset" value="重置"></td>
			</tr>
		</table>
		</form>
	<form action="UploadServlet" method="post"  enctype="multipart/form-data">
	       <table>
	       <tr>
	      <td>照片上传</td><td><input type="file" name="myFile">
			                  <input type="submit" value="上传" ></td></tr></table>
	
	</form>
	</div>
</body>
</html>