package com.Room;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
    
    
    public static List<Room> getAvailableRooms(String checkIn,String checkOut,String roomType){
    	
    	ArrayList<Room> roomList = new ArrayList<>();
    	
    	try {
    		
    		
    		con=DatabaseCon.getConnection();
    		
    		stmt=con.createStatement();
    		
    		String sql=null;
    		
    		if(roomType.equals("all")) {
    		
    		sql="SELECT * FROM rooms r WHERE r.room_id NOT IN (SELECT b.room_id FROM reservation b WHERE b.check_in_date < '"+checkIn+"' AND b.check_out_date > '"+checkOut+"')";
    		
    		}
    		else if(roomType.equals("standard")) {
    			
    			sql="SELECT * FROM rooms r WHERE r.room_type='standard' AND r.room_id NOT IN (SELECT b.room_id FROM reservation b WHERE b.check_in_date < '"+checkIn+"' AND b.check_out_date > '"+checkOut+"')";
    		}
    		else if(roomType.equals("suite")) {
    			
    			sql="SELECT * FROM rooms r WHERE r.room_type='suite' AND r.room_id NOT IN (SELECT b.room_id FROM reservation b WHERE b.check_in_date < '"+checkIn+"' AND b.check_out_date > '"+checkOut+"')";
    		}
    				
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			
    			int id = rs.getInt(1);
    			String roomNum = rs.getString(2);
    			String roomtype = rs.getString(3);
    			int cap = rs.getInt(4);
    			double price =rs.getDouble(5);
    			String features = rs.getString(8);
    			String description = rs.getString(9);
    			
    			Room room = new Room(id,roomNum,roomtype,cap,price,features,description);
    			
    			roomList.add(room);
    		}
    		
    	}
    	catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	
    	return roomList;
    }
}
