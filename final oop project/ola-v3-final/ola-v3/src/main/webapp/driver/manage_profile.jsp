<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.java.model.Driver" %>

<%
    // Current
    Driver driver = (Driver) request.getAttribute("driver");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Profile - OLA Booking</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="../css/styles.css">
</head>

<body class="fade-in">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="driver/DriverHome.jsp">OLA Premium</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="driver/DriverHome.jsp">Home</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="driver/DriverProfile.jsp">Driver Profile</a>
                    </li> -->
                </ul>
            </div>
        </div>
    </nav>

    <!-- Manage Profile Form -->
    <div class="container mt-5">
        <h3 class="text-center">Manage Profile</h3>

        <!-- Success/Error Messages -->
        <%
            String successMessage = request.getParameter("error");
            if (successMessage != null && !successMessage.isEmpty()) {
        %>
        <div class="alert alert-danger text-center">
            <%=successMessage%>
        </div>
        <%
            }
        %>

        <%
            String infoMessage = request.getParameter("message");
            if (infoMessage != null && !infoMessage.isEmpty()) {
        %>
        <div class="alert alert-primary text-center">
            <%=infoMessage%>
        </div>
        <%
            }
        %>

        <!-- Profile Form -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow">
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/DriverController?action=updateProfile" method="POST">

                            <div class="form-group mb-3">
                                <label for="driverName">Driver Name</label>
                                <input type="text" class="form-control" id="driverName" name="driverName" 
                                       value="<%= driver.getDriverName() != null ? driver.getDriverName() : "" %>" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="licenseNo">License No</label>
                                <input type="text" class="form-control" id="licenseNo" name="licenseNo" 
                                       value="<%= driver.getLicenseNo()  != null ? driver.getLicenseNo()  : "" %>" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="contactNo">Contact No</label>
                                <input type="text" class="form-control" id="contactNo" name="contactNo" 
                                       value="<%= driver.getContactNo()  != null ? driver.getContactNo()  : "" %>" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username" 
                                       value="<%= driver.getUsername()  != null ? driver.getUsername()  : "" %>" readonly>
                            </div>

                            <div class="form-group mb-3">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" 
                                       value="<%= driver.getPassword()  != null ? driver.getPassword()  : "" %>" required>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Update Profile</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center py-4 mt-5 bg-dark text-white">
        <p>&copy; 2024 OLA Premium | All Rights Reserved</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
