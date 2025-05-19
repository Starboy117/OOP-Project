package com.reservation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.DatabaseCon;

public class reservationControll {
	
	private static Connection con=null;
	private static Statement stmt = null;
	private static ResultSet rs= null;
	
	
	public static boolean insertReservationDetails(int userId,int roomId,String checkIn,String checkOut,String status,int payId) {
		
		boolean isTrue = false;
		
		try {
			
			con=DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql = "INSERT INTO reservation(reservation_id,UserID,room_id,check_in_date,check_out_date,status,paymentID) values(0,"+userId+","+roomId+",'"+checkIn+"','"+checkOut+"','"+status+"',"+payId+")";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				
				isTrue = true;
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return isTrue;
	}
	
	
	
	public static List<Reservations> getReservations(int userId){
	    
	    List<Reservations> reservations = new ArrayList<>();
	    
	    try {
	        con = DatabaseCon.getConnection();
	        stmt = con.createStatement();
	        String sql ="SELECT * FROM reservation WHERE UserID = " + userId;
	        rs = stmt.executeQuery(sql);
	        
	        while(rs.next()) {
	            int id = rs.getInt("reservation_id");           // use column names for clarity
	            String checkIn = rs.getString("check_in_date");
	            String checkOut = rs.getString("check_out_date");
	            String date = rs.getString("reservation_date");  // replace with correct column name
	            String status = rs.getString("status");
	            
	            Reservations reservation = new Reservations(id, checkIn, checkOut, date, status);
	            reservations.add(reservation);
	        }
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	    }
	    
	    return reservations;
	}
	
	public static boolean cancelReservation(int reserveId) {
		
		boolean isTrue = false;
		
		try {
			
			con=DatabaseCon.getConnection();
			
			stmt = con.createStatement();
			
			String sql = "Update reservation set status='Canceled' where reservation_id="+reserveId+"";
			
			int rs= stmt.executeUpdate(sql);
			
			if(rs>0) {
				
				isTrue = true;
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return isTrue;
	}


}
