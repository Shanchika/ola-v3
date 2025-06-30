<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - OLA Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to enhanced CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome for icons -->
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="index.jsp"> OLA Premium</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link"
					href="user/login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="user/register.jsp">Register</a></li>
                <li class="nav-item"><a class="nav-link" href="driver/DriverHome.jsp">Driver</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('https://images.unsplash.com/photo-1682685797208-c741d58c2eff?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
        <div class="hero-overlay">
            <div class="container text-center">
                <div class="hero-content ">
                    <h1 class="hero-title ">Your Journey, Your Choice</h1>
                    <p class="hero-subtitle">A seamless way to book, manage, and enjoy every ride with style.</p>
                    <a href="user/book_trip.jsp" class="btn btn-primary btn-lg me-3">Book a Trip</a>
                    <a href="user/register.jsp" class="btn btn-outline-light btn-lg">Get Started</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <div class="container features-section mt-5">
        <h2 class="text-center mb-5">Explore Our Premium Services</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-taxi fa-3x mb-3 feature-icon"></i>
                        <h5 class="card-title">Book a Trip</h5>
                        <p class="card-text">Enjoy a luxurious ride experience, tailored to your needs.</p>
                        <!-- <a href="book_trip.jsp" class="btn btn-primary">Book Now</a>  -->
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-history fa-3x mb-3 feature-icon"></i>
                        <h5 class="card-title">Trip History</h5>
                        <p class="card-text">Access a complete history of your trips, routes, and more.</p>
                        <!-- <a href="trip_history.jsp" class="btn btn-primary">View History</a>  -->
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-user-cog fa-3x mb-3 feature-icon"></i>
                        <h5 class="card-title">Manage Profile</h5>
                        <p class="card-text">Keep your details updated for a personalized ride experience.</p>
                       <!-- <a href="manage_profile.jsp" class="btn btn-primary">Manage Profile</a>   -->
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
