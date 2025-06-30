<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../shared/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - OLA Booking</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/styles.css">
<!-- Use same global styles -->
</head>
<body class="fade-in">


	<!-- Login Form -->
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>
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
						String infoMessage = request.getParameter("message");
						if (infoMessage != null && !infoMessage.isEmpty()) {
						%>
						<div class="alert alert-primary text-center">
							<%=infoMessage%>
						</div>
						<%
						}
						%>

						<form
							action="<%=request.getContextPath()%>/UserController?action=login"
							method="POST">
							<div class="form-group mb-3">
								<label for="email">Email</label> <input type="email"
									class="form-control" name="email" required>
							</div>
							<div class="form-group mb-3">
								<label for="password">Password</label> <input type="password"
									class="form-control" name="password" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
						<p class="text-center mt-3">
							Don't have an account? <a href="register.jsp">Register</a>
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
