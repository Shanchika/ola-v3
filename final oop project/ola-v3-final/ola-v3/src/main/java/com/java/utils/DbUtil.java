package com.java.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/ola4?serverTimezone=UTC";
    private static final String USER = "newuser";        // Replace with your MySQL username
    private static final String PASSWORD = "zI0XQD3UDS3Go6s0"; // Replace with your MySQL password
    private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver"; // MySQL 8+ driver

    // Static method to get database connection
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load the JDBC driver
            Class.forName(DRIVER_CLASS);

            // Establish the connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error connecting to the database", e);
        }
        return connection;
    }

    // Method to close the connection (optional)
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

