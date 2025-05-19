// Tendura Hotel Management System - Dashboard Specific JS
document.addEventListener('DOMContentLoaded', function() {
    // Dashboard-specific initialization code
    initializeDashboard();
});

function initializeDashboard() {
    // Load and display dashboard data
    updateDashboardStats();
    loadRecentActivity();
    loadTodayCheckouts();
    loadTodayCheckins();
    loadNotifications();
}

// Update dashboard statistics
function updateDashboardStats() {
    // In a real application, this would fetch data from the server
    // Here we're simulating by getting data from localStorage
    fetchData('rooms').then(rooms => {
        // Calculate statistics
        const totalRooms = rooms.length;
        const availableRooms = rooms.filter(room => room.status === 'available').length;
        const occupiedRooms = rooms.filter(room => room.status === 'occupied').length;
        const todayBookings = 8; // This would normally be calculated from actual data
        
        // Update DOM elements
        const statElements = document.querySelectorAll('.stat-number');
        if (statElements.length >= 4) {
            statElements[0].textContent = totalRooms;
            statElements[1].textContent = availableRooms;
            statElements[2].textContent = occupiedRooms;
            statElements[3].textContent = todayBookings;
        }
    });
}

// Load recent activity for the dashboard
function loadRecentActivity() {
    // This would fetch data from the server in a real application
    // Using static data for demonstration purposes
    console.log('Recent activity loaded');
}

// Load today's checkouts for the dashboard
function loadTodayCheckouts() {
    fetchData('reservations').then(reservations => {
        // Filter for checkouts that are due today
        const today = new Date().toISOString().split('T')[0]; // YYYY-MM-DD format
        
        // In a real app, we would filter based on today's date
        const todayCheckouts = reservations.filter(res => res.status === 'pending' || res.status === 'processing');
        console.log('Today\'s checkouts loaded:', todayCheckouts.length);
    });
}

// Load today's checkins for the dashboard
function loadTodayCheckins() {
    fetchData('reservations').then(reservations => {
        // Filter for checkins that are due today
        const today = new Date().toISOString().split('T')[0]; // YYYY-MM-DD format
        
        // In a real app, we would filter based on today's date
        const todayCheckins = reservations.filter(res => res.status === 'confirmed');
        console.log('Today\'s checkins loaded:', todayCheckins.length);
    });
}

// Load notifications
function loadNotifications() {
    // This would fetch notifications from the server in a real application
    // Using static data for demonstration purposes
    console.log('Notifications loaded');
}