/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Email;
import model.PayMethodsDB;

/**
 *
 * @author ADMIN
 */
public class PaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userName = request.getParameter("userNameP");
        String email = request.getParameter("emailP");
        String phone = request.getParameter("phoneP");
        String address = request.getParameter("addressP");
        String address2 = request.getParameter("addressP2");
        String country = request.getParameter("countryP");
        String zip = request.getParameter("zipP");

        String paymentMethod = request.getParameter("Type");
        String cardHolderName = request.getParameter("userNameP");
        String cardNumber = request.getParameter("CardNumber");
        String expirationDate = request.getParameter("Expiration");
        PrintWriter out = response.getWriter();

        response.setContentType("text/html");

        // Perform card validation
        PayMethodsDB pmd = new PayMethodsDB();
        boolean isValidCard = pmd.checkPaymentCard(paymentMethod, cardHolderName, cardNumber, expirationDate);

        if (isValidCard || paymentMethod == null) {
            // Card is valid, display success message, SEND EMAIL redirect to index.jsp
            Email emailSender = new Email();
            emailSender.sendOrderMail(email, userName, phone, address, address2, country, zip);
            out.println("<script>alert('Payment successful!'); window.location.href='index.jsp';</script>");
        } else {
            // Card is not valid, display error message and redirect to ShowAddToBag?action=showBag
            out.println("<script>alert('Payment failed. Please try again!'); window.location.href='ShowAddToBag?action=showBag';</script>");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
