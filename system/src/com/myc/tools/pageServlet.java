package com.myc.tools;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.myc.tools.Dao;
@WebServlet("/pageServlet") // 这是一个此页面的重命名
public class pageServlet extends HttpServlet {

	/**
 * 
 */
private static final long serialVersionUID = 1L; //缺省的串行版本标识
		protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException{
			int countperPage = 5;   //定义每页只显示5个数据
			HttpSession session = request.getSession();
			//默认第一页
			String pageIndex= request.getParameter("pageIndex");  //pageIndex为当前页
			if(pageIndex==null){
				pageIndex="1";
			}
			//首次访问，查询所有数据，计算页数
			@SuppressWarnings("unchecked")  //不检查先执行
			ArrayList<Object> students = (ArrayList<Object>)session.getAttribute("students");
			//将student数据送往students数据里
			//System.out.println(students.toString());
			if( students == null){
			
				Dao dao = new Dao();
				students = dao.queryAllStudents();
				session.setAttribute("students", students);  //设置session
				int pageCount;  //定义页数
				if(students.size()%countperPage==0){
					pageCount= students.size()/countperPage;
				}
				else{
					pageCount= students.size()/countperPage+1;
				}
				session.setAttribute("pageCount", pageCount);
				session.setAttribute("studentCount", students.size());
			}
			//根据当前页数在查询集合中获取数据
			int currentPageIndex = Integer.parseInt(pageIndex);  
			ArrayList<Object> pageStudents = new ArrayList<Object>();
			for(int i=0;i<students.size();i++){  //切换页面，显示不同的数据
				if(i>=(currentPageIndex-1)*countperPage&&i<(currentPageIndex)*countperPage){
					pageStudents.add(students.get(i)); 
				}
			}
			session.setAttribute("pageStudents", pageStudents);
			session.setAttribute("currentPageIndex",currentPageIndex);
			
			RequestDispatcher rd = request.getRequestDispatcher("/BMS_admain_infor.jsp"); //响应页面
			rd.forward(request,response);
		}

		}


