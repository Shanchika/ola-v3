<%@ page import="com.java.dao.TripDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.model.Trip" %>
<%
    TripDao tripDao = new TripDao();
    /*  List<Trip> availableTrips = tripDao.getAvailableTrips();*/
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Trips</title>
</head>
<body>
    <h2>Available Trips</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Pickup Location</th>
                <th>Destination</th>
                <th>Vehicle Type</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <% for (Trip trip : availableTrips) { %>
                <tr>
                    <td><%= trip.getPickupLocation() %></td>
                    <td><%= trip.getDestination() %></td>
                    <td><%= trip.getVehicleType() %></td>
                    <td><%= trip.getPrice() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
