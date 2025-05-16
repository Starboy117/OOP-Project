<!DOCTYPE html>
<%@ page import="com.staff.Staff" %>
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

<head> <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
  <title>Tendura Hotel - Staff</title>
  <link rel="stylesheet" href="css/dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="icon" href="images/tendura1.png" type="image/png" /> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<%
    String msg = (String) session.getAttribute("successMessage");
 

    if ("success".equals(msg)) {
	%>
	    <div class="alert alert-success alert-dismissible fade show" role="alert">
	        User Deletion successful!
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
    <p><%=role %></p>
   </div>
   <ul> 
     <li ><a href="adminDashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li> 
     <li ><a href="getUsers"><i class="fas fa-user-alt"></i> Users</a></li> 
     <li class="active"><a href="getStaff"><i class="fas fa-user-tie"></i> Staff</a></li> 
     <li><a href="#"><i class="fas fa-house-user"></i> Rooms</a></li> 
     <li><a href="reports.html"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>

        </ul>
       
    </nav>

    <main>
        <header>
            <div class="header-content">
                <h2><i class="fas fa-user-tie"></i> Staff</h2>
                
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
                        <h3>Manage Staff</h3>
                        <a href="addStaff.jsp">
                			<button class="btn btn-primary"><i class="fas fa-plus"></i> Add Staff</button>
               			 </a>
                    </div>
                    <div class="card-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Staff Id</th>
                                    <th>Name</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="checkout-list">
                            
                             <%
							    // Retrieve the user list from the session attribute
							    List<Staff> userList = (List<Staff>) request.getAttribute("staffTotal");
							    if (userList != null && !userList.isEmpty()) {
							        for (Staff user : userList) {
							%>
							            <tr>
							                <td><%= user.getId() %></td>
							                <td><%= user.getName() %></td>
							                <td><%= user.getUsername() %></td>
							                <td><%= user.getEmail() %></td>
							                <td><%= user.getPassword() %></td>
							                <td><%= user.getRole() %></td>
							                <td>
							                	<a href="singleStaff?userId=<%=user.getId()%>"><button class="btn btn-success me-3"><i class="fas fa-edit"></i> Edit</button></a>
							                	
							                	
							                	<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal_<%=user.getId()%>">
													    <i class="fas fa-trash-alt"></i> Delete Staff
													</button>
													
													<!-- Modal -->
													<div class="modal fade" id="confirmDeleteModal_<%=user.getId()%>" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header bg-danger text-white">
													        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
													        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													        Are you sure you want to delete this staff? This action cannot be undone.
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
													
													        <!-- Actual delete form -->
													        <form action="deleteStaff" method="post">
													          <input type="hidden" name="id" value="<%=user.getId()%>">
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
							        <tr><td colspan="6">No staffs found.</td></tr>
							<%
							    }
							%>
                      		
                        

                            </tbody>
                        </table>
                    </div>
                </div>
             </div>
    
    </main>
    
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    
        
</body>
</html>