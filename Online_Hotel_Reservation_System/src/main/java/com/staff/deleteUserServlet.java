package com.staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String user_id = request.getParameter("id");
		
		int id = Integer.parseInt(user_id);
		
		
		
		
		try {
			
			boolean isSuccess = staffDBUtill.deleteUser(id); 
			
			if(isSuccess == true) {
				
				request.getSession(false).setAttribute("successMessage", "success");
				response.sendRedirect("getUsers");
			}
			else {
				
				request.getSession(false).setAttribute("successMessage", "error");
				response.sendRedirect("getUsers");
				
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}

	}

}
