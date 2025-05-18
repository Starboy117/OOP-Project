package com.reservation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

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

}
