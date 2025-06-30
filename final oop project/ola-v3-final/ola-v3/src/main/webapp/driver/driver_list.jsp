<%@ page import="java.util.List" %>
<%@ page import="com.java.model.Driver" %>

<%
    // Retrieve the list of drivers passed from the controller
    List<Driver> drivers = (List<Driver>) request.getAttribute("driver_list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver List</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">OLA Premium</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="driver/DriverHome.jsp">Dashboard</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Driver List Table -->
    <div class="container mt-5">
        <h2 class="text-center mb-5">Driver List</h2>
        
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

						<%
						String infoMessage = request.getParameter("error");
						if (infoMessage != null && !infoMessage.isEmpty()) {
						%>
						<div class="alert alert-danger text-center">
							<%=infoMessage%>
						</div>
						<%
						}
						%>
        
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Driver ID</th>
                        <th scope="col">Driver Name</th>
                        <th scope="col">License No</th>
                        <th scope="col">Contact No</th>
                        <th scope="col">Username</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (drivers != null && !drivers.isEmpty()) { %>
                        <% for (Driver driver : drivers) { %>
                            <tr>
                                <td><%= driver.getDriverId() %></td>
                                <td><%= driver.getDriverName() %></td>
                                <td><%= driver.getLicenseNo() %></td>
                                <td><%= driver.getContactNo() %></td>
                                <td><%= driver.getUsername() %></td>
                                <td>
                                    <!--  <a href="edit_driver.jsp?driverId=<%= driver.getDriverId() %>" class="btn btn-primary btn-sm">Edit</a> -->
                                    <form action="<%=request.getContextPath()%>/DriverController?action=delete" method="POST" style="display: inline;">
                                        <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="6" class="text-center">No drivers found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
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
