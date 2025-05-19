package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/userInsertServlet")
public class userInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//capturing all form inputs
		String name =request.getParameter("name");
		String userName = request.getParameter("uname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("cPassword");
		
		
		//checking for null values to send error message
		if (name == null || name.isEmpty() ||
			    userName == null || userName.isEmpty() ||
			    email == null || email.isEmpty() ||
			    password == null || password.isEmpty() ||
			    cPassword == null || cPassword.isEmpty()) {
				request.setAttribute("error", "All fields are required.");
            	RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
            	dis.forward(request, response);
			    return;
			}
		
		
		//checking for matching password and confirm password
		if(!password.equals(cPassword)) {
			
			request.setAttribute("error", "Passwords don't match.");
            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
            dis.forward(request, response);
            return;
		}
		
		//checking whether user tries to use staff credential username
		if(userName.endsWith("@tendura_staff")) {
			
			request.setAttribute("error", "Username cannot end with '@tendura_staff'.");
            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
            dis.forward(request, response);
            return;
		}
		
		//implementing try-catch box to capture exceptions
		try {
			
			//creating control object to access control class
			IUserDBUtil iuserDBUtill = new UserDBUtil();
			
			//checking for duplicate usernames
			boolean check = iuserDBUtill.checkUsername(userName);
		
			
		if(check==true) {
			//inserting user details to database
			boolean msg = iuserDBUtill.insertUserDetails(name, userName, email, password);
			
			if(msg==true) {
				//redirecting to home page
				response.sendRedirect("Login.jsp");
				
			}
			else {
				//redirecting to register page if error
				request.setAttribute("error", "Registration failed.");
	            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
	            dis.forward(request, response);
				
				
				}
			}
		else {
			request.setAttribute("error", "Username already taken.");
            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
            dis.forward(request, response);
			
		}
		}
		catch(Exception e) {
			
			e.printStackTrace();
			request.setAttribute("error", "Something went wrong. Try again.");
            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
            dis.forward(request, response);
		}
	}

}