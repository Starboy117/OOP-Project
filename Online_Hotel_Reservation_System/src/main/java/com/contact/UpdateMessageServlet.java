package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateMessageServlet")
public class UpdateMessageServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String messageText = request.getParameter("message");
            
            ContactDBUtil contactUtil = new ContactDBUtil();
            ContactMessage existingMessage = contactUtil.getMessageById(id);
            
            if (existingMessage == null) {
                response.sendRedirect("getMessages?error=Message not found");
                return;
            }
            
            // Update the message content
            existingMessage.setMessage(messageText);
            
            boolean isSuccess = contactUtil.updateMessage(existingMessage);
            
            if(isSuccess) {
                response.sendRedirect("getMessages?success=Message updated successfully");
            } else {
                response.sendRedirect("getMessages?error=Update failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("getMessages?error=Server error: " + e.getMessage());
        }
    }
}


