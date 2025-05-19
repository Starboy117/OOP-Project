package com.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetMessagesServlet")
public class GetMessagesServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check for edit request
        String editId = request.getParameter("editId");
        if (editId != null && !editId.isEmpty()) {
            try {
                int id = Integer.parseInt(editId);
                ContactDBUtil contactUtil = new ContactDBUtil();
                ContactMessage messageToEdit = contactUtil.getMessageById(id);
                request.setAttribute("messageToEdit", messageToEdit);
            } catch (Exception e) {
                request.setAttribute("error", "Invalid message ID");
            }
        }
        
        ContactDBUtil contactUtil = new ContactDBUtil();
        List<ContactMessage> messages = contactUtil.getAllMessages();
        request.setAttribute("messages", messages);
        request.getRequestDispatcher("ContactUs.jsp").forward(request, response);
    }

}
