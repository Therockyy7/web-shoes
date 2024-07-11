/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Products;
import model.ProductsDB;

/**
 *
 * @author LENOVO
 */
public class ShowAddToBag extends HttpServlet {
    Map<Products,String> pro = new HashMap<>();
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
            out.println("<title>Servlet ShowAddToBag</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowAddToBag at " + request.getContextPath() + "</h1>");
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
            case "addToBag":
                doAddToBag(request,response);
                break;
            case "showBag":
                doShowBag(request, response);
                break;
            case "delete":
                doDeleteInBag(request, response);
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

    private void doAddToBag(HttpServletRequest request, HttpServletResponse response) {
        String sizeProduct = null;
        String[] checkedValues = request.getParameterValues("checkboxes");
        if (checkedValues != null && checkedValues.length > 0) {
            // Only the last selected checkbox value will be used
            sizeProduct = checkedValues[checkedValues.length - 1];
        } else {
            System.out.println("No checkboxes selected.");
            // Handle the case where no checkbox is selected
            return;
        }

        String idProduct_String = request.getParameter("id");
        int idProduct;
        try {
            idProduct = Integer.parseInt(idProduct_String);
        } catch (NumberFormatException e) {
            System.out.println("Invalid product ID: " + idProduct_String);
            // Handle invalid product ID format
            return;
        }

        try {
            Products products = ProductsDB.getProductById(idProduct);
            if (products == null) {
                System.out.println("Product not found with ID: " + idProduct);
                // Handle the case where the product is not found
                return;
            }

            // Initialize the map if it is null
            if (pro == null) {
                pro = new HashMap<>();
            }

            // Update the product with the new size if it exists, otherwise add it
            boolean productFound = false;
            for (Map.Entry<Products, String> entry : pro.entrySet()) {
                if (entry.getKey().getProductID() == products.getProductID()) {
                    entry.setValue(sizeProduct); // Update the size
                    productFound = true;
                    break;
                }
            }

            if (!productFound) {
                pro.put(products, sizeProduct); // Add the product with the size
            }

            // Set the updated map to the request attribute
            request.setAttribute("MapProduct", pro);
            request.getRequestDispatcher("include/shopBag.jsp").forward(request, response);
//            request.getRequestDispatcher("include/shopBag_2.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, null, ex);
        }
}
    
    private void doShowBag(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession MapProductSession = request.getSession();
            MapProductSession.setAttribute("mapProduct", pro);
            
            request.setAttribute("MapProduct", pro);
            request.getRequestDispatcher("include/shopBag.jsp").forward(request, response);
//            request.getRequestDispatcher("include/shopBag_2.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void doDeleteInBag(HttpServletRequest request, HttpServletResponse response) {
        String idProduct_String = request.getParameter("id");
        int idProduct = 0;
        try {
            idProduct = Integer.parseInt(idProduct_String);
        } catch (NumberFormatException e) {
            // Handle invalid integer parsing
            Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, "Invalid product ID: " + idProduct_String, e);
            try {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
            } catch (IOException ex) {
                Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, null, ex);
            }
            return;
        }

        try {
            Products products = ProductsDB.getProductById(idProduct);
            if (products == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

            boolean found = false;
            Iterator<Map.Entry<Products, String>> iterator = pro.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<Products, String> item = iterator.next();
                if (item.getKey().getProductID() == products.getProductID()) {
                    iterator.remove();
                    found = true;
                    break;
                }
            }

            if (!found) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found in the bag");
                return;
            }

            request.setAttribute("MapProduct", pro);
            request.getRequestDispatcher("include/shopBag.jsp").forward(request, response);
//            request.getRequestDispatcher("include/shopBag_2.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, null, ex);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
            } catch (IOException ex1) {
                Logger.getLogger(ShowAddToBag.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

}
