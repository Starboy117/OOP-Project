package com.staff;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Room.Room;
import com.user.DatabaseCon;
import com.user.User;

public class staffDBUtill {
	
	private static Connection con=null;
	private static Statement stmt = null;
	private static ResultSet rs= null;
	
	

	public static List<Staff> validateStaff(String userName, String password){
	    ArrayList<Staff> staffList= new ArrayList<>();

	  
	

	    try {
	        
	    	con = DatabaseCon.getConnection();
	        
	       
	        stmt = con.createStatement();

	        String sql="select * from staff where Username='"+userName+"' and password='"+password+"'";
	        rs = stmt.executeQuery(sql);

	        if(rs.next()) {
	            int id=rs.getInt(1);
	            String name = rs.getString(2);
	            String un = rs.getString(3);
	            String email = rs.getString(4);
	            String pw = rs.getString(5);
	            String role = rs.getString(6);

	            Staff staff1 = new Staff(id,name,un,email,pw,role);
	            staffList.add(staff1);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return staffList;
	}
	
	
	public static List<Integer> getNumberofObjectsAdmin() {

	    ArrayList<Integer> objList = new ArrayList<>();

	    try {
	        con = DatabaseCon.getConnection();

	
	        Statement stmt1 = con.createStatement();
	        String sql1 = "SELECT COUNT(*) AS totalUsers FROM registered_user";
	        ResultSet rs1 = stmt1.executeQuery(sql1);
	        if (rs1.next()) {
	            objList.add(rs1.getInt("totalUsers"));
	        } else {
	            objList.add(0);
	        }

	        
	        Statement stmt2 = con.createStatement();
	        String sql2 = "SELECT COUNT(*) AS totalStaff FROM staff";
	        ResultSet rs2 = stmt2.executeQuery(sql2);
	        if (rs2.next()) {
	            objList.add(rs2.getInt("totalStaff"));
	        } else {
	            objList.add(0);
	        }

	      
	        Statement stmt3 = con.createStatement();
	        String sql3 = "SELECT COUNT(*) AS totalRoom FROM room";
	        ResultSet rs3 = stmt3.executeQuery(sql3);
	        if (rs3.next()) {
	            objList.add(rs3.getInt("totalRoom"));
	        } else {
	            objList.add(0);
	        }
	        
	       

	       
	        rs1.close(); stmt1.close();
	        rs2.close(); stmt2.close();
	        rs3.close(); stmt3.close();

	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Add fallback 0s if needed
	        while (objList.size() < 3) {
	            objList.add(0);
	        }
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
	    
	 

	    return objList;
	}
	
	
	public static List<User> getUserOverview(){
		
		
		ArrayList<User> userList = new ArrayList<>();
		
		try {
			
			
			con = DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql ="SELECT * FROM registered_user ORDER BY UserID DESC LIMIT 5";
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id=rs.getInt(1);
				String name = rs.getString(2);
				String username = rs.getString(3);
				String email = rs.getString(4);
				
				User user = new User(id,name,username,email);
				
				userList.add(user);
			}
			
			
		}
		catch(Exception e) {
			
			
			
			
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
		
		
		return userList;
	}
	
	
	public static List<Staff> getStaffOverview(){
		
		
		ArrayList<Staff> staffList = new ArrayList<>();
		
		try {
			
			con = DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql="SELECT * FROM staff ORDER BY staffId DESC LIMIT 5";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id=rs.getInt(1);
				String name = rs.getString(2);
				String username = rs.getString(3);
				String email = rs.getString(4);
				String role = rs.getString(6);
				
				Staff staff = new Staff(id,name,username,email,role);
				
				staffList.add(staff);
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
		
		return staffList;
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
	
	
	public static List<User> getAllUsers(){
		
		ArrayList<User> userList = new ArrayList<>();
		
		try {
			
			con= DatabaseCon.getConnection();
			
			stmt = con.createStatement();
			
			String sql="Select * from registered_user";
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id=rs.getInt(1);
				String name = rs.getString(2);
				String username= rs.getString(3);
				String email=rs.getString(4);
				String pass=rs.getString(5);
				
				User user = new User(id,name,username,email,pass);
				
				userList.add(user);
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
		
		
		return userList;
	}
	
	
	public static List<Staff> getAllStaff(){
		
		
		ArrayList staffList = new ArrayList<>();
		
		
		try {
			
			con = DatabaseCon.getConnection();
			
			stmt=con.createStatement();
			
			String sql="select * from staff";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id=rs.getInt(1);
				String name = rs.getString(2);
				String username= rs.getString(3);
				String email=rs.getString(4);
				String pass=rs.getString(5);
				String role = rs.getString(6);
				
				Staff staff = new Staff(id,name,username,email,pass,role);
				
				staffList.add(staff);
				
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
		
		return staffList;
	}

	

}
