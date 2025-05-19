package com.staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.UserDBUtil;


@WebServlet("/editStaffServlet")
public class editStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String sUserName = request.getParameter("initial_username");
		
		
		int user_id = Integer.parseInt(id);
		
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";


		if (name == null || name.trim().isEmpty() ||
		    username == null || username.trim().isEmpty() ||
		    email == null || email.trim().isEmpty() || 
		    password == null || password.trim().isEmpty()
		    || role == null || role.trim().isEmpty()) {
		    
		  
		   
		    request.setAttribute("userEditError", "**All fields are required.");
		    RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
        	dis.forward(request, response);
			
		    
		    return; 
		}
		
		if(!email.matches(emailRegex)) {
			
			 request.setAttribute("userEditError", "**Invalid email format");
			 RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
         	dis.forward(request, response);
				
			 
			 return; 
			
		}
		
		
        
        if(password.length()<6) {
        	
        	request.setAttribute("userEditError", "**Password too short.");
        	RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
        	dis.forward(request, response);
			
		    
		    return; 
        	
        	
        }
        
        if(!username.endsWith("@tendura_staff")) {
        	
        	
        	request.setAttribute("userEditError", "**Invalid username format. Username should end with '@tendura_staff'.");
        	RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
        	dis.forward(request, response);
			
        	
        }
		
		
		

		
		
		
		boolean isTrue;
		iStaffUtil istaffDButil = new staffDBUtill();
		boolean check = istaffDButil.checkUsername(username);
		
		if(sUserName.equals(username)) {
			
			check = true;
		}
		
		try {
			
			if(check == true) {
			
				isTrue=istaffDButil.updateStaffDetails(user_id, name, username, email, password,role);
			
				if(isTrue == true) {
					
					request.setAttribute("user_id", user_id);
					request.setAttribute("user_name", name);
					request.setAttribute("user_username", username);
					request.setAttribute("user_email", email);
					request.setAttribute("user_password", password);
					request.setAttribute("user_role", role);
					
					RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
	            	dis.forward(request, response);
	   
				
					
				}
				else {
					
					
					request.setAttribute("userEditError", "**Something Went wrong!");
					RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
	            	dis.forward(request, response);
					
				}
			
			}
			else {
				
				request.setAttribute("userEditError", "**Username already taken");
				RequestDispatcher dis = request.getRequestDispatcher("editStaff.jsp");
            	dis.forward(request, response);
				
				
				
			}
			
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
	}
	
	
		
	

}
