package com.staff;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/staffManageServlet")
public class staffManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<Staff> staffList = staffDBUtill.getAllStaff();
		
		// System.out.println("Users fetched: " + staffList);


	        if (staffList != null && !staffList.isEmpty()) {
	            request.setAttribute("staffTotal",staffList);
	        } else {
	            request.setAttribute("staffTotal", new ArrayList<>());
	        }

	        RequestDispatcher dispatcher = request.getRequestDispatcher("staffManage.jsp");
	        dispatcher.forward(request, response);
	    
		
	}

}
