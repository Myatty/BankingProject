package com.cashnex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PendingUserInfoDao {

	public void insertUserData(String userName, String nrcNumber, String userGmail, String career
			, String userPassword, Double userBalance) throws SQLException, ClassNotFoundException {
		
		Connection con = DBUtility.getConnection();
		String sql = "INSERT INTO pendingUserInfo (username, nrcNumber, gmail, career, hashedPassword, balance) VALUES (?, ?, ?, ?, ?, ?)";

		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, userName);
		pstmt.setString(2, nrcNumber);
		pstmt.setString(3, userGmail);
		pstmt.setString(4, career);
		pstmt.setString(5, userPassword);
		pstmt.setDouble(6, userBalance);
		
		int rowAffected = pstmt.executeUpdate();
		
		if (rowAffected > 0 ) {
			System.out.println("Niceee");
		}
		
		// Log here to check whether insertion is succeeded or not
		
	}
}
