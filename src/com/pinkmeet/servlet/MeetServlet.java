package com.pinkmeet.servlet;

import com.pinkmeet.bean.User;
import com.pinkmeet.dao.PictureDAO;
import com.pinkmeet.dao.UserDAO;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MeetServlet
 */
@WebServlet(name = "MeetServlet",urlPatterns = "/MeetServlet")
public class MeetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetServlet() {
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

		//首先设置可以处理中文
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/json;charset=utf-8");
		//获取所有用户
		HttpSession session = request.getSession();
        int uid = (int) session.getAttribute("id");
        UserDAO dao = new UserDAO();
        ArrayList<User> users = new ArrayList<User>();
        users = dao.getAll(uid);
        //将用户数组转换成json响应给前端
        JSONObject obj = new JSONObject();
        try {
            obj.put("success",true);
            PictureDAO pidao =new PictureDAO();
            for (User user :users){
                JSONObject userObj = new JSONObject();
                userObj.put("uid",user.getId());
                userObj.put("username",user.getUsername());
                userObj.put("sex",user.getSex());
                userObj.put("profile",user.getProfile());
                userObj.put("img",pidao.getImg(user.getId()));

                obj.put("users",userObj);

            }

            response.getWriter().append(obj.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }

		

	}

}
