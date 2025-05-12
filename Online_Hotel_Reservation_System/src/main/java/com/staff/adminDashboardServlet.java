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

import com.Room.Room;
import com.user.User;

@WebServlet("/adminDashboardServlet")
public class adminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Integer> stats = staffDBUtill.getNumberofObjectsAdmin();

        List<User> userList = staffDBUtill.getUserOverview();
        List<Staff> staffList = staffDBUtill.getStaffOverview();
        List<Room> roomList = staffDBUtill.getRoomOverview();

        request.setAttribute("totalUsers", stats.get(0));
        request.setAttribute("totalStaff", stats.get(1));
        request.setAttribute("totalRooms", stats.get(2));

        if (userList != null && !userList.isEmpty()) {
            request.setAttribute("usersOverview", userList);
        } else {
            request.setAttribute("usersOverview", new ArrayList<>()); 
        }

        if (staffList != null && !staffList.isEmpty()) {
            request.setAttribute("staffOverview", staffList);
        } else {
            request.setAttribute("staffOverview", new ArrayList<>()); 
        }

        if (roomList != null && !roomList.isEmpty()) {
            request.setAttribute("roomOverview", roomList);
        } else {
            request.setAttribute("roomOverview", new ArrayList<>()); 
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
        dispatcher.forward(request, response);
    }
}

