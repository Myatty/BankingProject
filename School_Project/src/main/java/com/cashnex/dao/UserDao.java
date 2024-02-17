package com.cashnex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cashnex.model.User;

public class UserDao {

	public List<User> getUserList() throws ClassNotFoundException, SQLException {

		List<User> list = new ArrayList<User>();
		User user = null;

		Connection con = DBUtility.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM userTable");

		while (rs.next()) {
			user = new User();
			user.setUserId(rs.getInt("userId"));
			user.setUsername(rs.getString("username"));
			user.setNrcNumber(rs.getString("nrcNumber"));
			user.setEmail(rs.getString("gmail"));
			user.setCareer(rs.getString("Career"));
			user.setBalance(rs.getDouble("balance"));
			user.setPassword(rs.getString("hashedPassword"));
			list.add(user);
		}

		return list;

	}

	public List<String> checkUsernames() throws SQLException, ClassNotFoundException {
		List<String> usernames = new ArrayList<>();
		Connection con = DBUtility.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT userName FROM userTable");

		while (rs.next()) {
			usernames.add(rs.getString("userName"));
		}

		rs.close();
		stmt.close();
		con.close();

		return usernames;
	}

	public List<String> checkPasswords() throws SQLException, ClassNotFoundException {
		List<String> passwords = new ArrayList<>();
		Connection con = DBUtility.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT password FROM userTable");

		while (rs.next()) {
			passwords.add(rs.getString("password"));
		}

		rs.close();
		stmt.close();
		con.close();

		return passwords;
	}

	public void insertUserData(String userName, String nrcNumber, String userGmail, String career, String userPassword
			) throws SQLException, ClassNotFoundException {

		Connection con = DBUtility.getConnection();
		String sql = "INSERT INTO usertable (username, nrcNumber, gmail, career, hashedPassword) VALUES (?, ?, ?, ?, ?)";

		// need to hash

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, userName);
		pstmt.setString(2, nrcNumber);
		pstmt.setString(3, userGmail);
		pstmt.setString(4, career);
		pstmt.setString(5, userPassword);
//		pstmt.setDouble(6, userBalance);

		int rowAffected = pstmt.executeUpdate();

		// Log here to check whether insertion is succeeded or not
	}

	public static User getUserById(int id) throws SQLException, ClassNotFoundException {

		User user = null;
		   
			user = new User();
			String sql = "SELECT * FROM tbl_student where id="+id;
			Connection connection = DBUtility.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				user.setUserId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("username"));
				user.setNrcNumber(resultSet.getString("nrcNumber"));
				user.setEmail(resultSet.getString("gmail"));
				user.setCareer(resultSet.getString("Career"));
				user.setBalance(resultSet.getDouble("balance"));
				user.setPassword(resultSet.getString("hashedPassword"));
				}
			
		    return user;

	}

	public boolean delete(int id) throws ClassNotFoundException, SQLException {
		boolean flag = false;

		String sql = "DELETE FROM usertable where id=" + id;
		Connection con = DBUtility.getConnection();
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		int rowDeleted = preparedStatement.executeUpdate();
		if (rowDeleted > 0)
			flag = true;

		return flag;
	}

	// Insert Data using User Object
	public boolean saveUser(User user) throws SQLException, ClassNotFoundException {
		boolean flag = false;

		String sql = "INSERT INTO usertable (username, nrcNumber, userGmail, career, hashedPassword, balance) VALUES (?, ?, ?, ?, ?, ?)";
		Connection con = DBUtility.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getNrcNumber());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getCareer());
		pstmt.setString(5, user.getPassword());
		pstmt.setDouble(6, user.getBalance());
		
		int rowInserted = pstmt.executeUpdate();

		return flag;
	}

	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return false;
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
