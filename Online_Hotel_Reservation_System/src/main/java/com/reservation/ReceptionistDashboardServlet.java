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

import com.Room.Room;
import com.staff.staffDBUtill;


@WebServlet("/ReceptionistDashboardServlet")
public class ReceptionistDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List<Integer> stats = reservationControll.getNumberofObjectsRep();
			
			List<Room> roomList = reservationControll.getRoomOverview();
			List<Reservations> reserveList = reservationControll.reserveOverview();
			List<Guest> guestList = reservationControll.guestOverview();
			
			System.out.println("stats : "+stats);
			
			request.setAttribute("totalReserve", stats.get(0));
	        request.setAttribute("totalGuests", stats.get(1));
	        request.setAttribute("totalRooms", stats.get(2));
	        
	        if (roomList != null && !roomList.isEmpty()) {
	            request.setAttribute("roomOverview", roomList);
	        } else {
	            request.setAttribute("roomOverview", new ArrayList<>()); 
	        }
	        
	        if (reserveList != null && !reserveList.isEmpty()) {
	            request.setAttribute("reserveOverview", reserveList);
	        } else {
	            request.setAttribute("reserveOverview", new ArrayList<>()); 
	        }
	        
	        if (guestList!= null && !guestList.isEmpty()) {
	            request.setAttribute("guestOverview", guestList);
	        } else {
	            request.setAttribute("guestOverview", new ArrayList<>()); 
	        }
	        
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("receptionist_dashboard.jsp");
	        dispatcher.forward(request, response);
			
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("receptionist_dashboard.jsp");
	        dispatcher.forward(request, response);
		}
		
	}

}
