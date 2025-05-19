<!DOCTYPE html>


<%@ page import="com.reservation.Reservations" %>
<%@ page import="java.util.List" %>
<%@ page import="com.reservation.Guest" %>
<%@ page import="com.Room.Room" %>





<%



	Integer id = (Integer) session.getAttribute("staffId");

	if(id == null){
	
		response.sendRedirect("Login.jsp");
		return;
	}

	
    Integer totalReserve = (Integer) request.getAttribute("totalReserve");
    if (totalReserve == null) totalReserve = 0;

    Integer totalGuests = (Integer) request.getAttribute("totalGuests");
    if (totalGuests == null) totalGuests = 0;

    Integer totalRooms = (Integer) request.getAttribute("totalRooms");
    if (totalRooms == null) totalRooms = 0;

    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
    
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    
</head>
<body>
    <div class="container">
        <nav class="sidebar">
            <div class="logo">
                <h1>Tendura</h1>
                <p><%=role %></p>
            </div>
            <ul>
                <li class="active"><a href="index.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="check-inout.jsp"><i class="fas fa-key"></i> Check In/Out</a></li>
                <li><a href="guestView"><i class="fas fa-users"></i> Guests</a></li>
                <li><a href="#"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
            </ul>
            
        </nav>

             <main>
            <header>
                <div class="header-content">
                    <h2><i class="fas fa-tachometer-alt"></i> Dashboard</h2>
                    <div class="date-time">
                        <p id="current-date"></p>
                        <p id="current-time"></p>
                    </div>
                </div>
                <div class="user-actions">
                    <div class="notifications">
                    </div>
                    <div class="user-profile">
                    	<span class="user-name"><%=name %></span>
                        <a href="#"><i class="fas fa-user-circle"></i></a>
                        <a href="logout" title="Logout" class="logout-icon">
        					<i class="fas fa-power-off"></i>
   						 </a>
                    </div>
                </div>
            </header>

            <div class="content">
                <div class="stats-container">
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Reservations</h3>
                            <p class="stat-number"><%=totalReserve %></p>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Guests</h3>
                            <p class="stat-number"><%=totalGuests %></p>
                        </div>
                        <div class="stat-icon available">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Rooms</h3>
                            <p class="stat-number"><%=totalRooms %></p>
                        </div>
                        <div class="stat-icon occupied">
                            <i class="fas fa-house-user"></i></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Reports</h3>
                            <p class="stat-number">0</p>
                        </div>
                        <div class="stat-icon bookings">
                            <i class="fas fa-folder-open"></i>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <h3>Latest Reservations</h3>
                            <a href="getUsers" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Reservation Id</th>
                                        <th>User Id</th>
                                        <th>Room Id</th>
                                        <th>Check-In Date</th>
                                    </tr>
                                </thead>
                                <tbody id="checkout-list">
                          		 <%
								    // Retrieve the user list from the session attribute
								    List<Reservations> rList = (List<Reservations>) request.getAttribute("reserveOverview");
								    if (rList != null && !rList.isEmpty()) {
								        for (Reservations reserve : rList) {
								%>
								            <tr>
								                <td><%= reserve.getId() %></td>
								                <td><%= reserve.getUserId() %></td>
								                <td><%= reserve.getRoomId() %></td>
								                <td><%= reserve.getCheckInDate() %></td>
								            </tr>
								<%
								        }
								    } else {
								%>
								        <tr><td colspan="4">No users found.</td></tr>
								<%
								    }
								%>
                            

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card upcoming-checkins">
                        <div class="card-header">
                            <h3>Latest Guests</h3>
                            <a href="getStaff" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Guest Id</th>
                                        <th>Name</th>
                                        <th>Phone Number</th>
                                        <th>No of guests</th>
                                        
                                    </tr>
                                </thead>
                                <tbody id="checkin-list">
                                     <%
								    // Retrieve the user list from the session attribute
								    List<Guest> guestList = (List<Guest>) request.getAttribute("guestOverview");
								    if (guestList != null && !guestList.isEmpty()) {
								        for (Guest guest : guestList) {
									%>
								            <tr>
								                <td><%= guest.getcID() %></td>
								                <td><%= guest.getgName()%></td>
								                <td><%= guest.getgPhn() %></td>
								                <td><%= guest.getGuestNo() %></td>
							
								            </tr>
									<%
									        }
									    } else {
									%>
									        <tr><td colspan="5">No users found.</td></tr>
									<%
								 	   }
									%>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                  <div class="card upcoming-checkins">
                        <div class="card-header">
                            <h3>Latest Rooms</h3>
                            <a href="#" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Room Id</th>
                                        <th>Room Number</th>
                                        <th>Room Type</th>
                                        <th>Capacity</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody id="checkin-list">
                                     <%
								    // Retrieve the user list from the session attribute
								    List<Room> roomList = (List<Room>) request.getAttribute("roomOverview");
								    if (roomList != null && !roomList.isEmpty()) {
								        for (Room room : roomList) {
									%>
								            <tr>
								                <td><%= room.getRoomId() %></td>
								                <td><%= room.getRoomNumber() %></td>
								                <td><%= room.getRoomType() %></td>
								                <td><%= room.getCapacity() %></td>
								                <td><%= room.getStatus() %></td>
								            </tr>
									<%
									        }
									    } else {
									%>
									        <tr><td colspan="5">No users found.</td></tr>
									<%
								 	   }
									%>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                
                    

                
            
        </main>
    </div>
    
   
</body>
</html>