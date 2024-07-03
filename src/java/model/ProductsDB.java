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

public class ProductsDB implements DatabaseInfo {

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

    public static Products getProductById(int productId) throws Exception {
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
                products.setCategoryID(rs.getInt("CategoryID"));
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
    
    public static Categories getCategoriestById(int Id) throws Exception {
        Categories categories = null;
        String query = "SELECT * FROM Categories WHERE CategoryID = ?";
        try (Connection connection = getConnectionWithSqlJdbc(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                categories = new Categories();
                categories.setName(rs.getString("Name"));  // Assuming there's an ID column in Products table
                categories.setCategoryID(rs.getInt("CategoryID"));
                categories.setDescription(rs.getString("Description"));
               
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error retrieving categories: " + e.getMessage());
        }
        return categories;
    }
    
    
     public static ArrayList<Products> listAll(){
          ArrayList<Products> list= new ArrayList<Products>();
          //Connection con = getConnect();
          try(Connection con=getConnectionWithSqlJdbc()) {
            PreparedStatement stmt=con.prepareStatement("Select ProductID, Name, Brand, CategoryID, Price, Description, ImageURL, StockQuantity, ManufacturerID from Products");
            ResultSet  rs=stmt.executeQuery();
            while(rs.next()){
                list.add(new Products(rs.getInt(1),rs.getString(2),rs.getString(3), rs.getInt(4), rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductsDB.class.getName()).log(Level.SEVERE, null, ex);
        }   
          return null;
        }
     
      public static void main(String[] a) {
        ArrayList<Products> list;
        list = ProductsDB.listAll();
           
        for (Products item : list) {
            System.out.println(item);
        }
    }
}
