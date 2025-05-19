package com.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteGuestServlet")
public class DeleteGuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		boolean isTrue;
		
		isTrue = CheckInControl.deleteGuest(id);
		if(isTrue == true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("guests.jsp");
			dispatcher.forward(request, response);
		}
		else {
			List<Guest> guestDetails = CheckInControl.getGuestDetails(id);
			request.setAttribute(guestDetails, guestDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("guests.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}
