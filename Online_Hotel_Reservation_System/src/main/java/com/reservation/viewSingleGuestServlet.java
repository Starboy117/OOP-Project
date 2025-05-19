package com.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/viewSingleGuestServlet")
public class viewSingleGuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		try {
			
			List<Guest> guest=CheckInControl.singleGuest(id);
			
			if(guest!=null||!guest.isEmpty()) {
				
				Guest g1 = guest.get(0);
				
				request.setAttribute("name", g1.getgName());
				request.setAttribute("phone", g1.getgPhn());
				request.setAttribute("roomNo", g1.getRoomNo());
				request.setAttribute("date", g1.getcOutDate());
				
				
				RequestDispatcher dis = request.getRequestDispatcher("editGuest.jsp");
				dis.forward(request, response);
				
				
			}
			else {
				
				RequestDispatcher dis = request.getRequestDispatcher("editGuest.jsp");
				dis.forward(request, response);
				
				
				
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
