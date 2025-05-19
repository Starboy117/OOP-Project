package com.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/viewcheckInServlet")
public class viewcheckInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Guest> guestList = CheckInControl.viewGuestDetails();
		
		if(guestList != null || !guestList.isEmpty()) {
			request.setAttribute("guests",guestList);
			RequestDispatcher dis = request.getRequestDispatcher("guest.jsp");
			dis.forward(request, response);
			
		}
		else {
			request.setAttribute("Message","Guest Not Available");
			RequestDispatcher dis = request.getRequestDispatcher("check-inout.jsp");
			dis.forward(request, response);
			
		}
	}

}
