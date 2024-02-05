package com.cashnex.model;
public class User {

	private int userId;
    private String username;
    private String email;
    private String password;

    public void setUserId(int userId) {
    	this.userId = userId;
    }


    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public Object getEmail() {
		return this.email;
	}

	public String getUsername() {
		return this.username;
	}

	public String getPassword() {
		return this.password;
	}

	public int getId() {
		return this.userId;
	}
}
