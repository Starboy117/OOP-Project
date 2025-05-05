package com.user;

import java.sql.Connection;
import java.sql.DriverManager;



public class DatabaseCon {

	  	private static String url="jdbc:mysql://localhost:3306/tendura_hotel";
		private static String dbUser ="root";
		private static String pass ="parasite";
		private static Connection con;
		
		public static Connection getConnection() {
			
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, dbUser, pass);
				
				
			}
			catch(Exception e) {
				
				System.out.println("Database Connection failed!!!");
			}
			
			
			return con;
			
		}


}
