<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ page import='com.myc.tools.*'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
Student student=(Student) session.getAttribute(Constance.SESSION_STU_INFO); 
%>
</head>
<body>
<% 
    request.setCharacterEncoding("utf-8");
	
    String number = request.getParameter("number");
	String password = request.getParameter("password");
	
	
	Connection conn = null;
	Statement state = null;
	String sql="update tb_student set stu_password ='"+password+"' where stu_id="+student.getstu_id()+"";
	
	try{
		conn = DButil.getDBConnection(); 
		state = conn.createStatement();
		int effectedRows = state.executeUpdate(sql);
		if(effectedRows > 0){
			out.print("<h4>修改成功！</h4>");
		}else{
			out.print("<h4>修改失败！</h4>");
		}
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("ERRORINFO", e);
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}finally{
		DButil.closeStatement(state);
		DButil.closeConnection(conn);
	}
	
%>
</body>
</html>