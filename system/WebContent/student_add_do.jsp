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
	String number = request.getParameter("number");
	
	String name = request.getParameter("name");
	//name = new String(name.getBytes("ISO-8859-1"),"UTF-8");
	System.out.printf(name);
	
	String sex = request.getParameter("sex");
	//sex = new String(sex.getBytes("ISO-8859-1"),"UTF-8");
	
	int age = Integer.parseInt(request.getParameter("age"));

	String major = request.getParameter("major");
	//major = new String(major.getBytes("ISO-8859-1"),"UTF-8");
	

	String sdept = request.getParameter("sdept");
	//sdept = new String(sdept.getBytes("ISO-8859-1"),"UTF-8");
	
	String Tel = request.getParameter("Tel");
	//Tel = new String(Tel.getBytes("ISO-8859-1"),"UTF-8");

	String password = request.getParameter("password");
	//password = new String(password.getBytes("ISO-8859-1"),"UTF-8");
	
	Connection conn = null;
	Statement state = null;
	String sql="insert tb_student (stu_id,stu_name,stu_sex,stu_age,stu_major,stu_sdept,stu_phone,stu_password) values ('"+number+"',N'"+name+"','"+sex+"','"+age+"','"+major+"','"+sdept+"','"+Tel+"','"+password+"')";
	System.out.printf(name);
	
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