// Tendura Hotel Management System - Core Script
// Common functionality used across all pages

// Utility Functions
function formatDate(date) {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    return date.toLocaleDateString(undefined, options);
}

function formatTime(date) {
    const options = { hour: '2-digit', minute: '2-digit', second: '2-digit' };
    return date.toLocaleTimeString(undefined, options);
}

function generateId() {
    return 'id-' + Math.random().toString(36).substr(2, 9);
}

// Update current date and time
function updateDateTime() {
    const now = new Date();
    const dateElement = document.getElementById('current-date');
    const timeElement = document.getElementById('current-time');
    
    if (dateElement) dateElement.textContent = formatDate(now);
    if (timeElement) timeElement.textContent = formatTime(now);
}

// Initialize tabs functionality
function initTabs() {
    const tabButtons = document.querySelectorAll('.tab-btn');
    if (!tabButtons.length) return;
    
    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Remove active class from all buttons and content
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));
            
            // Add active class to clicked button
            button.classList.add('active');
            
            // Show corresponding content
            const tabId = button.getAttribute('data-tab');
            const tabContent = document.getElementById(tabId + '-content');
            if (tabContent) tabContent.classList.add('active');
        });
    });
}

// Initialize modals functionality
function initModals() {
    // Close modals when clicking outside or on close button
    const modals = document.querySelectorAll('.modal');
    const closeButtons = document.querySelectorAll('.close-modal');
    
    if (!modals.length) return;
    
    closeButtons.forEach(button => {
        button.addEventListener('click', () => {
            modals.forEach(modal => {
                modal.style.display = 'none';
            });
        });
    });
    
    window.addEventListener('click', (event) => {
        modals.forEach(modal => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    });
}

// Local storage handling for data persistence
const HotelData = {
    // Get data from localStorage or return default value
    get: function(key, defaultValue = []) {
        const data = localStorage.getItem(key);
        return data ? JSON.parse(data) : defaultValue;
    },
    
    // Save data to localStorage
    save: function(key, data) {
        localStorage.setItem(key, JSON.stringify(data));
    },
    
    // Initialize with sample data if not exists
    init: function() {
        // Check if we already have data
        if (!localStorage.getItem('guests')) {
            // Sample guests data
            const sampleGuests = [
                {
                    id: 'g-001',
                    firstName: 'John',
                    lastName: 'Smith',
                    email: 'john.smith@example.com',
                    phone: '+1 (555) 123-4567',
                    idType: 'passport',
                    idNumber: 'AB123456',
                    address: '123 Main St, Anytown, USA',
                    vipStatus: 'regular',
                    notes: 'Prefers rooms on higher floors.',
                    stayHistory: [
                        {
                            room: '101',
                            checkIn: '2025-06-10',
                            checkOut: '2025-06-15',
                            nights: 5,
                            total: 850
                        }
                    ]
                },
                {
                    id: 'g-002',
                    firstName: 'Emma',
                    lastName: 'Johnson',
                    email: 'emma.johnson@example.com',
                    phone: '+1 (555) 987-6543',
                    idType: 'drivers-license',
                    idNumber: 'DL789012',
                    address: '456 Oak Ave, Somewhere, USA',
                    vipStatus: 'frequent',
                    notes: 'Allergic to feather pillows.',
                    stayHistory: [
                        {
                            room: '204',
                            checkIn: '2025-06-12',
                            checkOut: '2025-06-15',
                            nights: 3,
                            total: 570
                        }
                    ]
                },
                {
                    id: 'g-003',
                    firstName: 'Michael',
                    lastName: 'Brown',
                    email: 'michael.brown@example.com',
                    phone: '+1 (555) 456-7890',
                    idType: 'national-id',
                    idNumber: 'ID9876543',
                    address: '789 Pine St, Elsewhere, USA',
                    vipStatus: 'vip',
                    notes: 'Usually orders room service for breakfast.',
                    stayHistory: [
                        {
                            room: '315',
                            checkIn: '2025-06-10',
                            checkOut: '2025-06-15',
                            nights: 5,
                            total: 1250
                        }
                    ]
                }
            ];
            
            // Sample reservations data
            const sampleReservations = [
                {
                    id: 'r-001',
                    guestId: 'g-001',
                    roomNumber: '101',
                    checkInDate: '2025-06-10',
                    checkOutDate: '2025-06-15',
                    status: 'pending',
                    specialRequests: 'Late check-in around 10 PM.'
                },
                {
                    id: 'r-002',
                    guestId: 'g-002',
                    roomNumber: '204',
                    checkInDate: '2025-06-12',
                    checkOutDate: '2025-06-15',
                    status: 'pending',
                    specialRequests: 'Extra towels please.'
                },
                {
                    id: 'r-003',
                    guestId: 'g-003',
                    roomNumber: '315',
                    checkInDate: '2025-06-10',
                    checkOutDate: '2025-06-15',
                    status: 'processing',
                    specialRequests: 'Room with city view requested.'
                }
            ];
            
            // Sample rooms data
            const sampleRooms = [
                { number: '101', type: 'standard', status: 'occupied', currentGuest: 'g-001', price: 150 },
                { number: '102', type: 'standard', status: 'available', currentGuest: null, price: 150 },
                { number: '103', type: 'standard', status: 'occupied', currentGuest: 'g-004', price: 150 },
                { number: '104', type: 'deluxe', status: 'occupied', currentGuest: 'g-005', price: 200 },
                { number: '105', type: 'deluxe', status: 'available', currentGuest: null, price: 200 },
                { number: '201', type: 'deluxe', status: 'maintenance', currentGuest: null, price: 200 },
                { number: '202', type: 'deluxe', status: 'available', currentGuest: null, price: 200 },
                { number: '203', type: 'deluxe', status: 'cleaning', currentGuest: null, price: 200 },
                { number: '204', type: 'deluxe', status: 'occupied', currentGuest: 'g-002', price: 200 },
                { number: '205', type: 'suite', status: 'available', currentGuest: null, price: 300 },
                { number: '301', type: 'suite', status: 'available', currentGuest: null, price: 300 },
                { number: '302', type: 'suite', status: 'available', currentGuest: null, price: 300 },
                { number: '303', type: 'suite', status: 'occupied', currentGuest: 'g-006', price: 300 },
                { number: '304', type: 'presidential', status: 'available', currentGuest: null, price: 500 },
                { number: '315', type: 'suite', status: 'occupied', currentGuest: 'g-003', price: 300 }
            ];
            
            // Save sample data to localStorage
            this.save('guests', sampleGuests);
            this.save('reservations', sampleReservations);
            this.save('rooms', sampleRooms);
        }
    }
};

// Document ready function
document.addEventListener('DOMContentLoaded', function() {
    // Initialize local storage with sample data
    HotelData.init();
    
    // Update date and time display
    updateDateTime();
    setInterval(updateDateTime, 1000);
    
    // Initialize tabs
    initTabs();
    
    // Initialize modals
    initModals();
});

// Simulate loading data (in a real app, this would be an API call)
function fetchData(endpoint) {
    return new Promise((resolve) => {
        setTimeout(() => {
            const data = HotelData.get(endpoint);
            resolve(data);
        }, 300);
    });
}