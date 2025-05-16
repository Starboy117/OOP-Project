package com.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PaymentDAO paymentDAO;

    public void init() {
        paymentDAO = new PaymentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Integer reservationId = null;
        double amount = Double.parseDouble(request.getParameter("amount"));
        String method = request.getParameter("payment_method");

        Payment payment = new Payment();
        
 
      
        payment.setReservationId(reservationId);
        payment.setAmount(amount);
        payment.setPaymentMethod(method);

        if ("Card".equals(method)) {
            payment.setCardName(request.getParameter("card_name"));
            payment.setCardNumber(request.getParameter("card_number"));
            payment.setExpiryDate(request.getParameter("expiry_date"));
            payment.setCvv(request.getParameter("cvv"));
        } else if ("EzCash".equals(method)) {
            payment.setMobileNumber(request.getParameter("mobile_number"));
        }

        try {
        	
        	System.out.println("Inserting Payment:");
        	System.out.println("Reservation ID: " + reservationId);
        	System.out.println("Amount: " + amount);
        	System.out.println("Method: " + method);

            paymentDAO.insertPayment(payment);
            response.sendRedirect("Home.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Payment.jsp");
        }
    }
}

