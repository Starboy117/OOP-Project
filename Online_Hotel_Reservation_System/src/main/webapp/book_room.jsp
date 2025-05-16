<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List" %>
<%@ page import="com.Room.Room" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Room Booking</title>
    <link rel="stylesheet" href="css/book_room.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <h1>Tendura Rooms</h1>
            <p>Discover your perfect stay with our premium accommodations</p>
        </div>
    </header>

    <main class="container">
    <form id="bookingForm" action="bookRoom" method="GET" class="booking-form">
        <div class="date-selector">
            <h2>Select Dates</h2>
            <div class="date-inputs">
                <div class="input-group">
                    <label for="check-in">Check-in Date</label>
                    <input type="date" id="check-in" name="checkIn" value="<%= request.getParameter("checkIn") != null ? request.getParameter("checkIn") : "" %>">

                </div>
                <div class="input-group">
                    <label for="check-out">Check-out Date</label>
                    <input type="date" id="check-out" name="checkOut" value="<%= request.getParameter("checkOut") != null ? request.getParameter("checkOut") : "" %>">

                </div>
            </div>
            <p id="nights-count" class="nights-count"></p>
        </div>

			        <div class="room-type-selector">
			            <h2>Room Type</h2>
			            <div class="room-types">
			                <button type="submit" class="room-type-option" name="roomType" value="all">
			                    <h3>All Rooms</h3>
			                    <p>View all available room types</p>
			                </button>
			                <button type="submit" class="room-type-option" name="roomType" value="standard">
			                    <h3>Standard</h3>
			                    <p>Comfortable and affordable</p>
			                </button>
			                <button type="submit" class="room-type-option" name="roomType" value="suite">
			                    <h3>Suite</h3>
			                    <p>Separate living area & luxurious features</p>
			                </button>
			            </div>
			        </div>
			    </form>
			
			    <div id="available-rooms" class="available-rooms">
			        <div id="loading" class="loading hidden">
			            <div class="spinner"></div>
			            <p>Finding available rooms...</p>
			        </div>
			        <div id="rooms-grid" class="rooms-grid">
			        
					     <% 
						    List<Room> roomList = (List<Room>) request.getAttribute("rooms");
						    Integer nights = (Integer) request.getAttribute("nights"); 
						    if (roomList != null && !roomList.isEmpty()) {
						        for (Room room : roomList) {
						%>
						<div class="room-card">
						    <div class="room-image">
						        <img src="#" alt="<%= room.getRoomType() %>">
						        <div class="room-price-tag">$<%= room.getPrice() %>/night</div>
						    </div>
						    <div class="room-details">
						        <h3><%= room.getRoomNumber() %> Room</h3>
						        <p class="room-description"><%= room.getDescription() %></p>
						
						        <div class="total-price">
						            <span>Price per night</span>
						            <strong>$<%= room.getPrice() %></strong>
						        </div>
						
						        <button class="book-button">Book Now</button>
						    </div>
						</div>

				
						<%
						        }
						    }
						%>
			        
			        </div>
			        
			        
						

			    </div>
			</main>


    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Luxury Hotel & Resort</h3>
                    <p>Experience the ultimate in luxury and comfort with our premium accommodations.</p>
                </div>
                <div class="footer-section">
                    <h3>Contact</h3>
                    <p>123 Luxury Avenue<br>Paradise City, PC 12345</p>
                    <p>reservations@luxuryhotel.com<br>+1 (555) 123-4567</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Luxury Hotel & Resort. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="js/book_room.js"></script>
</body>
</html>