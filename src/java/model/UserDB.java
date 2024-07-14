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
import java.util.Date;

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
                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                User user = new User(user_id, Username, Email, Password, Phone, Address);
                userList.add(user);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public static boolean addUser(User user) {
        try (Connection con = getConnect()) {
            // Check if the user already exists
            if (userExists(user.getEmail())) {
                System.out.println("User already exists");
                return false;
            }

            // Insert user into the Users table
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Users (Username, Email, Password, Address, Phone) VALUES (?, ?, ?, ?, ?)");
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getAddress());
            stmt.setString(5, user.getPhone());

            int rowsAffected = stmt.executeUpdate();
            stmt.close();

            // Check and return success or failure
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteUser(int userId) {
        try (Connection con = getConnect()) {
            // Xóa người dùng từ bảng Users
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Users WHERE UserID = ?");
            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            stmt.close();

            // Kiểm tra và trả về kết quả xóa thành công hay không
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateUser(User user) {
        try (Connection con = getConnect()) {
            // Cập nhật thông tin người dùng trong bảng Users
            PreparedStatement stmt = con.prepareStatement("UPDATE Users SET Username = ?, Password = ?, Email = ? WHERE UserID = ?");
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setInt(4, user.getUserId());

            int rowsAffected = stmt.executeUpdate();
            stmt.close();

            // Kiểm tra và trả về kết quả cập nhật thành công hay không
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static User getUserById(int userId) {
        User user = null;
        String sql = "SELECT * FROM users WHERE userId = ?";
        
        try (
            Connection con = getConnect();
            PreparedStatement stmt = con.prepareStatement(sql);
        ) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Assuming User class has constructor matching columns
                user = new User(
                    rs.getInt("userId"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("address"),
                    rs.getString("phone")
                );
            }
        } catch (SQLException ex) {
            // Handle any SQL exceptions
            ex.printStackTrace();
        }

        return user;
    }

    public static void main(String[] a) {
        ArrayList<User> list = UserDB.listAllUsers();
        for (User item : list) {
            System.out.println(item);
        }
    }

}
