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
        
    
        double amount = Double.parseDouble(request.getParameter("amount"));
        String method = request.getParameter("payment_method");
        String roomId = request.getParameter("roomId");
        String userId = request.getParameter("userId");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        
        
        int room_id=Integer.parseInt(roomId);
        int user_id=Integer.parseInt(userId);

        Payment payment = new Payment();
        
 
      
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

        	System.out.println("Amount: " + amount);
        	System.out.println("Method: " + method);

            int payId = paymentDAO.insertPayment(payment);
            request.setAttribute("payId", payId);
            request.setAttribute("roomId", room_id);
            request.setAttribute("userId",user_id);
            request.setAttribute("checkIn",checkInDate);
            request.setAttribute("checkOut", checkOutDate);
            request.getRequestDispatcher("makeReservation").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("PaymentStatus.jsp?status=failure");
        }
    }
}

