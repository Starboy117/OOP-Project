package com.payment;

import java.sql.*;
import java.util.*;

public class PaymentDAO {

	private String jdbcURL = "jdbc:mysql://localhost:3306/tendura_hotel";
	private String jdbcUsername = "root";
	private String jdbcPassword = "parasite";

	private static final String INSERT_PAYMENT_SQL = 
			"INSERT INTO payment (amount, payment_method, card_name, card_number, expiry_date, cvv, mobile_number) VALUES ( ?, ?, ?, ?, ?, ?, ?)";

	public int insertPayment(Payment payment) throws SQLException {
	    int paymentId = -1;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	             PreparedStatement ps = connection.prepareStatement(INSERT_PAYMENT_SQL, Statement.RETURN_GENERATED_KEYS)) {

	            ps.setDouble(1, payment.getAmount());
	            ps.setString(2, payment.getPaymentMethod());
	            ps.setString(3, payment.getCardName());
	            ps.setString(4, payment.getCardNumber());
	            ps.setString(5, payment.getExpiryDate());
	            ps.setString(6, payment.getCvv());
	            ps.setString(7, payment.getMobileNumber());

	            ps.executeUpdate();

	            ResultSet rs = ps.getGeneratedKeys();
	            if (rs.next()) {
	                paymentId = rs.getInt(1);
	            }

	        } catch (Exception e) {
	            System.out.println("Database connection failed!");
	            e.printStackTrace();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return paymentId;
	}

}
