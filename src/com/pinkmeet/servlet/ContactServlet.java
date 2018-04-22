package com.pinkmeet.servlet;

import com.pinkmeet.dao.UserDAO;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by mars on 2018/4/21.
 */
@WebServlet(name = "ContactServlet",urlPatterns = "/ContactServlet")
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/json;charset=utf-8");

        int uid =Integer.parseInt(request.getParameter("uid"));
        UserDAO dao = new UserDAO();

        JSONObject obj = new JSONObject();
        try {
            obj.put("success",true);
            obj.put("contact",dao.getContact(uid));
            response.getWriter().append(obj.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
