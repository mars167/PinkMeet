package com.pinkmeet.bean;

import com.pinkmeet.dao.UserDAO;;

public class User {
	private int id;
	private String cell_number;
	private String username;
	private String password;
	private int sex;
	private String profile;
	private long reg_time;
	private long login_time;
	private String contact;


	public User() {	
	}
	
	public User(String cell_number,String username,String password,int sex,String profile,String contact) {
		//调用父类构造方法 
		super();
		//赋值
		this.cell_number = cell_number;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.profile = profile;
		//获取时间戳
		long login_time =System.currentTimeMillis(); 
		long reg_time =System.currentTimeMillis();  
		this.reg_time = reg_time;
		this.login_time = login_time;
		this.contact = contact;
	}
	public void Regiester(User user) {
		try {
			UserDAO dao = new UserDAO();
			dao.insert(user);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCell_number() {
		return this.cell_number;
	}
	public void setCell_number(String cell_number) {
		this.cell_number = cell_number;
	}
	
	public String getUsername() {
		return this.username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getSex() {
		return this.sex;
	}
	public void setSex(int sex) {
		this.sex =sex;
	}
	
	public String getProfile() {
		return this.profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public long getReg_time() {
		return this.reg_time;
	}
	public void setReg_time(long reg_time) {
		this.reg_time = reg_time;
	}
	
	public long getLogin_time() {
		return this.login_time;
	}
	public void setLogin_time(long login_time) {
		this.login_time = login_time;
	}
	
	public String getContact(){
		return  this.contact;
	}
	public void setContact(String contact){
		this.contact = contact;
	}
	
	

}









