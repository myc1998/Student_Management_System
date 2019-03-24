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
Student student=(Student) session.getAttribute(Constance.SESSION_STU_INFO); 
//获得输学生的登陆学号
%>
</head>
<body>
<%
Connection conn = null;
Statement state = null;
ResultSet rs = null;
//String ID = request.getParameter("ID");
try{
	conn = DButil.getDBConnection();
	state = conn.createStatement();
	rs = state.executeQuery("select * from tb_student where stu_id="+student.getstu_id()+"");
	if(rs.next()){
%>

<div align="center">
		<h3>修改密码</h3>
		<hr>
	</div>
	<div align="center">
		<form action="update_password_do.jsp" method="post">
		
		<table>
			<tr>
				<td>学生编号：</td><td><input type="text" name="number" value="<%=rs.getString("stu_id")%>"> </td>
			</tr>
			
			<tr>
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td><td><input type="password" name="password" value="<%=rs.getString("stu_password")%>"> </td>
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