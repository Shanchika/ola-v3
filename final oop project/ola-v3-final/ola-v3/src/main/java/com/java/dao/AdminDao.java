package com.java.dao;

import com.java.utils.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDao{

    public boolean deleteUser(int userId) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE id = ?")) {
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Additional admin methods like managing promo codes can be added here
}