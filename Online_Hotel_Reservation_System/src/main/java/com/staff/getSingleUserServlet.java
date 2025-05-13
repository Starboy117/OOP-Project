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


@WebServlet("/getSingleUserServlet")
public class getSingleUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		int id = Integer.parseInt(userId);
		
		List<User> user = staffDBUtill.getSingleUser(id);
		
		try {
			
			if (user != null && !user.isEmpty()) {
				
				User user1 = user.get(0);
				
				request.setAttribute("user_id", user1.getId());
				request.setAttribute("user_name", user1.getName());
				request.setAttribute("user_username", user1.getUsername());
				request.setAttribute("user_email", user1.getEmail());
				request.setAttribute("user_password", user1.getPassword());
				
				RequestDispatcher dis = request.getRequestDispatcher("editUser.jsp");
            	dis.forward(request, response);
			}
			else {
				
				
			}
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
