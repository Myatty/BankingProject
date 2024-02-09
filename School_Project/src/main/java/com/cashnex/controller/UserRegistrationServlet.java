package com.cashnex.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.cashnex.dao.PendingUserInfoDao;
import com.cashnex.security.Security;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserRegistration")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public PendingUserInfoDao pendingUserInfoDao;
	
    public UserRegistrationServlet() {
        super();
        pendingUserInfoDao = new PendingUserInfoDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		String userName = request.getParameter("username");
		String nrcNumber = request.getParameter("nrcNumber");
		String userGmail = request.getParameter("userGmail");
		String career = request.getParameter("career");
		String userPassword = request.getParameter("userPassword");
		String userBalanceStr = request.getParameter("userBalance");
		
		Double userBalance = null;									// Need to convert from Str to Float
		if (userBalanceStr != null && !userBalanceStr.isEmpty()) {
		    try {
		        userBalance = Double.parseDouble(userBalanceStr);
		    } catch (NumberFormatException e) {
	
		        e.printStackTrace(); 
		    }
		}
		
		// hashing the password
		String hashedPassword = null;
		try {
			hashedPassword = Security.hashPassword(userPassword);
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		var out = response.getWriter();
		out.println(userName + nrcNumber + userGmail + career + userPassword + userBalance);
		try {
			pendingUserInfoDao.insertUserData(userName, nrcNumber, userGmail, career, hashedPassword,userBalance);
			out.println("Successfully inserted");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
//		request.setAttribute("userName", userName);
//		request.setAttribute("nrcNumber", nrcNumber);
//		request.setAttribute("userGmail", userGmail);
//		request.setAttribute("career", career);
//		request.setAttribute("userPassword", userPassword);
//		request.setAttribute("userBalance", userBalance);
//		
//    	request.setAttribute("adminApproval", 0);             // Admin Approval
//
//		request.getRequestDispatcher("views/adminDashboard.jsp").forward(request, response);
		
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
