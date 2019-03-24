package com.myc.tools;
import com.myc.tools.DButil;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.myc.tools.Student;
public class Dao {
	java.sql.Connection conn = null;
	java.sql.PreparedStatement ps = null; //接口继承
	ResultSet rs = null;
	Student student = null;
	public ArrayList<Object> queryAllStudents(){
		String sql="SELECT * from tb_student  ";
		ArrayList<Object> students = new ArrayList<Object>();
		try{
				conn = DButil.getDBConnection();
				ps = conn.prepareStatement(sql); //预处理？
				rs = ps.executeQuery();
				while(rs.next()){
						student = new Student();
						student.setNO(rs.getString("NO"));
						student.setstu_id(rs.getString("stu_id"));
						student.setstu_name(rs.getString("stu_name"));
						student.setstu_sex(rs.getString("stu_sex"));
						student.setstu_age(rs.getInt("stu_age"));
						student.setstu_major(rs.getString("stu_major"));
						student.setstu_sdept(rs.getString("stu_sdept"));
						student.setstu_phone(rs.getString("stu_phone"));
						students.add(student);
						//student.setstu_password(rs.getString("stu_password"));
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DButil.closeResultSet(rs);
		DButil.closeStatement(ps);
		DButil.closeConnection(conn);
	}
		
		return students;
}
	}