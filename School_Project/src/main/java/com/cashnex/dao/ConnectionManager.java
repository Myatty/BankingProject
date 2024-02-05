package com.cashnex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public interface ConnectionManager {
	
	Connection getConnection() throws SQLException;
	
	String URL = "jdbc:mysql://localhost:3306/bankingDB";
	String USER = "root";
	String PASS = "Lucifer";
	
	static ConnectionManager getInstance() {
		return () -> DriverManager.getConnection(URL, USER, PASS);
	}
}
