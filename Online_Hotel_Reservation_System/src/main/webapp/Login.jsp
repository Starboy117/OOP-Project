<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tendura - Login</title>
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    <link href="css/login.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
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
              <a class="nav-link custom" href="faqs.jsp">FAQs</a>
            </li>
          </ul>
        </div>
      </nav>
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>

    <form method="post" action="log" class="d-flex justify-content-center align-items-center vh-100">
        <div class="container custom shadow bg-white rounded-3">
            <h1 class="p-4 text-brown">Login</h1>
            <% String error = (String) request.getAttribute("error"); %>
			<% if (error != null) { %>
			  <p style="color:red;"><%= error %></p>
			<% } %>
            <div>
                <input class="input1 border rounded" type="text" name="username" placeholder="Username" ><br>
                <input class="input1 border rounded" type="password" name="password" placeholder="********" ><br>
                <button  class="m-5 btn-brown btn-lg" type="submit" name="submit" >Login</button><br>
               
            </div>
            <p class="pb-5">Don't have an account? <a href="Register.jsp">Register</a></p>
           
        </div>
    </form>
    
    
      <footer class="bg-light text-brown text-center py-4 mt-5">
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>
    <div class="container">
      <p class="mb-2">� 2025 Tendura Hotel. All rights reserved.</p>
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