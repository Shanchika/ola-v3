<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../shared/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - OLA Booking</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/styles.css">
</head>
<body class="fade-in">


	<!-- Registration Form -->
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Register</h3>
						<!-- Error Message Display -->
						<%
						String errorMessage = request.getParameter("error");
						if (errorMessage != null && !errorMessage.isEmpty()) {
						%>
						<div class="alert alert-danger text-center">
							<%=errorMessage%>
						</div>
						<%
						}
						%>

						<form
							action="<%=request.getContextPath()%>/UserController?action=register"
							method="POST">
							<div class="form-group mb-3">
								<label for="name">Name</label> <input type="text"
									class="form-control" name="name" required>
							</div>
							<div class="form-group mb-3">
								<label for="email">Email</label> <input type="email"
									class="form-control" name="email" required>
							</div>
							<div class="form-group mb-3">
								<label for="password">Password</label> <input type="password"
									class="form-control" name="password" required>
							</div>
							<!-- Role Dropdown -->
							<div class="form-group mb-3">
								<label for="role">Select Role</label> <select name="role"
									class="form-select" required>
									<option value="Rider">Rider</option>
									<option value="Driver">Driver</option>
									<option value="Admin">Admin</option>
								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>
						<p class="text-center mt-3">
							Already have an account? <a href="login.jsp">Login</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="text-center py-4 mt-5">
		<p>&copy; 2024 OLA Premium | All Rights Reserved</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
