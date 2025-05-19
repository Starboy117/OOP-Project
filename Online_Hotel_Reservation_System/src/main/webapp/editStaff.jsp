<!DOCTYPE html>

<%
    Integer id = (Integer) session.getAttribute("staffId");
    if(id == null){
        response.sendRedirect("Login.jsp");
        return;
    }
    
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
    
  
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    
    
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Edit Staff</title>
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
                <li><a href="adminDashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="getUsers"><i class="fas fa-user-alt"></i> Users</a></li>
                <li class="active"><a href="getStaff"><i class="fas fa-user-tie"></i> Staff</a></li>
                <li><a href="#"><i class="fas fa-house-user"></i> Rooms</a></li>
                <li><a href="#"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
            </ul>
        </nav>

        <main>
            <header>
                <div class="header-content">
                    <h2><i class="fas fa-user-plus"></i> Edit Staff</h2>
                   
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
            
            <div class="row">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <h3>Edit Staff Member</h3>
                            <a href="getStaff" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Staff List
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                    <% String error = (String) request.getAttribute("userEditError"); %>
						<% if (error != null) { %>
			 			 <p style="color:red;"><%= error %></p>
					<% } %>
                        <form action="staffEdit" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="id" value="${user_id}">
                            <input type="hidden" name="initial_username" value="${user_username}">
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="name" name="name" value="${user_name}" required>
                                    <div class="invalid-feedback">
                                        Please enter the staff member's full name.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" value="${user_username}" required>
                                    <div class="invalid-feedback">
                                        Please enter a username.
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${user_email}" required>
                                    <div class="invalid-feedback">
                                        Please enter a valid email address.
                                    </div>
                                </div>
                                <div class="col-md-6">
								    <label for="password" class="form-label">Password</label>
								    <div class="input-group">
								        <input type="password" class="form-control" id="password" name="password" value="${user_password}" required>
								        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
								            <i class="fas fa-eye"></i>
								        </button>
								    </div>
								    <div class="invalid-feedback">
								        Please enter a password.
								    </div>
								</div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="role" class="form-label">Role</label>
                                   <select class="form-control" id="role" name="role" required>
									    <option value="" disabled ${empty user_role ? 'selected' : ''}>Select a role</option>
									    <option value="System admin" ${user_role == 'System admin' ? 'selected' : ''}>System Administrator</option>
									    <option value="Receptionist" ${user_role == 'Receptionist' ? 'selected' : ''}>Receptionist</option>
									    <option value="Customer support staff" ${user_role == 'Customer support staff' ? 'selected' : ''}>Customer Support Agent</option>
									</select>

                                    <div class="invalid-feedback">
                                        Please select a role.
                                    </div>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save"></i> Update Staff Member
                                </button>
                                <a href="getStaff" class="btn btn-danger">
                                    <i class="fas fa-times"></i> Cancel
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <script src="js/editStaff.js"></script>
</body>
</html>
