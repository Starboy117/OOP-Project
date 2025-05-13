package com.staff;

import com.user.User;

public class Staff extends User {
	
	private String role;
	
	
	public Staff(int id, String name, String username, String email, String password, String role) {

		super(id,name,username,email,password);
		this.role = role;
	}
	
	public Staff(int id, String name, String username, String email, String role) {

		super(id,name,username,email);
		this.role = role;
	}


	public String getRole() {
		return role;
	}
	
	
	
	

}
