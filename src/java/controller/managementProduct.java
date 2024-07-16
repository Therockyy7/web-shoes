package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Products;
import model.ProductsDB;

/**
 * Servlet implementation class managementProduct
 */
public class managementProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet managementProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet managementProduct at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        switch (action) {
            case "addProduct":
                try {
                    addProduct(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "deleteProduct":
                try {
                    deleteProduct(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "updateProduct":
                try {
                    updateProduct(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            default:
                processRequest(request, response);
                break;
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        String productName = request.getParameter("productName");
        String brand = request.getParameter("brand");
        String categoryID = request.getParameter("categoryID");
        String priceString = request.getParameter("price");
        String description = request.getParameter("description");
        String[] url = new String[4];
        url[0] = request.getParameter("imageURL1");
        url[1] = request.getParameter("imageURL2");
        url[2] = request.getParameter("imageURL3");
        url[3] = request.getParameter("imageURL4");
        String imageUrl = String.join(";", url);
        String stockQuantityString = request.getParameter("stockQuantity");
        String manufacturerID = request.getParameter("manufacturerID");
        String size = request.getParameter("size");
        String gender = request.getParameter("gender");

        // Validate input if needed
        if (productName == null || productName.isEmpty() || priceString == null || priceString.isEmpty()) {
            response.sendRedirect("addProduct.jsp?error=missingFields");
            return;
        }

        double price;
        int categoryIDInt, stockQuantityInt, manufacturerIDInt;
        try {
            price = Double.parseDouble(priceString);
            categoryIDInt = Integer.parseInt(categoryID);
            stockQuantityInt = Integer.parseInt(stockQuantityString);
            manufacturerIDInt = Integer.parseInt(manufacturerID);
        } catch (NumberFormatException e) {
            response.sendRedirect("addProduct.jsp?error=invalidInput");
            return;
        }

        Products product = new Products(productName, brand, categoryIDInt, price, description, imageUrl, stockQuantityInt, manufacturerIDInt, size, gender);
        boolean success = ProductsDB.addProduct(product);

        // Redirect or forward to the appropriate page after adding the product
        if (success) {
            response.sendRedirect("productManagement.jsp");
        } else {
            response.sendRedirect("addProduct.jsp?error=dbError");
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductsDB.deleteProduct(productID);

        response.sendRedirect("productManagement.jsp");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String newProductName = request.getParameter("newProductName");
        String newBrand = request.getParameter("newBrand");
        String newCategoryIDString = request.getParameter("newCategoryID");
        String newPriceString = request.getParameter("newPrice");
        String newDescription = request.getParameter("newDescription");
        String[] url = new String[4];
        url[0] = request.getParameter("newImageURL1");
        url[1] = request.getParameter("newImageURL2");
        url[2] = request.getParameter("newImageURL3");
        url[3] = request.getParameter("newImageURL4");
        String newImageUrl = String.join(";", url);
        String newStockQuantityString = request.getParameter("newStockQuantity");
        String newManufacturerIDString = request.getParameter("newManufacturerID");
        String newSize = request.getParameter("newSize");
        String newGender = request.getParameter("newGender");

        System.out.println("Product ID: " + productID);
        System.out.println("New Product Name: " + newProductName);
        System.out.println("New Brand: " + newBrand);
        System.out.println("New Category ID: " + newCategoryIDString);
        System.out.println("New Price: " + newPriceString);
        System.out.println("New Description: " + newDescription);
        System.out.println("New Image URL: " + newImageUrl);
        System.out.println("New Stock Quantity: " + newStockQuantityString);
        System.out.println("New Manufacturer ID: " + newManufacturerIDString);
        System.out.println("New Size: " + newSize);
        System.out.println("New Gender: " + newGender);

        int newCategoryID, newStockQuantity, newManufacturerID;
        double newPrice;
        try {
            newCategoryID = Integer.parseInt(newCategoryIDString);
            newPrice = Double.parseDouble(newPriceString);
            newStockQuantity = Integer.parseInt(newStockQuantityString);
            newManufacturerID = Integer.parseInt(newManufacturerIDString);
        } catch (NumberFormatException e) {
            response.sendRedirect("updateProduct.jsp?error=invalidInput");
            return;
        }

        Products product = new Products(productID, newProductName, newBrand, newCategoryID, newPrice, newDescription, newImageUrl, newStockQuantity, newManufacturerID, newSize, newGender);
        boolean success = ProductsDB.updateProduct(product);

        if (success) {
            response.sendRedirect("productManagement.jsp");
        } else {
            response.sendRedirect("updateProduct.jsp?error=dbError");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
