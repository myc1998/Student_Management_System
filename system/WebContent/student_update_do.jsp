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
	/*Object o = session.getAttribute(Constance.SESSION_STU_INFO);
	if(o == null){
		response.sendRedirect("login.jsp");
	}*/
%>
</head>
<body>
<% 
    request.setCharacterEncoding("utf-8");  //将编码统一设置为utf-8
	int ID = Integer.parseInt(request.getParameter("ID"));	
    System.out.print(ID + "-------s");
    String number = request.getParameter("number");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	int age = Integer.parseInt(request.getParameter("age"));
	String major = request.getParameter("major");
	String sdept = request.getParameter("sdept");
	String Tel = request.getParameter("Tel");
	
	
	Connection conn = null;
	Statement state = null;
	String sql="update tb_student set stu_id = '"+number+"',stu_name ='"+name+"',stu_sex = '"+sex+"',stu_age ="+age+",stu_major = '"+major+"',stu_sdept = '"+sdept+"',stu_phone ='"+Tel+"' where NO ="+ID;
	
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
	response.sendRedirect("BMS_admain_infor.jsp");
%>
</body>
</html>