<!DOCTYPE html>

<%@ page import="com.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.staff.Staff" %>
<%@ page import="com.Room.Room" %>





<%



	Integer id = (Integer) session.getAttribute("staffId");

	if(id == null){
	
		response.sendRedirect("Login.jsp");
		return;
	}

	
    Integer totalUsers = (Integer) session.getAttribute("totalUsers");
    if (totalUsers == null) totalUsers = 0;

    Integer totalStaff = (Integer) session.getAttribute("totalStaff");
    if (totalStaff == null) totalStaff = 0;

    Integer totalRooms = (Integer) session.getAttribute("totalRooms");
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
    <div class="container1">
        <nav class="sidebar">
            <div class="logo">
                <h1>Tendura</h1>
                <p><%=role %></p>
            </div>
            <ul>
                <li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="getUsers"><i class="fas fa-user-alt"></i> Users</a></li>
                <li><a href="guests.html"><i class="fas fa-user-tie"></i> Staff</a></li>
                <li><a href="#"><i class="fas fa-house-user"></i> Rooms</a></li>
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
                        <a href="userProfile.jsp"><i class="fas fa-user-circle"></i></a>
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
                            <h3>Total Users</h3>
                            <p class="stat-number"><%=totalUsers %></p>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-user-alt"></i></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Staff</h3>
                            <p class="stat-number"><%=totalStaff %></p>
                        </div>
                        <div class="stat-icon available">
                            <i class="fas fa-user-tie"></i></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Rooms</h3>
                            <p class="stat-number"><%= totalRooms %></p>
                        </div>
                        <div class="stat-icon occupied">
                            <i class="fas fa-house-user"></i></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Reports</h3>
                            <p class="stat-number">8</p>
                        </div>
                        <div class="stat-icon bookings">
                            <i class="fas fa-folder-open"></i>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <h3>Latest Users</h3>
                            <a href="getUsers" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>User Id</th>
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody id="checkout-list">
                          		 <%
								    // Retrieve the user list from the session attribute
								    List<User> userList = (List<User>) session.getAttribute("usersOverview");
								    if (userList != null && !userList.isEmpty()) {
								        for (User user : userList) {
								%>
								            <tr>
								                <td><%= user.getId() %></td>
								                <td><%= user.getName() %></td>
								                <td><%= user.getUsername() %></td>
								                <td><%= user.getEmail() %></td>
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
                            <h3>Latest Staff</h3>
                            <a href="#" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Staff Id</th>
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                    </tr>
                                </thead>
                                <tbody id="checkin-list">
                                     <%
								    // Retrieve the user list from the session attribute
								    List<Staff> staffList = (List<Staff>) session.getAttribute("staffOverview");
								    if (staffList != null && !staffList.isEmpty()) {
								        for (Staff staff : staffList) {
									%>
								            <tr>
								                <td><%= staff.getId() %></td>
								                <td><%= staff.getName() %></td>
								                <td><%= staff.getUsername() %></td>
								                <td><%= staff.getEmail() %></td>
								                <td><%= staff.getRole() %></td>
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
								    List<Room> roomList = (List<Room>) session.getAttribute("roomOverview");
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
                
                
                    

                
            </div>
        </main>
    </div>
    
 
</body>
</html>