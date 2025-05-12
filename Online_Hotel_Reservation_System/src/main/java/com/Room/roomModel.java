package com.Room; 

public class roomModel {
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

    public roomModel(int roomId, String roomNumber, String roomType, int capacity, double price,
                     int floor, String status, String features, String description, String createdAt) {
        this.roomId = roomId;
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.capacity = capacity;
        this.price = price;
        this.floor = floor;
        this.status = status;
        this.features = features;
        this.description = description;
        this.createdAt = createdAt;
    }

    public roomModel(String roomNumber, String roomType, int capacity, double price,
                     int floor, String status, String features, String description) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.capacity = capacity;
        this.price = price;
        this.floor = floor;
        this.status = status;
        this.features = features;
        this.description = description;
    }

    public int getRoomId() { return roomId; }
    public void setRoomId(int roomId) { this.roomId = roomId; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getFloor() { return floor; }
    public void setFloor(int floor) { this.floor = floor; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getFeatures() { return features; }
    public void setFeatures(String features) { this.features = features; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
