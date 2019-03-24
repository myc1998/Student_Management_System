<%@ page isELIgnored="false"  language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>  <!-- isELIgnored="false" 把el表达式设置为可以使用  -->
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import='java.util.ArrayList'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生列表</title>

<script type="text/javascript">
	function student_add(){
		alert('将跳转至注册页面');
		window.location.href='student_add.jsp';
	}
</script>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String number_quire = request.getParameter("number_quire");
String name_quire = request.getParameter("name_quire");
/*if(name_quire !=null && !"".equals(name_quire)){
	name_quire = new String(name_quire.getBytes("ISO-8859-1"),"UTF-8");
}*/

Connection conn = null;
Statement state = null;
ResultSet rs = null;

String sql="select * from tb_student where 0=0 ";
if(number_quire !=null && !"".equals(number_quire)){
	sql += " and stu_id =" + number_quire;
}
if(name_quire !=null && !"".equals(name_quire)){
	sql += " and stu_name = '" + name_quire + "'";
}

try{
	conn = DButil.getDBConnection();
	state = conn.createStatement();
	rs = state.executeQuery(sql);
	System.out.println(sql);
		ArrayList<Object> students = new ArrayList<Object>();
	while(rs.next()){
		Student student = new Student();
		student.setNO(rs.getString("NO"));
		System.out.println(student.getNO());
		student.setstu_id(rs.getString("stu_id"));
		student.setstu_name(rs.getString("stu_name"));
		student.setstu_sex(rs.getString("stu_sex"));
		student.setstu_age(rs.getInt("stu_age"));
		student.setstu_major(rs.getString("stu_major"));
		student.setstu_sdept(rs.getString("stu_sdept"));
		student.setstu_phone(rs.getString("stu_phone"));
		students.add(student);
	}
		session.setAttribute("students", students);
	
	%>		

	<div align='center'>
		<h3>以下全部学生的信息</h3>
		<hr>
	</div>
	<div align='center'>
		<form action='' method="get">
			<table>
				<tr>
					<td>学生编号</td><td><input type="text" name='number_quire' value="<%=number_quire==null ? "" : number_quire %>"/></td>
					<td>学生姓名</td><td><input type="text" name='name_quire' value="<%=name_quire==null ? "" : name_quire%>"></td>
				</tr>
				<tr>
					<td colspan='2'><input type='submit' value='查询'></td>
					<td colspan='2'><input type='button' value='注册' onclick='student_add();'></td>
				</tr>
			</table>
		</form>
	</div>
	<div align='center'>
	<hr> 
		<table border='1px' cellpadding='0px' cellspacing='0px' width='70%'>
			<tr>
				<th>学生编号</th><th>学生姓名</th><th>年龄</th><th>性别</th><th>专业</th><th>学期</th><th>电话</th><th>操作</th>
			</tr>
			<c:forEach items="${pageStudents }" var="student"> 
		     <tr>
		    <td>${student.stu_id }</td>
		    <td>${student.stu_name }</td>
		    <td>${student.stu_age }</td>
		    <td>${student.stu_sex }</td>
		    <td>${student.stu_major }</td>
		    <td>${student.stu_sdept }</td>
		    <td>${student.stu_phone }</td>
		    <td><a href='student_update.jsp?ID=${student.NO }'>修改</a> <a href='student_delete.jsp?ID=${student.NO }'>删除</a></td>
		    </tr> 
		 	
			</c:forEach>
		</table>
		<a href = "pageServlet?pageIndex=1">首页</a>
		<c:if test="${currentPageIndex!=1 }">
		<a href = "pageServlet?pageIndex=${currentPageIndex-1 }">上一页</a>
	     </c:if>
	     <c:if test="${currentPageIndex!=pageCount }">
	     <a href = "pageServlet?pageIndex=${currentPageIndex+1 }">下一页</a>
	     </c:if>
	     <a href = "pageServlet?pageIndex=${pageCount }">尾页</a>
	</div>
	<div align="center">  共  ${pageCount }页, 当前第  ${currentPageIndex }页</div>
 <%
 	//session.removeAttribute("students");
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