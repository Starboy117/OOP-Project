<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Room - Tendura Hotel</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>tailwind.config={theme:{extend:{colors:{primary:'#8B4513',secondary:'#DEB887'},borderRadius:{'none':'0px','sm':'4px',DEFAULT:'8px','md':'12px','lg':'16px','xl':'20px','2xl':'24px','3xl':'32px','full':'9999px','button':'8px'}}}}</script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
    <style>
        :where([class^="ri-"])::before { content: "\f3c2"; }
        body {
            font-family: 'Inter', sans-serif;
            background-color: #faf8f6;
        }
        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #8B4513;
            box-shadow: 0 0 0 1px rgba(139, 69, 19, 0.2);
        }
    </style>
</head>
<body>
    <header class="bg-primary shadow-md">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <a href="#" class="text-white font-['Pacifico'] text-2xl">Tendura</a>
            <nav>
                <ul class="flex space-x-6">
                    <li><a href="#" class="text-white hover:text-secondary">Dashboard</a></li>
                    <li><a href="#" class="text-white hover:text-secondary font-medium border-b-2 border-white">Rooms</a></li>
                    <li><a href="#" class="text-white hover:text-secondary">Bookings</a></li>
                    <li><a href="#" class="text-white hover:text-secondary">Guests</a></li>
                    <li><a href="#" class="text-white hover:text-secondary">Reports</a></li>
                </ul>
            </nav>
            <div class="flex items-center space-x-4">
                <div class="w-8 h-8 flex items-center justify-center bg-white/20 rounded-full text-white">
                    <i class="ri-notification-3-line"></i>
                </div>
                <div class="w-8 h-8 flex items-center justify-center bg-white/20 rounded-full text-white">
                    <i class="ri-user-line"></i>
                </div>
            </div>
        </div>
    </header>

<main class="mx-auto px-8 py-8 max-w-6xl">
    <div class="flex items-center mb-8">
        <a href="rooms.jsp" class="text-primary hover:text-primary/80 mr-4">
            <div class="w-8 h-8 flex items-center justify-center">
                <i class="ri-arrow-left-line"></i>
            </div>
        </a>
        <h1 class="text-3xl font-bold text-primary">Add New Room</h1>
    </div>

    <div class="bg-white rounded shadow-sm p-6 max-w-5xl">
    
    
        <form id="addRoomForm" action="roomInsert" method="post" class="space-y-6">
        
        

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Room Number</label>
                    <input type="text" name="roomNumber" required class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900 placeholder-gray-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Room Type</label>
                    <select name="roomType" required class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900 pr-8">
                        <option value="">Select Room Type</option>
                        <option value="standard">Standard Room</option>
                        <option value="deluxe">Deluxe Room</option>
                        <option value="suite">Suite</option>
                        <option value="executive">Executive Suite</option>
                        <option value="family">Family Room</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Capacity</label>
                    <input type="number" name="capacity" min="1" max="10" required class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Price per Night ($)</label>
                    <input type="number" name="price" min="0" step="0.01" required class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Floor</label>
                    <input type="number" name="floor" min="1" required class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Status</label>
                    <select name="status" required class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900 pr-8">
                        <option value="available">Available</option>
                        <option value="maintenance">Maintenance</option>
                        <option value="reserved">Reserved</option>
                        <option value="occupied">Occupied</option>
                    </select>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Room Features</label>
                <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                    <label class="flex items-center space-x-2">
                        <input type="checkbox" name="features" value="wifi" class="text-primary">
                        <span class="text-sm text-gray-700">Wi-Fi</span>
                    </label>
                    <label class="flex items-center space-x-2">
                        <input type="checkbox" name="features" value="tv" class="text-primary">
                        <span class="text-sm text-gray-700">Smart TV</span>
                    </label>
                    <label class="flex items-center space-x-2">
                        <input type="checkbox" name="features" value="minibar" class="text-primary">
                        <span class="text-sm text-gray-700">Mini Bar</span>
                    </label>
                    <label class="flex items-center space-x-2">
                        <input type="checkbox" name="features" value="safe" class="text-primary">
                        <span class="text-sm text-gray-700">Safe Box</span>
                    </label>
                    <label class="flex items-center space-x-2">
                        <input type="checkbox" name="features" value="balcony" class="text-primary">
                        <span class="text-sm text-gray-700">Balcony</span>
                    </label>
                    <label class="flex items-center space-x-2">
                        <input type="checkbox" name="features" value="bathtub" class="text-primary">
                        <span class="text-sm text-gray-700">Bathtub</span>
                    </label>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                <textarea name="description" rows="4" class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900 placeholder-gray-500"></textarea>
            </div>

            <div class="flex justify-end space-x-4">
                <a href="rooms.jsp" class="px-6 py-2 border border-gray-300 text-gray-700 rounded hover:bg-gray-50 !rounded-button whitespace-nowrap">Cancel</a>
                <button type="submit" class="px-6 py-2 bg-primary text-white rounded hover:bg-primary/90 !rounded-button whitespace-nowrap">Add Room</button>
            </div>
        </form>
    </div>
</main>

<footer class="bg-primary/5 py-6 mt-auto">
    <div class="container mx-auto px-4">
        <div class="text-center text-sm text-gray-600">
            &copy; 2025 Tendura Hotel. All rights reserved.
        </div>
    </div>
</footer>

<div id="successModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div class="bg-white rounded-lg p-6 max-w-md w-full">
        <div class="flex items-center justify-center mb-4 text-green-500">
            <div class="w-12 h-12 flex items-center justify-center">
                <i class="ri-checkbox-circle-line text-3xl"></i>
            </div>
        </div>
        <h3 class="text-lg font-medium text-center text-gray-900 mb-2">Room Added Successfully</h3>
        <p class="text-gray-600 text-center mb-6">The new room has been added to the system.</p>
        <div class="flex justify-center">
            <a href="rooms.jsp" class="px-4 py-2 bg-primary text-white rounded hover:bg-primary/90 !rounded-button whitespace-nowrap">Return to Room List</a>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('addRoomForm');
        const successModal = document.getElementById('successModal');
        
        
    });
</script>

</body>
</html>
