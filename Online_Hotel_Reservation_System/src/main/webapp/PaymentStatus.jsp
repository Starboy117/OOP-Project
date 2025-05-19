<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

Integer userId = (Integer) session.getAttribute("userId");


if(userId == null){
	
	response.sendRedirect("Login.jsp");
	return;
}

%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Status - Tendura</title>
    <link rel="icon" href="images/tendura1.png" type="image/png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light text-center d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">

<%

    String status = request.getParameter("status");
%>

<% if ("success".equalsIgnoreCase(status)) { %>
    <div class="alert alert-success" style="width: 400px;">
        <h4 class="alert-heading">Payment Successful!</h4>
        <p>Thank you for your reservation. We’ve received your payment.</p>
        <hr>
        <a href="Home.jsp" class="btn btn-success">Go to Home</a>
    </div>
<% } else if ("failure".equalsIgnoreCase(status)) { %>
    <div class="alert alert-danger" style="width: 400px;">
        <h4 class="alert-heading">Payment Failed!</h4>
        <p>Something went wrong. Please try again.</p>
        <hr>
        <a href="Payment.jsp" class="btn btn-danger">Retry Payment</a>
    </div>
<% } else { %>
    <div class="alert alert-warning" style="width: 400px;">
        <h4 class="alert-heading">Unknown Status</h4>
        <p>We couldn't determine the payment status.</p>
        <hr>
        <a href="Home.jsp" class="btn btn-warning">Go to Home</a>
    </div>
<% } %>

</body>
</html>
