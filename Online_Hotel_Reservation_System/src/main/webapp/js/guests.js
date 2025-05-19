// Tendura Hotel Management System - Guest Management Page Specific JS
document.addEventListener('DOMContentLoaded', function() {
    // Guest Management Page initialization
    initializeGuestManagement();
    
    // Event listener for add guest button
    const addGuestBtn = document.getElementById('add-guest-btn');
    if (addGuestBtn) {
        addGuestBtn.addEventListener('click', () => {
            showGuestForm('add');
        });
    }
    
    // Event listener for cancel button on form
    const cancelGuestFormBtn = document.getElementById('cancel-guest-form');
    if (cancelGuestFormBtn) {
        cancelGuestFormBtn.addEventListener('click', () => {
            hideGuestForm();
        });
    }
    
    // Event listener for save guest button
    const guestForm = document.getElementById('guest-data-form');
    if (guestForm) {
        guestForm.addEventListener('submit', (event) => {
            event.preventDefault();
            saveGuest();
        });
    }
    
    // Event listener for guest search
    const searchInput = document.getElementById('guest-search');
    if (searchInput) {
        searchInput.addEventListener('input', () => {
            const searchTerm = searchInput.value.toLowerCase();
            filterGuests(searchTerm);
        });
    }
    
    // Event listener for close details button
    const closeDetailsBtn = document.getElementById('close-details');
    if (closeDetailsBtn) {
        closeDetailsBtn.addEventListener('click', () => {
            document.getElementById('guest-detail-section').style.display = 'none';
        });
    }
});

// Initialize the guest management page
function initializeGuestManagement() {
    // Load guests and populate the table
    loadGuests();
    
    // Set up the modal for delete confirmation
    setupDeleteConfirmation();
}

// Load guests from storage and display in table
function loadGuests() {
    fetchData('guests').then(guests => {
        const guestsTable = document.getElementById('guests-table').getElementsByTagName('tbody')[0];
        
        if (guestsTable) {
            // Clear existing rows
            guestsTable.innerHTML = '';
            
            // Add guest data to table
            guests.forEach(guest => {
                const row = guestsTable.insertRow();
                
                // Full name cell
                const nameCell = row.insertCell(0);
                nameCell.textContent = `${guest.firstName} ${guest.lastName}`;
                
                // Phone cell
                const phoneCell = row.insertCell(1);
                phoneCell.textContent = guest.phone;
                
                // Email cell
                const emailCell = row.insertCell(2);
                emailCell.textContent = guest.email;
                
                // ID Number cell
                const idCell = row.insertCell(3);
                idCell.textContent = guest.idNumber;
                
                // Status cell
                const statusCell = row.insertCell(4);
                const statusSpan = document.createElement('span');
                statusSpan.className = `guest-status ${guest.vipStatus}`;
                statusSpan.textContent = formatVipStatus(guest.vipStatus);
                statusCell.appendChild(statusSpan);
                
                // Last Stay cell
                const lastStayCell = row.insertCell(5);
                if (guest.stayHistory && guest.stayHistory.length > 0) {
                    // Get the most recent stay
                    const lastStay = guest.stayHistory.sort((a, b) => 
                        new Date(b.checkIn) - new Date(a.checkIn))[0];
                    lastStayCell.textContent = lastStay.checkIn;
                } else {
                    lastStayCell.textContent = 'N/A';
                }
                
                // Actions cell
                const actionsCell = row.insertCell(6);
                
                // View button
                const viewBtn = document.createElement('button');
                viewBtn.className = 'btn-icon';
                viewBtn.innerHTML = '<i class="fas fa-eye"></i>';
                viewBtn.addEventListener('click', () => showGuestDetails(guest.id));
                actionsCell.appendChild(viewBtn);
                
                // Edit button
                const editBtn = document.createElement('button');
                editBtn.className = 'btn-icon';
                editBtn.innerHTML = '<i class="fas fa-pen"></i>';
                editBtn.addEventListener('click', () => showGuestForm('edit', guest.id));
                actionsCell.appendChild(editBtn);
                
                // Delete button
                const deleteBtn = document.createElement('button');
                deleteBtn.className = 'btn-icon';
                deleteBtn.innerHTML = '<i class="fas fa-trash"></i>';
                deleteBtn.addEventListener('click', () => confirmDeleteGuest(guest.id));
                actionsCell.appendChild(deleteBtn);
            });
        }
    });
}

// Format VIP status for display
function formatVipStatus(status) {
    switch(status) {
        case 'vip':
            return 'VIP';
        case 'frequent':
            return 'Frequent Guest';
        case 'regular':
        default:
            return 'Regular';
    }
}

// Show guest form (add or edit)
function showGuestForm(mode, guestId = null) {
    const formContainer = document.getElementById('guest-form');
    const formTitle = document.getElementById('form-title');
    const guestIdField = document.getElementById('guest-id');
    const saveButton = document.getElementById('save-guest-btn');
    
    if (formContainer && formTitle) {
        // Show form and hide table
        formContainer.classList.remove('hidden');
        document.getElementById('guests-table').style.display = 'none';
        
        // Set form mode
        if (mode === 'add') {
            formTitle.textContent = 'Add New Guest';
            document.getElementById('guest-data-form').reset();
            if (guestIdField) guestIdField.value = '';
            if (saveButton) saveButton.textContent = 'Save Guest';
        } else if (mode === 'edit' && guestId) {
            formTitle.textContent = 'Edit Guest';
            if (saveButton) saveButton.textContent = 'Update Guest';
            
            // Load guest data into form
            loadGuestDataIntoForm(guestId);
        }
    }
}

// Hide guest form
function hideGuestForm() {
    const formContainer = document.getElementById('guest-form');
    if (formContainer) {
        formContainer.classList.add('hidden');
        document.getElementById('guests-table').style.display = 'table';
    }
}

// Load guest data into form for editing
function loadGuestDataIntoForm(guestId) {
    fetchData('guests').then(guests => {
        const guest = guests.find(g => g.id === guestId);
        
        if (guest) {
            // Set form values
            document.getElementById('guest-id').value = guest.id;
            document.getElementById('first-name').value = guest.firstName;
            document.getElementById('last-name').value = guest.lastName;
            document.getElementById('email').value = guest.email;
            document.getElementById('phone').value = guest.phone;
            document.getElementById('id-type').value = guest.idType;
            document.getElementById('id-number').value = guest.idNumber;
            document.getElementById('address').value = guest.address;
            document.getElementById('vip-status').value = guest.vipStatus;
            document.getElementById('notes').value = guest.notes;
        }
    });
}

// Save guest (add or update)
function saveGuest() {
    // Get form values
    const guestId = document.getElementById('guest-id').value;
    const firstName = document.getElementById('first-name').value;
    const lastName = document.getElementById('last-name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const idType = document.getElementById('id-type').value;
    const idNumber = document.getElementById('id-number').value;
    const address = document.getElementById('address').value;
    const vipStatus = document.getElementById('vip-status').value;
    const notes = document.getElementById('notes').value;
    
    // Create guest object
    const guest = {
        firstName,
        lastName,
        email,
        phone,
        idType,
        idNumber,
        address,
        vipStatus,
        notes,
        stayHistory: []
    };
    
    // Get existing guests
    fetchData('guests').then(guests => {
        if (guestId) {
            // Update existing guest
            const index = guests.findIndex(g => g.id === guestId);
            
            if (index !== -1) {
                // Preserve stay history
                guest.stayHistory = guests[index].stayHistory;
                guest.id = guestId;
                guests[index] = guest;
            }
        } else {
            // Add new guest
            guest.id = 'g-' + generateId();
            guests.push(guest);
        }
        
        // Save updated guests data
        HotelData.save('guests', guests);
        
        // Reload guests table
        loadGuests();
        
        // Hide form and show table
        hideGuestForm();
        
        // Show success message
        alert(`Guest ${firstName} ${lastName} has been ${guestId ? 'updated' : 'saved'} successfully!`);
    });
}

// Filter guests based on search term
function filterGuests(searchTerm) {
    const rows = document.querySelectorAll('#guests-table tbody tr');
    
    rows.forEach(row => {
        const name = row.cells[0].textContent.toLowerCase();
        const phone = row.cells[1].textContent.toLowerCase();
        const email = row.cells[2].textContent.toLowerCase();
        const id = row.cells[3].textContent.toLowerCase();
        
        if (name.includes(searchTerm) || 
            phone.includes(searchTerm) || 
            email.includes(searchTerm) || 
            id.includes(searchTerm)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// Set up delete confirmation
function setupDeleteConfirmation() {
    const confirmDeleteBtn = document.getElementById('confirm-delete');
    const cancelDeleteBtn = document.getElementById('cancel-delete');
    const confirmModal = document.getElementById('confirm-modal');
    
    if (confirmDeleteBtn && cancelDeleteBtn && confirmModal) {
        cancelDeleteBtn.addEventListener('click', () => {
            confirmModal.style.display = 'none';
        });
    }
}

// Confirm delete guest
function confirmDeleteGuest(guestId) {
    const confirmModal = document.getElementById('confirm-modal');
    const confirmDeleteBtn = document.getElementById('confirm-delete');
    
    if (confirmModal && confirmDeleteBtn) {
        // Show the confirmation modal
        confirmModal.style.display = 'block';
        
        // Add click event to the confirm button
        confirmDeleteBtn.onclick = function() {
            deleteGuest(guestId);
            confirmModal.style.display = 'none';
        };
    }
}

// Delete guest
function deleteGuest(guestId) {
    fetchData('guests').then(guests => {
        // Filter out the guest to delete
        const updatedGuests = guests.filter(guest => guest.id !== guestId);
        
        // Save updated guests data
        HotelData.save('guests', updatedGuests);
        
        // Reload guests table
        loadGuests();
        
        // Show success message
        alert('Guest has been deleted successfully!');
    });
}

// Show guest details
function showGuestDetails(guestId) {
    fetchData('guests').then(guests => {
        const guest = guests.find(g => g.id === guestId);
        
        if (guest) {
            // Populate guest details
            document.getElementById('detail-guest-name').textContent = `${guest.firstName} ${guest.lastName}`;
            document.getElementById('profile-guest-name').textContent = `${guest.firstName} ${guest.lastName}`;
            document.getElementById('profile-guest-id').textContent = `ID: ${guest.idType.toUpperCase()}-${guest.idNumber}`;
            
            const statusElement = document.getElementById('profile-guest-status');
            statusElement.textContent = formatVipStatus(guest.vipStatus);
            statusElement.className = `guest-status ${guest.vipStatus}`;
            
            document.getElementById('detail-phone').textContent = guest.phone;
            document.getElementById('detail-email').textContent = guest.email;
            document.getElementById('detail-address').textContent = guest.address || 'Not provided';
            document.getElementById('guest-notes').textContent = guest.notes || 'No notes available';
            
            // Populate stay history table
            const stayHistoryTable = document.getElementById('stay-history-table').getElementsByTagName('tbody')[0];
            stayHistoryTable.innerHTML = '';
            
            if (guest.stayHistory && guest.stayHistory.length > 0) {
                guest.stayHistory.forEach(stay => {
                    const row = stayHistoryTable.insertRow();
                    
                    row.insertCell(0).textContent = stay.room;
                    row.insertCell(1).textContent = stay.checkIn;
                    row.insertCell(2).textContent = stay.checkOut;
                    row.insertCell(3).textContent = stay.nights;
                    row.insertCell(4).textContent = `$${stay.total.toFixed(2)}`;
                });
            } else {
                const row = stayHistoryTable.insertRow();
                const cell = row.insertCell(0);
                cell.colSpan = 5;
                cell.textContent = 'No stay history available';
                cell.style.textAlign = 'center';
                cell.style.fontStyle = 'italic';
                cell.style.color = 'var(--light)';
            }
            
            // Show guest detail section
            document.getElementById('guest-detail-section').style.display = 'block';
        }
    });
}