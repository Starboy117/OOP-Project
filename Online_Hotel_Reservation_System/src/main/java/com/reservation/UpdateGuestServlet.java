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
		
		String cid = request.getParameter("id");
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String phnNo = request.getParameter("phnNo");
		String roomNo = request.getParameter("roomNo");
		String checkOutdate = request.getParameter("checkOutdate");
		
		boolean isSuccess =CheckInControl.updateGuest(cid,name, nic, phnNo, roomNo, checkOutdate);
		
		if(isSuccess == true){
			
			response.sendRedirect("guestView");
		
		}
		
		else {
			request.setAttribute("error","Update Failed");
			RequestDispatcher dis = request.getRequestDispatcher("editGuest.jsp");
			dis.forward(request, response);
		}
		
		
	}

}
