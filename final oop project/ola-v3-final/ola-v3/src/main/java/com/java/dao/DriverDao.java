package com.java.dao;

import com.java.model.Driver;
import com.java.utils.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverDao {

    public Driver login(String username, String password) {
        String sql = "SELECT * FROM driver WHERE Username = ? AND Password = ?";
        Driver driver = null;

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                driver = new Driver();
                driver.setDriverId(rs.getInt("DriverID"));
                driver.setDriverName(rs.getString("DriverName"));
                driver.setLicenseNo(rs.getString("LicenseNo"));
                driver.setContactNo(rs.getString("ContactNo"));
                driver.setUsername(rs.getString("Username"));
                driver.setPassword(rs.getString("Password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return driver;
    }

    // Method for inserting a new driver
    public boolean insertDriver(Driver driver) {
        String sql = "INSERT INTO driver (DriverID, DriverName, LicenseNo, ContactNo, Username, Password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, driver.getDriverId());
            ps.setString(2, driver.getDriverName());
            ps.setString(3, driver.getLicenseNo());
            ps.setString(4, driver.getContactNo());
            ps.setString(5, driver.getUsername());
            ps.setString(6, driver.getPassword());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method for deleting a driver
    public boolean deleteDriver(int driverId) {
        String sql = "DELETE FROM driver WHERE DriverID = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, driverId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method for listing all drivers
    public List<Driver> getAllDrivers() {
        String sql = "SELECT * FROM driver";
        List<Driver> drivers = new ArrayList<>();

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("DriverID"));
                driver.setDriverName(rs.getString("DriverName"));
                driver.setLicenseNo(rs.getString("LicenseNo"));
                driver.setContactNo(rs.getString("ContactNo"));
                driver.setUsername(rs.getString("Username"));
                driver.setPassword(rs.getString("Password"));
                drivers.add(driver);
                System.out.println("Driver ID: " + driver.getDriverId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return drivers;
    }
    
    public Driver getFirstDriver() {
        String sql = "SELECT * FROM driver LIMIT 1";  // SQL to get the first row
        Driver driver = null;

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                driver = new Driver();
                driver.setDriverId(rs.getInt("DriverID"));
                driver.setDriverName(rs.getString("DriverName"));
                driver.setLicenseNo(rs.getString("LicenseNo"));
                driver.setContactNo(rs.getString("ContactNo"));
                driver.setUsername(rs.getString("Username"));
                driver.setPassword(rs.getString("Password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return driver;
    }
    
    public boolean updateFirstDriver(Driver driver) {
        String sql = "UPDATE driver SET DriverName = ?, LicenseNo = ?, ContactNo = ?, Username = ?, Password = ? WHERE DriverID = (SELECT MIN(DriverID) FROM driver)";
        boolean rowUpdated = false;

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, driver.getDriverName());
            ps.setString(2, driver.getLicenseNo());
            ps.setString(3, driver.getContactNo());
            ps.setString(4, driver.getUsername());
            ps.setString(5, driver.getPassword());

            int rowsAffected = ps.executeUpdate();
            rowUpdated = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}
