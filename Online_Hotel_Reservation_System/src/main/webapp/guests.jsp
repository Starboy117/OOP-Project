<!DOCTYPE html>
 <%@ page import = "com.reservation.Guest" %>
 <%@ page import = "java.util.List" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Guest Management</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Bootstrap 5 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>

<%
    String msg = (String) session.getAttribute("successMessage");
 

    if ("success".equals(msg)) {
	%>
	    <div class="alert alert-success alert-dismissible fade show" role="alert">
	        Guest Deletion successful!
	        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	    </div>
	<%
	    } else if ("error".equals(msg)) {
	%>
	    <div class="alert alert-danger alert-dismissible fade show" role="alert">
	        Something went wrong!
	        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	    </div>
	<%
			
	    }
    
    session.removeAttribute("successMessage");
	%>
	
	
    <div class="container1">
        <nav class="sidebar">
            <div class="logo">
                <h1>Tendura</h1>
                <p>Hotel Management</p>
            </div>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="check-inout.jsp"><i class="fas fa-key"></i> Check In/Out</a></li>
                <li class="active"><a href="guests.jsp"><i class="fas fa-users"></i> Guests</a></li>
                <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
            
        </nav>

        <main>
            <header>
                <div class="header-content">
                    <h2><i class="fas fa-users"></i> Guest Management</h2>
                    <div class="date-time">
                        <p id="current-date"></p>
                        <p id="current-time"></p>
                    </div>
                </div>
                <div class="user-actions">
                    <div class="notifications">
                        <i class="fas fa-bell"></i>
                        <span class="badge">3</span>
                    </div>
                    <div class="user-profile">
                        <img src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg" alt="Receptionist">
                    </div>
                </div>
            </header>

            <div class="content">
                <div class="card">
                    <div class="card-header">
                        <h3>Guest Directory</h3>
                       
                    </div>


                        <table id="guests-table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Phone No</th>
                                    <th>Room No</th>
                                    <th>Check-Out Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Guest> guests = (List<Guest>) request.getAttribute("guests");
                                if (guests != null && !guests.isEmpty()){
                                
                                	for(Guest g1: guests){
                                		
                          
                                
                                %>
                                
                           <tr>
							    <td><%= g1.getcID() %></td>
							    <td><%= g1.getgName() %></td>
							    <td><%= g1.getgPhn() %></td>
							    <td><%= g1.getRoomNo() %></td>
							    <td><%= g1.getcOutDate() %></td>
							    <td>
							        <a href="singleGuest?id=<%=g1.getcID()%>"><button class="btn btn-success me-3"><i class="fas fa-edit"></i> Edit</button></a>
							
							        <!-- Delete Button with unique modal trigger -->
							        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal<%= g1.getcID() %>">
							            <i class="fas fa-trash-alt"></i> Delete Guest
							        </button>
							
							        <!-- Unique Modal -->
							        <div class="modal fade" id="confirmDeleteModal<%= g1.getcID() %>" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
							            <div class="modal-dialog">
							                <div class="modal-content">
							                    <div class="modal-header bg-danger text-white">
							                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
							                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
							                    </div>
							                    <div class="modal-body">
							                        Are you sure you want to delete this user? This action cannot be undone.
							                    </div>
							                    <div class="modal-footer">
							                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
							                        <form action="deleteGuest" method="post">

							                            <input type="hidden" name="id" value="<%= g1.getcID() %>">
							                            <button type="submit" class="btn btn-danger">Delete</button>
							                        </form>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </td>
							</tr>
							
							                                
                               <%
								        }
								    } else {
								%>
								        <tr><td colspan="6">No users found.</td></tr>
								<%
								    }
								%>
                            </tbody>
                        </table>
                    </div>
                </div>

                    

        </main>
    </div>
    
    
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

    
</body>
</html>