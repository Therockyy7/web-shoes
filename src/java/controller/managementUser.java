package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserDB;

/**
 * Servlet implementation class managementUser
 */
public class managementUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet managementUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet managementUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "addUser":
                addUser(request, response);
                break;
            case "deleteUser":
                deleteUser(request, response);
                break;
            case "updateUser":
                updateUser(request, response);
                break;
            default:
                processRequest(request, response);
                break;
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Validate input if needed
        // Example:
        if (username == null || username.isEmpty() || password == null || password.isEmpty() || email == null
                || email.isEmpty()) {
            // Handle validation error
            // You can redirect back to the add user page with an error message

            response.sendRedirect("addUser.jsp?error=missingFields");
            return;
        }

        // Perform additional validation such as email format, password strength, etc.
        // Convert registrationDateStr to a java.sql.Timestamp if needed
        // Add user to the database
        boolean success = UserDB.addUser(new User(username, password, email, phone, address));

        // Redirect or forward to appropriate page after adding user
        if (success) {
            response.sendRedirect("userManagement.jsp"); // Redirect to user management page upon success
        } else {
            response.sendRedirect("addUser.jsp?error=dbError"); // Handle database error case
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Perform validation if needed
        // Delete user from the database
        UserDB.deleteUser(userId);

        // Redirect or forward to appropriate page after deleting user
        response.sendRedirect("userManagement.jsp"); // Example redirection
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String newUsername = request.getParameter("newUsername");
        String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String newPhone = request.getParameter("newPhone");
        String newAddress = request.getParameter("newAddress");

        // Perform validation if needed
        // Update user in the database
        boolean success = UserDB.updateUser(new User(userId, newUsername, newPassword, newEmail, newPhone, newAddress));

        if (success) {
            response.sendRedirect("userManagement.jsp"); // Redirect to user management page upon success
        } else {
            response.sendRedirect("updateUser.jsp?error=dbError"); // Handle database error case
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
