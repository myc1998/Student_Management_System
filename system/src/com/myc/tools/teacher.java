package com.myc.tools;

public class teacher {

	private String teacher_id; 
	private String teacher_name;
	private String teacher_password; 
	
	
	public String getteacher_id() {
		return teacher_id;
	}
	public void setteacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	
	public String getteacher_name() {
		return teacher_name;
	}
	public void setteacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	
	public String getteacher_password() {
		return teacher_password;
	}
	public void setteacher_password(String teacher_password) {
		this.teacher_password = teacher_password;
	}
	public String toString() {
		return "Teacher [admain_id=" +teacher_id + ", teacher_name=" + teacher_name +  ",teacher_password="+ teacher_password + "]";
	}
	
}
