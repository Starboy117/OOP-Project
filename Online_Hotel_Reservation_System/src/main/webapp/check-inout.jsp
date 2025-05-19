<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tendura Hotel - Check In/Out</title>
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
                <li class="active"><a href="check-inout.jsp"><i class="fas fa-key"></i> Check In/Out</a></li>
                <li><a href="guestView"><i class="fas fa-users"></i> Guests</a></li>
                <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Edit Page</a></li>
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
                    <h2><i class="fas fa-key"></i> Check In / Check Out</h2>
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
                <div class="tabs">
                    <button class="tab-btn active" data-tab="check-in">Check In</button>
                    <button class="tab-btn" data-tab="check-out">Check Out</button>
                    <button class="tab-btn" data-tab="room-status">Room Status</button>
                </div>

                <div class="tab-content active" id="check-in-content">
                    <div class="card">
                        <div class="card-header">
                            <h3>Guest Check-In</h3>
                            <button class="btn" id="new-checkin-btn"><i class="fas fa-plus"></i> New Check-In</button>
                        </div>
                        <div class="card-body">
                            <div id="checkin-form" class="form-container">
                                <h3>New Check-In</h3>
                                
                                
                                
                                <form id="new-checkin-form" method="post" action="guestDetails">
                                    <div class="form-group">
                                        <label for="guest-name">Guest Name*</label>
                                        <input type="text" id="guest-name"name="guestName" required>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="guest-phone">Phone</label>
                                            <input type="tel" id="guest-phone"name="phoneNo">
                                        </div>
                                        <div class="form-group">
                                            <label for="guest-email">Email</label>
                                            <input type="email" id="guest-email"name="Email">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="id-type">ID Type</label>
                                            <select id="id-type"name="idType">
                                                <option value="passport">Passport</option>
                                                <option value="drivers-license">Driver's License</option>
                                                <option value="national-id">National ID</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="id-number">ID Number*</label>
                                            <input type="text" id="id-number"name="idNo" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="room-number">Room Number*</label>
                                            <select id="room-number"name="roomNo" required>
                                                <option value="">Select Room</option>
                                                <option value="101">101 - Standard</option>
                                                <option value="102">102 - Standard</option>
                                                <option value="201">201 - Deluxe</option>
                                                <option value="202">202 - Deluxe</option>
                                                <option value="301">301 - Suite</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="num-guests">Number of Guests</label>
                                            <input type="number" id="num-guests"name="guestNo" min="1" value="1">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="check-in-date">Check-In Date*</label>
                                            <input type="date" id="check-in-date"name="checkIn" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="check-out-date">Check-Out Date*</label>
                                            <input type="date" id="check-out-date"name="checkOut" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="special-requests">Special Requests</label>
                                        <textarea id="special-requests"name="spR"></textarea>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" class="btn btn-secondary" id="cancel-checkin">Cancel</button>
                                        <button type="submit" class="btn">Complete Check-In</button>
                                    </div>
                                </form>
                                
                                
                                
                            </div>
                            <table id="checkin-table">
                                <thead>
                                    <tr>
                                        <th>Guest Name</th>
                                        <th>Room</th>
                                        <th>Check-In Date</th>
                                        <th>Expected Check-Out</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Sarah Williams</td>
                                        <td>105</td>
                                        <td>2025-06-15</td>
                                        <td>2025-06-18</td>
                                        <td><span class="status confirmed">Confirmed</span></td>
                                        <td>
                                            <button class="btn-icon"><i class="fas fa-pen"></i></button>
                                            <button class="btn-icon"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>David Jones</td>
                                        <td>210</td>
                                        <td>2025-06-15</td>
                                        <td>2025-06-20</td>
                                        <td><span class="status confirmed">Confirmed</span></td>
                                        <td>
                                            <button class="btn-icon"><i class="fas fa-pen"></i></button>
                                            <button class="btn-icon"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lisa Miller</td>
                                        <td>302</td>
                                        <td>2025-06-15</td>
                                        <td>2025-06-17</td>
                                        <td><span class="status confirmed">Confirmed</span></td>
                                        <td>
                                            <button class="btn-icon"><i class="fas fa-pen"></i></button>
                                            <button class="btn-icon"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-content" id="check-out-content">
                    <div class="card">
                        <div class="card-header">
                            <h3>Guest Check-Out</h3>
                            <div class="search-box">
                                <input type="text" placeholder="Search by room or guest name..." id="checkout-search">
                                <button class="search-btn"><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <table id="checkout-table">
                                <thead>
                                    <tr>
                                        <th>Guest Name</th>
                                        <th>Room</th>
                                        <th>Check-In Date</th>
                                        <th>Expected Check-Out</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>John Smith</td>
                                        <td>101</td>
                                        <td>2025-06-10</td>
                                        <td>2025-06-15</td>
                                        <td><span class="status pending">Pending Checkout</span></td>
                                        <td>
                                            <button class="btn btn-small">Process Checkout</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Emma Johnson</td>
                                        <td>204</td>
                                        <td>2025-06-12</td>
                                        <td>2025-06-15</td>
                                        <td><span class="status pending">Pending Checkout</span></td>
                                        <td>
                                            <button class="btn btn-small">Process Checkout</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Michael Brown</td>
                                        <td>315</td>
                                        <td>2025-06-10</td>
                                        <td>2025-06-15</td>
                                        <td><span class="status processing">Processing</span></td>
                                        <td>
                                            <button class="btn btn-small">Process Checkout</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-content" id="room-status-content">
                    <div class="card">
                        <div class="card-header">
                            <h3>Room Status Overview</h3>
                            <div class="filter-options">
                                <select id="room-type-filter">
                                    <option value="all">All Room Types</option>
                                    <option value="standard">Standard</option>
                                    <option value="deluxe">Deluxe</option>
                                    <option value="suite">Suite</option>
                                </select>
                                <select id="room-status-filter">
                                    <option value="all">All Statuses</option>
                                    <option value="available">Available</option>
                                    <option value="occupied">Occupied</option>
                                    <option value="maintenance">Maintenance</option>
                                    <option value="cleaning">Cleaning</option>
                                </select>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="room-grid">
                                <!-- First Floor -->
                                <div class="floor">
                                    <h4>First Floor</h4>
                                    <div class="rooms">
                                        <div class="room-card occupied">
                                            <h5>101</h5>
                                            <p>Standard</p>
                                            <div class="room-status">Occupied</div>
                                            <div class="guest-name">John Smith</div>
                                            <div class="checkout-date">Checkout: June 15</div>
                                        </div>
                                        <div class="room-card available">
                                            <h5>102</h5>
                                            <p>Standard</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                        <div class="room-card occupied">
                                            <h5>103</h5>
                                            <p>Standard</p>
                                            <div class="room-status">Occupied</div>
                                            <div class="guest-name">Alex Turner</div>
                                            <div class="checkout-date">Checkout: June 17</div>
                                        </div>
                                        <div class="room-card occupied">
                                            <h5>104</h5>
                                            <p>Deluxe</p>
                                            <div class="room-status">Occupied</div>
                                            <div class="guest-name">Jennifer Lee</div>
                                            <div class="checkout-date">Checkout: June 16</div>
                                        </div>
                                        <div class="room-card available">
                                            <h5>105</h5>
                                            <p>Deluxe</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Second Floor -->
                                <div class="floor">
                                    <h4>Second Floor</h4>
                                    <div class="rooms">
                                        <div class="room-card maintenance">
                                            <h5>201</h5>
                                            <p>Deluxe</p>
                                            <div class="room-status">Maintenance</div>
                                        </div>
                                        <div class="room-card available">
                                            <h5>202</h5>
                                            <p>Deluxe</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                        <div class="room-card cleaning">
                                            <h5>203</h5>
                                            <p>Deluxe</p>
                                            <div class="room-status">Cleaning</div>
                                        </div>
                                        <div class="room-card occupied">
                                            <h5>204</h5>
                                            <p>Deluxe</p>
                                            <div class="room-status">Occupied</div>
                                            <div class="guest-name">Emma Johnson</div>
                                            <div class="checkout-date">Checkout: June 15</div>
                                        </div>
                                        <div class="room-card available">
                                            <h5>205</h5>
                                            <p>Suite</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Third Floor -->
                                <div class="floor">
                                    <h4>Third Floor</h4>
                                    <div class="rooms">
                                        <div class="room-card available">
                                            <h5>301</h5>
                                            <p>Suite</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                        <div class="room-card available">
                                            <h5>302</h5>
                                            <p>Suite</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                        <div class="room-card occupied">
                                            <h5>303</h5>
                                            <p>Suite</p>
                                            <div class="room-status">Occupied</div>
                                            <div class="guest-name">Robert Davis</div>
                                            <div class="checkout-date">Checkout: June 18</div>
                                        </div>
                                        <div class="room-card available">
                                            <h5>304</h5>
                                            <p>Presidential Suite</p>
                                            <div class="room-status">Available</div>
                                        </div>
                                        <div class="room-card occupied">
                                            <h5>315</h5>
                                            <p>Suite</p>
                                            <div class="room-status">Occupied</div>
                                            <div class="guest-name">Michael Brown</div>
                                            <div class="checkout-date">Checkout: June 15</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Checkout Modal -->
    <div class="modal" id="checkout-modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Process Check-Out</h3>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="guest-info">
                    <h4>Guest Information</h4>
                    <p><strong>Name:</strong> <span id="modal-guest-name">John Smith</span></p>
                    <p><strong>Room:</strong> <span id="modal-room-number">101</span></p>
                    <p><strong>Check-In Date:</strong> <span id="modal-checkin-date">June 10, 2025</span></p>
                    <p><strong>Check-Out Date:</strong> <span id="modal-checkout-date">June 15, 2025</span></p>
                </div>
                <div class="billing-info">
                    <h4>Billing Summary</h4>
                    <table class="billing-table">
                        <tr>
                            <td>Room Charges (5 nights)</td>
                            <td>$750.00</td>
                        </tr>
                        <tr>
                            <td>Room Service</td>
                            <td>$125.00</td>
                        </tr>
                        <tr>
                            <td>Mini Bar</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>Taxes</td>
                            <td>$92.00</td>
                        </tr>
                        <tr class="total">
                            <td>Total</td>
                            <td>$1,012.00</td>
                        </tr>
                    </table>
                </div>
                <div class="form-group">
                    <label for="payment-method">Payment Method</label>
                    <select id="payment-method">
                        <option value="credit-card">Credit Card</option>
                        <option value="cash">Cash</option>
                        <option value="bank-transfer">Bank Transfer</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="checkout-notes">Additional Notes</label>
                    <textarea id="checkout-notes"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="cancel-checkout">Cancel</button>
                <button class="btn" id="complete-checkout">Complete Check-Out</button>
            </div>
        </div>
    </div>
    
   <!--  <script src="js/script.js"></script>
    <script src="js/checkinout.js"></script>--> 
</body>
</html>