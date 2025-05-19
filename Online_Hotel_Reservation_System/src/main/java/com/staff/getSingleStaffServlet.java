package com.staff;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.User;


@WebServlet("/getSingleStaffServlet")
public class getSingleStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		
		int id = Integer.parseInt(userId);
		
		iStaffUtil istaffDButil = new staffDBUtill();
		List<Staff> user = istaffDButil.getSingleStaff(id);
		
		System.out.println("Staff : " + user);
		
		try {
			
			if (user != null && !user.isEmpty()) {
				
				Staff user1 = user.get(0);
				
				request.setAttribute("user_id", user1.getId());
				request.setAttribute("user_name", user1.getName());
				request.setAttribute("user_username", user1.getUsername());
				request.setAttribute("user_email", user1.getEmail());
				request.setAttribute("user_password", user1.getPassword());
				request.setAttribute("user_role", user1.getRole());
				
				RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
            	dis.forward(request, response);
			}
			else {
				
				request.setAttribute("getUser_error", "Something went wrong!");
				RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
            	dis.forward(request, response);
				
				
			}
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
	}
	
	

}
