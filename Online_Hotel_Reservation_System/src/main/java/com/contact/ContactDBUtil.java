package com.contact;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContactDBUtil {

	private String jdbcURL = "jdbc:mysql://localhost:3306/tendura_hotel";
	private String jdbcUsername = "root";
	private String jdbcPassword = "parasite";

	private static final String INSERT_MESSAGE_SQL = 
			"INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
	private static final String SELECT_ALL_MESSAGES_SQL = 
			"SELECT * FROM contact_messages ORDER BY submission_date DESC";
	private static final String SELECT_MESSAGE_BY_ID_SQL = 
			"SELECT * FROM contact_messages WHERE id = ?";
	private static final String UPDATE_MESSAGE_SQL = 
			"UPDATE contact_messages SET name=?, email=?, message=? WHERE id=?";
	private static final String DELETE_MESSAGE_SQL = 
			"DELETE FROM contact_messages WHERE id=?";

	// Initialize database connection
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			System.out.println("Database connection failed!");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver not found!");
			e.printStackTrace();
		}
		return connection;
	}

	// Insert a new contact message
	public boolean insertContactMessage(ContactMessage message) {
		boolean rowInserted = false;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MESSAGE_SQL)) {

			preparedStatement.setString(1, message.getName());
			preparedStatement.setString(2, message.getEmail());
			preparedStatement.setString(3, message.getMessage());

			rowInserted = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			System.out.println("Error inserting contact message");
			e.printStackTrace();
		}
		return rowInserted;
	}

	// Get all contact messages
	public List<ContactMessage> getAllMessages() {
		List<ContactMessage> messages = new ArrayList<>();

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MESSAGES_SQL);
				ResultSet rs = preparedStatement.executeQuery()) {

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String messageText = rs.getString("message");
				String submissionDate = rs.getString("submission_date");

				ContactMessage message = new ContactMessage(name, email, messageText);
				message.setId(id);
				message.setSubmissionDate(submissionDate);
				messages.add(message);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving contact messages");
			e.printStackTrace();
		}
		return messages;
	}

	// Get a single message by ID
	public ContactMessage getMessageById(int id) {
		ContactMessage message = null;

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MESSAGE_BY_ID_SQL)) {

			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String messageText = rs.getString("message");
				String submissionDate = rs.getString("submission_date");

				message = new ContactMessage(name, email, messageText);
				message.setId(id);
				message.setSubmissionDate(submissionDate);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving message by ID");
			e.printStackTrace();
		}
		return message;
	}

	// Update a contact message
	public boolean updateMessage(ContactMessage message) {
	    boolean rowUpdated = false;
	    try (Connection connection = getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MESSAGE_SQL)) {
	        
	        preparedStatement.setString(1, message.getName());
	        preparedStatement.setString(2, message.getEmail());
	        preparedStatement.setString(3, message.getMessage());
	        preparedStatement.setInt(4, message.getId());
	        
	        rowUpdated = preparedStatement.executeUpdate() > 0;
	    } catch (SQLException e) {
	        System.out.println("Error updating contact message");
	        e.printStackTrace();
	    }
	    return rowUpdated;
	}
	
	// Delete a contact message
	public boolean deleteMessage(int id) {
		boolean rowDeleted = false;

		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MESSAGE_SQL)) {

			preparedStatement.setInt(1, id);
			rowDeleted = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			System.out.println("Error deleting contact message");
			e.printStackTrace();
		}
		return rowDeleted;
	}
}
