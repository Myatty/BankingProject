package com.cashnex.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserRegistration")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		String userName = request.getParameter("username");
		String nrcNumber = request.getParameter("nrcNumber");
		String userGmail = request.getParameter("userGmail");
		String career = request.getParameter("career");
		String userPassword = request.getParameter("userPassword");
		String userBalance = request.getParameter("userBalance");
		
		var out = response.getWriter();
		
		request.setAttribute("userName", userName);
		request.setAttribute("nrcNumber", nrcNumber);
		request.setAttribute("userGmail", userGmail);
		request.setAttribute("career", career);
		request.setAttribute("userPassword", userPassword);
		request.setAttribute("userBalance", userBalance);
		
    	request.setAttribute("adminApproval", 0);             // Admin Approval

		request.getRequestDispatcher("views/adminDashboard.jsp").forward(request, response);
		
//		out.append(username + " " + nrcNumber + " " + userGmail + " " + career + " " + userPassword);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
