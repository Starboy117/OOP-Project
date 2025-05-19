package com.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/guestCheckingServlet")
public class guestCheckingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String gNmae=request.getParameter("guestName");
			String pNo=request.getParameter("phoneNo");
			String eMail=request.getParameter("Email");
			String idType=request.getParameter("idType");
			String  idNumber=request.getParameter("idNo");
			String  roomNumber=request.getParameter("roomNo");
			String guestNumber=request.getParameter("guestNo");
			String checkInDate=request.getParameter("checkIn");
			String checkOutDate = request.getParameter("checkOut");
			String sRequest=request.getParameter("spR");
			
			System.out.println("guestName = " + gNmae);
			System.out.println("phoneNo = " + pNo);
			System.out.println("email = " + eMail);
			System.out.println("idType = " + idType);
			System.out.println("idNo = " + idNumber);
			System.out.println("roomNo = " + roomNumber);
			System.out.println("guestNo = " + guestNumber);
			System.out.println("checkIn = " + checkInDate);
			System.out.println("checkOut = " + checkOutDate);
			System.out.println("specialRequest = " + sRequest);

			
			int guestNum=Integer.parseInt(guestNumber);
			boolean isSuccess=CheckInControl.checkInDetailsInsert(gNmae, pNo, eMail, idType, idNumber, roomNumber, guestNum, checkInDate, checkOutDate, sRequest);
			
			if(isSuccess==true) {
				request.setAttribute("Message","Successfully Updated");
				RequestDispatcher dis = request.getRequestDispatcher("check-inout.jsp");
				dis.forward(request, response);
				
			}
			else {
				request.setAttribute("Message","Update Failed");
				RequestDispatcher dis = request.getRequestDispatcher("check-inout.jsp");
				dis.forward(request, response);
				
			}
		}
			
		


}
