package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Integer id =(Integer) session.getAttribute("userId");
		String sUserName = (String) session.getAttribute("username");
		
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";


		if (name == null || name.trim().isEmpty() ||
		    username == null || username.trim().isEmpty() ||
		    email == null || email.trim().isEmpty()) {
		    
		  
		   
		    session.setAttribute("formError", "**All fields are required.");
		    response.sendRedirect("userProfile.jsp");
		    return; 
		}
		
		if(!email.matches(emailRegex)) {
			
			 session.setAttribute("emailError", "**Invalid email format");
			 response.sendRedirect("userProfile.jsp");
			 return; 
			
		}
		
		
		

		
		
		
		boolean isTrue;
		boolean check = UserDBUtil.checkUsername(username);
		
		if(sUserName.equals(username)) {
			
			check = true;
		}
		
		try {
			
			if(check == true) {
			
				isTrue=UserDBUtil.updateUserDetails(id, name, username, email);
			
				if(isTrue == true) {
				
					session.setAttribute("name", name);
					session.setAttribute("username", username);
			    	session.setAttribute("email", email);
			    	response.sendRedirect("userProfile.jsp");
			    	session.setAttribute("usernameError", null);
				}
				else {
				
					response.sendRedirect("userProfile.jsp");
				}
			
			}
			else {
				
				session.setAttribute("usernameError", "**Username already taken");
				response.sendRedirect("userProfile.jsp");
				
				
			}
			
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("userProfile.jsp");
		}
		
		
		
		
	
	}

}
