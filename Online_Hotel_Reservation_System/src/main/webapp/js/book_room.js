// Sample room data
/*const rooms = [
    {
        id: '1',
        name: 'Elegant Standard Room',
        type: 'standard',
        price: 120,
        capacity: 2,
        description: 'Comfortable room with modern amenities and a beautiful city view.',
        amenities: ['Free Wi-Fi', 'TV', 'Air Conditioning', 'Mini Bar', 'Coffee Maker'],
        imageUrl: 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
    },
    {
        id: '2',
        name: 'Deluxe Garden View',
        type: 'deluxe',
        price: 220,
        capacity: 3,
        description: 'Luxurious room with a king-size bed and a stunning garden view.',
        amenities: ['Free Wi-Fi', 'TV', 'Air Conditioning', 'Mini Bar', 'Bathtub', 'Bathrobe'],
        imageUrl: 'https://images.pexels.com/photos/3634741/pexels-photo-3634741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
    },
    {
        id: '3',
        name: 'Executive Suite',
        type: 'suite',
        price: 350,
        capacity: 4,
        description: 'Elegant suite with separate living area and premium amenities.',
        amenities: ['Free Wi-Fi', 'TV', 'Living Room', 'Kitchen', 'Coffee Machine', 'Bathrobe'],
        imageUrl: 'https://images.pexels.com/photos/2631746/pexels-photo-2631746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
    }
];
*/
// DOM Elements
const checkInInput = document.getElementById('check-in');
const checkOutInput = document.getElementById('check-out');
const nightsCount = document.getElementById('nights-count');
const roomTypeOptions = document.querySelectorAll('.room-type-option');
const roomsGrid = document.getElementById('rooms-grid');
const loadingElement = document.getElementById('loading');

// Set minimum dates
const today = new Date().toISOString().split('T')[0];
const tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);
const tomorrowStr = tomorrow.toISOString().split('T')[0];

checkInInput.min = today;
checkOutInput.min = tomorrowStr;

// Only set default values if user hasn't already submitted dates
if (!checkInInput.value) {
    checkInInput.value = today;
}
if (!checkOutInput.value) {
    checkOutInput.value = tomorrowStr;
}

// Event Listeners
checkInInput.addEventListener('change', handleDateChange);
checkOutInput.addEventListener('change', handleDateChange);
roomTypeOptions.forEach(option => {
    option.addEventListener('click', handleRoomTypeChange);
});

// Initialize
let selectedRoomType = 'all';
updateNightsCount();
searchRooms();

checkInInput.addEventListener('change', handleDateChange);
checkOutInput.addEventListener('change', handleDateChange);

function handleDateChange(e) {
    if (e.target.id === 'check-in') {
        const nextDay = new Date(e.target.value);
        nextDay.setDate(nextDay.getDate() + 1);
        checkOutInput.min = nextDay.toISOString().split('T')[0];

        if (checkOutInput.value <= e.target.value) {
            checkOutInput.value = nextDay.toISOString().split('T')[0];
        }
    }

    updateNightsCount();

    // Auto-submit the form on date change
    document.getElementById("bookingForm").submit();
}

function handleRoomTypeChange(e) {
    const option = e.currentTarget;
    roomTypeOptions.forEach(opt => opt.classList.remove('selected'));
    option.classList.add('selected');
    selectedRoomType = option.dataset.type;
    searchRooms();
}

function updateNightsCount() {
    const checkIn = new Date(checkInInput.value);
    const checkOut = new Date(checkOutInput.value);
    const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));

    nightsCount.textContent = `${nights} night${nights !== 1 ? 's' : ''} selected`;

    // Update all hidden nights inputs
    document.querySelectorAll("input[id^='nights-hidden-']").forEach(input => {
        input.value = nights;
    });
}


/*function searchRooms() {
    loadingElement.classList.remove('hidden');
    roomsGrid.innerHTML = '';
    
    // Simulate API call
    setTimeout(() => {
        const filteredRooms = rooms.filter(room => 
            selectedRoomType === 'all' || room.type === selectedRoomType
        );
        
        displayRooms(filteredRooms);
        loadingElement.classList.add('hidden');
    }, 500);
}*/

/*function displayRooms(rooms) {
    const checkIn = new Date(checkInInput.value);
    const checkOut = new Date(checkOutInput.value);
    const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));
    
    roomsGrid.innerHTML = rooms.map(room => `
        <div class="room-card">
            <div class="room-image">
                <img src="${room.imageUrl}" alt="${room.name}">
                <div class="room-price-tag">$${room.price}/night</div>
            </div>
            <div class="room-details">
                <h3>${room.name}</h3>
                <p class="room-description">${room.description}</p>
                <div class="amenities">
                    ${room.amenities.slice(0, 4).map(amenity => 
                        `<span class="amenity">${amenity}</span>`
                    ).join('')}
                    ${room.amenities.length > 4 ? 
                        `<span class="amenity">+${room.amenities.length - 4} more</span>` : 
                        ''}
                </div>
                <div class="total-price">
                    <span>Total for ${nights} night${nights !== 1 ? 's' : ''}</span>
                    <strong>$${room.price * nights}</strong>
                </div>
                <button class="book-button">Book Now</button>
            </div>
        </div>
    `).join('');
}
*/

function setNightsBeforeSubmit(roomNumber) {
    const checkIn = new Date(document.getElementById('check-in').value);
    const checkOut = new Date(document.getElementById('check-out').value);
    const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));

    document.getElementById('nights').value = nights;
    return true; // allow form to submit
}




function submitBooking(roomNumber) {
    const checkIn = new Date(document.getElementById('check-in').value);
    const checkOut = new Date(document.getElementById('check-out').value);
    const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));

    const nightsInput = document.getElementById(`nights-hidden-${roomNumber}`);
    nightsInput.value = nights;

    document.getElementById(`bookForm-${roomNumber}`).submit();
}


