package com.Room;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import com.user.DatabaseCon;

public class roomController {

    private static boolean issuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static boolean insertRoom(String roomNumber, String roomType, int capacity, double price,
                                     int floor, String status, String features, String description) {
        issuccess = false;

        try {
            con = DatabaseCon.getConnection();
            stmt = con.createStatement();
            
            String sql = "INSERT INTO rooms (room_number, room_type, capacity, price, floor, status, features, description) VALUES ('"
                    + roomNumber + "', '" + roomType + "', " + capacity + ", " + price + ", " + floor + ", '" + status
                    + "', '" + features + "', '" + description + "')";

            int rows = stmt.executeUpdate(sql);

            if (rows > 0) {
                issuccess = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return issuccess;
    }
}
