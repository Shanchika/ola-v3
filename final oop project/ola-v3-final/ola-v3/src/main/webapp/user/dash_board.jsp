<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
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
<title>User Dashboard</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global CSS -->
<link rel="stylesheet" href="../css/styles.css">
<!-- Ensure this is your global stylesheet -->
</head>
<body class="fade-in">


	<!-- Dashboard Content -->
	<div class="container mt-5">
		<%
		String warMessage = request.getParameter("warning");
		if (warMessage != null && !warMessage.isEmpty()) {
		%>
		<div class="alert alert-warning text-center">
			<%=warMessage%>
		</div>
		<%
		}
		%>
		<div class="row">
			<!-- Book a Trip -->
			<div class="col-md-4">
				<div class="card text-center shadow-sm">
					<div class="card-body">
						<i class="fas fa-taxi fa-3x mb-3"></i>
						<h5 class="card-title">Book a Trip</h5>
						<p class="card-text">Plan your trip and book a vehicle with
							ease.</p>
						<a href="book_trip.jsp" class="btn btn-primary">Book Now</a>
					</div>
				</div>
			</div>

			<!-- Trip History -->
			<div class="col-md-4">
				<div class="card text-center shadow-sm">
					<div class="card-body">
						<i class="fas fa-history fa-3x mb-3"></i>
						<h5 class="card-title">Trip History</h5>
						<p class="card-text">View your past trips and booking details.</p>
						<a href="<%=request.getContextPath()%>/TripController?action=list"
							class="btn btn-primary"> View History </a>
					</div>
				</div>
			</div>

			<!-- Trip Status -->
			<div class="col-md-4">
				<div class="card text-center shadow-sm">
					<div class="card-body">
						<i class="fas fa-wpexplorer fa-3x mb-3"></i>
						<h5 class="card-title">Trip Status</h5>
						<p class="card-text">View your current trip details</p>
						<a href="trip_status.jsp" class="btn btn-primary">View Status</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Second Row -->
		<div class="row mt-4">
			<!-- Manage Profile -->
			<div class="col-md-4">
				<div class="card text-center shadow-sm">
					<div class="card-body">
						<i class="fas fa-user-cog fa-3x mb-3"></i>
						<h5 class="card-title">Manage Profile</h5>
						<p class="card-text">Update your personal information</p>
						<a href="<%= request.getContextPath() %>/manage_profile.jsp" class="btn btn-primary">Manage
							Profile</a>
					</div>
				</div>
			</div>

			<!-- Dummy Box 1 -->
			<div class="col-md-4">
				<div class="card text-center shadow-sm">
					<div class="card-body">
						<i class="fas fa-credit-card-alt fa-3x mb-3"></i>
						<h5 class="card-title">Payment</h5>
						<p class="card-text">See your spending.</p>
						<a href="manage_profile.jsp" class="btn btn-primary">Payment
							History</a>
					</div>
				</div>
			</div>

			<!-- Dummy Box 2 -->
			<div class="col-md-4">
				<div class="card text-center shadow-sm">
					<div class="card-body">
						<i class="fas fa-unlock fa-3x mb-3"></i>
						<h5 class="card-title">Offers</h5>
						<p class="card-text">Promotions tailored for you.</p>
						<a href="manage_profile.jsp" class="btn btn-primary">Claim
							Offers</a>
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
	<script
		src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/js/all.min.js"></script>
	<!-- For icons -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
