package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.staff.Staff;
import com.staff.staffDBUtill;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        if (userName == null || userName.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("error", "Username and password cannot be empty.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        try {
            HttpSession session = request.getSession();

            if (userName.endsWith("@tendura_staff")) {
                // Staff login
                List<Staff> staffDetails = staffDBUtill.validateStaff(userName, password);

                if (staffDetails != null && !staffDetails.isEmpty()) {
                    Staff staff = staffDetails.get(0);

                    if ("System admin".equalsIgnoreCase(staff.getRole())) {
                        session.setAttribute("staffId", staff.getId());
                        session.setAttribute("name", staff.getName());
                        session.setAttribute("username", staff.getUsername());
                        session.setAttribute("email", staff.getEmail());
                        session.setAttribute("pass", staff.getPassword());
                        session.setAttribute("role", staff.getRole());

                        response.sendRedirect("adminDashboardServlet");
                    } else {
                        request.setAttribute("error", "Unauthorized staff role.");
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "**Invalid staff credentials.");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }

            } else {
               
            	IUserDBUtil iuserDBUtill = new UserDBUtil(); 
                List<User> userDetails = iuserDBUtill.validateUser(userName, password);

                if (userDetails != null && !userDetails.isEmpty()) {
                    User user = userDetails.get(0);

                    session.setAttribute("userId", user.getId());
                    session.setAttribute("name", user.getName());
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("email", user.getEmail());
                    session.setAttribute("pass", user.getPassword());

                    response.sendRedirect("Home.jsp");
                } else {
                    request.setAttribute("error", "**Invalid Username or password.");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Try again.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
