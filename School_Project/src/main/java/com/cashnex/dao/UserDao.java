package com.cashnex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao {

	public String checkAdminUsername() throws ClassNotFoundException, SQLException {

		Connection con = DBUtility.getConnection();

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from userTable");

		String userName = null;
		while (rs.next()) {
			userName = rs.getString("userName");
		}

		stmt.close();
		con.close();
		return userName;
	}

	public String checkAdminPassword() throws ClassNotFoundException, SQLException {

		Connection con = DBUtility.getConnection();

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from userTable");

		String adminPassword = null;
		while (rs.next()) {
			adminPassword = rs.getString("password");
		}

		stmt.close();
		con.close();
		return adminPassword;
	}

	public void insertUserData(String userName, String nrcNumber, String userGmail, String career
			, String userPassword, double userBalance) throws SQLException, ClassNotFoundException {
		
		Connection con = DBUtility.getConnection();
		String sql = "INSERT INTO usertable (username, nrcNumber, userGmail, career, hashedPassword, balance) VALUES (?, ?, ?, ?, ?, ?)";

		//need to hash
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, userName);
		pstmt.setString(2, nrcNumber);
		pstmt.setString(3, userGmail);
		pstmt.setString(4, career);
		pstmt.setString(5, userPassword);
		pstmt.setDouble(6, userBalance);
		
		int rowAffected = pstmt.executeUpdate();
		
		// Log here to check whether insertion is succeeded or not
		
	}

//    private ConnectionManager connectionManager;
//
//    public UserDao(ConnectionManager connectionManager) {
//        this.connectionManager = connectionManager;
//    }
//
//    public boolean createUser(User user) {
//        String sql = "INSERT INTO User (userId, username, email, password) VALUES (?, ?, ?, ?)";
//        try (Connection connection = connectionManager.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//
//        	preparedStatement.setInt(1, user.getId());
//            preparedStatement.setString(2, (String)user.getUsername());
//            preparedStatement.setString(3, (String) user.getEmail());
//            preparedStatement.setString(4, (String)user.getPassword());
//
//            int rowsAffected = preparedStatement.executeUpdate();
//            return rowsAffected > 0;
//
//        } catch (SQLException e) {
//            e.printStackTrace(); 
//            return false;
//        }
//    }
//
//    public User getUserByUserId(int userId) {
//        String sql = "SELECT * FROM User WHERE userId = ?";
//        try (Connection connection = connectionManager.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//
//            preparedStatement.setInt(1, userId);
//
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                if (resultSet.next()) {
//                    return mapResultSetToUser(resultSet);
//                }
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace(); 
//        }
//
//        return null; 
//    }
//
//
//    private User mapResultSetToUser(ResultSet resultSet) throws SQLException {
//        User user = new User();
//
//        user.setUserId(resultSet.getInt("userId"));
//        user.setUsername(resultSet.getString("username"));        
//        user.setEmail(resultSet.getString("email"));
//        user.setPassword(resultSet.getString("password"));
//        return user;
//    }

}
