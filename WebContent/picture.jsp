<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import = "com.pinkmeet.dao.UserDAO,com.pinkmeet.dao.PictureDAO"%>
<%
	String deafultImg = "images/1.png";
	String filepath = "uploadDir/img/";
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet-更换照片";

	PictureDAO dao = new PictureDAO();
	String filename = dao.getImg((int) session.getAttribute("id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=title%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/register.css">
	<link rel="icon" href="images/icon.png">
</head>
<body>
	<div id="stage">
		<div id="title" class="part">
			<img src="images/logo.png" alt="PinkMeet" height="100%">
		</div>
		<div id="content" class="part">
			<form action="UploadImage" method="post" enctype = "multipart/form-data">
				<tr>
					<td>
						<input type="file" name="imageUpload" id ="imageUpload"/>
					</td>
					<td>
						<input type="submit" class="btn" value="上传">
					</td>
				</tr>
			</form>
			<tr>
				<br><br>
				<td>
					<a href="profile.jsp" class="link">返回</a>
				</td>
			</tr>
		</div>
	</div>

</body>
</html>