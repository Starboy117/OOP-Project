package com.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/InsertReservationServlet")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer roomId = (Integer) request.getAttribute("roomId");
		Integer userId = (Integer) request.getAttribute("userId");
		String checkinDate = (String) request.getAttribute("checkIn");
		String checkoutDate = (String) request.getAttribute("checkOut");
		String status = "pending";
		Integer payId = (Integer) request.getAttribute("payId");
		
		
		boolean isSuccess = reservationControll.insertReservationDetails(userId, roomId, checkinDate, checkoutDate, status, payId);
		
		if(isSuccess==true) {
			
			
			response.sendRedirect("PaymentStatus.jsp?status=success");
			
		}
		else {
			
			response.sendRedirect("PaymentStatus.jsp?status=failure");
		}
	
	}

}
