package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Lấy session hiện tại nếu có
        if (session != null) {
            session.invalidate(); // Hủy session
        }

        String value = request.getParameter("value");
        if ("admin".equalsIgnoreCase(value)) {
            response.sendRedirect("../index.jsp"); // Chuyển hướng về trang chủ của admin
        } else {
            response.sendRedirect("index.jsp"); // Chuyển hướng về trang chủ
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
