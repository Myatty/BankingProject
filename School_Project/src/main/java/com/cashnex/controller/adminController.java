package com.cashnex.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.cashnex.dao.AdminDao;
import com.cashnex.dao.ConnectionManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/adminPanel")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  public AdminDao adminDao; // Declare AdminDao variable
	    
	    // Initialize AdminDao instance in servlet's init() method
	    @Override
	    public void init() throws ServletException {
	        super.init();
	        adminDao = new AdminDao(); // Initialize AdminDao
	    }
	
//    public adminController() {
//        super();
//        this.adminDao = new AdminDao(ConnectionManager.getInstance());
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        
        String adminUsername = request.getParameter("adminUsername");
        String adminPassword = request.getParameter("adminPassword");
        String storedAdminUsername = null;
        String storedAdminPassword = null;
        
		try {
			storedAdminUsername = adminDao.checkAdminUsername();
			storedAdminPassword = adminDao.checkAdminPassword();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if ((storedAdminUsername != null && storedAdminUsername.equals(adminUsername)) && (adminPassword != null
        		&& storedAdminPassword.equals(storedAdminPassword))) {
            request.getRequestDispatcher("views/adminDashboard.jsp").forward(request, response);
        } else {
            response.getWriter().append("Access Denied");
        }
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
