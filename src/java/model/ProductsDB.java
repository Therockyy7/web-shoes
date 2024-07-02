package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductsDB implements DatabaseInfo {

    protected Connection getConnectionWithSqlJdbc() throws Exception {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver: " + e);
        }
        try {
            Connection connection = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return connection;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public List<Products> searchProductNames(String query) throws Exception {
        List<Products> products = new ArrayList<>();
        String SEARCH_PRODUCT_NAMES = "SELECT * FROM Products WHERE Name LIKE ?";
        try (Connection connection = getConnectionWithSqlJdbc(); PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT_NAMES)) {
            preparedStatement.setString(1, "%" + query + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // Create a Product object and set its properties from the ResultSet
                Products product = new Products();
                product.setProductID(rs.getInt("ProductID"));  // Assuming there's an ID column in Products table
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setDescription(rs.getString("Description"));
                product.setImageURL(rs.getString("ImageURL"));  // Example: Assuming there's an ImageURL column
                // Add the Product object to the list
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public Products getProductById(int productId) throws Exception {
        Products products = null;
        String query = "SELECT * FROM Products WHERE ProductID = ?";
        try (Connection connection = getConnectionWithSqlJdbc(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, productId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                products = new Products();
                products.setProductID(rs.getInt("ProductID"));  // Assuming there's an ID column in Products table
                products.setName(rs.getString("Name"));
                products.setBrand(rs.getString("Brand"));
                products.setPrice(rs.getDouble("Price"));
                products.setStockQuantity(rs.getInt("StockQuantity"));
                products.setDescription(rs.getString("Description"));
                products.setImageURL(rs.getString("ImageURL"));  // Example: Assuming there's an ImageURL column
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error retrieving products: " + e.getMessage());
        }
        return products;
    }
}
