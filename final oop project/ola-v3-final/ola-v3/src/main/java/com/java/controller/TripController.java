package com.java.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.java.dao.TripDao;
import com.java.model.Trip;
import java.util.List;

/**
 * Servlet implementation class TripController
 */
@jakarta.servlet.annotation.WebServlet("/TripController")
public class TripController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		TripDao tripDao = new TripDao();

		if ("book".equalsIgnoreCase(action)) {
			String pickup = request.getParameter("pickup");
			String destination = request.getParameter("destination");
			String vehicleType = request.getParameter("vehicleType");
			int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
			double price = tripDao.calculatePrice(pickup, destination, vehicleType);

			Trip trip = new Trip();
			trip.setPickupLocation(pickup);
			trip.setDestination(destination);
			trip.setVehicleType(vehicleType);
			trip.setUserId(userId);
			trip.setPrice(price);

			if (tripDao.bookTrip(trip)) {
				response.sendRedirect("user/trip_status.jsp");
			} else {
				response.sendRedirect("user/book_trip.jsp?error=Booking failed");
			}
		} else if ("delete".equalsIgnoreCase(action)) {
			String tripId = request.getParameter("tripId");

			System.out.println("delete TripId: " + tripId);
			// Call DAO to delete the trip from the database
			boolean isDeleted = tripDao.deleteTrip(tripId);

			// Redirect to the trip history page with a success or failure message

			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("userId") == null) {
				response.sendRedirect("user/login.jsp?error=Please log in first");
				return;
			}

			// Get user ID from session
			int userId = (Integer) session.getAttribute("userId");
			// System.out.println("User ID: " + userId);
			// Fetch trip history for the user
			List<Trip> tripHistory = tripDao.getTripsByUserId(userId);
			if (tripHistory != null && !tripHistory.isEmpty()) {
				for (Trip trip : tripHistory) {
					System.out.println("Trip ID: " + trip.getId());
				}
			} else {
				// System.out.println("No trips found for this user.");
			}

			// Set trip history as request attribute
			request.setAttribute("tripHistory", tripHistory);

			// Forward to trip history JSP
			String message = "";
			if (isDeleted) {
				request.getRequestDispatcher("user/trip_history.jsp?message=Trip deleted successfully").forward(request,
						response);

			} else {
				request.getRequestDispatcher("user/trip_history.jsp?error=Failed to delete the trip").forward(request,
						response);
			}

		} else if ("list".equalsIgnoreCase(action)) {
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("userId") == null) {
				response.sendRedirect("user/login.jsp?error=Please log in first");
				return;
			}

			// Get user ID from session
			int userId = (Integer) session.getAttribute("userId");
			// System.out.println("User ID: " + userId);
			// Fetch trip history for the user
			List<Trip> tripHistory = tripDao.getTripsByUserId(userId);
			if (tripHistory != null && !tripHistory.isEmpty()) {
				for (Trip trip : tripHistory) {
					System.out.println("Trip ID: " + trip.getId());
				}
			} else {
				// System.out.println("No trips found for this user.");
			}

			// Set trip history as request attribute
			request.setAttribute("tripHistory", tripHistory);

			// Forward to trip history JSP
			request.getRequestDispatcher("user/trip_history.jsp").forward(request, response);

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
