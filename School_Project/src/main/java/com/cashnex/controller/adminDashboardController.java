package com.cashnex.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.cashnex.dao.UserDao;
import com.cashnex.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class adminDashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = null;

	public adminDashboardController() {
		super();
		userDao = new UserDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action == null) {
			action = "LIST";
		}
		switch (action) {
		case "LIST":
			try {
				listUser(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;

		case "EDIT":
			try {
				getUser(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;

		case "DELETE":
			try {
				deleteUser(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;

		default:
			try {
				listUser(request, response);
			} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			break;
		}

	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		List<User> userList = userDao.getUserList();
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/views/adminDashboard.jsp").forward(request, response);
	}

	private void getUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, ClassNotFoundException, SQLException {
		
		String id = request.getParameter("id");
		User user = null;
		try {
			user = UserDao.getUserById(Integer.parseInt(id));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		request.setAttribute("user", user);
		request.getRequestDispatcher("/views/userRegistration.jsp").forward(request, response);
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, ClassNotFoundException, SQLException {
		String id = request.getParameter("id");
		if (userDao.delete(Integer.parseInt(id))) {
			request.setAttribute("MSG", "Successfully Deleted");
		}
		listUser(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setNrcNumber(request.getParameter("nrcNumber"));
		user.setEmail(request.getParameter("gmail"));
		user.setCareer(request.getParameter("career"));
		if(id.isEmpty() || id == null) {
			try {
				if(userDao.saveUser(user)) {
				request.setAttribute("MSG", "Successfully Saved!");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
		}
		}
		else {
			user.setUserId(Integer.parseInt(id));
			if(userDao.updateUser(user)) {
			request.setAttribute("MSG", "Successfully Updated!");
			}
		}
		try {
			listUser(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	}

}
