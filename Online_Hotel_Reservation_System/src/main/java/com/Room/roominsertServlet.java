package com.Room;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/roominsertServlet")
public class roominsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String roomNumber = request.getParameter("roomNumber");
		String roomType = request.getParameter("roomType");
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		double price = Double.parseDouble(request.getParameter("price"));
		int floor = Integer.parseInt(request.getParameter("floor"));
		String status = request.getParameter("status");
		String features = request.getParameter("features");
		String description = request.getParameter("description");
		
				boolean isTrue = roomController.insertRoom(roomNumber, roomType, capacity, price, floor, status, features, description);

				if (isTrue) {
					response.sendRedirect("roomSuccess.jsp");
				} else {
					response.sendRedirect("roomInsertFail.jsp");
				}
			}
	}

