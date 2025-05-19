package com.staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteStaffServlet")
public class deleteStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String staff_id = request.getParameter("id");
		
		int id = Integer.parseInt(staff_id);
		
		
		
		
		try {
			
			iStaffUtil istaffDButil = new staffDBUtill();
			
			boolean isSuccess = istaffDButil.deleteStaff(id); 
			
			if(isSuccess == true) {
				
				request.getSession(false).setAttribute("successMessage", "success");
				response.sendRedirect("getStaff");
			}
			else {
				
				request.getSession(false).setAttribute("successMessage", "error");
				response.sendRedirect("getStaff");
				
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}

	}

	

}
