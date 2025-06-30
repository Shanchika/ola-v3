package com.java.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.java.dao.UserDao;
import com.java.model.User;

/**
 * Servlet implementation class UserController
 */
@jakarta.servlet.annotation.WebServlet("/UserController")
public class UserController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        UserDao userDao = new UserDao();

        if ("register".equalsIgnoreCase(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setRole(role);

            if (userDao.registerUser(user)) {
                response.sendRedirect("user/login.jsp?success=Registration Successful, Now Login !!!");
            } else {
                response.sendRedirect("user/register.jsp?error=Registration failed, Try again");
            }
        } else if ("login".equalsIgnoreCase(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            System.out.println("it's coming here");
            
            User user = userDao.validateLogin(email, password);
            if (user != null) {
                // Create a session and store user details in it
                HttpSession session = request.getSession(true);
                session.setAttribute("userId", user.getId());
                session.setAttribute("userName", user.getName());
                session.setAttribute("userEmail", user.getEmail());
                session.setAttribute("userRole", user.getRole());

                response.sendRedirect("user/dash_board.jsp");
            } else {
            	response.sendRedirect("user/login.jsp?error=Invalid login");
            }

        }else if ("logout".equalsIgnoreCase(action)) {
            
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();  // Invalidate the session, removing all attributes
            }

            // Redirect the user to the login page after logout
            response.sendRedirect("user/login.jsp?message=You have successfully logged out");
        }else if("updateProfile".equals(action)) {
            // Get user ID from session
            HttpSession session = request.getSession(false);
            
            Integer user_id = (Integer) session.getAttribute("userId");

            if (user_id != null) {
                // Get the updated details from the form
                String name = request.getParameter("name");


                boolean isUpdated = userDao.updateUserProfile(name, user_id);

                if (isUpdated) {
                    // Update successful, update session attribute and redirect
                	session.setAttribute("userName", name);
                    response.sendRedirect("manage_profile.jsp?message=Profile updated successfully");
                } else {
                    // Update failed, redirect with error message
                    response.sendRedirect("manage_profile.jsp?error=Failed to update profile");
                }
            } else {
                response.sendRedirect("user/login.jsp?error=Please log in first");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
