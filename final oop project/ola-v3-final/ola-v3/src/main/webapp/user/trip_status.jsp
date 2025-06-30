<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../shared/navbar.jsp"%>
<%
    if (session == null) {
        response.sendRedirect("login.jsp?error=Please log in first");
        return;
    }

    // Retrieve user details from session
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("email");
    String userRole = (String) session.getAttribute("userRole");

    // Example trip data (should be retrieved from the database)
    String pickupLocation = "Main Street";
    String destinationLocation = "Central Park";
    String vehicleType = "Car";
    String tripPrice = "$20.00";
    String tripStatus = "Ongoing"; // Could be 'Ongoing', 'Completed', 'Cancelled'
    String tripId = "1";  // This ID will be useful for updating status
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Status - OLA Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body class="fade-in">


    <!-- Trip Status -->
    <div class="container mt-5">
        <h3 class="text-center">Trip Status</h3>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title text-center">Trip Details</h5>
                        <table class="table table-bordered">
                            <tr>
                                <th>Pickup Location</th>
                                <td><%= pickupLocation %></td>
                            </tr>
                            <tr>
                                <th>Destination</th>
                                <td><%= destinationLocation %></td>
                            </tr>
                            <tr>
                                <th>Vehicle Type</th>
                                <td><%= vehicleType %></td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td><%= tripPrice %></td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td><%= tripStatus %></td>
                            </tr>
                        </table>

                        <!-- Google Maps Sample -->
                        <div class="map-responsive">
                        <div style="width: 100%"><iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=1%20Grafton%20Street,%20Dublin,%20Ireland+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"><a href="https://www.gps.ie/">gps tracker sport</a></iframe></div>
                        
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center py-4 mt-5">
        <p>&copy; 2024 OLA Premium | All Rights Reserved</p>
    </footer>

    <!-- Bootstrap and JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Google Maps API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY"></script>

    <script>
        function initMap() {
            // The location of the pickup point (you can customize the latitude/longitude)
            const pickupLocation = { lat: 40.7128, lng: -74.006
