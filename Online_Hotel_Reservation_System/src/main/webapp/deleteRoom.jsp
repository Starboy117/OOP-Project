<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delete Room - Tendura Hotel</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#8B4513", secondary: "#DEB887" },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
    />
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
      <div
        class="container mx-auto px-4 py-3 flex justify-between items-center"
      >
        <a href="#" class="text-white font-['Pacifico'] text-2xl">Tendura</a>
        <nav>
          <ul class="flex space-x-6">
            <li>
              <a href="#" class="text-white hover:text-secondary">Dashboard</a>
            </li>
            <li>
              <a
                href="#"
                class="text-white hover:text-secondary font-medium border-b-2 border-white"
                >Rooms</a
              >
            </li>
            <li>
              <a href="#" class="text-white hover:text-secondary">Bookings</a>
            </li>
            <li>
              <a href="#" class="text-white hover:text-secondary">Guests</a>
            </li>
            <li>
              <a href="#" class="text-white hover:text-secondary">Reports</a>
            </li>
          </ul>
        </nav>
        <div class="flex items-center space-x-4">
          <div
            class="w-8 h-8 flex items-center justify-center bg-white/20 rounded-full text-white"
          >
            <i class="ri-notification-3-line"></i>
          </div>
          <div
            class="w-8 h-8 flex items-center justify-center bg-white/20 rounded-full text-white"
          >
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
        <h1 class="text-3xl font-bold text-primary">Delete Room #1024</h1>
      </div>
      <div class="bg-white rounded shadow-sm p-6 max-w-5xl">
        <div class="space-y-6">
          <div class="flex items-center justify-center mb-6 text-red-500">
            <div class="w-16 h-16 flex items-center justify-center">
              <i class="ri-error-warning-line text-5xl"></i>
            </div>
          </div>
          
          <h2 class="text-xl font-semibold text-center text-gray-800 mb-2">
            Are you sure you want to delete this room?
          </h2>
          
          <p class="text-gray-600 text-center mb-8">
            This action will permanently remove Room #1024 from the system. All associated data will be lost and cannot be recovered.
          </p>
          
          <div class="bg-red-50 border-l-4 border-red-500 p-4 mb-6">
            <div class="flex">
              <div class="flex-shrink-0 text-red-500">
                <i class="ri-alert-line text-xl"></i>
              </div>
              <div class="ml-3">
                <h3 class="text-sm font-medium text-red-800">
                  Warning: This action is irreversible
                </h3>
                <div class="mt-2 text-sm text-red-700">
                  <p>
                    Deleting this room will remove all associated data permanently.
                  </p>
                </div>
              </div>
            </div>
          </div>
          
          <div class="border rounded-lg p-4 mb-8 max-w-md mx-auto">
            <h3 class="font-medium text-gray-700 mb-3 text-center">Room Details</h3>
            <div class="space-y-2 text-sm text-gray-600">
              <div class="flex justify-between">
                <span>Room Number:</span>
                <span class="font-medium">1024</span>
              </div>
              <div class="flex justify-between">
                <span>Type:</span>
                <span class="font-medium">Deluxe Room</span>
              </div>
              <div class="flex justify-between">
                <span>Floor:</span>
                <span class="font-medium">10</span>
              </div>
              <div class="flex justify-between">
                <span>Capacity:</span>
                <span class="font-medium">2 guests</span>
              </div>
              <div class="flex justify-between">
                <span>Price:</span>
                <span class="font-medium">$299.99/night</span>
              </div>
            </div>
          </div>
          
          <div class="flex flex-col sm:flex-row justify-between space-y-4 sm:space-y-0">
            <div class="flex items-center">
              <input
                id="confirm-checkbox"
                type="checkbox"
                class="w-4 h-4 text-primary rounded border-gray-300 focus:ring-primary"
              />
              <label for="confirm-checkbox" class="ml-2 block text-sm text-gray-700">
                I understand this action cannot be undone
              </label>
            </div>
            
            <div class="flex space-x-4">
              <a
                href="rooms.jsp"
                class="px-6 py-2 border border-gray-300 text-gray-700 rounded hover:bg-gray-50 !rounded-button whitespace-nowrap"
              >
                Cancel
              </a>
              <button
                id="deleteButton"
                disabled
                class="px-6 py-2 bg-red-500 text-white rounded hover:bg-red-600 !rounded-button whitespace-nowrap disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Delete Room Permanently
              </button>
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
    
    <div
      id="successModal"
      class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
    >
      <div class="bg-white rounded-lg p-6 max-w-md w-full">
        <div class="flex items-center justify-center mb-4 text-green-500">
          <div class="w-12 h-12 flex items-center justify-center">
            <i class="ri-checkbox-circle-line text-3xl"></i>
          </div>
        </div>
        <h3 class="text-lg font-medium text-center text-gray-900 mb-2">
          Room Deleted Successfully
        </h3>
        <p class="text-gray-600 text-center mb-6">
          Room #1024 has been permanently removed from the system.
        </p>
        <div class="flex justify-center">
          <a
            href="rooms.jsp"
            class="px-4 py-2 bg-primary text-white rounded hover:bg-primary/90 !rounded-button whitespace-nowrap"
            >Return to Room List</a
          >
        </div>
      </div>
    </div>
    
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const confirmCheckbox = document.getElementById("confirm-checkbox");
        const deleteButton = document.getElementById("deleteButton");
        const successModal = document.getElementById("successModal");
        
        // Enable/disable delete button based on checkbox
        confirmCheckbox.addEventListener("change", function() {
          deleteButton.disabled = !this.checked;
        });
        
        // Handle delete action
        deleteButton.addEventListener("click", function() {
          // In a real application, you would send a delete request to your server here
          // For demonstration, we'll just show the success modal
          successModal.classList.remove("hidden");
        });
      });
    </script>
  </body>
</html>