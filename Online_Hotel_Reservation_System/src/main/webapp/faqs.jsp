<%@ page language="java" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tendura - FAQs</title>
  <link rel="icon" href="images/tendura1.png" type="image/png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/home.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>

<body class="bg-light d-flex flex-column">
  <!-- Navbar (copied from homepage) -->
  <nav class="navbar custom navbar-light bg-light fixed-top" style="opacity: 90%;">
    <div class="logo1">
      <a href="Home.jsp" class="navbar-brand">
        <span class="fw-bold text-brown fs-1 text-s5">Tendura</span>
      </a>
    </div>
    <div class="tabs">
      <ul class="nav" style="margin: 0%;">
        <li class="nav-item"><a class="nav-link custom" href="Home.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link custom" href="">About Us</a></li>
        <li class="nav-item"><a class="nav-link custom" href="#">Contact Us</a></li>
        <li class="nav-item"><a class="nav-link active custom" href="faqs.jsp">FAQs</a></li>
      </ul>
    
  </nav>

  <!-- Main Content -->
  <main class="container my-5 pt-5">
    <h1 class="text-center text-brown fw-bold mb-4 mt-5">Frequently Asked Questions</h1>
    <div class="accordion" id="faqAccordion">

      <div class="accordion-item">
        <h2 class="accordion-header" id="q1">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#a1">
            How do I make a reservation?
          </button>
        </h2>
        <div id="a1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            You can make a reservation by clicking the "Book Now" button on the homepage and selecting your dates and room preferences.
          </div>
        </div>
      </div>

      <div class="accordion-item">
        <h2 class="accordion-header" id="q2">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a2">
            What is the cancellation policy?
          </button>
        </h2>
        <div id="a2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Cancellations are free up to 48 hours before check-in. After that, a one-night fee applies.
          </div>
        </div>
      </div>

      <div class="accordion-item">
        <h2 class="accordion-header" id="q3">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a3">
            Are pets allowed?
          </button>
        </h2>
        <div id="a3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Yes, we are pet-friendly. Please notify us in advance when booking.
          </div>
        </div>
      </div>

      <div class="accordion-item">
        <h2 class="accordion-header" id="q4">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a4">
            Is breakfast included?
          </button>
        </h2>
        <div id="a4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
          <div class="accordion-body">
            Yes, complimentary breakfast is included in all our room bookings.
          </div>
        </div>
      </div>
      
      <div class="accordion-item">
  <h2 class="accordion-header" id="q5">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a5">
      Can I modify my reservation after booking?
    </button>
  </h2>
  <div id="a5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
    <div class="accordion-body">
      Yes, you can modify your reservation details by logging into your account and selecting "My Reservations". Changes are allowed up to 24 hours before check-in.
    </div>
  </div>
</div>

<div class="accordion-item">
  <h2 class="accordion-header" id="q6">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a6">
      Do I need to create an account to make a reservation?
    </button>
  </h2>
  <div id="a6" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
    <div class="accordion-body">
      Yes, creating an account allows us to securely manage your bookings and provide personalized services.
    </div>
  </div>
</div>

<div class="accordion-item">
  <h2 class="accordion-header" id="q7">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a7">
      How can I check the status of my booking?
    </button>
  </h2>
  <div id="a7" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
    <div class="accordion-body">
      You can check your booking status by logging into your account and navigating to the "My Reservations" section.
    </div>
  </div>
</div>

<div class="accordion-item">
  <h2 class="accordion-header" id="q8">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a8">
      What payment methods do you accept?
    </button>
  </h2>
  <div id="a8" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
    <div class="accordion-body">
      We accept credit cards, debit cards, and UPI. Online payments are processed securely through our payment gateway.
    </div>
  </div>
</div>

<div class="accordion-item">
  <h2 class="accordion-header" id="q9">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a9">
      Will I receive a confirmation email?
    </button>
  </h2>
  <div id="a9" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
    <div class="accordion-body">
      Yes, once your reservation is confirmed, we will send a confirmation email to your registered email address with all the details.
    </div>
  </div>
</div>
      

    </div>
  </main>

  <!-- Footer -->
  <footer class="bg-light text-brown text-center py-4 mt-5">
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>
    <div class="container">
      <p class="mb-2">© 2025 Tendura Hotel. All rights reserved.</p>
      <p class="mb-3">
        <a href="#" class="text-brown text-decoration-none">Privacy Policy</a> | 
        <a href="#" class="text-brown text-decoration-none">Terms of Service</a>
      </p>
      <div>
        <a href="#" class="text-brown mx-2"><i class="bi bi-facebook"></i> Facebook</a>
        <a href="#" class="text-brown mx-2"><i class="bi bi-twitter"></i> Twitter</a>
        <a href="#" class="text-brown mx-2"><i class="bi bi-instagram"></i> Instagram</a>
      </div>
    </div>
  </footer>

  <script>
    var checkId = 0;
    <% if (userId != null && userId != 0) { %> checkId = 1; <% } %>
    if (checkId === 1) {
      document.getElementById("profile").style.display = "block";
      document.getElementById("login").style.display = "none";
      document.getElementById("register").style.display = "none";
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
