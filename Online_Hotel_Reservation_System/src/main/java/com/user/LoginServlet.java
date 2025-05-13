package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.staff.Staff;
import com.staff.staffDBUtill;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (userName == null || userName.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Username and password cannot be empty.");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
            return;
        }
        
        try {
        	
        	
        	if(userName.endsWith("@tendura_staff")) {
        		
        		List<Staff> staffDetails = staffDBUtill.validateStaff(userName, password);
        		
        		if(staffDetails != null && !staffDetails.isEmpty()) {
        			
        			Staff staff = staffDetails.get(0);
        			
        			if(staff.getRole().trim().equals("System admin")) {
        				
        				HttpSession session = request.getSession();
        				session.setAttribute("staffId", staff.getId());
        				session.setAttribute("name", staff.getName());
        				session.setAttribute("username", staff.getUsername());
                    	session.setAttribute("email", staff.getEmail());
                    	session.setAttribute("pass", staff.getPassword());
                    	session.setAttribute("role", staff.getRole());
                    
                    	response.sendRedirect("adminDashboardServlet");
        			}
        			else {
        				
        				request.setAttribute("error", "no role.");
                    	RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
                    	dis.forward(request, response);
        			}
        		}
        		
        		
        	}
        	else {
        		
        		
        		List<User> userDetails = UserDBUtil.validateUser(userName, password);

           
            
            	if (userDetails != null && !userDetails.isEmpty()) {  
            	
            		User user = userDetails.get(0);
            		HttpSession session = request.getSession();
            		session.setAttribute("userId",user.getId());
                	session.setAttribute("name", user.getName());
                	session.setAttribute("username", user.getUsername());
                	session.setAttribute("email", user.getEmail());
                	session.setAttribute("pass", user.getPassword());
                
                	response.sendRedirect("Home.jsp");
            	} else {
            		request.setAttribute("error", "**Invalid Username or password.");
                	RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
                	dis.forward(request, response);
            	}
            
        	}
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Try again.");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }
    	}
}
