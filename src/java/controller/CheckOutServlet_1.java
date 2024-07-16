/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PayMethodsDB;
import model.Products;

/**
 *
 * @author LENOVO
 */
public class CheckOutServlet_1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath() + "</h1>");
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
        // Lấy dữ liệu từ biểu mẫu
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String userName = request.getParameter("UserName");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String address = request.getParameter("Address");
        String address2 = request.getParameter("Address2");
        String country = request.getParameter("Country");
        String zip = request.getParameter("Zip");
        String paymentMethod = request.getParameter("PaymentMethod");

        // Lấy danh sách sản phẩm từ session (hoặc cơ sở dữ liệu)
        Map<Products, String> mapProduct = (Map<Products, String>) request.getSession().getAttribute("cart");
        if (mapProduct != null) {
            request.setAttribute("cart", mapProduct);
        }
        // Đặt các giá trị vào thuộc tính của yêu cầu để sử dụng trong JSP
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("userName", userName);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("address2", address2);
        request.setAttribute("country", country);
        request.setAttribute("zip", zip);
        request.setAttribute("paymentMethod", paymentMethod);

        if (paymentMethod.equals("Payment on delivery")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("include/paymentDeli.jsp");
            dispatcher.forward(request, response);
        } else if (paymentMethod.equals("Payment by card")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("include/paymentCard.jsp");
            dispatcher.forward(request, response);
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
