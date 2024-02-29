package com.cashnex.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.cashnex.dao.AdminDao;
import com.cashnex.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class adminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDao adminDao; // Declare AdminDao variable
	public UserDao userDao; // Declare UserDao variable

	// Initialize AdminDao instance in servlet's init() method
	@Override
	public void init() throws ServletException {
		super.init();
		adminDao = new AdminDao(); // Initialize AdminDao
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminUsername = request.getParameter("adminUsername");
		String adminPassword = request.getParameter("adminPassword");
		String storedAdminUsername = null;
		String storedAdminPassword = null;

		try {
			storedAdminUsername = adminDao.checkAdminUsername();
			storedAdminPassword = adminDao.checkAdminPassword();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		if (storedAdminUsername != null && storedAdminUsername.equals(adminUsername) && storedAdminPassword != null
				&& storedAdminPassword.equals(adminPassword)) {
			request.getSession().setAttribute("loginSuccess", true);
			response.sendRedirect(request.getContextPath() + "/adminDashboardController");
		} else {
			request.getSession().setAttribute("loginSuccess", false);
			response.sendRedirect(request.getContextPath() + "/views/adminLogin_V2.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
