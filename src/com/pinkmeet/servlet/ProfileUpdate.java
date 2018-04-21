package com.pinkmeet.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pinkmeet.dao.UserDAO;

/**
 * Servlet implementation class ProfileUpdate
 */
@WebServlet(name = "ProfileUpdate",urlPatterns = "/ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charSet=utf-8");
		
		String username = request.getParameter("username");
		String profile = request.getParameter("profile");
		HttpSession  session = request.getSession();
		String cell_number = (String) session.getAttribute("cell_number");
		String contact = (String) session.getAttribute("contact");


		UserDAO dao = new UserDAO();
		
		response.getWriter().println(profile);
		
		dao.update(cell_number, username, profile,contact);
		session.setAttribute("username", username);
		session.setAttribute("profile", profile);
		response.sendRedirect("profile.jsp");
		
	}
}
