package com.reservation;

public class Reservations {
	
	private int id;
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
