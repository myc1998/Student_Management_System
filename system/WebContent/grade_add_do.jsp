<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交添加信息</title>
<%
/*	Object o = session.getAttribute(Constance.SESSION_STU_INFO);
	if(o == null){
		response.sendRedirect("login.jsp");
	}
*/
%>
</head>
<%
    request.setCharacterEncoding("utf-8");
	String stu_id = request.getParameter("stu_id");
	String stu_name = request.getParameter("stu_name");
	String course_id = request.getParameter("course_id");
	String course_name = request.getParameter("course_name");
	String grade = request.getParameter("grade");
	
	Connection conn = null;
	Statement state = null;
	String sql="insert tb_student_course (stu_id,stu_name,course_id,course_name,grade) values ('"+stu_id+"','"+stu_name+"','"+course_id+"','"+course_name+"','"+grade+"')";
	
	
	try{
		conn = DButil.getDBConnection(); 
		state = conn.createStatement();
		int effectedRows = state.executeUpdate(sql);
		if(effectedRows > 0){
			out.print("<h4>添加成功！</h4>");
		}else{
			out.print("<h4>添加失败！</h4>");
		}
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("ERROEINFO",e);
		request.getRequestDispatcher("error.jsp").forward(request,response);
	}finally{
		DButil.closeStatement(state);
		DButil.closeConnection(conn);
	}
%>	
</html>