// Tendura Hotel Management System - Reports Page Specific JS
document.addEventListener('DOMContentLoaded', function() {
    // Initialize reports page
    initializeReports();
    
    // Event listeners for report controls
    const generateReportBtn = document.getElementById('generate-report');
    const startDateInput = document.getElementById('start-date');
    const endDateInput = document.getElementById('end-date');
    
    if (generateReportBtn && startDateInput && endDateInput) {
        // Set default date range (last 7 days)
        const today = new Date();
        const lastWeek = new Date();
        lastWeek.setDate(today.getDate() - 7);
        
        startDateInput.value = lastWeek.toISOString().split('T')[0];
        endDateInput.value = today.toISOString().split('T')[0];
        
        generateReportBtn.addEventListener('click', () => {
            generateReports(startDateInput.value, endDateInput.value);
        });
    }
    
    // Event listeners for activity log details
    const logDetailBtns = document.querySelectorAll('.log-details');
    const logDetailModal = document.getElementById('log-detail-modal');
    const closeLogDetailBtn = document.getElementById('close-log-detail');
    
    if (logDetailBtns.length && logDetailModal && closeLogDetailBtn) {
        logDetailBtns.forEach(btn => {
            btn.addEventListener('click', (event) => {
                // In a real app, we would fetch log details from the server
                // For now, we'll just show the modal with the dummy data
                logDetailModal.style.display = 'block';
                
                // Prevent the click from triggering parent elements' events
                event.stopPropagation();
            });
        });
        
        closeLogDetailBtn.addEventListener('click', () => {
            logDetailModal.style.display = 'none';
        });
    }
    
    // Event listeners for filter dropdowns
    const logTypeFilter = document.getElementById('log-type');
    const logUserFilter = document.getElementById('log-user');
    
    if (logTypeFilter && logUserFilter) {
        logTypeFilter.addEventListener('change', filterActivityLogs);
        logUserFilter.addEventListener('change', filterActivityLogs);
    }
    
    // Event listener for log search
    const logSearchInput = document.getElementById('log-search');
    if (logSearchInput) {
        logSearchInput.addEventListener('input', () => {
            const searchTerm = logSearchInput.value.toLowerCase();
            filterActivityLogs(searchTerm);
        });
    }
});

// Initialize reports page
function initializeReports() {
    // Generate initial reports
    const startDate = document.getElementById('start-date').value;
    const endDate = document.getElementById('end-date').value;
    generateReports(startDate, endDate);
    
    // Initialize chart placeholders
    initializeChartPlaceholders();
}

// Generate reports based on date range
function generateReports(startDate, endDate) {
    console.log(`Generating reports from ${startDate} to ${endDate}`);
    
    // In a real application, this would fetch data from the server
    // and update the UI with actual statistics
    
    // For now, we'll simulate by showing an alert
    // alert(`Reports generated for period: ${startDate} to ${endDate}`);
    
    // Update occupancy report
    updateOccupancyReport(startDate, endDate);
    
    // Update revenue report
    updateRevenueReport(startDate, endDate);
    
    // Update activity logs
    updateActivityLogs(startDate, endDate);
}

// Update occupancy report
function updateOccupancyReport(startDate, endDate) {
    // In a real app, we would fetch occupancy data for the date range
    // For now, we're using static data
    
    console.log(`Updating occupancy report from ${startDate} to ${endDate}`);
    
    // Update chart (in a real app)
    // updateOccupancyChart(startDate, endDate);
}

// Update revenue report
function updateRevenueReport(startDate, endDate) {
    // In a real app, we would fetch revenue data for the date range
    // For now, we're using static data
    
    console.log(`Updating revenue report from ${startDate} to ${endDate}`);
    
    // Update chart (in a real app)
    // updateRevenueChart(startDate, endDate);
}

// Update activity logs
function updateActivityLogs(startDate, endDate) {
    // In a real app, we would fetch logs for the date range
    // For now, we're using static data
    
    console.log(`Updating activity logs from ${startDate} to ${endDate}`);
}

// Filter activity logs based on type and user
function filterActivityLogs(searchTerm = '') {
    const typeFilter = document.getElementById('log-type').value;
    const userFilter = document.getElementById('log-user').value;
    const searchFilter = typeof searchTerm === 'string' ? searchTerm : document.getElementById('log-search').value.toLowerCase();
    
    const logRows = document.querySelectorAll('#activity-log-table tbody tr');
    
    logRows.forEach(row => {
        const type = row.cells[1].textContent.toLowerCase();
        const user = row.cells[2].textContent.toLowerCase();
        const description = row.cells[3].textContent.toLowerCase();
        
        let typeMatch = typeFilter === 'all' || type.includes(typeFilter);
        let userMatch = userFilter === 'all' || user === userFilter;
        let searchMatch = searchFilter === '' || 
                         type.includes(searchFilter) || 
                         user.includes(searchFilter) || 
                         description.includes(searchFilter) ||
                         row.cells[0].textContent.toLowerCase().includes(searchFilter);
        
        if (typeMatch && userMatch && searchMatch) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// Initialize chart placeholders - in a real app, this would use a library like Chart.js
function initializeChartPlaceholders() {
    const occupancyChart = document.getElementById('occupancy-chart');
    const revenueChart = document.getElementById('revenue-chart');
    
    if (occupancyChart && revenueChart) {
        // These would be real chart initializations in a production app
        console.log('Chart placeholders initialized');
    }
}