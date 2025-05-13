package com.staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.UserDBUtil;

@WebServlet("/editUserServlet")
public class editUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String sUserName = request.getParameter("initial_username");
		
		int user_id = Integer.parseInt(id);
		
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";


		if (name == null || name.trim().isEmpty() ||
		    username == null || username.trim().isEmpty() ||
		    email == null || email.trim().isEmpty() || 
		    password == null || password.trim().isEmpty()) {
		    
		  
		   
		    request.setAttribute("formError", "**All fields are required.");
		    
		    return; 
		}
		
		if(!email.matches(emailRegex)) {
			
			 request.setAttribute("emailError", "**Invalid email format");
			 
			 return; 
			
		}
		
		
        
        if(password.length()<6) {
        	
        	request.setAttribute("passwordError", "**Password too short.");
		    
		    return; 
        	
        	
        }
		
		
		

		
		
		
		boolean isTrue;
		boolean check = UserDBUtil.checkUsername(username);
		
		if(sUserName.equals(username)) {
			
			check = true;
		}
		
		try {
			
			if(check == true) {
			
				isTrue=staffDBUtill.updateUserDetails(user_id, name, username, email, password);
			
				if(isTrue == true) {
					
					request.setAttribute("user_id", user_id);
					request.setAttribute("user_name", name);
					request.setAttribute("user_username", username);
					request.setAttribute("user_email", email);
					request.setAttribute("user_password", password);
					
					RequestDispatcher dis = request.getRequestDispatcher("editUser.jsp");
	            	dis.forward(request, response);
				
					
				}
				else {
					
					RequestDispatcher dis = request.getRequestDispatcher("editUser.jsp");
	            	dis.forward(request, response);
					
				}
			
			}
			else {
				
				RequestDispatcher dis = request.getRequestDispatcher("editUser.jsp");
            	dis.forward(request, response);
				
				
			}
			
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("userProfile.jsp");
		}
		
		
	}

}
