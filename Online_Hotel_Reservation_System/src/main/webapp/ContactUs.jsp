<%@ page import="com.contact.ContactMessage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Get messages from request attribute
    List<ContactMessage> messages = (List<ContactMessage>) request.getAttribute("messages");
    if (messages == null) {
        messages = new ArrayList<>();
    }
    
    // Get success/error messages from parameters
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    
    ContactMessage messageToEdit = (ContactMessage) request.getAttribute("messageToEdit");
    
%>



<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tendura - Contact Us</title>
  <link rel="icon" href="images/tendura1.png" type="image/png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="css/ContactUs.css" rel="stylesheet" />
  <script  src="js/ContactUs.js" defer></script>
  <link href="css/home.css" rel="stylesheet" />
 

</head>

<body class="d-flex flex-column">
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
          <a class="nav-link active custom" href="ContactUs.jsp">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link custom" href="#">FAQs</a>
        </li>
        
       </ul>
      </div>
     </nav>
    <div class="image-container" >
  		
    
	
	<div class="contant">
		<div class="contact-info">

			<h3>Get in Touch</h3>

			<p>
				<strong>Phone:</strong> +94 11 234 5678 (24/7 Support)
			</p>
			<p>
				<strong>Email:</strong> support@tendurahotel.com
			</p>
			<p>
				<strong>Address:</strong> No. 10, Paradise Street, Colombo 03, Sri
				Lanka
			</p>

		</div>

		<div class="contact-form">

			<h3>Send Us a Message</h3>

			<% if (success != null) { %>
			<div class="alert alert-success"><%= success %></div>
			<% } %>

			<% if (error != null) { %>
			<div class="alert alert-danger"><%= error %></div>
			<% } %>

				<form id="contactForm"
					action="<%=messageToEdit != null ? "updateMessage" : "contact"%>"
					method="post">

					<%
					if (messageToEdit != null) {
					%>
					<input type="hidden" name="id" value="<%=messageToEdit.getId()%>" />
					<%
					}	
					%>


					<div class="form-group">

						<label for="name">Full Name</label> <input type="text" id="name"
							name="name"
							value="<%=messageToEdit != null ? messageToEdit.getName() : ""%>"
							<%=messageToEdit != null ? "readonly" : "required"%> />

					</div>

					<div class="form-group">

						<label for="email">Email Address</label> <input type="email"
							id="email" name="email"
							value="<%=messageToEdit != null ? messageToEdit.getEmail() : ""%>"
							<%=messageToEdit != null ? "readonly" : "required"%> />
					</div>

					<div class="form-group">

						<label for="message">Message</label>
						<textarea id="message" name="message" rows="5" required><%=messageToEdit != null ? messageToEdit.getMessage() : ""%></textarea>
					</div>

					<button type="submit" id="submitBtn">
						<%=messageToEdit != null ? "Update Message" : "Send Message"%>
					</button>

					<%
					if (messageToEdit != null) {
					%>
					<a href="getMessages" class="btn btn-secondary">Cancel</a>
					<%
					}
					%>

				</form>

			</div>

		<div class="message-list" id="messageList">

			<h3>Submitted Messages</h3>

				<%
				if (messages.isEmpty()) {
				%>
				<p>No messages yet.</p>
				<%
				} else {
				%>
				<%
				for (ContactMessage message : messages) {
				%>
				<div class="message-item card mb-3">
					<div class="card-body">
						<h5 class="card-subtitle mb-2 text-muted"><%=message.getName()%></h5>
						<h6 class="card-subtitle mb-2 text-muted"><%=message.getEmail()%></h6>
						<p class="card-subtitle mb-2 text-muted"><%=message.getMessage()%></p>
						<p class="card-text">
							<small class="text-muted">Submitted on: <%=message.getSubmissionDate()%></small>
						</p>

						<div class="actions">

							<<a href="getMessages?editId=<%=message.getId()%>"
								class="btn btn-sm btn-warning">Edit</a>

							<form action="deleteMessage" method="post"
								style="display: inline;">
								<input type="hidden" name="id" value="<%=message.getId()%>" />

								<button type="submit" class="btn btn-sm btn-danger">Delete</button>

							</form>
						</div>
					</div>
				</div>
				<%
			}
			%>
			<%
			}
			%>
		</div>
	</div>



	<footer class="text-dark text-center py-4 mt-5">
    <center>
      <hr style="width: 98%; border: 2px #422100;" class="mb-5">
    </center>
    <div class="container">
      <p class="mb-2">© 2025 Tendura Hotel. All rights reserved.</p>
      <p class="mb-3">
        <a href="#" class="text-black text-decoration-none">Privacy Policy</a> | 
        <a href="#" class="text-black text-decoration-none">Terms of Service</a>
      </p>
			<div>
				<a href="#" class="text-dark mx-2"> <i class="bi bi-facebook"></i>
					Facebook
				</a> <a href="#" class="text-dark mx-2"> <i class="bi bi-twitter"></i>
					Twitter
				</a> <a href="#" class="text-dark mx-2"> <i class="bi bi-instagram"></i>
					Instagram
				</a>
			</div>
		</div>
  </footer>
  
  </div>
  
</body>

</html>