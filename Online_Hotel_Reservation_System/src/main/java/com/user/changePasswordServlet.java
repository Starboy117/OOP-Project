package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		Integer id =(Integer) session.getAttribute("userId");
		
		
		String pass = request.getParameter("password");
        String cpass = request.getParameter("cPassword");
        
        if (pass == null || pass.trim().isEmpty() ||
        	    cpass == null || cpass.trim().isEmpty()) {
        	    
        	    session.setAttribute("passwordError", "**Password and confirm password cannot be empty");
        	    response.sendRedirect("userProfile.jsp");
        	    return;
        	}
        
        if(pass.length()<6) {
        	
        	session.setAttribute("passwordError", "**Password too short.");
		    response.sendRedirect("userProfile.jsp");
		    return; 
        	
        	
        }
        else if(!cpass.equals(pass)) {
        	
        	session.setAttribute("passwordError", "**Passwords don't match.");
		    response.sendRedirect("userProfile.jsp");
		    return; 
        	
        	
        }
        
        
        try {
        	
        	IUserDBUtil iuserDBUtill = new UserDBUtil(); 
        	boolean isTrue = iuserDBUtill.changedPasswordUpdate(id, pass);
        	
        	if(isTrue==true) {
        		
        		session.setAttribute("pass", pass);
    		    response.sendRedirect("userProfile.jsp");
    		   
        	}
        	else {
        		
        		session.setAttribute("passwordError", "**An unknown error occured : Change password failed");
    		    response.sendRedirect("userProfile.jsp");
    		   
        	}
        	
        }
        catch(Exception e) {
        	
        	e.printStackTrace();
        }

	}

}
