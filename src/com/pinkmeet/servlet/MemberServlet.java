package com.pinkmeet.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pinkmeet.bean.User;
import com.pinkmeet.dao.UserDAO;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet(name = "MemberServlet",urlPatterns = "/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
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
		request.setCharacterEncoding("utf-8");
		
		String cell_number = request.getParameter("cell_number");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int sex = Integer.parseInt(request.getParameter("sex")) ;
		String profile = request.getParameter("profile");
		String contact = request.getParameter("contact");

//		System.out.println(contact);
//		response.getWriter().println(profile);
		
		PrintWriter out = response.getWriter();

		User user = new User(cell_number,username,password,sex,profile,contact);
		UserDAO dao = new UserDAO();
		try {
			dao.insert(user);
//			dao.login(user.getCell_number(),user.getPassword());
			user = dao.getUserByCell_number(cell_number);
			HttpSession session =request.getSession();
			session.setAttribute("islogin", 1);
			session.setAttribute("id", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("cell_number", user.getCell_number());
			session.setAttribute("sex", user.getSex());
			session.setAttribute("profile", user.getProfile());
			session.setAttribute("contact", user.getContact());
			response.sendRedirect("profile.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
