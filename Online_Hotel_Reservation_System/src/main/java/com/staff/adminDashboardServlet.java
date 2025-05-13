package com.staff;

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

import com.Room.Room;
import com.user.User;


@WebServlet("/adminDashboardServlet")
public class adminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    List<Integer> stats = staffDBUtill.getNumberofObjectsAdmin();
	    
//	    System.out.println("Stats retrieved from DB:");
//	    System.out.println("Total Users: " + stats.get(0));
//	    System.out.println("Total Staff: " + stats.get(1));
//	    System.out.println("Total Rooms: " + stats.get(2));
	    
	    List<User> userList = staffDBUtill.getUserOverview();
	    
	    List<Staff> staffList = staffDBUtill.getStaffOverview();
	    
	    List<Room> roomList = staffDBUtill.getRoomOverview();
	    
	    
//	    for (User user : userList) {
//	        System.out.println("User ID: " + user.getId() + ", Name: " + user.getName());
//	    }
	    
//	   System.out.println("room List in Servlet: " + roomList);

	    HttpSession session = request.getSession(false);
//	    if (session == null) {
//            session = request.getSession(true); 
//        }
	    
	    session.setAttribute("totalUsers", stats.get(0));
	    session.setAttribute("totalStaff", stats.get(1));
	    session.setAttribute("totalRooms", stats.get(2));
	    if (userList != null && !userList.isEmpty()) {
	        session.setAttribute("usersOverview", userList);
	    } else {
	        session.setAttribute("usersOverview", new ArrayList<>()); 
	    }
	    
	    
	    
	    if (staffList != null && !staffList.isEmpty()) {
	        session.setAttribute("staffOverview", staffList);
	    } else {
	        session.setAttribute("staffOverview", new ArrayList<>()); 
	    }
	    
	    
	    if (roomList != null && !roomList.isEmpty()) {
	        session.setAttribute("roomOverview", roomList);
	    } else {
	        session.setAttribute("roomOverview", new ArrayList<>()); 
	    }



	    response.sendRedirect("admin_dashboard.jsp");
	}
	
	



}
