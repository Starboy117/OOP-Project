package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//User pages control class
public class UserDBUtil implements IUserDBUtil {

    private static Connection con = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    
    //Login function
    @Override
    public List<User> validateUser(String userName, String password) {
        List<User> userList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM registered_user WHERE Username=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String un = rs.getString(3);
                String email = rs.getString(4);
                String pw = rs.getString(5);

                User user1 = new User(id, name, un, email, pw);
                userList.add(user1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
    
    
    
    
    //checking for duplicate username
    @Override
    public boolean checkUsername(String username) {
        boolean isAvailable = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM registered_user WHERE Username=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (!rs.next()) {
                isAvailable = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isAvailable;
    }
    
    
    
    
    //Register function
    @Override
    public boolean insertUserDetails(String name, String userName, String email, String password) {
        boolean success = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "INSERT INTO registered_user VALUES (0, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, userName);
            ps.setString(3, email);
            ps.setString(4, password);

            int result = ps.executeUpdate();
            success = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    
    //user profile changing user details function
    @Override
    public boolean updateUserDetails(int id, String name, String username, String email) {
        boolean success = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "UPDATE registered_user SET Name=?, Username=?, email=? WHERE UserID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setInt(4, id);

            int result = ps.executeUpdate();
            success = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    
    //user profile changing password function
    @Override
    public boolean changedPasswordUpdate(int id, String password) {
        boolean success = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "UPDATE registered_user SET password=? WHERE UserID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, id);

            int result = ps.executeUpdate();
            success = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}
