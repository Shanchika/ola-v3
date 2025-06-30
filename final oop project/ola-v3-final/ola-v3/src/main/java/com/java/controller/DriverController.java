package com.java.controller;

import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.java.dao.DriverDao;
import com.java.model.Driver;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class DriverController
 */
@jakarta.servlet.annotation.WebServlet("/DriverController")
//inheritance
public class DriverController extends HttpServlet {
	
	private DriverDao driverDAO = new DriverDao();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("login".equalsIgnoreCase(action)) {
			loginDriver(request, response);
		} else if ("insert".equalsIgnoreCase(action)) {
			insertDriver(request, response);
		} else if ("delete".equalsIgnoreCase(action)) {
			deleteDriver(request, response);
		} else if ("list".equalsIgnoreCase(action)) {
			listDrivers(request, response);
		} else if ("delete".equalsIgnoreCase(action)) {
			deleteDriver(request, response);
		} else if ("user".equalsIgnoreCase(action)) {
			getDriver(request, response);
		} else if ("updateProfile".equalsIgnoreCase(action)) {
			updateDriverProfile(request, response);
		}
	}

	// Driver login
	private void loginDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("driver/DriverHome.jsp?success=Logged In");
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//
//		Driver driver = driverDAO.login(username, password);
//
//		if (driver != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("driver", driver);
//			response.sendRedirect("dashboard.jsp");
//		} else {
//			response.sendRedirect("login.jsp?error=Invalid login credentials");
//		}
	}
	
	private void getDriver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Driver driver = driverDAO.getFirstDriver(); // Call the DAO method

        if (driver != null) {
            request.setAttribute("driver", driver);  // Set driver object as request attribute
            
			request.getRequestDispatcher("driver/manage_profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("driver/DriverLogin.jsp?message=Login First"); // Redirect if no driver found
        }
    }
	
    // Method to handle updating the first driver's profile
    private void updateDriverProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve updated form data from the request
        String driverName = request.getParameter("driverName");
        String licenseNo = request.getParameter("licenseNo");
        String contactNo = request.getParameter("contactNo");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a Driver object and set the form data
        Driver driver = new Driver();
        driver.setDriverName(driverName);
        driver.setLicenseNo(licenseNo);
        driver.setContactNo(contactNo);
        driver.setUsername(username);
        driver.setPassword(password);

        // Call the DAO to update the driver
        boolean isUpdated = driverDAO.updateFirstDriver(driver);

        // Redirect to the profile page with a success message
        Driver updated_driver = driverDAO.getFirstDriver();
        request.setAttribute("driver", updated_driver);
        if (isUpdated) {
			request.getRequestDispatcher("driver/manage_profile.jsp?message=Profile updated successfully").forward(request, response);
    
        } else {
        	request.getRequestDispatcher("driver/manage_profile.jsp?error=Profile update failed").forward(request, response);
        }
    }


	// Insert driver
	private void insertDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Driver driver = new Driver();
		Random rand = new Random();
		int n = rand.nextInt(1000000000);
		driver.setDriverId(n);
		driver.setDriverName(request.getParameter("driverName"));
		driver.setLicenseNo(request.getParameter("licenseNo"));
		driver.setContactNo(request.getParameter("contactNo"));
		driver.setUsername(request.getParameter("username"));
		driver.setPassword(request.getParameter("password"));
		System.out.println(driver.getDriverName());

		if (driverDAO.insertDriver(driver)) {
			
			response.sendRedirect("driver/DriverLogin.jsp?message=Driver added successfully");
		} else {
			response.sendRedirect("driver/adddriver.jsp?error=Failed to add driver");
		}
	}

	// Delete driver
	private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int driverId = Integer.parseInt(request.getParameter("driverId"));

		if (driverDAO.deleteDriver(driverId)) {
			List<Driver> drivers = driverDAO.getAllDrivers();
			request.setAttribute("driver_list", drivers);
			request.getRequestDispatcher("driver/driver_list.jsp?success=Driver deleted successfully").forward(request, response);
//			response.sendRedirect("driver/driver_list.jsp");
		} else {
			List<Driver> drivers = driverDAO.getAllDrivers();
			request.setAttribute("driver_list", drivers);
			request.getRequestDispatcher("driver/driver_list.jsp?error=Failed to delete driver").forward(request, response);
//			response.sendRedirect("driver/driver_list.jsp?");
		}
	}

	// List all drivers
	private void listDrivers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("it's listing drivers");

		List<Driver> drivers = driverDAO.getAllDrivers();
		request.setAttribute("driver_list", drivers);
		request.getRequestDispatcher("driver/driver_list.jsp").forward(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
