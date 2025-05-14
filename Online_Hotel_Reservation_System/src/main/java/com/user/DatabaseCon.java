package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseCon {

    private static String url = "jdbc:mysql://localhost:3306/tendura_hotel";
    private static String dbUser = "root";
    private static String pass = "parasite";
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Updated driver for MySQL 8+
            con = DriverManager.getConnection(url, dbUser, pass);
            System.out.println("Database connected successfully!");
        } catch (Exception e) {
            System.out.println("Database Connection failed!!!");
            e.printStackTrace(); // This prints the actual error
        }

        return con;
    }
}
