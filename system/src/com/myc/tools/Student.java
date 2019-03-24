package com.myc.tools;

public class Student {
	private String NO;
	private String stu_id; 
	private String stu_name;
	private int stu_age; 
	private String stu_sex; 
	private String stu_major;
	private String stu_sdept;
	private String stu_phone; 
	private String stu_password; 
	
	public String getNO() {
		return NO;
	}
	public void setNO(String NO) {
		this.NO = NO;
	}
	
	public String getstu_id() {
		return stu_id;
	}
	public void setstu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getstu_name() {
		return stu_name;
	}
	public void setstu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getstu_sex() {
		return stu_sex;
	}
	public void setstu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public int getstu_age() {
		return stu_age;
	}
	public void setstu_age(int stu_age) {
		this.stu_age = stu_age;
	}
	public String getstu_major() {
		return stu_major;
	}
	public void setstu_major(String stu_major) {
		this.stu_major = stu_major;
	}
	public String getstu_sdept() {
		return stu_sdept;
	}
	public void setstu_sdept(String stu_sdept) {
		this.stu_sdept = stu_sdept;
	}
	
	public String getstu_password() {
		return stu_password;
	}
	public void setstu_password(String stu_password) {
		this.stu_password = stu_password;
	}
	public String getstu_phone() {
		return stu_phone;
	}
	public void setstu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}

	public String toString() {
		return "Student [stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_sex=" + stu_sex + ", stu_age=" + stu_age + ", "
				+"stu_major="+stu_major+",stu_sdept+"+stu_sdept+ ",stu_password="+ stu_password + ", stu_phone=" + stu_phone + "]";
	}
	
	
}
