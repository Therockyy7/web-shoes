package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Products;
import model.ProductsDB;

public class SearchServlet extends HttpServlet {
    private ProductsDB productsDB = new ProductsDB(); // Tạo đối tượng ProductsDB

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        List<Products> searchResults = null;

        try {
            searchResults = productsDB.searchProductNames(query); // Gọi phương thức tìm kiếm
        } catch (Exception ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Đặt kết quả tìm kiếm vào request attribute
        request.setAttribute("searchResults", searchResults);

        // Chuyển tiếp yêu cầu đến searchProducts.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("include/searchProducts.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
