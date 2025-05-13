<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room List - Tendura Hotel</title>
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					primary : '#8B4513',
					secondary : '#DEB887'
				},
				borderRadius : {
					'none' : '0px',
					'sm' : '4px',
					DEFAULT : '8px',
					'md' : '12px',
					'lg' : '16px',
					'xl' : '20px',
					'2xl' : '24px',
					'3xl' : '32px',
					'full' : '9999px',
					'button' : '8px'
				}
			}
		}
	}
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
<style>
:where([class^="ri-"])::before {
	content: "\f3c2";
}

body {
	font-family: 'Inter', sans-serif;
	background-color: #faf8f6;
}

.table-row-hover:hover {
	background-color: rgba(139, 69, 19, 0.05);
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
						class="text-white hover:text-secondary font-medium border-b-2 border-white">Rooms</a></li>
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

	<main class="container mx-auto px-4 py-8">
		<div class="flex justify-between items-center mb-8">
			<h1 class="text-3xl font-bold text-primary">Room Management</h1>
			<a href="addRoom.jsp"
				class="bg-primary text-white px-4 py-2 !rounded-button flex items-center whitespace-nowrap">
				<i class="ri-add-line mr-2"></i> Add New Room
			</a>
		</div>

		<div class="bg-white rounded shadow-sm mb-8 p-4">
			<div
				class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
				<div class="relative w-full md:w-1/3">
					<input type="text" placeholder="Search rooms..."
						class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded">
					<div
						class="absolute left-3 top-1/2 transform -translate-y-1/2 w-5 h-5 flex items-center justify-center text-gray-500">
						<i class="ri-search-line"></i>
					</div>
				</div>
				<div class="flex space-x-4 w-full md:w-auto">
					<select
						class="border border-gray-300 rounded px-3 py-2 bg-white text-gray-700 pr-8">
						<option>All Room Types</option>
						<option>Standard</option>
						<option>Deluxe</option>
						<option>Suite</option>
						<option>Executive</option>
					</select> <select
						class="border border-gray-300 rounded px-3 py-2 bg-white text-gray-700 pr-8">
						<option>All Statuses</option>
						<option>Available</option>
						<option>Occupied</option>
						<option>Maintenance</option>
						<option>Reserved</option>
					</select>
				</div>
			</div>

			<div class="overflow-x-auto">
				<table class="min-w-full divide-y divide-gray-200">
					<thead class="bg-primary/10">
						<tr>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-primary uppercase tracking-wider">Room
								No.</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-primary uppercase tracking-wider">Room
								Type</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-primary uppercase tracking-wider">Capacity</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-primary uppercase tracking-wider">Price/Night</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-primary uppercase tracking-wider">Status</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-primary uppercase tracking-wider">Actions</th>
						</tr>
					</thead>
					<tbody class="bg-white divide-y divide-gray-200">
						<tr class="table-row-hover">
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">101</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Standard
								Twin</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">$120</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Available</span>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
								<div class="flex space-x-2">
									<a href="roomAvailability.jsp?id=101"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-calendar-line"></i>
										</div>
									</a> <a href="editRoom.jsp?id=101"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-edit-line"></i>
										</div>
									</a> <a
										href="deleteRoom.jsp?roomNumber=1024&roomType=Deluxe%20Room&floor=10&capacity=2&price=299.99">
										<button class="text-red-600 hover:text-red-800">
											<div class="w-8 h-8 flex items-center justify-center">
												<i class="ri-delete-bin-line"></i>
											</div>
										</button>
									</a>

								</div>
							</td>
						</tr>
						<tr class="table-row-hover">
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">102</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Deluxe
								King</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">$180</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">Occupied</span>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
								<div class="flex space-x-2">
									<a href="roomAvailability.jsp?id=102"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-calendar-line"></i>
										</div>
									</a> <a href="editRoom.jsp?id=102"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-edit-line"></i>
										</div>
									</a> <a
										href="deleteRoom.jsp?roomNumber=1024&roomType=Deluxe%20Room&floor=10&capacity=2&price=299.99">
										<button class="text-red-600 hover:text-red-800">
											<div class="w-8 h-8 flex items-center justify-center">
												<i class="ri-delete-bin-line"></i>
											</div>
										</button>
									</a>

								</div>
							</td>
						</tr>
						<tr class="table-row-hover">
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">103</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Executive
								Suite</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">4</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">$320</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">Reserved</span>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
								<div class="flex space-x-2">
									<a href="roomAvailability.jsp?id=103"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-calendar-line"></i>
										</div>
									</a> <a href="editRoom.jsp?id=103"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-edit-line"></i>
										</div>
									</a> <a
										href="deleteRoom.jsp?roomNumber=1024&roomType=Deluxe%20Room&floor=10&capacity=2&price=299.99">
										<button class="text-red-600 hover:text-red-800">
											<div class="w-8 h-8 flex items-center justify-center">
												<i class="ri-delete-bin-line"></i>
											</div>
										</button>
									</a>

								</div>
							</td>
						</tr>
						<tr class="table-row-hover">
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">104</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Standard
								Queen</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">$140</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gray-100 text-gray-800">Maintenance</span>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
								<div class="flex space-x-2">
									<a href="roomAvailability.jsp?id=104"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-calendar-line"></i>
										</div>
									</a> <a href="editRoom.jsp?id=104"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-edit-line"></i>
										</div>
									</a> <a
										href="deleteRoom.jsp?roomNumber=1024&roomType=Deluxe%20Room&floor=10&capacity=2&price=299.99">
										<button class="text-red-600 hover:text-red-800">
											<div class="w-8 h-8 flex items-center justify-center">
												<i class="ri-delete-bin-line"></i>
											</div>
										</button>
									</a>

								</div>
							</td>
						</tr>
						<tr class="table-row-hover">
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">105</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Family
								Room</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">5</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">$250</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Available</span>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
								<div class="flex space-x-2">
									<a href="roomAvailability.jsp?id=105"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-calendar-line"></i>
										</div>
									</a> <a href="editRoom.jsp?id=105"
										class="text-primary hover:text-primary/80">
										<div class="w-8 h-8 flex items-center justify-center">
											<i class="ri-edit-line"></i>
										</div>
									</a> <a
										href="deleteRoom.jsp?roomNumber=1024&roomType=Deluxe%20Room&floor=10&capacity=2&price=299.99">
										<button class="text-red-600 hover:text-red-800">
											<div class="w-8 h-8 flex items-center justify-center">
												<i class="ri-delete-bin-line"></i>
											</div>
										</button>
									</a>

								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="flex justify-between items-center mt-6">
				<div class="text-sm text-gray-700">
					Showing <span class="font-medium">1</span> to <span
						class="font-medium">5</span> of <span class="font-medium">24</span>
					rooms
				</div>
				<div class="flex space-x-2">
					<button
						class="px-3 py-1 border border-gray-300 rounded-l-md bg-white text-gray-500 hover:bg-gray-50 disabled:opacity-50"
						disabled>Previous</button>
					<button
						class="px-3 py-1 border border-gray-300 bg-primary text-white hover:bg-primary/90">
						1</button>
					<button
						class="px-3 py-1 border border-gray-300 bg-white text-gray-700 hover:bg-gray-50">
						2</button>
					<button
						class="px-3 py-1 border border-gray-300 bg-white text-gray-700 hover:bg-gray-50">
						3</button>
					<button
						class="px-3 py-1 border border-gray-300 rounded-r-md bg-white text-gray-700 hover:bg-gray-50">
						Next</button>
				</div>
			</div>
		</div>
	</main>

	<footer class="bg-primary/5 py-6 mt-auto">
		<div class="container mx-auto px-4">
			<div class="text-center text-sm text-gray-600">&copy; 2025
				Tendura Hotel. All rights reserved.</div>
		</div>
	</footer>



</body>
</html>
