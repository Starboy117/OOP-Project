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

import com.user.User;

@WebServlet("/userManageServlet")
public class userManageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	iStaffUtil istaffDButil = new staffDBUtill();
        List<User> userList = istaffDButil.getAllUsers();
        
       // System.out.println("Users fetched: " + userList);


        if (userList != null && !userList.isEmpty()) {
            request.setAttribute("usersTotal", userList);
        } else {
            request.setAttribute("usersTotal", new ArrayList<>());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("userManage.jsp");
        dispatcher.forward(request, response);
    }
}

