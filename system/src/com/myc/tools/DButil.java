package com.myc.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DButil {

	private static final String DB_DRIVER = "com.mysql.jdbc.Driver"; //Mysql数据库调用连接
	
//	String database;
	
	private static String url = "jdbc:mysql://localhost:3306/student";// + database;连接mysql数据库
	
	private static String user = "root"; //用户名
	
	private static String password = "19980110";  //密码

	public static Connection getDBConnection(){
		
		Connection conn = null;

		try {
			Class.forName(DB_DRIVER);
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("驱动加载出现异常：" + e);  //异常处理
		} catch (SQLException e) {
			System.out.println("数据库连接出现异常：" + e);
		}
		return conn;
	}
	
	public static void closeConnection(Connection conn){
		
		try{
			if(conn != null){
				conn.close();  //进行数据库的关闭
			}
		}catch(Exception e){
			System.out.println("数据库连接关闭异常：" + e);
		}
		
	}
	
	public static void closeStatement(Statement state){
		
		try{
			if(state != null){
				state.close();
			}
		}catch(Exception e ){
			System.out.println("Statement关闭出现异常：" + e);
		}
		
	}
	
	public static void closeResultSet(ResultSet rs){
		
		try{
			if(rs != null){
				rs.close();
			}
		}catch(Exception e ){
			System.out.println("ResultSet关闭出现异常：" + e);
		}
		
	}
}