package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            HttpSession session = request.getSession();
            session.setAttribute("user", u);  // Store the whole user object
            if ("admin".equals(u.getRole())) {
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
