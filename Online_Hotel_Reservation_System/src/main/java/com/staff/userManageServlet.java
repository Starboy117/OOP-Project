package com.staff;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.User;


@WebServlet("/userManageServlet")
public class userManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> userList = staffDBUtill.getAllUsers();
		
//		System.out.println("room List in Servlet: " + userList);
		
		HttpSession session = request.getSession(false);
		
//		if (session == null) {
//            session = request.getSession(true); 
//        }
//		
		  if (userList != null && !userList.isEmpty()) {
		        session.setAttribute("usersTotal", userList);
		    } else {
		       session.setAttribute("usersTotal", new ArrayList<>()); 
		  }
		  
		  response.sendRedirect("userManage.jsp");
		    
	}

}
