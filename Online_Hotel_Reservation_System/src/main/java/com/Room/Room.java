package com.Room;

public class Room {

    private int roomId;
    private String roomNumber;
    private String roomType;
    private int capacity;
    private double price;
    private int floor;
    private String status;    
    private String features;
    private String description;
    private String createdAt;

    public Room(int roomId, String roomNumber, String roomType, int capacity, String status) {
        this.roomId = roomId;
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.capacity = capacity;
        this.status = status;
    }
    
    

	public int getRoomId() {
		return roomId;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public String getRoomType() {
		return roomType;
	}

	public int getCapacity() {
		return capacity;
	}

	public double getPrice() {
		return price;
	}

	public int getFloor() {
		return floor;
	}

	public String getStatus() {
		return status;
	}

	public String getFeatures() {
		return features;
	}

	public String getDescription() {
		return description;
	}

	public String getCreatedAt() {
		return createdAt;
	}

    
}
