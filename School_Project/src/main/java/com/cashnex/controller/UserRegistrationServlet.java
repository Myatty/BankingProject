package com.cashnex.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.cashnex.dao.PendingUserInfoDao;
import com.cashnex.dao.UserDao;
import com.cashnex.security.Security;
import com.cashnex.service.AccountNumberGenerator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserRegistration")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PendingUserInfoDao pendingUserInfoDao;
	public UserDao userDao;

	public UserRegistrationServlet() {
		super();
		pendingUserInfoDao = new PendingUserInfoDao();
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/views/userRegistration.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("username");
		String nrcNumber = request.getParameter("nrcNumber");
		String userGmail = request.getParameter("userGmail");
		String career = request.getParameter("career");
		String userPassword = request.getParameter("userPassword");
		
		String hashedPassword = Security.doHashing(userPassword);
		String accountNumber = AccountNumberGenerator.generateAccountNumber();
		

		try {
			pendingUserInfoDao.insertUserData(userName, nrcNumber, userGmail, career, hashedPassword,accountNumber);
			userDao.insertUserData(userName, nrcNumber, userGmail, career, hashedPassword,accountNumber);
			// Set success message attribute
			request.setAttribute("registrationSuccess", true);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			// If an error occurs, set error message attribute
			request.setAttribute("registrationError", true);
		}

		request.getRequestDispatcher("/views/userRegistration.jsp").forward(request, response);
	}

}
