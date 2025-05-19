package com.reservation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/getReservationServlet")
public class getReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		try {
			
			List<Reservations> reservations = reservationControll.getReservations(userId);
			
			if(reservations != null && !reservations.isEmpty()) {
				
				request.setAttribute("reservations", reservations);
				RequestDispatcher dis = request.getRequestDispatcher("viewReservation.jsp");
	            dis.forward(request, response);
			}
			else {
				
				RequestDispatcher dis = request.getRequestDispatcher("viewReservation.jsp");
	            dis.forward(request, response);
			}
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
