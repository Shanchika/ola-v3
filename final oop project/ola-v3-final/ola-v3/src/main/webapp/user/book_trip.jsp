<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../shared/navbar.jsp" %>
<%
    if (session == null) {
        response.sendRedirect("login.jsp?error=Please log in first");
        return;
    } 

    // Retrieve user details from session
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("email");
    String userRole = (String) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Trip - OLA Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body class="fade-in">

   

    <!-- Booking Form -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Book a Trip</h3>
                        <form action="<%= request.getContextPath() %>/TripController?action=book" method="POST">
                            <div class="form-group mb-3">
                                <label for="pickup">Pickup Location</label>
                                <input type="text" class="form-control" name="pickup" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="destination">Destination</label>
                                <input type="text" class="form-control" name="destination" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="vehicleType">Vehicle Type</label>
                                <select name="vehicleType" class="form-select" required>
                                    <option value="Car">Car</option>
                                    <option value="Bike">Bike</option>
                                    <option value="Auto">Auto</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Book Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center py-4 mt-5">
        <p>&copy; 2024 OLA Premium | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
