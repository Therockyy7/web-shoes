/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.DatabaseInfo.DBURL;
import static model.DatabaseInfo.DRIVERNAME;
import static model.DatabaseInfo.PASSDB;
import static model.DatabaseInfo.USERDB;
import static model.ProductsDB.getConnectionWithSqlJdbc;

/**
 *
 * @author LENOVO
 */
public class PromotionsDB implements DatabaseInfo{
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
    
    public static  Promotion getPromotionById(int id) throws Exception {
        Promotion promotion = null;
        
        try(Connection con = getConnectionWithSqlJdbc()){
            PreparedStatement stmt = con.prepareStatement("Select PromotionID, Code, DiscountPercentage, ValidFrom, ValidTo, Description from Promotions where PromotionID = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                promotion = new Promotion();
                promotion.setPromotionID(rs.getInt("PromotionID"));
                promotion.setCode(rs.getString("Code"));
                promotion.setDiscountPercentage(rs.getInt("DiscountPercentage"));
                promotion.setValidFrom(rs.getDate("ValidFrom"));
                promotion.setValidTo(rs.getDate("ValidTo"));
                promotion.setDescription(rs.getString("Description"));
            }
        }catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error retrieving promotion: " + e.getMessage());
        }
        return promotion;
    }
    
    public static  Promotion getPromotionByCode(String code) throws Exception {
        Promotion promotion = null;
        
        try(Connection con = getConnectionWithSqlJdbc()){
            PreparedStatement stmt = con.prepareStatement("Select PromotionID, Code, DiscountPercentage, ValidFrom, ValidTo, Description from Promotions where Code = ?");
            stmt.setString(1, code);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                promotion = new Promotion();
                promotion.setPromotionID(rs.getInt("PromotionID"));
                promotion.setCode(rs.getString("Code"));
                promotion.setDiscountPercentage(rs.getInt("DiscountPercentage"));
                promotion.setValidFrom(rs.getDate("ValidFrom"));
                promotion.setValidTo(rs.getDate("ValidTo"));
                promotion.setDescription(rs.getString("Description"));
            }else{
                return promotion;
            }
        }catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error retrieving promotion: " + e.getMessage());
        }
        return promotion;
    }
    
    public static ArrayList<Promotion> listAll(){
          ArrayList<Promotion> list= new ArrayList<Promotion>();
          //Connection con = getConnect();
          try(Connection con=getConnectionWithSqlJdbc()) {
            PreparedStatement stmt=con.prepareStatement("Select PromotionID, Code, DiscountPercentage, ValidFrom, ValidTo, Description from Promotions");
            ResultSet  rs=stmt.executeQuery();
            while(rs.next()){
                list.add(new Promotion(rs.getInt(1),rs.getString(2),rs.getInt(3), rs.getDate(4), rs.getDate(5), rs.getString(6)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDB.class.getName()).log(Level.SEVERE, null, ex);
        }   
          return null;
        }
    
     public static void main(String[] a) {
        ArrayList<Promotion> list;
        list = PromotionsDB.listAll();
           
        for (Promotion item : list) {
            System.out.println(item);
        }
    }
}
