package com.staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.UserDBUtil;


@WebServlet("/addStaffServlet")
public class addStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name =request.getParameter("name");
		String userName = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
		
		if (name == null || name.isEmpty() ||
			    userName == null || userName.isEmpty() ||
			    email == null || email.isEmpty() ||
			    password == null || password.isEmpty() ||
			    role == null || role.isEmpty()) {
				request.setAttribute("error", "All fields are required.");
            	RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
            	dis.forward(request, response);
			    return;
			}
		
		if(!email.matches(emailRegex)) {
			
			 request.setAttribute("error", "**Invalid email format");
			 RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
        	dis.forward(request, response);
				
			 
			 return; 
			
		}
		
		
       
       if(password.length()<6) {
       	
       	request.setAttribute("error", "**Password too short.");
       	RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
       	dis.forward(request, response);
			
		    
		    return; 
       	
       	
       }
       
       if(!userName.endsWith("@tendura_staff")) {
       	
       	
       	request.setAttribute("error", "**Invalid username format. Username should end with '@tendura_staff'.");
       	RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
       	dis.forward(request, response);
			
       	
       }
		
	
		
		try {
			
			boolean check = staffDBUtill.checkUsername(userName);
		
			
		if(check==true) {
			
			boolean msg = staffDBUtill.insertStaffDetails(name, userName, email, password, role);
			
			if(msg==true) {
				
				request.setAttribute("successMessage", "success");
				RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
	            dis.forward(request, response);
				
				
			}
			else {

				request.setAttribute("successMessage", "error");
	            RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
	            dis.forward(request, response);
				
				
				}
			}
		else {
			request.setAttribute("error", "Username already taken.");
            RequestDispatcher dis = request.getRequestDispatcher("addStaff.jsp");
            dis.forward(request, response);
			
		}
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
	}

		
	

}
