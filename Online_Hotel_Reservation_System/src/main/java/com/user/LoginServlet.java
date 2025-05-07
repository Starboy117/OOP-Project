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

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/log")
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
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Try again.");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }
    	}
}
