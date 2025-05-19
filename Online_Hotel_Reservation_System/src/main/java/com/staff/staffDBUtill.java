package com.staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Room.Room;
import com.user.DatabaseCon;
import com.user.User;

public class staffDBUtill implements iStaffUtil {
    
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    @Override
    public List<Staff> validateStaff(String userName, String password) {
        ArrayList<Staff> staffList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM staff WHERE Username=? AND password=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String un = rs.getString(3);
                String email = rs.getString(4);
                String pw = rs.getString(5);
                String role = rs.getString(6);

                Staff staff1 = new Staff(id, name, un, email, pw, role);
                staffList.add(staff1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return staffList;
    }

    @Override
    public List<Integer> getNumberofObjectsAdmin() {
        ArrayList<Integer> objList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();

            // Users count
            String sql1 = "SELECT COUNT(*) AS totalUsers FROM registered_user";
            pstmt = con.prepareStatement(sql1);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                objList.add(rs.getInt("totalUsers"));
            } else {
                objList.add(0);
            }
            rs.close();

            // Staff count
            String sql2 = "SELECT COUNT(*) AS totalStaff FROM staff";
            pstmt = con.prepareStatement(sql2);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                objList.add(rs.getInt("totalStaff"));
            } else {
                objList.add(0);
            }
            rs.close();

            // Rooms count
            String sql3 = "SELECT COUNT(*) AS totalRoom FROM rooms";
            pstmt = con.prepareStatement(sql3);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                objList.add(rs.getInt("totalRoom"));
            } else {
                objList.add(0);
            }
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
            while (objList.size() < 3) {
                objList.add(0);
            }
        } finally {
            closeResources();
        }

        return objList;
    }

    @Override
    public List<User> getUserOverview() {
        ArrayList<User> userList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM registered_user ORDER BY UserID DESC LIMIT 5";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);

                User user = new User(id, name, username, email);
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return userList;
    }

    @Override
    public List<Staff> getStaffOverview() {
        ArrayList<Staff> staffList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM staff ORDER BY staffId DESC LIMIT 5";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String role = rs.getString(6);

                Staff staff = new Staff(id, name, username, email, role);
                staffList.add(staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return staffList;
    }

    @Override
    public List<Room> getRoomOverview() {
        ArrayList<Room> roomList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM rooms ORDER BY room_id DESC LIMIT 5";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String num = rs.getString(2);
                String type = rs.getString(3);
                int cap = rs.getInt(4);
                String status = rs.getString(7);

                Room room = new Room(id, num, type, cap, status);
                roomList.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return roomList;
    }

    @Override
    public List<User> getAllUsers() {
        ArrayList<User> userList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM registered_user";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String pass = rs.getString(5);

                User user = new User(id, name, username, email, pass);
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return userList;
    }

    @Override
    public List<Staff> getAllStaff() {
        ArrayList<Staff> staffList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM staff";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String pass = rs.getString(5);
                String role = rs.getString(6);

                Staff staff = new Staff(id, name, username, email, pass, role);
                staffList.add(staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return staffList;
    }

    @Override
    public List<User> getSingleUser(int id) {
        ArrayList<User> userList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM registered_user WHERE UserID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int user_id = rs.getInt(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String pass = rs.getString(5);

                User user = new User(user_id, name, username, email, pass);
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return userList;
    }

    @Override
    public boolean updateUserDetails(int id, String name, String username, String email, String password) {
        boolean msg = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "UPDATE registered_user SET Name=?, Username=?, email=?, password=? WHERE UserID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setInt(5, id);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                msg = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return msg;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean msg = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "DELETE FROM registered_user WHERE UserID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                msg = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return msg;
    }

    @Override
    public boolean deleteStaff(int id) {
        boolean msg = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "DELETE FROM staff WHERE staffId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                msg = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return msg;
    }

    @Override
    public List<Staff> getSingleStaff(int id) {
        ArrayList<Staff> staffList = new ArrayList<>();

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM staff WHERE staffId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int user_id = rs.getInt(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String pass = rs.getString(5);
                String role = rs.getString(6);

                Staff user = new Staff(user_id, name, username, email, pass, role);
                staffList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return staffList;
    }

    @Override
    public boolean checkUsername(String username) {
        boolean msg = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "SELECT * FROM staff WHERE username=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                msg = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return msg;
    }

    @Override
    public boolean updateStaffDetails(int id, String name, String username, String email, String password, String role) {
        boolean msg = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "UPDATE staff SET name=?, username=?, email=?, password=?, role=? WHERE staffId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, role);
            pstmt.setInt(6, id);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                msg = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return msg;
    }

    @Override
    public boolean insertStaffDetails(String name, String userName, String email, String password, String role) {
        boolean msg = false;

        try {
            con = DatabaseCon.getConnection();
            String sql = "INSERT INTO staff VALUES(0, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, userName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, role);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                msg = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return msg;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}