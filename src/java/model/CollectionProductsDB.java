/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author ACER
 */
public class CollectionProductsDB implements DatabaseInfo{
    public static Connection getConnectionWithSqlJdbc() throws Exception {
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
    
public static List<CollectionProducts> getProductsByCollectionId(int collectionId) throws Exception {
    List<CollectionProducts> products = new ArrayList<>();
    String query = "SELECT * FROM CollectionProducts WHERE CollectionID = ?";
    try (Connection connection = getConnectionWithSqlJdbc();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, collectionId);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            CollectionProducts product = new CollectionProducts();
            product.setProductID(rs.getInt("ProductID"));
            product.setCollectionID(rs.getInt("CollectionID"));
            product.setName(rs.getString("Name"));
            product.setCategoryID(rs.getInt("CategoryID"));
            product.setPrice(rs.getDouble("Price"));
            product.setStockQuantity(rs.getInt("StockQuantity"));
            product.setDescription(rs.getString("Description"));
            product.setImageURL(rs.getString("ImageURL"));
            product.setSize(rs.getString("Size"));
            product.setGender(rs.getString("Gender"));
            products.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error retrieving products by collection ID: " + e.getMessage());
    }
    return products;
}

public static CollectionProducts getProductById(int productID) throws Exception {
    CollectionProducts product = null;
    String query = "SELECT * FROM CollectionProducts WHERE ProductID = ?";
    try (Connection connection = getConnectionWithSqlJdbc();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, productID);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            product = new CollectionProducts();
            product.setProductID(rs.getInt("ProductID"));
            product.setCollectionID(rs.getInt("CollectionID"));
            product.setName(rs.getString("Name"));
            product.setCategoryID(rs.getInt("CategoryID"));
            product.setPrice(rs.getDouble("Price"));
            product.setStockQuantity(rs.getInt("StockQuantity"));
            product.setDescription(rs.getString("Description"));
            product.setImageURL(rs.getString("ImageURL"));
            product.setSize(rs.getString("Size"));
            product.setGender(rs.getString("Gender"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error retrieving product: " + e.getMessage());
    }
    return product;
}

}
