package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userInsertServlet
 */
//@WebServlet("/userInsertServlet")
public class userInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name =request.getParameter("name");
		String userName = request.getParameter("uname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("cPassword");
		
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
		
		
		if(!password.equals(cPassword)) {
			
			request.setAttribute("error", "Passwords don't match.");
            RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
            dis.forward(request, response);
            return;
		}
		
		
		try {
			
			boolean check = UserDBUtil.checkUsername(userName);
		
			
		if(check==true) {
			
			boolean msg = UserDBUtil.insertUserDetails(name, userName, email, password);
			
			if(msg==true) {
				
				response.sendRedirect("Login.jsp?success=1");
				
			}
			else {

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
