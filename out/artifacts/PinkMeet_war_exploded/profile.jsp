<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<%@ page import = "com.pinkmeet.dao.UserDAO,com.pinkmeet.dao.PictureDAO"%> 
 <%
 	String deafultImg = "images/1.png";
 	String filepath = "uploadDir/img/";
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "个人中心";
	
	PictureDAO dao = new PictureDAO();
	String filename = dao.getImg((int)session.getAttribute("id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title%></title>
</head>
<body>
	<div>
		<div>
		<h5>图片</h5>
			<img alt="" src="<%=filepath+filename %>">
            <a href="picture.jsp">修改照片</a>
		</div>
		<h5>ID:</h5>
		<%=session.getAttribute("id") %>
		<h5>用户名：</h5>
		<%=(String)session.getAttribute("username") %>
		<h5>性别：</h5>
		<%=session.getAttribute("sex") %>
		<h5>电话号码：</h5>
		<%=(String)session.getAttribute("cell_number") %>
		<h5>个人简介：</h5>
		<%=(String)session.getAttribute("profile") %>
		<h5>联系方式：</h5>
		<%=(String)session.getAttribute("contact") %>

	</div>
	<a href="<%=path %>/profileUpdate.jsp">修改</a>
</body>
</html>