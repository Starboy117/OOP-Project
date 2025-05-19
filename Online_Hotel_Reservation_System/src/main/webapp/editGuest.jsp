<!DOCTYPE html>

<%
   
    
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
    
  
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    
    
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
    
    String checkId = request.getParameter("id");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Edit Guest</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/staff.css">
</head>
<body>
    <div class="container1">
        <nav class="sidebar">
            <div class="logo">
                <h1>Tendura</h1>
                <p><%=role %></p>
            </div>
            <ul>
                 <li><a href="index.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="check-inout.jsp"><i class="fas fa-key"></i> Check In/Out</a></li>
                <li class="active"><a href="guests.jsp"><i class="fas fa-users"></i> Guests</a></li>
                <li><a href="editGuest.jsp"><i class="fas fa-chart-bar"></i> Edit page</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
        </nav>

        <main>
            <header>
                <div class="header-content">
                    <h2><i class="fas fa-user-plus"></i> Edit Guest</h2>
                   
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
                        <div class="d-flex justify-content-between align-items-center">
                            <h3>Edit Guest Member</h3>
                            <a href="guestView" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Guest List
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                    <% String error = (String) request.getAttribute("error"); %>
						<% if (error != null) { %>
			 			 <p style="color:red;"><%= error %></p>
					<% } %>
                        <form action="updateGuest" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="id" value="<%=checkId%>">
                           
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Guest Name</label>
                                    <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                                    <div class="invalid-feedback">
                                        Please enter the staff member's full name.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="password" class="form-label">Room Number</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="roomNo" value="${roomNo}" required>
                                       
                                    </div>
                                    <div class="invalid-feedback">
                                        Please enter a password.
                                    </div>
                                </div>
                                
                               
                            
                            </div>

                            
                                
                          

                            <div class="row mb-3">
                             
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Phone Number</label>
                                    <input type="email" class="form-control" id="email" name="phnNo" value="${phone}" required>
                                    <div class="invalid-feedback">
                                        Please enter a valid email address.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="role" class="form-label">Check-Out Date</label>
                                    <input type="text" class="form-control"  name="checkOutdate" value="${date}" required>
                                   

                                    <div class="invalid-feedback">
                                        Please select a role.
                                    </div>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save"></i> Update Guest Member
                                </button>
                                <a href="guestView" class="btn btn-danger">
                                    <i class="fas fa-times"></i> Cancel
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
