package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT UserID, Username, Password, Email FROM Users WHERE Email=? AND Password=?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String username = rs.getString("Username");
                user = new User(userId, username, email, password);

                PreparedStatement roleStmt = con.prepareStatement(
                        "SELECT r.Name FROM UserRoles ur JOIN Roles r ON ur.RoleID = r.RoleID WHERE ur.UserID=?");
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
    
     public void insert(User c) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO [dbo].[Users]\n"
                    //                    + "           ([UserID]\n"
                    + "           ([UserName]\n"
                    + "           ,[Email]\n"
                    + "           ,[Password]\n"
                    + "           ,[Address]\n"
                    + "           ,[Phone]\n"
                    + "           ,[RegistrationDate]\n"
                    + "           ,[LastLogin])\n"
                    + "     VALUES (?,?,?,?,?,?,?)");
            stmt.setString(1, c.getUsername());
            stmt.setString(2, c.getEmail());    
            stmt.setString(3, c.getPassword());
            stmt.setString(4, c.getAddress());
            stmt.setString(5, c.getPhone());
            stmt.setString(6, c.getRegistrationDate());
            stmt.setString(7, c.getLastLogin());
//            stmt.setDate(6, new java.sql.Date(c.getRegistrationDate().getTime()));
//            stmt.setDate(7, new java.sql.Date(c.getLastLogin().getTime()));

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Add successful!");
            } else {
                System.out.println("Failed add!");
            }

            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
//Rim
    public void insert(String UserName, String Email, String Password, String Address, String Phone, String RegistrationDate, String LastLogin) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO [dbo].[Users]\n"
                    //                    + "           ([UserID]\n"
                    + "           ([UserName]\n"
                    + "           ,[Email]\n"
                    + "           ,[Password]\n"
                    + "           ,[Address]\n"
                    + "           ,[Phone]\n"
                    + "           ,[RegistrationDate]\n"
                    + "           ,[LastLogin])\n"
                    + "     VALUES (?,?,?,?,?,?,?)");
            stmt.setString(1, UserName);
            stmt.setString(2, Email);
            stmt.setString(3, Password);
            stmt.setString(4, Address);
            stmt.setString(5, Phone);
            stmt.setString(6, RegistrationDate);
            stmt.setString(7, LastLogin);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Add successful!");
            } else {
                System.out.println("Failed add!");
            }
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteUserByEmail(String email) {
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("DELETE FROM Users WHERE email = ?");
            st.setString(1, email);
            int rowsDeleted = st.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("User with email " + email + " was deleted successfully.");
            } else {
                System.out.println("No user found with email " + email + ".");
            }
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserByUserName(String userName) {
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("SELECT * FROM [dbo].[Users] where UserName=?");
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("email"), rs.getString("passWord"), rs.getString("User"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("registrationDate"), rs.getString("lastLogin"));
                return u;
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    public List<User> getUserBySearchName(String txtSearch) {
        List<User> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("SELECT * FROM [dbo].[Users] where UserName LIKE ?");
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("userName"), rs.getString("email"), rs.getString("passWord"), rs.getString("User"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("registrationDate"), rs.getString("lastLogin")));
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void changePassWord(User u) {
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("Update Users set Password = ? where Email = ?");
            st.setString(1, u.getPassword());
            st.setString(2, u.getEmail());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePassByMail(String pass, String email) {
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement("Update Users set Password = ? where Email = ?");
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getNumberUsers() {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM Users");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (Exception e) {
        }
        return 1;
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
                // Thiết lập giá trị cho tham số UserID
                PreparedStatement roleStmt = con.prepareStatement("SELECT r.Name FROM UserRoles ur JOIN Roles r ON ur.RoleID = r.RoleID WHERE ur.UserID=?");
                roleStmt.setInt(1, user_id);  // Thiết lập giá trị cho tham số UserID
                ResultSet roleRs = roleStmt.executeQuery();
                String Role = null;
                if (roleRs.next()) {
                    Role = roleRs.getString("Name");  // Lấy giá trị cột "Name" trong bảng Roles
                }
                roleRs.close();
                roleStmt.close();
                String Email = rs.getString("Email");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String RegistrationDate = rs.getString("RegistrationDate");
                String LastLogin = rs.getString("LastLogin");

//                Date RegistrationDate = rs.getDate("RegistrationDate");
//                Date LastLogin = rs.getDate("LastLogin");
                User user = new User(user_id, Username, Email, Password, Role, Address, Phone, RegistrationDate, LastLogin);
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
            PreparedStatement stmt = con.prepareStatement(
                    "INSERT INTO Users (Username, Email, Password, Address, Phone) VALUES (?, ?, ?, ?, ?)");
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
            PreparedStatement stmt = con.prepareStatement(
                    "UPDATE Users SET Username = ?, Password = ?, Email = ?, Phone = ?, Address = ? WHERE UserID = ?");
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getAddress());
            stmt.setInt(6, user.getUserId());

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
                PreparedStatement stmt = con.prepareStatement(sql);) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Assuming User class has constructor matching columns
                user = new User(
                        rs.getInt("userId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"));
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
