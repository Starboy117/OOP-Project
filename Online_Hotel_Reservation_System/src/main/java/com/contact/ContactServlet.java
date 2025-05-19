package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String messageText = request.getParameter("message");

		// Basic validation
		if (name == null || name.trim().isEmpty() || 
				email == null || email.trim().isEmpty() || 
				messageText == null || messageText.trim().isEmpty()) {

			response.sendRedirect("ContactUs.jsp?error=All fields are required");
			return;
		}

		// Create message object
		ContactMessage message = new ContactMessage(name, email, messageText);
		ContactDBUtil contactUtil = new ContactDBUtil(); // Updated to use new style

		try {
			boolean isSuccess = contactUtil.insertContactMessage(message);
			if (isSuccess) {
				response.sendRedirect("getMessages?success=Message sent successfully");
			} else {
				response.sendRedirect("getMessages?error=Failed to send message");
			}
		} catch (Exception e) {
			response.sendRedirect("getMessages?error=Database error");
			e.printStackTrace();
		}
	}

}
