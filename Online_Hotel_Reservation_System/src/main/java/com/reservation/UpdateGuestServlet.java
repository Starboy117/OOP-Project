package com.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateGuestServlet")
public class UpdateGuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phnNo");
		String Email = request.getParameter("Email");
		String idNo = request.getParameter("idNo");
		String checkOutdate = request.getParameter("checkOutdate");
		
		boolean isSuccess =CheckInControl.updateGuest(name, phone, Email, idNo, checkOutdate);
		
		if(isSuccess == true){
			request.setAttribute("Message","Successfully Updated");
			RequestDispatcher dis = request.getRequestDispatcher("guests.jsp");
			dis.forward(request, response);
		}
		
		else {
			request.setAttribute("Message","Update Failed");
			RequestDispatcher dis = request.getRequestDispatcher("guest.jsp");
			dis.forward(request, response);
		}
		
		
	}

}
