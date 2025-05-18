package com.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertReservationServlet")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer roomId = (Integer) request.getAttribute("roomId");
		Integer userId = (Integer) request.getAttribute("userId");
		String checkinDate = (String) request.getAttribute("checkInDate");
		String checkoutDate = (String) request.getAttribute("checkOutDate");
		String status = "pending";
		
		
		
	
	}

}
