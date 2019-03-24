package com.myc.tools;

public class admian {
	
	private String admian_id; 
	private String admian_name;
	private String admian_password; 
	
	
	public String getadmian_id() {
		return admian_id;
	}
	public void setadmian_id(String admian_id) {
		this.admian_id = admian_id;
	}
	
	public String getadmian_name() {
		return admian_name;
	}
	public void setadmian_name(String admian_name) {
		this.admian_name = admian_name;
	}
	
	public String getadmian_password() {
		return admian_password;
	}
	public void setadmian_password(String admian_password) {
		this.admian_password = admian_password;
	}
	public String toString() {
		return "Admian [admain_id=" +admian_id + ", admian_name=" + admian_name +  ",admian_password="+ admian_password + "]";
	}
	
	
}