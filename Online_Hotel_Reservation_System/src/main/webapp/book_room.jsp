<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

Integer userId = (Integer) session.getAttribute("userId");


if(userId == null){
	
	response.sendRedirect("Login.jsp");
	return;
}

%>

<%@ page import="java.util.List" %>
<%@ page import="com.Room.Room" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel - Room Booking</title>
    <link href="css/login.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/book_room.css">
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
    
    
</head>
<body class="bg-light">
     <nav class="navbar custom navbar-light bg-light fixed-top" style="opacity: 90%;">
        <div class="logo1">
          <a href="Home.jsp" class="navbar-brand">
            <span class="fw-bold text-brown fs-1 text-s5">Tendura</span>
          </a>
        </div>
        <div class="tabs">
          <ul class="nav" style="margin: 0%;">
            <li class="nav-item">
              <a class="nav-link custom" href="Home.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link custom" href="#">About Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link custom" href="#">Contact Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link custom" href="faqs.jsp">FAQs</a>
            </li>
          </ul>
        </div>
      </nav>
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>

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
						        
						        
						            String roomType = room.getRoomType().trim().toLowerCase();
						            String imageUrl;
						            if (roomType.equals("suite")) {
						                imageUrl = "https://images.pexels.com/photos/2631746/pexels-photo-2631746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
						            } else {
						                imageUrl = "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
						            }
						        
						        

						%>
						<div class="room-card">
						    <div class="room-image">
						        <img src="<%=imageUrl %>" alt="<%= room.getRoomType() %>">
						        <div class="room-price-tag">$<%= room.getPrice() %>/night</div>
						    </div>
						    <div class="room-details">
						        <h3><%= room.getRoomNumber() %> Room  (<%=room.getRoomType() %>)</h3>
						        <p class="room-description"><%= room.getDescription() %></p>
						
						        <div class="total-price">
						            <span>Price per night</span>
						            <strong>$<%= room.getPrice() %></strong>
						        </div>
						
						      <form id="bookForm-<%= room.getRoomNumber() %>" action="Payment.jsp" method="GET">
							    <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
							    <input type="hidden" name="amount" value="<%= room.getPrice() %>">
							    <input type="hidden" name="nights" id="nights-hidden-<%= room.getRoomNumber() %>">
							
							    
							    <input type="hidden" name="checkIn" value="<%= request.getParameter("checkIn") != null ? request.getParameter("checkIn") : "" %>">
							    <input type="hidden" name="checkOut" value="<%= request.getParameter("checkOut") != null ? request.getParameter("checkOut") : "" %>">
							
							    <button type="button" class="btn btn-dark w-100" onclick="submitBooking(<%= room.getRoomNumber() %>)">Book Now</button>
							</form>




						    </div>
						</div>

				
						<%
						        }
						    }
						    else{
						    	%>
						    	
						    	<div class="no-rooms-available d-flex flex-column justify-content-center align-items-center" style="width:600px;display:block;">
								  
								 
								</div>

						  
						  <% 	
						    }
						%>
			        
			        </div>
			        
			        
						

			    </div>
			</main>
			
			<footer class="bg-light text-brown text-center py-4 mt-5">
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>
    <div class="container">
      <p class="mb-2">© 2025 Tendura Hotel. All rights reserved.</p>
      <p class="mb-3">
        <a href="#" class="text-brown text-decoration-none">Privacy Policy</a> | 
        <a href="#" class="text-brown text-decoration-none">Terms of Service</a>
      </p>
      <div>
        <a href="#" class="text-brown mx-2">
          <i class="bi bi-facebook"></i> Facebook
        </a>
        <a href="#" class="text-brown mx-2">
          <i class="bi bi-twitter"></i> Twitter
        </a>
        <a href="#" class="text-brown mx-2">
          <i class="bi bi-instagram"></i> Instagram
        </a>
      </div>
    </div>
  </footer>


   

    <script src="js/book_room.js"></script>
</body>
</html>