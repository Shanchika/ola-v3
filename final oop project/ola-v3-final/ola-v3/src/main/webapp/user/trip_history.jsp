<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, java.util.List,
java.util.Map, java.util.HashMap, com.java.model.Trip"%>
<%@ include file="../shared/navbar.jsp"%>
<% if (session == null)
{ response.sendRedirect("user/login.jsp?error=Please log in first"); return; }
List<Trip>tripHistory = (List<Trip>) request.getAttribute("tripHistory"); // Retrieve user details from
  String userName = (String) session.getAttribute("userName"); 
  String userEmail = (String) session.getAttribute("email"); 
  String userRole = (String) session.getAttribute("userRole"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trip History - OLA Booking</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="../css/styles.css" />
</head>
<body class="fade-in">
	<!-- Trip History -->
	<div class="container mt-5">
		<h3 class="text-center">Trip History</h3>
		<% String successMessage = request.getParameter("error"); if
          (successMessage != null && !successMessage.isEmpty()) { %>
		<div class="alert alert-danger text-center"><%=successMessage%></div>
		<% } %>
		<% String infoMessage = request.getParameter("message"); if
          (infoMessage != null && !infoMessage.isEmpty()) { %>
		<div class="alert alert-primary text-center"><%=infoMessage%></div>
		<% } %>
		<div class="table-responsive">
			<table class="table table-striped table-hover table-bordered mt-4">
				<thead class="table-dark">
					<tr>
						<th>Pickup Location</th>
						<th>Destination</th>
						<th>Vehicle Type</th>
						<th>Price</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<td>
				<tbody>
					<% if (tripHistory != null && !tripHistory.isEmpty()) { for
                  (Trip trip : tripHistory) { %>
					<tr>
						<td><%=trip.getPickupLocation()%></td>
						<td><%=trip.getDestination()%></td>
						<td><%=trip.getVehicleType()%></td>
						<td>$<%=trip.getPrice()%></td>
						<td><%="Completed"%></td>
						<!-- Delete Form -->
						<td>
							<form
								action="<%=request.getContextPath()%>/TripController?action=delete"
								method="POST"
								onsubmit="return confirm('Are you sure you want to delete this trip?');">
								<input type="hidden" name="tripId" value="<%=trip.getId()%>" />
								<button type="submit" class="btn btn-danger btn-sm">
									Delete</button>
							</form>
						</td>
					</tr>
					<% } } else { %>
					<tr>
						<td colspan="6" class="text-center">No trip history found</td>
					</tr>
					<% } %>
				</tbody>
				</td>
			</table>
		</div>
	</div>

	<!-- Footer -->
	<footer class="text-center py-4 mt-5">
		<p>&copy; 2024 OLA Premium | All Rights Reserved</p>
	</footer>

	<!-- Bootstrap and JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/js/all.min.js"></script>
	<!-- For icons -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</Trip>
</Trip>
