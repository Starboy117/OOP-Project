package com.reservation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.DatabaseCon;

public class CheckInControl {

	private static Connection con=null;
	private static Statement stmt = null;
	private static ResultSet rs= null;
	
	public static boolean checkInDetailsInsert(String gName, String gPhn, String gmail, String idType, String idNo, String roomNo, int guestNo, String cIndate, String cOutdate, String sr) {
	    boolean successMessage = false;

	    try {
	        con = DatabaseCon.getConnection();
	        stmt = con.createStatement();

	        String sql = "INSERT INTO guest_checkins (" +
	                "guest_name, guest_phone, guest_email, id_type, id_number, " +
	                "room_number, num_guests, checkin_date, checkout_date, special_requests) " +
	                "VALUES ('" + gName + "', '" + gPhn + "', '" + gmail + "', '" + 
	                idType + "', '" + idNo + "', '" + roomNo + "', " + guestNo + 
	                ", '" + cIndate + "', '" + cOutdate + "', '" + sr + "')";


	        System.out.println("Executing SQL: " + sql); // Debugging line

	        int result = stmt.executeUpdate(sql);
	        if (result > 0) {
	            successMessage = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return successMessage;
	}
	
	
	public static List<Guest> viewGuestDetails(){
		ArrayList<Guest> guestList = new ArrayList<>();
		
		
		try {
			 con = DatabaseCon.getConnection();
		        stmt = con.createStatement();
		        
		        String sql = "SELECT checkin_id, guest_name, guest_phone, room_number, checkin_date FROM guest_checkins";
		        rs = stmt.executeQuery(sql);
		        
		        while(rs.next()) {
		        	int id=rs.getInt(1);
		        	String name=rs.getString(2);
		        	String phnNo=rs.getString(3);
		        	String roomNo=rs.getString(4);
		        	String checkInDate=rs.getString(5);
		        	
		        	Guest guest = new Guest(id,name,phnNo,roomNo,checkInDate);
		        	guestList.add(guest);
		        }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return guestList;
		
	}
	
//	public static boolean updateGuest(String name,String phnNo, String Email,String idNo,String checkOutdate) {
//
//		
//		boolean successMessage;
//		try {
//			
//			con = DatabaseCon.getConnection();
//	        stmt = con.createStatement();
//	        String sql = "update guest_checkins set name = '"+guest_name+"',phnNO='"+guest_phone+"',Email='"+guest_email+"',idNo='"+id_number+"',checkOutdate='"+checkOut_date+"'" +"where id='"+checkin_id+"'";
//	        
//	        int rs =stmt.executeUpdate(sql);
//	        
//	        if(rs>0) {
//	        	successMessage = true;
//	        	
//	        }
//		}
//		
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return successMessage;
//		
//	}
	
	public static boolean deleteGuest(String id) {
		
		int convId=Integer.parseInt(id);
		
		boolean successMessage=false;
		try {
			con = DatabaseCon.getConnection();
	        stmt = con.createStatement();
	        
	        String sql = "delete from guest_checkins where checkin_id="+convId+"";
	        int r = stmt.executeUpdate(sql);
	        
	        if(r>0) {
	        	successMessage= true;
	        }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return successMessage;	
	}

}


