<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Home</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="../css/styles.css">
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="DriverHome.jsp">OLA Premium</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("DriverHome.jsp")){%> active<%}%>" href="DriverHome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("DriverLogin.jsp")){%> active<%}%>" href="DriverLogin.jsp">Driver Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("adddriver.jsp")){%> active<%}%>" href="adddriver.jsp">Add Driver</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("DriverProfile.jsp")){%> active<%}%>" href="<%=request.getContextPath()%>/DriverController?action=list">Driver List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("DriverProfile.jsp")){%> active<%}%>" href="<%=request.getContextPath()%>/DriverController?action=user">Driver Info</a>
                    </li>
                    <% if(session.getAttribute("userLoginName") != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Section -->
    <section class="container my-5">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img class="img-fluid rounded" alt="Main Image" src="image/d30emke-c154a695-f5e8-47bd-bbcc-d385960b8b32.jpg">
            </div>
            <div class="col-md-6 text-center">
                <h1 class="text-uppercase text-decoration-underline mb-4">Driver Page</h1>
                <h3>To start your journey as a driver</h3>
                <a href="adddriver.jsp" class="btn btn-primary mt-4">Click Here to Add Details</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center py-4 mt-5 bg-dark text-white">
        <p>&copy; 2024 OLA Premium | All Rights Reserved</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
