<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Edit Room - Tendura Hotel</title>
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					primary : "#8B4513",
					secondary : "#DEB887"
				},
				borderRadius : {
					none : "0px",
					sm : "4px",
					DEFAULT : "8px",
					md : "12px",
					lg : "16px",
					xl : "20px",
					"2xl" : "24px",
					"3xl" : "32px",
					full : "9999px",
					button : "8px",
				},
			},
		},
	};
</script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" />
<style>
:where([class^="ri-"])::before {
	content: "\f3c2";
}

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
		<div
			class="container mx-auto px-4 py-3 flex justify-between items-center">
			<a href="#" class="text-white font-['Pacifico'] text-2xl">Tendura</a>
			<nav>
				<ul class="flex space-x-6">
					<li><a href="#" class="text-white hover:text-secondary">Dashboard</a></li>
					<li><a href="#"
						class="text-white hover:text-secondary font-medium border-b-2 border-white">Rooms</a>
					</li>
					<li><a href="#" class="text-white hover:text-secondary">Bookings</a></li>
					<li><a href="#" class="text-white hover:text-secondary">Guests</a></li>
					<li><a href="#" class="text-white hover:text-secondary">Reports</a></li>
				</ul>
			</nav>
			<div class="flex items-center space-x-4">
				<div
					class="w-8 h-8 flex items-center justify-center bg-white/20 rounded-full text-white">
					<i class="ri-notification-3-line"></i>
				</div>
				<div
					class="w-8 h-8 flex items-center justify-center bg-white/20 rounded-full text-white">
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
			<h1 class="text-3xl font-bold text-primary">Edit Room #${room.roomNumber}</h1>
		</div>
		<div class="bg-white rounded shadow-sm p-6 max-w-5xl">

			<form id="editRoomForm" action="updateRoomServlet" method="post"
				class="space-y-6">

				<input type="hidden" name="roomId" value="${room.roomId}" />

				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label for="roomNumber"
							class="block text-sm font-medium text-gray-700 mb-2">Room
							Number</label> 
						<input type="text" id="roomNumber" name="roomNumber"
							value="${room.roomNumber}" readonly
							class="w-full px-3 py-2 border border-gray-300 rounded bg-gray-50 text-gray-500" />
					</div>
					<div>
						<label for="roomType"
							class="block text-sm font-medium text-gray-700 mb-2">Room
							Type</label> 
						<select id="roomType" name="roomType" required
							class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900 pr-8">
							<option value="">Select Room Type</option>
							<option value="standard" ${room.roomType == 'standard' ? 'selected' : ''}>Standard Room</option>
							<option value="deluxe" ${room.roomType == 'deluxe' ? 'selected' : ''}>Deluxe Room</option>
							<option value="suite" ${room.roomType == 'suite' ? 'selected' : ''}>Suite</option>
							<option value="executive" ${room.roomType == 'executive' ? 'selected' : ''}>Executive Suite</option>
							<option value="family" ${room.roomType == 'family' ? 'selected' : ''}>Family Room</option>
						</select>
					</div>
					<div>
						<label for="capacity"
							class="block text-sm font-medium text-gray-700 mb-2">Capacity</label>
						<input type="number" id="capacity" name="capacity" min="1"
							max="10" value="${room.capacity}" required
							class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900" />
					</div>
					<div>
						<label for="price"
							class="block text-sm font-medium text-gray-700 mb-2">Price
							per Night ($)</label> 
						<input type="number" id="price" name="price"
							min="0" step="0.01" value="${room.price}" required
							class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900" />
					</div>
					<div>
						<label for="floor"
							class="block text-sm font-medium text-gray-700 mb-2">Floor</label>
						<input type="number" id="floor" name="floor" min="1" value="${room.floor}"
							required
							class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900" />
					</div>
					<div>
						<label for="status"
							class="block text-sm font-medium text-gray-700 mb-2">Status</label>
						<select id="status" name="status" required
							class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900 pr-8">
							<option value="available" ${room.status == 'available' ? 'selected' : ''}>Available</option>
							<option value="maintenance" ${room.status == 'maintenance' ? 'selected' : ''}>Maintenance</option>
							<option value="reserved" ${room.status == 'reserved' ? 'selected' : ''}>Reserved</option>
							<option value="occupied" ${room.status == 'occupied' ? 'selected' : ''}>Occupied</option>
						</select>
					</div>
				</div>
				<div>
					<label class="block text-sm font-medium text-gray-700 mb-2">Room
						Features</label>
					<div class="grid grid-cols-2 md:grid-cols-3 gap-4">
						<label class="flex items-center space-x-2"> 
							<input
								type="checkbox" name="features" value="wifi" ${room.features != null && room.features.contains('wifi') ? 'checked' : ''} 
								class="text-primary" /> 
							<span class="text-sm text-gray-700">Wi-Fi</span>
						</label> 
						<label class="flex items-center space-x-2"> 
							<input
								type="checkbox" name="features" value="tv" ${room.features != null && room.features.contains('tv') ? 'checked' : ''} 
								class="text-primary" /> 
							<span class="text-sm text-gray-700">Smart TV</span>
						</label> 
						<label class="flex items-center space-x-2"> 
							<input
								type="checkbox" name="features" value="minibar" ${room.features != null && room.features.contains('minibar') ? 'checked' : ''} 
								class="text-primary" /> 
							<span class="text-sm text-gray-700">Mini Bar</span>
						</label> 
						<label class="flex items-center space-x-2"> 
							<input
								type="checkbox" name="features" value="safe" ${room.features != null && room.features.contains('safe') ? 'checked' : ''} 
								class="text-primary" /> 
							<span class="text-sm text-gray-700">Safe Box</span>
						</label> 
						<label class="flex items-center space-x-2"> 
							<input
								type="checkbox" name="features" value="balcony" ${room.features != null && room.features.contains('balcony') ? 'checked' : ''} 
								class="text-primary" /> 
							<span class="text-sm text-gray-700">Balcony</span>
						</label> 
						<label class="flex items-center space-x-2"> 
							<input
								type="checkbox" name="features" value="bathtub" ${room.features != null && room.features.contains('bathtub') ? 'checked' : ''} 
								class="text-primary" /> 
							<span class="text-sm text-gray-700">Bathtub</span>
						</label>
					</div>
				</div>
				<div>
					<label for="description"
						class="block text-sm font-medium text-gray-700 mb-2">Description</label>
					<textarea id="description" name="description" rows="4"
						class="w-full px-3 py-2 border border-gray-300 rounded text-gray-900">${room.description != null ? room.description : ''}</textarea>
				</div>
				<div>
					<button type="submit"
						class="bg-primary text-white px-6 py-3 rounded hover:bg-primary/80 transition">Update
						Room</button>
				</div>
			</form>
		</div>
	</main>
</body>
</html>
