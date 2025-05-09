<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

	Integer id = (Integer) session.getAttribute("userId");
	String name;
	String username;
	String email;
	String pass;
	String usernameError = (String) session.getAttribute("usernameError");
	String formError = (String) session.getAttribute("formError");
	String emailError = (String) session.getAttribute("emailError");
	String passwordError = (String) session.getAttribute("passwordError");
	
	if(id == null){
		
		response.sendRedirect("Login.jsp");
		return;
	}
	else{
		
		 name = (String) session.getAttribute("name");
		 username = (String) session.getAttribute("username");
		 email = (String) session.getAttribute("email");
		 pass = (String) session.getAttribute("pass");
	}
%>




<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tendura</title>
        <link rel="icon" href="images/tendura1.png" type="image/png" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="css/userProfile.css" rel="stylesheet">
    </head>

    <body>
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

        <div class="profile-container shadow-lg"> 

          <div class="design1">

          </div>

          <form id="form1" method="post" action="updateUser" >
            
              <div class="form-container">
                <fieldset disabled id="fieldset1">
                  <legend class="fs-1">User Detals</legend><br>
                  
                   <%if(formError != null) {%>
                  	<p style="color:red;"><%=formError %></p>
                  	<%session.removeAttribute("formError"); %>
                  <%} %>
                  
                  
                  <label class="fs-3">Name</label><br>
                  <input class="input1" type="text" name="name" value="<%=name %>"><br><br>

                  <label class="fs-3">Username</label><br>
                  
                  <%if(usernameError != null) {%>
                  	<p style="color:red;"><%=usernameError %></p>
                  	<%session.removeAttribute("usernameError"); %>
                  <%} %>
                  
                  <input class="input1" type="text" name="username" value="<%=username %>"><br><br>

                  <label class="fs-3">Email</label><br>
                  
                   <%if(emailError != null) {%>
                  	<p style="color:red;"><%=emailError %></p>
                  	<%session.removeAttribute("emailError"); %>
                  <%} %>
                  
                  
                  <input class="input1" type="text" name="email" value="<%=email %>"><br><br>
                </fieldset>

                <button type="button" class="btn custom bg-brown btn-lg border-0" id="edit-btn" onclick="updateProfile();">Edit <i class="bi bi-pencil"></i></button>
                <button type="submit" class="btn-success btn-lg border-0" style="display: none;margin-bottom:50px;" id="update-btn">Update <i class="bi bi-arrow-clockwise"></i>
                </button>
                </div>
            
            </form>

              <br><br>
              <hr style="margin: auto;">
              <br><br>

          <form id="form2" method="post" action="passwordChange">
            
              <div class="form-container" style="padding-bottom:50px;">
                <fieldset disabled id="fieldset2">
                  <legend class="fs-1">Change Password</legend><br>
                  
                   <%if(passwordError != null) {%>
                  	<p style="color:red;"><%=passwordError %></p>
                  	<%session.removeAttribute("passwordError"); %>
                  <%} %>
                  
                  
                  <label class="fs-3">Password</label><br>
                  <input class="input1" type="password" value="<%=pass %>" name="password"><br><br>

                  <label class="fs-3">Confirm Password</label><br>
                  <input class="input1" type="password" value="<%=pass %>" name="cPassword"><br><br>
                </fieldset>
                
                <button type="button" class="btn custom bg-brown btn-lg border-0" id="cp-btn" onclick="changePass();">Change Password</button>
                <button type="submit" class="btn-success btn-lg border-0" style="margin-bottom:50px;display:none" id="cp-update-btn">Change Password</button>
                  
              </div>
          
          </form>


        </div>

        <script src="js/userProfile.js"></script>
    </body>
    
   

    
</html>