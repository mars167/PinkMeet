package com.pinkmeet.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/UploadImage")
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

        /****** 文件路径部分 用的是项目发布的相对路径******/
        // Servlet上下文对象
        ServletContext servletContext = this.getServletConfig().getServletContext();
        // tomcat的项目路径，记住要加斜杠
        String fileName = "test.jpg";//保存为什么名字
        String realPath = servletContext.getRealPath(UPLOAD_DIR)+"/";//保存的路径
        String filePath = realPath+fileName;//合起来就是完整的文件路径了
        System.out.println("UploadTestServlet filePath:"+filePath);
        File realPathFile = new File(realPath);
        if (!realPathFile.exists()) {
            realPathFile.mkdirs();
        }

        /****** 读写部分  ******/
        FileOutputStream fos = new FileOutputStream(new File(filePath));
        //传给页面的输出流
        ServletInputStream sis = request.getInputStream();
        byte[] b = new byte[1024];
        int len = 0;;
        while ((len=sis.read(b))!=-1) {
            fos.write(b, 0, len);
        }

        /****** 关闭资源  ******/
        fos.close();
        sis.close();

        /****** 把图片地址，转发回页面 ******/
        try {
            request.setAttribute("path", UPLOAD_DIR+fileName);
            System.out.println("UploadTestServlet path:"+UPLOAD_DIR+fileName);
            request.getRequestDispatcher("/test/UploadTest.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }

	}

}
