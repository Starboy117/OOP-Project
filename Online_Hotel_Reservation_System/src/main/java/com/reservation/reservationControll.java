package com.reservation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Room.Room;
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
	
	
	public static List<Integer> getNumberofObjectsRep(){
		
		ArrayList<Integer> objList = new ArrayList<>();
		
		try {
			
			con=DatabaseCon.getConnection();
			
			Statement stmt1 = con.createStatement();
			
			String sql="SELECT COUNT(*) AS totalReservations FROM reservation";
			
			ResultSet rs1=stmt1.executeQuery(sql);
			
			if(rs1.next()) {
				
				objList.add(rs1.getInt("totalReservations"));
			}
			else {
				
				objList.add(0);
			}
			
			 Statement stmt2 = con.createStatement();
		        String sql2 = "SELECT COUNT(*) AS totalCheckIns FROM guest_checkins";
		        ResultSet rs2 = stmt2.executeQuery(sql2);
		        if (rs2.next()) {
		            objList.add(rs2.getInt("totalCheckIns"));
		        } else {
		            objList.add(0);
		        }

		      
		        Statement stmt3 = con.createStatement();
		        String sql3 = "SELECT COUNT(*) AS totalRoom FROM rooms";
		        ResultSet rs3 = stmt3.executeQuery(sql3);
		        if (rs3.next()) {
		            objList.add(rs3.getInt("totalRoom"));
		        } else {
		            objList.add(0);
		        }
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return objList;
	}
	
	
	
	
public static List<Room> getRoomOverview(){
		
		
		ArrayList<Room> roomList = new ArrayList<>();
		
		try {
			
			
			con = DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql="SELECT * FROM rooms ORDER BY room_id DESC LIMIT 5";
			
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next()) {
				
				int id=rs.getInt(1);
				String num = rs.getString(2);
				String type = rs.getString(3);
				int cap = rs.getInt(4);
				String status = rs.getString(7);
				
				Room room = new Room(id,num,type,cap,status);
				
				roomList.add(room);
			}
			
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		finally {
	        // Ensure resources are closed in the finally block
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (stmt != null) {
	                stmt.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();  // Log or handle the exception as needed
	        }
	    }
		
		return roomList;
	}

	

	public static List<Reservations> reserveOverview(){
		
		ArrayList<Reservations> reservations = new ArrayList<>();
		
		try {
			
			con = DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql="SELECT * FROM reservation ORDER BY reservation_id DESC LIMIT 5";
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id=rs.getInt(1);
				int uid=rs.getInt(2);
				int rid=rs.getInt(3);
				String checkin=rs.getString(4);
				
				Reservations res = new Reservations(id,uid,rid,checkin);
				
				reservations.add(res);
			}
			
			
		}
	
			catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
		
		return reservations;
	}
	
	
	public static List<Guest> guestOverview(){
		
		ArrayList<Guest> guests = new ArrayList<>();
		
		try {
			
			con = DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql="SELECT * FROM guest_checkins ORDER BY checkin_id DESC LIMIT 5";
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id=rs.getInt(1);
				String name=rs.getString(2);
				String phone=rs.getString(3);
				int noGuests = rs.getInt(8);
				
				Guest guest = new Guest(id,name,phone,noGuests);
				
				guests.add(guest);
			}
			
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return guests;
	}


}
