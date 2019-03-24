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
String number_quire = request.getParameter("number_quire");
String name_quire = request.getParameter("name_quire");
if(name_quire !=null && !"".equals(name_quire)){
	name_quire = new String(name_quire.getBytes("ISO-8859-1"),"UTF-8");
}
	Connection conn = null;
	Statement state = null;
	ResultSet rs = null;
	
	String sql="select * from tb_student_course where 0=0 ";
	if(number_quire !=null && !"".equals(number_quire)){
		sql += " and stu_id =" + number_quire;
	}
	if(name_quire !=null && !"".equals(name_quire)){
		System.out.printf(name_quire);
		sql += " and stu_name = '" + name_quire + "'";
	}
	try{
		conn = DButil.getDBConnection();
		state = conn.createStatement();
		rs = state.executeQuery(sql);
		
%>
	<div align='center'>
		<h3>以下是全部学生的成绩信息</h3>
		<hr>
	</div>
	<div align='center'>
		<form action='' method='post'>
			<table>
				<tr>
					<td>学生编号</td><td><input type="text" name='number_quire' value="<%=number_quire==null ? "" : number_quire %>"/></td>
					<td>学生姓名</td><td><input type="text" name='name_quire' value="<%=name_quire==null ? "" : name_quire%>"></td>
				</tr>
				<tr>
					<td colspan='2'><input type='submit' value='查询'></td>
				</tr>
			</table>
		</form>
	</div>
	<div align='center'>
		<table border='1px' cellpadding='0px' cellspacing='0px' width='70%'>
			<tr>
				<th>学生学号</th><th>学生姓名</th><th>课程编号</th><th>课程名称</th><th>成绩</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
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