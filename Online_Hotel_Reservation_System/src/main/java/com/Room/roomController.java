package com.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.DatabaseCon;

public class roomController {

	// Insert a new room safely with PreparedStatement
	public static boolean insertRoom(String roomNumber, String roomType, int capacity, double price, int floor,
			String status, String features, String description) {
		boolean issuccess = false;
		String sql = "INSERT INTO rooms (room_number, room_type, capacity, price, floor, status, features, description) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = DatabaseCon.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, roomNumber);
			pstmt.setString(2, roomType);
			pstmt.setInt(3, capacity);
			pstmt.setDouble(4, price);
			pstmt.setInt(5, floor);
			pstmt.setString(6, status);
			pstmt.setString(7, features);
			pstmt.setString(8, description);

			int rows = pstmt.executeUpdate();
			issuccess = rows > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return issuccess;
	}

	// Get all rooms
	public static List<Room> getAllRooms() {
		List<Room> rooms = new ArrayList<>();
		String sql = "SELECT * FROM rooms";

		try (Connection con = DatabaseCon.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				Room room = new Room(rs.getInt("room_id"), rs.getString("room_number"), rs.getString("room_type"),
						rs.getInt("capacity"), rs.getDouble("price"), rs.getInt("floor"), rs.getString("status"),
						rs.getString("features"), rs.getString("description"));
				rooms.add(room);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rooms;
	}

	// Get available rooms filtered by dates and room type
	public static List<Room> getAvailableRooms(String checkIn, String checkOut, String roomType) {
		List<Room> roomList = new ArrayList<>();

		// Normalize roomType input
		roomType = roomType.toLowerCase();

		StringBuilder sql = new StringBuilder("SELECT * FROM rooms r WHERE r.status = 'available' ");
		sql.append("AND r.room_id NOT IN (SELECT b.room_id FROM reservation b WHERE ");
		sql.append("b.check_in_date < ? AND b.check_out_date > ?) ");

		if (!roomType.equals("all")) {
			sql.append("AND LOWER(r.room_type) = ? ");
		}

		try (Connection con = DatabaseCon.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {

			pstmt.setString(1, checkOut); // Note: swapped order for correct overlap logic
			pstmt.setString(2, checkIn);

			if (!roomType.equals("all")) {
				pstmt.setString(3, roomType);
			}

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Room room = new Room(rs.getInt("room_id"), rs.getString("room_number"), rs.getString("room_type"),
							rs.getInt("capacity"), rs.getDouble("price"), rs.getInt("floor"), rs.getString("status"),
							rs.getString("features"), rs.getString("description"));
					roomList.add(room);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return roomList;
	}

	public static Room getRoomById(int roomId) {
		Room room = null;
		String sql = "SELECT * FROM rooms WHERE room_id = ?";

		try (Connection con = DatabaseCon.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, roomId);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				room = new Room(rs.getInt("room_id"), rs.getString("room_number"), rs.getString("room_type"),
						rs.getInt("capacity"), rs.getDouble("price"), rs.getInt("floor"), rs.getString("status"),
						rs.getString("features"), rs.getString("description"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return room;
	}

	public static boolean updateRoom(int roomId, String roomNumber, String roomType, int capacity, double price,
			int floor, String status, String features, String description) {
		boolean isSuccess = false;
		String sql = "UPDATE rooms SET room_number=?, room_type=?, capacity=?, price=?, floor=?, status=?, features=?, description=? WHERE room_id=?";

		try (Connection con = DatabaseCon.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, roomNumber);
			pstmt.setString(2, roomType);
			pstmt.setInt(3, capacity);
			pstmt.setDouble(4, price);
			pstmt.setInt(5, floor);
			pstmt.setString(6, status);
			pstmt.setString(7, features);
			pstmt.setString(8, description);
			pstmt.setInt(9, roomId);

			int rows = pstmt.executeUpdate();
			isSuccess = rows > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

}
