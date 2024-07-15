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
import static model.DatabaseInfo.DBURL;
import static model.DatabaseInfo.DRIVERNAME;
import static model.DatabaseInfo.PASSDB;
import static model.DatabaseInfo.USERDB;

/**
 *
 * @author ADMIN
 */
public class PayMethodsDB implements DatabaseInfo{
    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
      
    
   public boolean checkPaymentCard(String paymentMethod, String cardHolderName,String cardNumber,String expirationDate){
       try(Connection con =getConnect()){
           PreparedStatement stmt = con.prepareStatement("SELECT * FROM PaymentMethods WHERE Type = ? "
                   + "AND CardHolderName = ? AND CardNumber = ? AND ExpirationDate = ?");
            stmt.setString(1, paymentMethod);
            stmt.setString(2, cardHolderName);
            stmt.setString(3, cardNumber);
            stmt.setString(4, expirationDate);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return true;
            }
            rs.close();
            stmt.close();
       }catch(Exception e){
           e.printStackTrace();
       }
       return false;
   }
}
