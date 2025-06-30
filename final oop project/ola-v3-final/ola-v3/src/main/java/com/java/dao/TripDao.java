package com.java.dao;

import com.java.model.Trip;
import com.java.utils.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

public class TripDao {

    public boolean bookTrip(Trip trip) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO trips (pickup_location, destination_location, vehicle_type, rider_id, fare) VALUES (?, ?, ?, ?, ?)")) {
            ps.setString(1, trip.getPickupLocation());
            ps.setString(2, trip.getDestination());
            ps.setString(3, trip.getVehicleType());
            ps.setInt(4, trip.getUserId());
            ps.setDouble(5, trip.getPrice());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public double calculatePrice(String pickup, String destination, String vehicleType) {
        // Mock price calculation logic, can be expanded based on distance or other factors
        return 50.0;
    }
    
    public boolean deleteTrip(String tripId) {
        String sql = "DELETE FROM trips WHERE trip_id = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Set the tripId parameter in the SQL query
            ps.setString(1, tripId);

            // Execute the delete statement
            int rowsAffected = ps.executeUpdate();

            // Return true if a row was deleted, false otherwise
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Trip> getTripsByUserId(int userId) {
        List<Trip> trips = new ArrayList<>();
        String sql = "SELECT * FROM trips WHERE rider_id = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (!rs.isBeforeFirst()) {  // Check if ResultSet is empty
                System.out.println("No trips found for user with ID: " + userId);
            } else {
                System.out.println("Trips found for user with ID: " + userId);
            }

            while (rs.next()) {
                Trip trip = new Trip();
                trip.setId(rs.getInt("trip_id"));
                trip.setPickupLocation(rs.getString("pickup_location"));
                trip.setDestination(rs.getString("destination_location"));
                trip.setVehicleType(rs.getString("vehicle_type"));
                trip.setPrice(rs.getDouble("fare"));
                trips.add(trip);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return trips;
    }
    
   
}
