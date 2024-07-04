package controller;

//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Products;
import model.ProductsDB;

public class ShowInfoProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy productId từ request
        String productIdStr = request.getParameter("productId");
        int productId = Integer.parseInt(productIdStr);

        // Khởi tạo ProductDAO và lấy thông tin sản phẩm
        ProductsDB productDB = new ProductsDB();
        Products product = null;
        try {
            product = productDB.getProductById(productId);
        } catch (Exception ex) {
            Logger.getLogger(ShowInfoProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Đặt sản phẩm làm thuộc tính của request
        request.setAttribute("product", product);

        // Chuyển tiếp đến trang JSP để hiển thị thông tin chi tiết của sản phẩm
        request.getRequestDispatcher("include/showInfoProduct.jsp").forward(request, response);
    }
}
