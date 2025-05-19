package com.reservation;

public class Reservations {
	
	private int id;
	private int userId;
	private int roomId;
	private String checkInDate;
	private String checkOutDate;
	private String reservationDate;
	private String status;
	
	
	public Reservations(int id, String checkInDate, String checkOutDate, String reservationDate, String status) {

		this.id = id;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reservationDate = reservationDate;
		this.status = status;
	}
	
	public Reservations(int id, int userId, int roomId, String checkInDate) {

		this.id = id;
		this.userId = userId;
		this.roomId = roomId;
		this.checkInDate = checkInDate;
	}


	
	


	public int getUserId() {
		return userId;
	}

	public int getRoomId() {
		return roomId;
	}

	public int getId() {
		return id;
	}


	public String getCheckInDate() {
		return checkInDate;
	}


	public String getCheckOutDate() {
		return checkOutDate;
	}


	public String getReservationDate() {
		return reservationDate;
	}


	public String getStatus() {
		return status;
	}
	
	

}
