package com.pinkmeet.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pinkmeet.bean.User;
import com.pinkmeet.dao.UserDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "Login",urlPatterns = "/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user=null;
		String cell_number=request.getParameter("cell_number");
		String password = request.getParameter("password");
		UserDAO  dao = new UserDAO();
		if(dao.login(cell_number,password)) {
			user = dao.getUserByCell_number(cell_number);
			HttpSession session = request.getSession();
			session.setAttribute("id", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("cell_number",user.getCell_number());
			session.setAttribute("sex", user.getSex());
			session.setAttribute("profile", user.getProfile());
			session.setAttribute("contact", user.getContact());
			session.setAttribute("islogin", 1);
			response.sendRedirect("profile.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
