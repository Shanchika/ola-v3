<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Login</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="DriverHome.jsp">OLA Premium</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("DriverHome.jsp")){%> active<%}%>" href="DriverHome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("adddriver.jsp")){%> active<%}%>" href="adddriver.jsp">Add Driver</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%if(request.getRequestURI().endsWith("DriverProfile.jsp")){%> active<%}%>" href="DriverProfile.jsp">Driver Profile</a>
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

    <!-- Success Message -->
    <div class="container mt-5">
        <%
            String successMessage = request.getParameter("success");
            if (successMessage != null && !successMessage.isEmpty()) {
        %>
        <div class="alert alert-success text-center">
            <%=successMessage%>
        </div>
        <%
            }
        %>
    </div>

    <!-- Driver Login Form -->
    <section class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow">
                    <div class="card-body">
                        <h2 class="text-center mb-4 text-uppercase text-decoration-underline">Driver Login</h2>
                        <form action="<%=request.getContextPath()%>/DriverController?action=login" method="POST">
                            <div class="form-group mb-3">
                                <label for="Username">Username</label>
                                <input type="text" class="form-control" name="aUsername" placeholder="Enter your Username" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="Password">Password</label>
                                <input type="password" class="form-control" name="aPass" placeholder="Enter your Password" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
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
