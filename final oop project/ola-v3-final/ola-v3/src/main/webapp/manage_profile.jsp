<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.java.model.User"%>
<%@ include file="shared/navbar.jsp" %>
<%
// Assume session is already created and user is logged in
if (session == null) {
	response.sendRedirect("user/login.jsp?error=Please log in first");
	return;
} // Assuming 'loggedInUser' is stored in session after login

String userName = (String) session.getAttribute("userName");
String userEmail = (String) session.getAttribute("email");
String userRole = (String) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Profile - OLA Booking</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/styles.css">
</head>

<body class="fade-in">
	
	<div class="container mt-5">
		<h3 class="text-center">Manage Profile</h3>
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
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form
					action="<%=request.getContextPath()%>/UserController?action=updateProfile"
					method="POST">
					<div class="form-group mb-3">
						<label for="name">Name</label> <input type="text"
							class="form-control" id="name" name="name" value="<%=userName%>"
							required>
					</div>
					<%-- <div class="form-group mb-3">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" name="email"
							value="<%=userEmail%>" readonly>
					</div> --%>
					<div class="form-group mb-3">
						<label for="phone">Phone</label> <input type="text"
							class="form-control" id="phone" name="phone"
							value="(+94) 753423428" required>
					</div>
					<div class="form-group mb-3">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" name="address"
							value="Malabe Colombo" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Update
							Profile</button>
					</div>
				</form>
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
