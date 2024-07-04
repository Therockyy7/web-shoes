/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categories;
import model.Products;
import model.ProductsDB;


/**
 *
 * @author LENOVO
 */
public class AllServlet extends HttpServlet {

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
            out.println("<title>Servlet AllServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AllServlet at " + request.getContextPath() + "</h1>");
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
       String action = request.getParameter("action");
        
        switch (action) {
            case "listAll":
                doListAll(request,response);
                break;
            case "showItem":
                doListItem(request,response);
                break;
            default:
                throw new AssertionError();
        }
        
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
        processRequest(request, response);
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

    private void doListAll(HttpServletRequest request, HttpServletResponse response) {
        try {
             ArrayList<Products> list = ProductsDB.listAll();
             request.setAttribute("list", list);
            request.getRequestDispatcher("include/all.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(AllServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AllServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void doListItem(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id_String = request.getParameter("id");
            int id = Integer.parseInt(id_String);
            Products products = ProductsDB.getProductById(id);
            Categories categories = ProductsDB.getCategoriestById(products.getCategoryID());
            
            request.setAttribute("categories", categories);
            request.setAttribute("product", products);
            request.getRequestDispatcher("include/card.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AllServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
