<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生列表</title>
<%
	Student student=(Student) session.getAttribute(Constance.SESSION_STU_INFO); 

%><!--  
<script type="text/javascript">
	function student_add(){
		alert('将跳转至注册页面');
		window.location.href='student_add.jsp';
	}
</script>-->
</head>
<body>
<%

	Connection conn = null;
	Statement state = null;
	ResultSet rs = null;
	
	String sql="select * from tb_student_course where stu_id="+student.getstu_id()+"";
	
	try{
		conn = DButil.getDBConnection();
		state = conn.createStatement();
		rs = state.executeQuery(sql);
		
%>
	<div align='center'>
		<h3>以下是你的成绩信息</h3>
		<hr>
	</div>
	
	<div align='center'>
		<table border='1px' cellpadding='0px' cellspacing='0px' width='70%'>
			<tr>
				<th>学号</th><th>课程号</th><th>课程名称</th><th>成绩</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(2) %></td>
				
				<td><%=rs.getInt(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				
				
				<!--  <td><a href='student_update.jsp?ID=<%=rs.getInt(1) %>'>修改</a> <a href='student_delete.jsp?ID=<%=rs.getInt(1)%>'>删除</a></td>-->
			</tr>
			<%
			}
			%>
		</table>
	</div>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DButil.closeResultSet(rs);
		DButil.closeStatement(state);
		DButil.closeConnection(conn);
	}
%>
</body>
</html>