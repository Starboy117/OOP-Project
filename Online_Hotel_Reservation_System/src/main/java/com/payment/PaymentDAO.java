package com.payment;

import java.sql.*;
import java.util.*;

public class PaymentDAO {

	private String jdbcURL = "jdbc:mysql://localhost:3306/tendura_hotel";
	private String jdbcUsername = "root";
	private String jdbcPassword = "parasite";

	private static final String INSERT_PAYMENT_SQL = 
			"INSERT INTO payment (reservation_id, amount, payment_method, card_name, card_number, expiry_date, cvv, mobile_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	public void insertPayment(Payment payment) throws SQLException {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
		try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
				PreparedStatement ps = connection.prepareStatement(INSERT_PAYMENT_SQL)) {
			
			if (payment.getReservationId() == null) {
				ps.setNull(1, java.sql.Types.INTEGER);
			} else {
				ps.setInt(1, payment.getReservationId());
			}
			
			ps.setDouble(2, payment.getAmount());
			ps.setString(3, payment.getPaymentMethod());
			ps.setString(4, payment.getCardName());
			ps.setString(5, payment.getCardNumber());
			ps.setString(6, payment.getExpiryDate());
			ps.setString(7, payment.getCvv());
			ps.setString(8, payment.getMobileNumber());

			ps.executeUpdate();
		} catch (Exception e) {
			
			System.out.println("database con failed!");
			e.printStackTrace();
		}
	
	}catch(Exception e) {
		
		e.printStackTrace();
		
	}
		
	}
}
