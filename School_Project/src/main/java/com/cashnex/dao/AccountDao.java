package com.cashnex.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AccountDao {

	public String checkUsername() throws ClassNotFoundException, SQLException {
		
		Connection con = DBUtility.getConnection();
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT userName from userTable");
		
		//below here is implementation
		
		return null;
		
	}
	public String checkUserPassword() throws ClassNotFoundException, SQLException {
		
		Connection con = DBUtility.getConnection();
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT password from userTable");
		
		//below here is implementation
		
		return null;
		
	}
}
