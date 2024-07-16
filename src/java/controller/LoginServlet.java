package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import model.User;
import model.UserDB;


public class LoginServlet extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("Email");
        String pass = request.getParameter("Password");

        User u = UserDB.login(email, pass);
        if (u == null) {
            request.setAttribute("msg", "Wrong email or password! Please try again");
            request.setAttribute("Email", email);
            request.setAttribute("Password", pass);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
             HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            HttpSession newSession = request.getSession(true);
            newSession.setAttribute("user", u);  // Store the whole user object
            
            // Thêm cookie để lưu trữ thông tin người dùng
            Cookie emailCookie = new Cookie("userEmail", email);
            emailCookie.setMaxAge(60 * 60 * 24);  // Thời gian sống của cookie: 1 ngày
            response.addCookie(emailCookie);
            
            Cookie roleCookie = new Cookie("userRole", u.getRole());
            roleCookie.setMaxAge(60 * 60 * 24);  // Thời gian sống của cookie: 1 ngày
            response.addCookie(roleCookie);

            if ("Admin".equals(u.getRole())) {
                response.sendRedirect("adminPage.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
