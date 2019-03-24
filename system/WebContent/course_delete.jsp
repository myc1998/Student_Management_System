<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除课程</title>

<%
	String ID = request.getParameter("ID");
	Connection conn =null;
	Statement state =null;
	String sql = "delete from tb_course where NO ="+ID;
	
	try{
		
		conn = DButil.getDBConnection();
		state = conn.createStatement();
		state.executeUpdate(sql);
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("ERRORINFO",e);
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}finally{
		DButil.closeStatement(state);
		DButil.closeConnection(conn);
	}
	
	response.sendRedirect("BMS_admain_course.jsp");
%>
</head>
</html>