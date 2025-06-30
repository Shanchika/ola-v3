package com.java.dao;

import com.java.model.User;
import com.java.utils.*;
import java.sql.*;

public class UserDao {

    public User validateLogin(String email, String password) {
    	User user = null;
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?")) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("user_id"));    // Assuming the table has a column "user_id"
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean registerUser(User user) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateUserProfile(String name, int user_id) {
        String sql = "UPDATE users SET name = ? WHERE user_id = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setInt(2, user_id);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Return true if update was successful

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
