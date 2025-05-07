<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tendura</title>
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    <link href="css/login.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script  src="js/register.js" defer></script>
</head>

<body class="bg-light d-flex flex-column">

    <nav class="navbar custom navbar-light bg-light fixed-top" style="opacity: 90%;">
        <div class="logo1">
          <a href="Home.jsp" class="navbar-brand">
            <span class="fw-bold text-brown fs-1 text-s5">Tendura</span>
          </a>
        </div>
        <div class="tabs">
          <ul class="nav" style="margin: 0%;">
            <li class="nav-item">
              <a class="nav-link custom" href="Home.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link custom" href="#">About Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link custom" href="#">Contact Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link custom" href="#">FAQs</a>
            </li>
          </ul>
        </div>
      </nav>
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>

    <form class="d-flex justify-content-center align-items-center vh-100" onsubmit="return validateForm()" method="post" action="insert" id="regForm" >
        <div class="container custom shadow bg-white rounded-3">
            <h1 class="p-4 text-brown">Register</h1>
            <% String error = (String) request.getAttribute("error"); %>
			<% if (error != null) { %>
			  <p style="color:red;"><%= error %></p>
			<% } %>
            <div>
                <input class="input1  rounded" type="text" placeholder="Name" name="name" id="name"><br>
                <p id="msg1" style="color:red;"></p>
                <input class="input1  rounded" type="text" placeholder="Username" name="uname" id="uname"><br>
                <p id="msg2" style="color:red;"></p>
                <input class="input1  rounded" type="email" placeholder="Email" name="email" id="email"><br>
                <p id="msg3" style="color:red;"></p>
                <input class="input1  rounded" type="text" placeholder="Password" name="password" id="password"><br>
                <p id="msg4" style="color:red;"></p>
                <input class="input1  rounded" type="password" placeholder="Confirm Password" name="cPassword" id="cPassword"><br>
                <p id="msg5" style="color:red;"></p>
                <button  class="m-5 btn-brown btn-lg" type="submit" name="submit" id="submit">Register</button><br>
               
            </div>
            <p class="pb-5">Already have an account? <a href="Login.jsp">Login</a></p>
           
        </div>
    </form>
    
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
        <a href="#" class="text-brown mx-2">
          <i class="bi bi-facebook"></i> Facebook
        </a>
        <a href="#" class="text-brown mx-2">
          <i class="bi bi-twitter"></i> Twitter
        </a>
        <a href="#" class="text-brown mx-2">
          <i class="bi bi-instagram"></i> Instagram
        </a>
      </div>
    </div>
  </footer>
  
  
</body>
</html>