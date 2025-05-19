

<!DOCTYPE html>


<%

Integer userId = (Integer) session.getAttribute("userId");
String name = (String) session.getAttribute("name");


if(userId == null){
	
	response.sendRedirect("Login.jsp");
	return;
}
%>


<%@ page import="com.reservation.Reservations" %>
<%@ page import="java.util.List" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>View Reservation - Tendura Hotel</title>
  <link rel="icon" href="images/tendura1.png" type="image/png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>
  <link rel="stylesheet" href="css/viewReservation.css"/>
</head>

<body class="bg-light text-brown">

  <div class="container py-5">
    <h1 class="mb-4 text-center">Your Reservation Details</h1>
    
    <%
		  String status = (String) request.getAttribute("msg");
		  if ("success".equals(status)) {
		%>
		  <div class="alert alert-success alert-dismissible fade show" role="alert">
		    Reservation cancelled successfully!
		    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>
		<%
		  } else if ("error".equals(status)) {
		%>
		  <div class="alert alert-danger alert-dismissible fade show" role="alert">
		    Something went wrong while cancelling the reservation.
		    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		  </div>
		<%
		  }
		%>
    

    <%
    List<Reservations> reservation =(List<Reservations>) request.getAttribute("reservations");
    
    if (reservation != null) {
    
	    for(Reservations reserve : reservation){
	   
	   
	
	    
	    %>
	    
	    <div class="card shadow-lg reservation-card">
	      <div class="card-header bg-brown text-white d-flex justify-content-between align-items-center">
	        <span><i class="bi bi-person-fill me-2"></i> <%=name %></span>
	        <p><i class="bi bi-calendar-event me-2"></i> <%=reserve.getReservationDate() %></p>
	      </div>
	      <div class="card-body">
	        <p><strong>Reservation ID:</strong> <%=reserve.getId() %></p>
	        <p><strong>Check-In Date:</strong> <%=reserve.getCheckInDate() %></p>
	        <p><strong>Check-In Date:</strong> <%=reserve.getCheckOutDate() %></p>
	        <p><strong>Status:</strong> 
			  <span class="badge 
			    <% String s = reserve.getStatus(); 
			       if ("Confirmed".equalsIgnoreCase(s)) { %> bg-primary
			    <% } else if ("Pending".equalsIgnoreCase(s)) { %> bg-warning text-dark
			    <% } else if ("Checked-In".equalsIgnoreCase(s)) { %> bg-info text-dark
			    <% } else if ("Completed".equalsIgnoreCase(s)) { %> bg-success
			    <% } else if ("No-show".equalsIgnoreCase(s)) { %> bg-dark
			    <% } else if ("Canceled".equalsIgnoreCase(s)) { %> bg-danger
			    <% } else { %> bg-secondary
			    <% } %>">
			    <%= s %>
			  </span>
			</p>

	      </div>
	      <div class="card-footer d-flex justify-content-end gap-3">
	        
		       <button class="btn btn-outline-danger" onclick="showCancelModal(<%=reserve.getId() %>)">
				  <i class="bi bi-x-circle"></i> Cancel
				</button>

	        
	        <button class="btn btn-brown" onclick="printReservation()">
	          <i class="bi bi-printer-fill"></i> Print
	        </button>
	      </div>
	    </div>
	    
	    
	    <%
	    }
    }
	    %>

    <div class="text-center mt-4">
      <a href="Home.jsp" class="btn btn-outline-secondary">
        <i class="bi bi-arrow-left-circle"></i> Back to Home
      </a>
    </div>
  </div>
  
  
  <!-- Cancel Confirmation Modal -->
	<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content border-danger">
	      <div class="modal-header bg-danger text-white">
	        <h5 class="modal-title" id="cancelModalLabel">Cancel Reservation</h5>
	        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	        <p>Are you sure you want to <strong>cancel</strong> this reservation?</p>
	        <input type="hidden" id="cancelReservationId" />
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No, Go Back</button>
	        <button type="button" class="btn btn-danger" onclick="confirmCancel()">Yes, Cancel It</button>
	      </div>
	    </div>
	  </div>
	</div>
  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Store selected reservation ID and show modal
  function showCancelModal(id) {
    document.getElementById('cancelReservationId').value = id;
    let cancelModal = new bootstrap.Modal(document.getElementById('cancelModal'));
    cancelModal.show();
  }

  // Called when user confirms cancel
  function confirmCancel() {
    const id = document.getElementById('cancelReservationId').value;
    window.location.href = "cancelReservation?id=" + id;
  }

  function printReservation() {
    window.print();
  }
  

  setTimeout(function () {
    let alertEl = document.querySelector('.alert');
    if (alertEl) {
      let bsAlert = bootstrap.Alert.getOrCreateInstance(alertEl);
      bsAlert.close();
    }
  }, 5000);


</script>

  
  

</body>
</html>
