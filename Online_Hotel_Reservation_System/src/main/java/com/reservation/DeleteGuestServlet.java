package com.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteGuestServlet")
public class DeleteGuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		boolean isTrue;
		
		HttpSession session = request.getSession(false);
		
		isTrue = CheckInControl.deleteGuest(id);
		if(isTrue == true) {
			session.setAttribute("successMessage", "success");
			response.sendRedirect("guestView");
			
		}
		else {
			session.setAttribute("successMessage", "error");
			response.sendRedirect("guestView");
			
		}
	}

}
