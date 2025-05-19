package com.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CancelReservationServlet")
public class CancelReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reserveId = request.getParameter("id");
		
		
		System.out.print("id : "+reserveId);
		
		 if (reserveId == null || reserveId.trim().isEmpty()) {
			 	request.setAttribute("msg", "late");
				RequestDispatcher dis = request.getRequestDispatcher("getUserReservation");
	            dis.forward(request, response);
	        }
		 
		
		
		
		try {
			 int id =Integer.parseInt(reserveId);
			boolean isSuccess = reservationControll.cancelReservation(id);
			
			if(isSuccess==true) {
				
				request.setAttribute("msg", "success");
				RequestDispatcher dis = request.getRequestDispatcher("getUserReservation");
	            dis.forward(request, response);
			}
			else {
				
				request.setAttribute("msg", "error");
				RequestDispatcher dis = request.getRequestDispatcher("getUserReservation");
	            dis.forward(request, response);
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}
