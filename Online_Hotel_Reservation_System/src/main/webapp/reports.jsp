<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Reports & Logs</title>
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
                <li><a href="index.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="check-inout.jsp"><i class="fas fa-key"></i> Check In/Out</a></li>
                <li><a href="guests.jsp"><i class="fas fa-users"></i> Guests</a></li>
                <li class="active"><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
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
                    <h2><i class="fas fa-chart-bar"></i> Reports & Logs</h2>
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
                <div class="report-controls">
                    <div class="date-range">
                        <label for="start-date">From:</label>
                        <input type="date" id="start-date">
                        <label for="end-date">To:</label>
                        <input type="date" id="end-date">
                    </div>
                    <div class="report-actions">
                        <button class="btn" id="generate-report"><i class="fas fa-sync"></i> Generate</button>
                        <button class="btn btn-secondary"><i class="fas fa-download"></i> Export</button>
                        <button class="btn btn-secondary"><i class="fas fa-print"></i> Print</button>
                    </div>
                </div>

                <div class="tabs">
                    <button class="tab-btn active" data-tab="occupancy">Occupancy</button>
                    <button class="tab-btn" data-tab="revenue">Revenue</button>
                    <button class="tab-btn" data-tab="activity-log">Activity Log</button>
                </div>

                <div class="tab-content active" id="occupancy-content">
                    <div class="card">
                        <div class="card-header">
                            <h3>Occupancy Report</h3>
                        </div>
                        <div class="card-body">
                            <div class="statistics">
                                <div class="stat-box">
                                    <h4>Average Occupancy Rate</h4>
                                    <div class="stat-value">76%</div>
                                </div>
                                <div class="stat-box">
                                    <h4>Highest Day</h4>
                                    <div class="stat-value">92%</div>
                                    <div class="stat-detail">June 12, 2025</div>
                                </div>
                                <div class="stat-box">
                                    <h4>Lowest Day</h4>
                                    <div class="stat-value">52%</div>
                                    <div class="stat-detail">June 8, 2025</div>
                                </div>
                                <div class="stat-box">
                                    <h4>Room Nights</h4>
                                    <div class="stat-value">245</div>
                                </div>
                            </div>

                            <div class="chart-container">
                                <canvas id="occupancy-chart"></canvas>
                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Available Rooms</th>
                                        <th>Occupied Rooms</th>
                                        <th>Occupancy Rate</th>
                                        <th>Revenue</th>
                                    </tr>
                                </thead>
                                <tbody id="occupancy-table">
                                    <tr>
                                        <td>June 14, 2025</td>
                                        <td>12</td>
                                        <td>38</td>
                                        <td>76%</td>
                                        <td>$6,250</td>
                                    </tr>
                                    <tr>
                                        <td>June 13, 2025</td>
                                        <td>10</td>
                                        <td>40</td>
                                        <td>80%</td>
                                        <td>$6,500</td>
                                    </tr>
                                    <tr>
                                        <td>June 12, 2025</td>
                                        <td>4</td>
                                        <td>46</td>
                                        <td>92%</td>
                                        <td>$7,450</td>
                                    </tr>
                                    <tr>
                                        <td>June 11, 2025</td>
                                        <td>8</td>
                                        <td>42</td>
                                        <td>84%</td>
                                        <td>$6,800</td>
                                    </tr>
                                    <tr>
                                        <td>June 10, 2025</td>
                                        <td>15</td>
                                        <td>35</td>
                                        <td>70%</td>
                                        <td>$5,600</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-content" id="revenue-content">
                    <div class="card">
                        <div class="card-header">
                            <h3>Revenue Report</h3>
                        </div>
                        <div class="card-body">
                            <div class="statistics">
                                <div class="stat-box">
                                    <h4>Total Revenue</h4>
                                    <div class="stat-value">$32,600</div>
                                </div>
                                <div class="stat-box">
                                    <h4>Room Revenue</h4>
                                    <div class="stat-value">$28,350</div>
                                    <div class="stat-detail">87% of total</div>
                                </div>
                                <div class="stat-box">
                                    <h4>Services Revenue</h4>
                                    <div class="stat-value">$4,250</div>
                                    <div class="stat-detail">13% of total</div>
                                </div>
                                <div class="stat-box">
                                    <h4>Avg. Daily Rate</h4>
                                    <div class="stat-value">$165</div>
                                </div>
                            </div>

                            <div class="chart-container">
                                <canvas id="revenue-chart"></canvas>
                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>Revenue Source</th>
                                        <th>Amount</th>
                                        <th>% of Total</th>
                                    </tr>
                                </thead>
                                <tbody id="revenue-breakdown">
                                    <tr>
                                        <td>Standard Rooms</td>
                                        <td>$10,800</td>
                                        <td>33.1%</td>
                                    </tr>
                                    <tr>
                                        <td>Deluxe Rooms</td>
                                        <td>$12,250</td>
                                        <td>37.6%</td>
                                    </tr>
                                    <tr>
                                        <td>Suites</td>
                                        <td>$5,300</td>
                                        <td>16.3%</td>
                                    </tr>
                                    <tr>
                                        <td>Room Service</td>
                                        <td>$2,450</td>
                                        <td>7.5%</td>
                                    </tr>
                                    <tr>
                                        <td>Mini Bar</td>
                                        <td>$950</td>
                                        <td>2.9%</td>
                                    </tr>
                                    <tr>
                                        <td>Other Services</td>
                                        <td>$850</td>
                                        <td>2.6%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-content" id="activity-log-content">
                    <div class="card">
                        <div class="card-header">
                            <h3>Activity Log</h3>
                            <div class="search-box">
                                <input type="text" id="log-search" placeholder="Search logs...">
                                <button class="search-btn"><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="filter-bar">
                                <label for="log-type">Filter by type:</label>
                                <select id="log-type">
                                    <option value="all">All Activities</option>
                                    <option value="checkin">Check-in</option>
                                    <option value="checkout">Check-out</option>
                                    <option value="reservation">Reservations</option>
                                    <option value="payment">Payments</option>
                                    <option value="system">System</option>
                                </select>

                                <label for="log-user">Filter by user:</label>
                                <select id="log-user">
                                    <option value="all">All Users</option>
                                    <option value="jane">Jane Doe</option>
                                    <option value="john">John Admin</option>
                                    <option value="mark">Mark Manager</option>
                                </select>
                            </div>

                            <table id="activity-log-table">
                                <thead>
                                    <tr>
                                        <th>Date & Time</th>
                                        <th>Type</th>
                                        <th>User</th>
                                        <th>Description</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2025-06-15 09:45:23</td>
                                        <td><span class="log-type checkin">Check-in</span></td>
                                        <td>Jane Doe</td>
                                        <td>Guest checked in</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-15 08:30:10</td>
                                        <td><span class="log-type checkout">Check-out</span></td>
                                        <td>Jane Doe</td>
                                        <td>Guest checked out</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-14 19:15:45</td>
                                        <td><span class="log-type payment">Payment</span></td>
                                        <td>John Admin</td>
                                        <td>Payment processed</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-14 16:20:33</td>
                                        <td><span class="log-type reservation">Reservation</span></td>
                                        <td>Jane Doe</td>
                                        <td>New reservation created</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-14 14:05:17</td>
                                        <td><span class="log-type system">System</span></td>
                                        <td>System</td>
                                        <td>Daily backup completed</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-14 11:30:42</td>
                                        <td><span class="log-type checkout">Check-out</span></td>
                                        <td>Mark Manager</td>
                                        <td>Guest checked out</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-14 09:15:28</td>
                                        <td><span class="log-type checkin">Check-in</span></td>
                                        <td>Jane Doe</td>
                                        <td>Guest checked in</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-14 08:45:03</td>
                                        <td><span class="log-type reservation">Reservation</span></td>
                                        <td>Jane Doe</td>
                                        <td>Reservation modified</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-13 17:40:19</td>
                                        <td><span class="log-type system">System</span></td>
                                        <td>John Admin</td>
                                        <td>Room rates updated</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td>2025-06-13 15:20:55</td>
                                        <td><span class="log-type payment">Payment</span></td>
                                        <td>Mark Manager</td>
                                        <td>Refund processed</td>
                                        <td><button class="btn-icon log-details"><i class="fas fa-info-circle"></i></button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Activity Log Details Modal -->
    <div class="modal" id="log-detail-modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Activity Log Details</h3>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="log-detail-info">
                    <p><strong>Date & Time:</strong> <span id="log-date">June 15, 2025 9:45:23 AM</span></p>
                    <p><strong>Type:</strong> <span id="log-type">Check-in</span></p>
                    <p><strong>User:</strong> <span id="log-user">Jane Doe (Receptionist)</span></p>
                    <p><strong>IP Address:</strong> <span id="log-ip">192.168.1.105</span></p>
                    <p><strong>Description:</strong></p>
                    <div class="log-description" id="log-description">
                        <p>Guest Robert Davis checked into Room 208.</p>
                        <p>Check-in processed at front desk. Guest provided passport for identification.</p>
                        <p>Assigned room key cards: 2</p>
                        <p>Payment method: Credit Card (Visa ending in 4567)</p>
                    </div>
                    <p><strong>Related Records:</strong></p>
                    <div class="related-records" id="related-records">
                        <p><a href="#">Guest: Robert Davis (ID: G-2025-0642)</a></p>
                        <p><a href="#">Reservation: R-2025-0853</a></p>
                        <p><a href="#">Room: 208 (Deluxe)</a></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" id="close-log-detail">Close</button>
            </div>
        </div>
    </div>

    <script src="js/script.js"></script>
    <script src="js/reports.js"></script>
    <!-- Include a chart library here in a real app -->
    <!--<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>-->
    <script>
        // Placeholder for chart visualization
        // Would normally use a library like Chart.js
        console.log("Chart visualization would be implemented here");
    </script>
</body>
</html>