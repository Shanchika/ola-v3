package com.java.model;

public class Trip {
    private int id;
    private String pickupLocation;
    private String destination;
    private String vehicleType;
    private int userId;
    private double price;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

	public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}

