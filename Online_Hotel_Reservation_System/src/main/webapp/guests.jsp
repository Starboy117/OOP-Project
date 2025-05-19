<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Guest Management</title>
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
                <li class="active"><a href="guests.jsp"><i class="fas fa-users"></i> Guests</a></li>
                <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Reports & Logs</a></li>
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
                        <div class="header-actions">
                            <div class="search-box">
                                <input type="text" id="guest-search" placeholder="Search guests...">
                                <button class="search-btn"><i class="fas fa-search"></i></button>
                            </div>
                            <button class="btn" id="add-guest-btn"><i class="fas fa-plus"></i> Add New Guest</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="guest-form" class="form-container hidden">
                            <h3 id="form-title">Add New Guest</h3>
                            <form id="guest-data-form">
                                <input type="hidden" id="guest-id">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="first-name">First Name*</label>
                                        <input type="text" id="first-name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="last-name">Last Name*</label>
                                        <input type="text" id="last-name" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" id="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone*</label>
                                        <input type="tel" id="phone" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="id-type">ID Type</label>
                                        <select id="id-type">
                                            <option value="passport">Passport</option>
                                            <option value="drivers-license">Driver's License</option>
                                            <option value="national-id">National ID</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="id-number">ID Number*</label>
                                        <input type="text" id="id-number" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea id="address"></textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="vip-status">VIP Status</label>
                                        <select id="vip-status">
                                            <option value="regular">Regular</option>
                                            <option value="frequent">Frequent Guest</option>
                                            <option value="vip">VIP</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="notes">Special Notes</label>
                                        <textarea id="notes"></textarea>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-secondary" id="cancel-guest-form">Cancel</button>
                                    <button type="submit" class="btn" id="save-guest-btn">Save Guest</button>
                                </div>
                            </form>
                        </div>

                        <table id="guests-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>ID Number</th>
                                    <th>Status</th>
                                    <th>Last Stay</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Guest records will be loaded here via JavaScript -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row" id="guest-detail-section" style="display: none;">
                    <div class="card">
                        <div class="card-header">
                            <h3>Guest Details: <span id="detail-guest-name"></span></h3>
                            <button class="btn-link" id="close-details"><i class="fas fa-times"></i> Close</button>
                        </div>
                        <div class="card-body">
                            <div class="guest-details">
                                <div class="guest-profile">
                                    <div class="profile-image">
                                        <i class="fas fa-user-circle"></i>
                                    </div>
                                    <div class="profile-info">
                                        <h4 id="profile-guest-name">John Smith</h4>
                                        <p id="profile-guest-id">ID: PASSPORT-AB123456</p>
                                        <p id="profile-guest-status" class="guest-status vip">VIP Guest</p>
                                    </div>
                                </div>

                                <div class="detail-section">
                                    <h4>Contact Information</h4>
                                    <div class="detail-grid">
                                        <div class="detail-item">
                                            <span class="detail-label">Phone:</span>
                                            <span class="detail-value" id="detail-phone">+1 (555) 123-4567</span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Email:</span>
                                            <span class="detail-value" id="detail-email">john.smith@example.com</span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Address:</span>
                                            <span class="detail-value" id="detail-address">123 Main St, Anytown, USA</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="detail-section">
                                    <h4>Stay History</h4>
                                    <table class="detail-table" id="stay-history-table">
                                        <thead>
                                            <tr>
                                                <th>Room</th>
                                                <th>Check-In</th>
                                                <th>Check-Out</th>
                                                <th>Nights</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>101</td>
                                                <td>2025-03-15</td>
                                                <td>2025-03-20</td>
                                                <td>5</td>
                                                <td>$850.00</td>
                                            </tr>
                                            <tr>
                                                <td>205</td>
                                                <td>2024-12-24</td>
                                                <td>2024-12-26</td>
                                                <td>2</td>
                                                <td>$480.00</td>
                                            </tr>
                                            <tr>
                                                <td>302</td>
                                                <td>2024-08-10</td>
                                                <td>2024-08-15</td>
                                                <td>5</td>
                                                <td>$1,250.00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="detail-section">
                                    <h4>Notes & Preferences</h4>
                                    <div class="notes-section" id="guest-notes">
                                        <p>Prefers rooms on higher floors with city view. Allergic to feather pillows. Usually orders room service for breakfast.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <!-- Confirmation Modal -->
    <div class="modal" id="confirm-modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Confirm Deletion</h3>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this guest record? This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="cancel-delete">Cancel</button>
                <button class="btn btn-danger" id="confirm-delete">Delete</button>
            </div>
        </div>
    </div>

    <script src="js/script.js"></script>
    <script src="js/guests.js"></script>
</body>
</html>