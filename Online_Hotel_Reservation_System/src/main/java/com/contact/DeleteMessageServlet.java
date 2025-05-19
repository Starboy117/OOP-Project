package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ContactDBUtil contactUtil = new ContactDBUtil(); // Updated

		try {
			boolean isSuccess = contactUtil.deleteMessage(id);
			if (isSuccess) {
				response.sendRedirect("getMessages?success=Message deleted successfully");
			} else {
				response.sendRedirect("getMessages?error=Failed to delete message");
			}
		} catch (Exception e) {
			response.sendRedirect("getMessages?error=Database error");
			e.printStackTrace();
		}
	}

}
