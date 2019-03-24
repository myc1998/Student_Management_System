package com.myc.tools;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
@WebServlet("/UploadServlet")  
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		SmartUpload smartUpload = new SmartUpload();		
		//Request req = smartUpload.getRequest();//得到Request对象
		// 初始化
		ServletConfig config = this.getServletConfig();
		smartUpload.initialize(config, request, response);				
		try {// 上传文件
			smartUpload.upload();		
			//String number = req.getParameter("number");
			//System.out.println("number的值为:" + number);			
			// 得到上传的文件对象 	
			File smartFile = smartUpload.getFiles().getFile(0);
			// 保存文件
			String filepath= "image/"+smartFile.getFileName();
			smartFile.saveAs(filepath, SmartUpload.SAVE_VIRTUAL);// 保存文件
			request.setAttribute("filepath", filepath);
			System.out.println("  ###");
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}String msg = "Upload Success!";
		System.out.println("!!!!");
		request.setAttribute("msg", msg); 
		RequestDispatcher rd = request.getRequestDispatcher("/student_add.jsp");
		rd.forward(request, response);
}}

