package com.pinkmeet.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.pinkmeet.bean.User;
import com.pinkmeet.dao.LikeDAO;
import com.pinkmeet.dao.PictureDAO;
import com.pinkmeet.dao.UserDAO;
import jdk.nashorn.api.scripting.JSObject;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/**
 * Created by mars on 2018/4/21.
 */
@WebServlet(name = "LikeServlet",urlPatterns = "/LikeServlet")
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/json;charset=utf-8");

        HttpSession session = request.getSession();
        int uid = (int) session.getAttribute("id");
        int cuid = Integer.parseInt(request.getParameter("cuid"));

        LikeDAO dao = new LikeDAO();
        if (!dao.isLike(uid,cuid)){
            dao.insert(uid,cuid);
        }else{
            dao.update(uid,cuid);
        }

        if (dao.isLiked(uid,cuid)){
            UserDAO udao = new UserDAO();
            User user = udao.getUserById(cuid);
            System.out.println(user.getUsername()+";"+user.getContact());
            PictureDAO pdao = new PictureDAO();

            JSONObject obj = new JSONObject();

            try {
                obj.put("success",true);
                obj.put("contact",user.getContact());
                obj.put("username",user.getUsername());
                obj.put("img",pdao.getImg(cuid));
                response.getWriter().append(obj.toString());
            } catch (JSONException e) {
                e.printStackTrace();
            }

        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
