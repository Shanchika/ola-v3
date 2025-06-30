package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.AdminDao;

/**
 * Servlet implementation class AdminController
 */
@jakarta.servlet.annotation.WebServlet("/AdminController")
public class AdminController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AdminDao adminDao = new AdminDao();

        if ("deleteUser".equalsIgnoreCase(action)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            if (adminDao.deleteUser(userId)) {
                response.sendRedirect("admin/manage_users.jsp?success=User deleted");
            } else {
                response.sendRedirect("admin/manage_users.jsp?error=Failed to delete user");
            }
        } else if ("managePromos".equalsIgnoreCase(action)) {
            // Logic to manage promo codes, add/edit/delete can be implemented here
            response.sendRedirect("admin/manage_promos.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
