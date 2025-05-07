package com.user;

public class User {

	private int id;
	private String name;
	private String userName;
	private String email;
	private String password;
	
	public User(int id, String name, String userName, String email, String password) {
	
		this.id = id;
		this.name = name;
		this.userName = userName;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getUsername() {
		return userName;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}
	
	
}
