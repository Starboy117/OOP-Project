<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room Availability - Tendura Hotel</title>
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<script>tailwind.config={theme:{extend:{colors:{primary:'#8B4513',secondary:'#DEB887'},borderRadius:{'none':'0px','sm':'4px',DEFAULT:'8px','md':'12px','lg':'16px','xl':'20px','2xl':'24px','3xl':'32px','full':'9999px','button':'8px'}}}}</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>
<style>
:where([class^="ri-"])::before { content: "\f3c2"; }
body {
font-family: 'Inter', sans-serif;
background-color: #faf8f6;
}
input:focus, select:focus {
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

<main class="container mx-auto px-4 py-8">
<div class="flex justify-between items-center mb-8">
<h1 class="text-3xl font-bold text-primary">Room Availability Overview</h1>
<div class="flex space-x-4">
<button class="px-4 py-2 bg-white border border-gray-300 rounded flex items-center space-x-2 hover:bg-gray-50 !rounded-button whitespace-nowrap">
<i class="ri-download-line"></i>
<span>Export</span>
</button>
<button onclick="window.location.href='addRoom.jsp';" class="px-4 py-2 bg-primary text-white rounded flex items-center space-x-2 hover:bg-primary/90 !rounded-button whitespace-nowrap" >
<i class="ri-add-line"></i>
<span>Add Room</span>
</button>
</div>
</div>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
<div class="bg-white rounded-lg shadow-sm p-6">
<div class="flex items-center justify-between mb-4">
<h3 class="text-lg font-medium text-gray-900">Total Rooms</h3>
<div class="w-10 h-10 flex items-center justify-center bg-primary/10 rounded-full text-primary">
<i class="ri-hotel-line text-xl"></i>
</div>
</div>
<p class="text-3xl font-bold text-gray-900">120</p>
<p class="text-sm text-gray-500 mt-2">All room types included</p>
</div>

<div class="bg-white rounded-lg shadow-sm p-6">
<div class="flex items-center justify-between mb-4">
<h3 class="text-lg font-medium text-gray-900">Available</h3>
<div class="w-10 h-10 flex items-center justify-center bg-green-100 rounded-full text-green-600">
<i class="ri-checkbox-circle-line text-xl"></i>
</div>
</div>
<p class="text-3xl font-bold text-gray-900">82</p>
<p class="text-sm text-gray-500 mt-2">Ready for booking</p>
</div>
<div class="bg-white rounded-lg shadow-sm p-6">
<div class="flex items-center justify-between mb-4">
<h3 class="text-lg font-medium text-gray-900">Occupied</h3>
<div class="w-10 h-10 flex items-center justify-center bg-blue-100 rounded-full text-blue-600">
<i class="ri-user-star-line text-xl"></i>
</div>
</div>
<p class="text-3xl font-bold text-gray-900">32</p>
<p class="text-sm text-gray-500 mt-2">Currently in use</p>
</div>
<div class="bg-white rounded-lg shadow-sm p-6">
<div class="flex items-center justify-between mb-4">
<h3 class="text-lg font-medium text-gray-900">Maintenance</h3>
<div class="w-10 h-10 flex items-center justify-center bg-orange-100 rounded-full text-orange-600">
<i class="ri-tools-line text-xl"></i>
</div>
</div>
<p class="text-3xl font-bold text-gray-900">6</p>
<p class="text-sm text-gray-500 mt-2">Under maintenance</p>
</div>
</div>

<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
<div class="bg-white rounded-lg shadow-sm p-6">
<h3 class="text-lg font-medium text-gray-900 mb-6">Occupancy Rate by Room Type</h3>
<div id="roomTypeChart" class="w-full h-80"></div>
</div>

<div class="bg-white rounded-lg shadow-sm p-6">
<h3 class="text-lg font-medium text-gray-900 mb-6">Weekly Occupancy Trend</h3>
<div id="occupancyTrendChart" class="w-full h-80"></div>
</div>
</div>

<div class="bg-white rounded-lg shadow-sm overflow-hidden">
<div class="p-6 border-b border-gray-200">
<div class="flex justify-between items-center">
<h3 class="text-lg font-medium text-gray-900">Room Status Details</h3>
<div class="relative">
<input type="text" placeholder="Search rooms..." class="pl-10 pr-4 py-2 border border-gray-300 rounded text-sm">
<div class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400">
<i class="ri-search-line"></i>
</div>
</div>
</div>
</div>

<div class="overflow-x-auto">
<table class="w-full">
<thead>
<tr class="bg-gray-50">
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Room</th>
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Floor</th>
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Current Guest</th>
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Check-in</th>
<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Check-out</th>
<th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
</tr>
</thead>
<tbody class="bg-white divide-y divide-gray-200">
<tr>
<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">1001</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Deluxe King</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">10</td>
<td class="px-6 py-4 whitespace-nowrap">
<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Available</span>
</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
<button class="text-primary hover:text-primary/80">Edit</button>
</td>
</tr>
<tr>
<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">1002</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Executive Suite</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">10</td>
<td class="px-6 py-4 whitespace-nowrap">
<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">Occupied</span>
</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">James Anderson</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">May 7, 2025</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">May 10, 2025</td>
<td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
<button class="text-primary hover:text-primary/80">View</button>
</td>
</tr>
<tr>
<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">1003</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Deluxe Twin</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">10</td>
<td class="px-6 py-4 whitespace-nowrap">
<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-orange-100 text-orange-800">Maintenance</span>
</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
<button class="text-primary hover:text-primary/80">Edit</button>
</td>
</tr>
<tr>
<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">1004</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Family Suite</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">10</td>
<td class="px-6 py-4 whitespace-nowrap">
<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">Occupied</span>
</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Sarah Thompson</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">May 6, 2025</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">May 12, 2025</td>
<td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
<button class="text-primary hover:text-primary/80">View</button>
</td>
</tr>
<tr>
<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">1005</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Deluxe King</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">10</td>
<td class="px-6 py-4 whitespace-nowrap">
<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Available</span>
</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
<td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
<button class="text-primary hover:text-primary/80">Edit</button>
</td>
</tr>
</tbody>
</table>
</div>

<div class="px-6 py-4 border-t border-gray-200">
<div class="flex items-center justify-between">
<div class="text-sm text-gray-500">
Showing 1 to 5 of 120 entries
</div>
<div class="flex space-x-2">
<button class="px-3 py-1 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 !rounded-button whitespace-nowrap">Previous</button>
<button class="px-3 py-1 bg-primary text-white rounded text-sm hover:bg-primary/90 !rounded-button whitespace-nowrap">1</button>
<button class="px-3 py-1 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 !rounded-button whitespace-nowrap">2</button>
<button class="px-3 py-1 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 !rounded-button whitespace-nowrap">3</button>
<button class="px-3 py-1 border border-gray-300 rounded text-sm text-gray-700 hover:bg-gray-50 !rounded-button whitespace-nowrap">Next</button>
</div>
</div>
</div>
</div>
</main>

<footer class="bg-primary/5 py-6 mt-auto">
<div class="container mx-auto px-4">
<div class="text-center text-sm text-gray-600">
&copy; 2025 Tendura Hotel. All rights reserved.
</div>
</div>
</footer>

<script>
document.addEventListener('DOMContentLoaded', function() {
const roomTypeChart = echarts.init(document.getElementById('roomTypeChart'));
const occupancyTrendChart = echarts.init(document.getElementById('occupancyTrendChart'));
const roomTypeOption = {
animation: false,
tooltip: {
trigger: 'item',
backgroundColor: 'rgba(255, 255, 255, 0.9)',
textStyle: {
color: '#1f2937'
}
},
legend: {
bottom: '0',
left: 'center',
textStyle: {
color: '#1f2937'
}
},
series: [
{
name: 'Room Types',
type: 'pie',
radius: ['40%', '70%'],
avoidLabelOverlap: false,
itemStyle: {
borderRadius: 8
},
label: {
show: false
},
emphasis: {
label: {
show: true,
fontSize: '14',
fontWeight: 'bold'
}
},
labelLine: {
show: false
},
data: [
{ value: 40, name: 'Deluxe King', itemStyle: { color: 'rgba(87, 181, 231, 1)' } },
{ value: 30, name: 'Executive Suite', itemStyle: { color: 'rgba(141, 211, 199, 1)' } },
{ value: 25, name: 'Deluxe Twin', itemStyle: { color: 'rgba(251, 191, 114, 1)' } },
{ value: 25, name: 'Family Suite', itemStyle: { color: 'rgba(252, 141, 98, 1)' } }
]
}
]
};

const occupancyTrendOption = {
animation: false,
tooltip: {
trigger: 'axis',
backgroundColor: 'rgba(255, 255, 255, 0.9)',
textStyle: {
color: '#1f2937'
}
},
grid: {
left: '3%',
right: '4%',
bottom: '3%',
containLabel: true
},
xAxis: {
type: 'category',
boundaryGap: false,
data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
axisLine: {
lineStyle: {
color: '#e5e7eb'
}
},
axisLabel: {
color: '#1f2937'
}
},
yAxis: {
type: 'value',
axisLine: {
lineStyle: {
color: '#e5e7eb'
}
},
axisLabel: {
color: '#1f2937'
},
splitLine: {
lineStyle: {
color: '#e5e7eb'
}
}
},
series: [
{
name: 'Occupancy Rate',
type: 'line',
smooth: true,
data: [68, 72, 81, 85, 90, 95, 88],
itemStyle: {
color: 'rgba(87, 181, 231, 1)'
},
areaStyle: {
color: {
type: 'linear',
x: 0,
y: 0,
x2: 0,
y2: 1,
colorStops: [{
offset: 0,
color: 'rgba(87, 181, 231, 0.2)'
}, {
offset: 1,
color: 'rgba(87, 181, 231, 0)'
}]
}
}
}
]
};

roomTypeChart.setOption(roomTypeOption);
occupancyTrendChart.setOption(occupancyTrendOption);

window.addEventListener('resize', function() {
roomTypeChart.resize();
occupancyTrendChart.resize();
});
});
</script>
</body>
</html>