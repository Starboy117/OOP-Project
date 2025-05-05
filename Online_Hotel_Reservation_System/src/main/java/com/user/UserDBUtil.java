package com.user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
	
	private static Connection con=null;
	private static Statement stmt = null;
	private static ResultSet rs= null;
	
	public static List<User> validateUser(String userName, String password){
	    ArrayList<User> userList= new ArrayList<>();

	  
	

	    try {
	        
	    	con = DatabaseCon.getConnection();
	        
	       
	        stmt = con.createStatement();

	        String sql="select * from registered_user where Username='"+userName+"' and password='"+password+"'";
	        rs = stmt.executeQuery(sql);

	        if(rs.next()) {
	            int id=rs.getInt(1);
	            String name = rs.getString(2);
	            String un = rs.getString(3);
	            String email = rs.getString(4);
	            String pw = rs.getString(5);

	            User user1 = new User(id,name,un,email,pw);
	            userList.add(user1);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return userList;
	}
	
	public static boolean checkUsername(String username) {
		
		boolean msg = false;
		
		try {
			
			con=DatabaseCon.getConnection();
			stmt=con.createStatement();
			
			String sql="Select * from where Username='"+username+"'";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				msg=true;
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		return msg;
	}
	
	
	public static boolean insertUserDetails(String name, String userName, String email, String password) {
		boolean msg = false;
		
		
		
		try {
			
			con = DatabaseCon.getConnection();
			stmt = con.createStatement();
	        
	        String sql="Insert into registered_user values(0,'"+name+"','"+userName+"','"+email+"','"+password+"')";
	        
	        int rs = stmt.executeUpdate(sql);
	        
	        if(rs>0) {
	        	
	        	msg = true;
	        }
	        else {
	        	
	        	msg = false;
	        }
	        
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return msg;
	}

	
}

