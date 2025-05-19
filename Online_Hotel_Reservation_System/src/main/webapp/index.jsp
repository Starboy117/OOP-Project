<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <div class="container">
        <nav class="sidebar">
            <div class="logo">
                <h1>Tendura</h1>
                <p>Hotel Management</p>
            </div>
            <ul>
                <li class="active"><a href="index.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="check-inout.jsp"><i class="fas fa-key"></i> Check In/Out</a></li>
                <li><a href="guests.jsp"><i class="fas fa-users"></i> Guests</a></li>
                <li><a href="editGuest.jsp"><i class="fas fa-chart-bar"></i> Edit page</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            </ul>
            <div class="user-info">
                <img src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg" alt="Receptionist">
                <div>
                    <p class="name">Jane Doe</p>
                    <p class="role">Receptionist</p>
                </div>
            </div>
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
                        <i class="fas fa-bell"></i>
                        <span class="badge">3</span>
                    </div>
                    <div class="user-profile">
                        <img src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg" alt="Receptionist">
                    </div>
                </div>
            </header>

            <div class="content">
                <div class="stats-container">
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Rooms</h3>
                            <p class="stat-number">50</p>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-door-closed"></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Available</h3>
                            <p class="stat-number">23</p>
                        </div>
                        <div class="stat-icon available">
                            <i class="fas fa-check-circle"></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Occupied</h3>
                            <p class="stat-number">27</p>
                        </div>
                        <div class="stat-icon occupied">
                            <i class="fas fa-user"></i>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Today's Bookings</h3>
                            <p class="stat-number">8</p>
                        </div>
                        <div class="stat-icon bookings">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="card upcoming-checkouts">
                        <div class="card-header">
                            <h3>Today's Check-outs</h3>
                            <a href="check-inout.jsp" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Room</th>
                                        <th>Guest</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="checkout-list">
                                    <tr>
                                        <td>101</td>
                                        <td>John Smith</td>
                                        <td><span class="status pending">Pending</span></td>
                                        <td><a href="check-inout.jsp" class="btn btn-small">Process</a></td>
                                    </tr>
                                    <tr>
                                        <td>204</td>
                                        <td>Emma Johnson</td>
                                        <td><span class="status pending">Pending</span></td>
                                        <td><a href="check-inout.jsp" class="btn btn-small">Process</a></td>
                                    </tr>
                                    <tr>
                                        <td>315</td>
                                        <td>Michael Brown</td>
                                        <td><span class="status processing">Processing</span></td>
                                        <td><a href="check-inout.jsp" class="btn btn-small">Process</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card upcoming-checkins">
                        <div class="card-header">
                            <h3>Today's Check-ins</h3>
                            <a href="check-inout.jsp" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Room</th>
                                        <th>Guest</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="checkin-list">
                                    <tr>
                                        <td>105</td>
                                        <td>Sarah Williams</td>
                                        <td><span class="status confirmed">Confirmed</span></td>
                                        <td><a href="check-inout.jsp" class="btn btn-small">Process</a></td>
                                    </tr>
                                    <tr>
                                        <td>210</td>
                                        <td>David Jones</td>
                                        <td><span class="status confirmed">Confirmed</span></td>
                                        <td><a href="check-inout.jsp" class="btn btn-small">Process</a></td>
                                    </tr>
                                    <tr>
                                        <td>302</td>
                                        <td>Lisa Miller</td>
                                        <td><span class="status confirmed">Confirmed</span></td>
                                        <td><a href="check-inout.jsp" class="btn btn-small">Process</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="card recent-activity">
                        <div class="card-header">
                            <h3>Recent Activity</h3>
                            <a href="reports.jsp" class="btn-link">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="activity-list">
                                <div class="activity-item">
                                    <div class="activity-icon check-in">
                                        <i class="fas fa-sign-in-alt"></i>
                                    </div>
                                    <div class="activity-details">
                                        <p><strong>Check-in:</strong> Robert Davis checked into Room 208</p>
                                        <span class="time">Today, 9:45 AM</span>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon check-out">
                                        <i class="fas fa-sign-out-alt"></i>
                                    </div>
                                    <div class="activity-details">
                                        <p><strong>Check-out:</strong> Maria Garcia checked out from Room 115</p>
                                        <span class="time">Today, 8:30 AM</span>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon reservation">
                                        <i class="fas fa-calendar-plus"></i>
                                    </div>
                                    <div class="activity-details">
                                        <p><strong>New Reservation:</strong> Booking confirmed for James Wilson</p>
                                        <span class="time">Yesterday, 7:15 PM</span>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon update">
                                        <i class="fas fa-edit"></i>
                                    </div>
                                    <div class="activity-details">
                                        <p><strong>Updated:</strong> Room 302 status changed to "Under Maintenance"</p>
                                        <span class="time">Yesterday, 4:20 PM</span>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon check-out">
                                        <i class="fas fa-sign-out-alt"></i>
                                    </div>
                                    <div class="activity-details">
                                        <p><strong>Check-out:</strong> Thomas Anderson checked out from Room 405</p>
                                        <span class="time">Yesterday, 11:10 AM</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card notifications">
                        <div class="card-header">
                            <h3>Notifications</h3>
                            <a href="#" class="btn-link">Mark All Read</a>
                        </div>
                        <div class="card-body">
                            <div class="notification-list">
                                <div class="notification-item unread">
                                    <div class="notification-icon">
                                        <i class="fas fa-exclamation-circle"></i>
                                    </div>
                                    <div class="notification-details">
                                        <p>Room 205 needs cleaning service</p>
                                        <span class="time">10 minutes ago</span>
                                    </div>
                                </div>
                                <div class="notification-item unread">
                                    <div class="notification-icon">
                                        <i class="fas fa-bell"></i>
                                    </div>
                                    <div class="notification-details">
                                        <p>VIP Guest arriving in 2 hours</p>
                                        <span class="time">1 hour ago</span>
                                    </div>
                                </div>
                                <div class="notification-item">
                                    <div class="notification-icon">
                                        <i class="fas fa-info-circle"></i>
                                    </div>
                                    <div class="notification-details">
                                        <p>Staff meeting at 4:00 PM today</p>
                                        <span class="time">3 hours ago</span>
                                    </div>
                                </div>
                                <div class="notification-item">
                                    <div class="notification-icon">
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div class="notification-details">
                                        <p>Monthly report due tomorrow</p>
                                        <span class="time">Yesterday</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <script src="js/script.js"></script>
    <script src="js/dashboard.js"></script>
</body>
</html>