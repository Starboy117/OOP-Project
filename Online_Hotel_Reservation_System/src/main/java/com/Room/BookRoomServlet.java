package com.Room;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String checkIn = request.getParameter("checkIn");
	    String checkOut = request.getParameter("checkOut");

	    try {
	        List<Room> roomList = roomController.getAvailableRooms(checkIn, checkOut);

	        if (roomList != null && !roomList.isEmpty()) {
	            request.setAttribute("rooms", roomList);
	            RequestDispatcher dis = request.getRequestDispatcher("book_room.jsp");
	            dis.forward(request, response);
	        } else {
	            // Optional: handle case where no rooms are available
	            request.setAttribute("message", "No available rooms for the selected dates.");
	            RequestDispatcher dis = request.getRequestDispatcher("book_room.jsp");
	            dis.forward(request, response);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


}
