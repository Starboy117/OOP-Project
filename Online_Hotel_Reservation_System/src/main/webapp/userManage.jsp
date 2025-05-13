<!DOCTYPE html>

<%@ page import="com.user.User" %>
<%@ page import="java.util.List" %>

<%



	Integer id = (Integer) session.getAttribute("staffId");

	if(id == null){
	
		response.sendRedirect("Login.jsp");
		return;
	}

	

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    
</head>
<body>
    <div class="container1">
        <nav class="sidebar">
            <div class="logo">
                <h1>Tendura</h1>
                <p><%=role %></p>
            </div>
            <ul>
                <li ><a href="admin_dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li class="active"><a href="#"><i class="fas fa-user-alt"></i> Users</a></li>
                <li><a href="guests.html"><i class="fas fa-user-tie"></i> Staff</a></li>
                <li><a href="#"><i class="fas fa-house-user"></i> Rooms</a></li>
                <li><a href="reports.html"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
                
            </ul>
           
        </nav>

        <main>
            <header>
                <div class="header-content">
                    <h2><i class="fas fa-user-alt"></i> Users</h2>
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
            
            
            <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <h3>Manage Users</h3>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>User Id</th>
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="checkout-list">
                                
                                 <%
								    // Retrieve the user list from the session attribute
								    List<User> userList = (List<User>) session.getAttribute("usersTotal");
								    if (userList != null && !userList.isEmpty()) {
								        for (User user : userList) {
								%>
								            <tr>
								                <td><%= user.getId() %></td>
								                <td><%= user.getName() %></td>
								                <td><%= user.getUsername() %></td>
								                <td><%= user.getEmail() %></td>
								                <td><%= user.getPassword() %></td>
								                <td>
								                	<a><button class="btn btn-success me-3">Edit</button></a>
								                	<a><button class="btn btn-danger">Delete</button></a>
								                </td>
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
            
</body>
