package model;

import static model.DatabaseInfo.DBURL;
import static model.DatabaseInfo.DRIVERNAME;
import static model.DatabaseInfo.PASSDB;
import static model.DatabaseInfo.USERDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDB implements DatabaseInfo {

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

    public static User login(String email, String password) {
        User user = null;
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT UserID, Username, Password, Email FROM Users WHERE Email=? AND Password=?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String username = rs.getString("Username");
                user = new User(userId, username, email, password);

                PreparedStatement roleStmt = con.prepareStatement("SELECT r.Name FROM UserRoles ur JOIN Roles r ON ur.RoleID = r.RoleID WHERE ur.UserID=?");
                roleStmt.setInt(1, userId);
                ResultSet roleRs = roleStmt.executeQuery();
                if (roleRs.next()) {
                    String role = roleRs.getString("Name");
                    user.setRole(role);
                }
                roleStmt.close();
            }
            rs.close();
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public static boolean userExists(String email) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM Users WHERE Email = ?");
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static ArrayList<User> listAllUsers() {
        ArrayList<User> userList = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Users");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int user_id = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                String Email = rs.getString("Email");
                User user = new User(user_id, Username, Email, Password);
                userList.add(user);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public static void main(String[] a) {
        ArrayList<User> list = UserDB.listAllUsers();
        for (User item : list) {
            System.out.println(item);
        }
    }

}
