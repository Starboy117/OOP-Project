<!DOCTYPE html>
<%@ page import="com.staff.Staff" %>
<%
    Integer id = (Integer) session.getAttribute("staffId");
    if(id == null){
        response.sendRedirect("Login.jsp");
        return;
    }
    
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
    
    // Check for messages from redirect
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    
    // Clear the messages after retrieving them
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Add Staff</title>
    <link rel="stylesheet" href="css/staff.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    
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
                <li><a href="reports.html"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
            </ul>
        </nav>

        <main>
            <header>
                <div class="header-content">
                    <h2><i class="fas fa-user-plus"></i> Add New Staff</h2>
                   
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
                            <h3>Add New Staff Member</h3>
                            <a href="getStaff">
                				<button class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Staff List</button>
               				 </a>
                            
                        </div>
                    </div>
                    <div class="card-body">
                        <% if(successMessage != null && !successMessage.isEmpty()) { %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <%= successMessage %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>

                        <% if(errorMessage != null && !errorMessage.isEmpty()) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <%= errorMessage %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>

                        <form action="addStaff" method="post" class="needs-validation" novalidate>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                    <div class="invalid-feedback">
                                        Please enter the staff member's full name.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                    <div class="invalid-feedback">
                                        Please enter a username.
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                    <div class="invalid-feedback">
                                        Please enter a valid email address.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="password" class="form-label">Password</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="password" name="password" required>
                                       
                                    </div>
                                    <div class="invalid-feedback">
                                        Please enter a password.
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="role" class="form-label">Role</label>
                                    <select class="form-select" id="role" name="role" required>
                                        <option value="" selected disabled>Select a role</option>
                                        <option value="System admin">System Administrator</option>
                                        <option value="Receptionist">Receptionist</option>
                                        <option value="Customer support staff">Customer Support Staff</option>
                                  
                                    </select>
                                    <div class="invalid-feedback">
                                        Please select a role.
                                    </div>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Save Staff Member
                                </button>
                                <button type="reset" class="btn btn-outline-secondary">
                                    <i class="fas fa-undo"></i> Reset
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
           
        </main>
    </div>
    
  
</body>
</html>