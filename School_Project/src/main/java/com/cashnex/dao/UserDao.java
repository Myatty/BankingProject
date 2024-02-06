package com.cashnex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cashnex.model.User;

public class UserDao {

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
