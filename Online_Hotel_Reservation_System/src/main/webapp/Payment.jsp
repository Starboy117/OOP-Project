
<!DOCTYPE html>


<%

Integer userId = (Integer) session.getAttribute("userId");


if(userId == null){
	
	response.sendRedirect("Login.jsp");
	return;
}

String roomId = request.getParameter("roomId");
String amount = request.getParameter("amount");
String nights = request.getParameter("nights");

String checkin = request.getParameter("checkIn") ;
String checkout = request.getParameter("checkOut") ;


double total = Double.parseDouble(amount)*Integer.parseInt(nights);


%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Tendura - Payment</title>
	
		<link rel="icon" href="images/tendura1.png" type="image/png" />
		<link href="css/login.css" rel="stylesheet" />
		<link href="css/Payment.css" rel="stylesheet" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="js/Payment.js" defer></script>
		
		
		

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
	
	<div class = "payment-wrapper">
		<h2>Complete Your Payment</h2>
		
		<form id = "paymentForm" action = "pay" method = "post">
		
			<input type="hidden" name="roomId" value=<%=roomId %>>
			<input type="hidden" name="userId" value=<%=userId %>>
			<input type="hidden" name="checkInDate" value=<%=checkin %>>
			<input type="hidden" name="checkOutDate" value=<%=checkout %>>
			
			<div class = "input-details">
			
				<label for = "amount">Amount(LKR)</label>
				<input type = "number" id = "amount" name="amount" value="<%=total%>" required readonly>
			</div>
			
			<div class = "input-details">
			
				<label for = "payment_method">Payment Method</label>
				
				<select id="payment_method" name="payment_method" required onchange="SelectPaymentMethod()">
  
  					<option value="">Select a Payment Method</option>
  					<option value="Card">Card</option>
  					<option value="EzCash">EzCash</option>

				</select>
			
			</div>
			
			<div class="card-details" id="card-details" style="display:none;">
			
				<div class="input-group">
          
          			<label for="card_name">Cardholder Name</label>
          			<input type="text" id="card_name" name="card_name">
        		
        		</div>
			
				<div class = "input-details">
			
					<label for = "card_number">Card Number</label>
					<input type = "text" id = "card_number" name = "card_number" maxlength="16">
			
				</div>
			
				<div class = "input-row">
				
				  <div class = "input-details">
				  
					<label for = "expiry_date" >Expiry Date</label>
					<input type = "month" id = "expiry_date" name = "expiry_date"> 	
				  
				  </div>
				
				  <div class = "input-details">
				
					<label for = "cvv">CVV</label>
					<input type = "password" id = "cvv" name = "cvv" maxlength="3">
				
				  </div>
			
			</div>
			
			</div>
			
			<div id="ezcash-details" style="display:none;">
			
			
        	  <div class="input-details">
        	  
          		<label for="mobile_number">Mobile Number</label>
          		<input type="text" id="mobile_number" name="mobile_number">
        
        	  </div>
      		
      		</div>
			
		   <button type="submit" name="submit" id="submit">Submit Payment</button>
		   	
		</form>
		
	</div>
	
	
	

	
</body>

</html>