// Tendura Hotel Management System - Check In/Out Page Specific JS
document.addEventListener('DOMContentLoaded', function() {
    // Check In/Out Page initialization
    initializeCheckInOut();
    
    // Event listeners for Check In form
    const newCheckinBtn = document.getElementById('new-checkin-btn');
    const cancelCheckinBtn = document.getElementById('cancel-checkin');
    const checkinForm = document.getElementById('checkin-form');
    const newCheckinForm = document.getElementById('new-checkin-form');
    
    if (newCheckinBtn) {
        newCheckinBtn.addEventListener('click', () => {
            checkinForm.style.display = 'block';
            document.getElementById('checkin-table').style.display = 'none';
        });
    }
    
    if (cancelCheckinBtn) {
        cancelCheckinBtn.addEventListener('click', () => {
            checkinForm.style.display = 'none';
            document.getElementById('checkin-table').style.display = 'table';
            newCheckinForm.reset();
        });
    }
    
    if (newCheckinForm) {
        newCheckinForm.addEventListener('submit', (event) => {
            event.preventDefault();
            handleNewCheckin();
        });
    }
    
    // Set up checkout process event listeners
    setupCheckoutProcessButtons();
    
    // Set up modal close button and cancel checkout
    const closeModalBtns = document.querySelectorAll('.close-modal');
    const cancelCheckoutBtn = document.getElementById('cancel-checkout');
    const completeCheckoutBtn = document.getElementById('complete-checkout');
    
    closeModalBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            document.getElementById('checkout-modal').style.display = 'none';
        });
    });
    
    if (cancelCheckoutBtn) {
        cancelCheckoutBtn.addEventListener('click', () => {
            document.getElementById('checkout-modal').style.display = 'none';
        });
    }
    
    if (completeCheckoutBtn) {
        completeCheckoutBtn.addEventListener('click', () => {
            processCheckout();
        });
    }
});

// Initialize check in/out page
function initializeCheckInOut() {
    // Set date inputs to today
    const today = new Date().toISOString().split('T')[0]; // YYYY-MM-DD format
    const checkInDateInput = document.getElementById('check-in-date');
    const checkOutDateInput = document.getElementById('check-out-date');
    
    if (checkInDateInput) checkInDateInput.value = today;
    if (checkOutDateInput) {
        // Set default checkout to tomorrow
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        checkOutDateInput.value = tomorrow.toISOString().split('T')[0];
    }
    
    // Load available rooms
    loadAvailableRooms();
    
    // Load current check-ins and check-outs
    loadCheckIns();
    loadCheckOuts();
}

// Load available rooms for dropdown
function loadAvailableRooms() {
    fetchData('rooms').then(rooms => {
        const availableRooms = rooms.filter(room => room.status === 'available');
        const roomSelect = document.getElementById('room-number');
        
        if (roomSelect) {
            // Clear existing options except the first one
            while (roomSelect.options.length > 1) {
                roomSelect.remove(1);
            }
            
            // Add available rooms to dropdown
            availableRooms.forEach(room => {
                const option = document.createElement('option');
                option.value = room.number;
                option.textContent = `${room.number} - ${room.type.charAt(0).toUpperCase() + room.type.slice(1)}`;
                roomSelect.appendChild(option);
            });
        }
    });
}

// Load check-ins
function loadCheckIns() {
    fetchData('reservations').then(reservations => {
        const confirmedReservations = reservations.filter(res => res.status === 'confirmed');
        
        // In a real app, we would fetch guest details for each reservation
        // and populate the table with actual data
        console.log('Check-ins loaded:', confirmedReservations.length);
    });
}

// Load check-outs
function loadCheckOuts() {
    fetchData('reservations').then(reservations => {
        const pendingCheckouts = reservations.filter(res => res.status === 'pending' || res.status === 'processing');
        
        // In a real app, we would fetch guest details for each reservation
        // and populate the table with actual data
        console.log('Check-outs loaded:', pendingCheckouts.length);
        
        // Set up checkout process buttons
        setupCheckoutProcessButtons();
    });
}

// Set up checkout process buttons
function setupCheckoutProcessButtons() {
    const checkoutButtons = document.querySelectorAll('#checkout-table button.btn-small');
    
    checkoutButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Get the row data (in a real app, we would get the reservation ID)
            const row = this.closest('tr');
            const guestName = row.cells[0].textContent;
            const roomNumber = row.cells[1].textContent;
            const checkinDate = row.cells[2].textContent;
            const checkoutDate = row.cells[3].textContent;
            
            // Fill the modal with the data
            document.getElementById('modal-guest-name').textContent = guestName;
            document.getElementById('modal-room-number').textContent = roomNumber;
            document.getElementById('modal-checkin-date').textContent = checkinDate;
            document.getElementById('modal-checkout-date').textContent = checkoutDate;
            
            // Show the modal
            document.getElementById('checkout-modal').style.display = 'block';
        });
    });
}

// Handle new check-in submission
function handleNewCheckin() {
    // Get form values
    const guestName = document.getElementById('guest-name').value;
    const guestPhone = document.getElementById('guest-phone').value;
    const guestEmail = document.getElementById('guest-email').value;
    const idType = document.getElementById('id-type').value;
    const idNumber = document.getElementById('id-number').value;
    const roomNumber = document.getElementById('room-number').value;
    const numGuests = document.getElementById('num-guests').value;
    const checkInDate = document.getElementById('check-in-date').value;
    const checkOutDate = document.getElementById('check-out-date').value;
    const specialRequests = document.getElementById('special-requests').value;
    
    // In a real app, we would:
    // 1. Create a new guest record if this is a new guest
    // 2. Create a new reservation
    // 3. Update room status
    // 4. Add an entry to the activity log
    
    console.log('New check-in:', {
        guestName,
        roomNumber,
        checkInDate,
        checkOutDate
    });
    
    // Show success message
    alert(`Check-in completed for ${guestName} in Room ${roomNumber}`);
    
    // Reset form and show table
    document.getElementById('new-checkin-form').reset();
    document.getElementById('checkin-form').style.display = 'none';
    document.getElementById('checkin-table').style.display = 'table';
    
    // In a real app, we would refresh the table with the new data
}

// Process checkout
function processCheckout() {
    // Get modal data
    const guestName = document.getElementById('modal-guest-name').textContent;
    const roomNumber = document.getElementById('modal-room-number').textContent;
    const paymentMethod = document.getElementById('payment-method').value;
    const checkoutNotes = document.getElementById('checkout-notes').value;
    
    // In a real app, we would:
    // 1. Update the reservation status to 'completed'
    // 2. Update the room status to 'cleaning'
    // 3. Process the payment
    // 4. Add an entry to the activity log
    
    console.log('Checkout processed:', {
        guestName,
        roomNumber,
        paymentMethod,
        checkoutNotes
    });
    
    // Show success message
    alert(`Checkout completed for ${guestName} from Room ${roomNumber}`);
    
    // Close the modal and refresh the table
    document.getElementById('checkout-modal').style.display = 'none';
    
    // In a real app, we would refresh the table by removing this row
}