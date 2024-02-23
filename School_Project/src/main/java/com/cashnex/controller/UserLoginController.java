package com.cashnex.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.cashnex.dao.UserDao;
import com.cashnex.security.Security;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userLogin")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected UserDao userDao = null;

	/*
	 * public UserLoginController() { super(); // TODO Auto-generated constructor
	 * stub }
	 */

	@Override
	public void init() throws ServletException {

		super.init();
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		String userGmail = request.getParameter("userGmail");
		String userPassword = request.getParameter("userPassword");
		String hashedPassword = null;
		String decryptedPassword = null;
		List<String> storedUserGmails = new ArrayList<>();
		List<String> storedUserPasswords = new ArrayList<>();
		List<String> decryptedPasswords = new ArrayList<>();

		/*
		 * //Original try { hashedPassword = Security.hashPassword(userPassword); }
		 * catch (InvalidKeyException | NoSuchAlgorithmException |
		 * NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException e) {
		 * // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		
		//MD-5
		hashedPassword = Security.doHashing(userPassword);
		
		try {
			storedUserGmails = userDao.checkUserGmails();
			storedUserPasswords = userDao.checkPasswords();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * for (String password : storedUserPasswords) { String storedPassword = null;
		 * try { storedPassword = Security.decryptPassword(password);
		 * decryptedPasswords.add(storedPassword); } catch (InvalidKeyException |
		 * NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
		 * | BadPaddingException e) { // Handle decryption exceptions
		 * e.printStackTrace(); } finally { if (storedPassword != null) {
		 * response.getWriter().append(storedPassword); } } }
		 */

			
		
		

		if ((storedUserGmails != null && storedUserPasswords != null) 
				&& ((storedUserGmails.contains(userGmail) && (storedUserPasswords.contains(hashedPassword))))) {

			response.sendRedirect(request.getContextPath() + "/views/userDashboard.jsp");

		} else {
			response.getWriter().append("Bad");
			response.getWriter().append(hashedPassword);
			
			
		}
		/*
		 * for(String password : decryptedPasswords) {
		 * response.getWriter().append(password); response.getWriter().append("lee"); }
		 */
		/*
		 * if (storedUserGmails != null && storedUserPasswords != null) { boolean found
		 * = false; for (int i = 0; i < storedUserGmails.size(); i++) { String
		 * storedUserGmail = storedUserGmails.get(i); String storedPassword =
		 * storedUserPasswords.get(i); try { decryptedPassword =
		 * Security.decryptPassword(storedPassword);
		 * response.getWriter().append("Decrypted Password is " + decryptedPassword);
		 * 
		 * if (storedUserGmail.equals(userGmail) &&
		 * decryptedPassword.equals(userPassword)) { found = true; break; } } catch
		 * (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException |
		 * IllegalBlockSizeException | BadPaddingException e) { // Handle decryption
		 * errors e.printStackTrace(); } }
		 * 
		 * if (found) { response.getWriter().append("Nice"); } else {
		 * response.getWriter().append("Bad"); response.getWriter().append(userGmail);
		 * response.getWriter().append(userPassword); } } else {
		 * response.getWriter().append("Null"); response.getWriter().append(userGmail);
		 * response.getWriter().append(userPassword); }
		 */

		/*
		 * response.getWriter().append(userGmail + " " + hashedPassword); try {
		 * response.getWriter().append("Decrypted Password is " +
		 * Security.decyptPassword(hashedPassword)); } catch (InvalidKeyException |
		 * NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
		 * | BadPaddingException | IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
