package com.pinkmeet.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.pinkmeet.dao.PictureDAO;

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/UploadImage")
@MultipartConfig
public class UploadImage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /** 上传目录名*/
    private static final String UPLOAD_DIR = "uploadDir/img/";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImage() {
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
		System.out.println("UploadTestServlet in");
        /****** 初始化部分 ******/
        //设置编码格式，前端后台统一是utf-8
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/json;charset=utf-8");

        //图片上传
        Part part = request.getPart("imageUpload");
        //获取上传文件名称
        String fileName = part.getSubmittedFileName();
        //检验文件格式
        String fileType = fileName.substring(fileName.lastIndexOf("."));
        
        //防止重名对文件重命名
        String  newfileName = System.currentTimeMillis()+fileType;
        //将文件写入至指定目录
        String filepath = this.getServletContext().getRealPath("/uploadDir/img");
        File f = new File(filepath);
        if(!f.exists()) {
        	f.mkdirs();
        }
        part.write(filepath+"/"+newfileName);
        PictureDAO dao = new PictureDAO();
        HttpSession session = request.getSession();
//        String id =(String) session.getAttribute("id");
        System.out.println( session.getAttribute("id"));
//        int uid = Integer.parseInt(id);
//        dao.insert(uid, newfileName);
        
        response.getWriter().println(filepath);

	}

}
