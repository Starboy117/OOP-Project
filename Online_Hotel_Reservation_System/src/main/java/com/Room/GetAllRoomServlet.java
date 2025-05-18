package com.Room;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/roomList")
public class GetAllRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Call the static method correctly
        List<Room> allRooms = roomController.getAllRooms();
        
        // Set the room list as request attribute
        request.setAttribute("roomList", allRooms);
        
        // Forward to RoomList.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("RoomList.jsp");
        dispatcher.forward(request, response);
    }

    // Optional: handle POST requests the same way as GET
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
