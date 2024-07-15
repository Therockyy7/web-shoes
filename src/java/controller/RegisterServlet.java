/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import model.UserDB;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("Email");
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        String address = request.getParameter("Address");
        String phone = request.getParameter("Phone");
//        String role = "User";

        // Lấy thời gian hiện tại cho RegistrationDate và LastLogin
        LocalDateTime currentDateTime = LocalDateTime.now();

        // Định dạng ngày tháng năm và giờ để đưa vào cơ sở dữ liệu
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        // Sử dụng  thời gian hiện tại cho RegistrationDate và LastLogin

        String formattedRegistrationDate = currentDateTime.format(formatter);
        String formattedLastLogin = currentDateTime.format(formatter);
//        String formattedRegistrationDate = "2024-01-01 00:00:00.000";
//        String formattedLastLogin = "2024-01-01 00:00:00.000";


        UserDB ud = new UserDB();
        User user;
        String message = "Something wrong";
        int slUPrev = ud.getNumberUsers();

        boolean isDup = ud.userExists(email);
        if (isDup == true) {
            message = "This email has been registered!";
            request.setAttribute("error", message);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            user = new User(username, email, password, address, phone, formattedRegistrationDate, formattedLastLogin);
//            ud.insert(username, email, password, address, phone, formattedRegistrationDate, formattedLastLogin);
                ud.insert(user);
            int slUAfter = ud.getNumberUsers();
            if (slUAfter > slUPrev) {
                message = "Register successfully. Please Login!";
            }
            request.setAttribute("successfully", message);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
