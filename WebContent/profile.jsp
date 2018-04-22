<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<%@ page import = "com.pinkmeet.dao.UserDAO,com.pinkmeet.dao.PictureDAO"%> 
 <%
 	String deafultImg = "images/1.png";
 	String filepath = "uploadDir/img/";
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet-个人信息";
	
	PictureDAO dao = new PictureDAO();
	String filename = dao.getImg((int)session.getAttribute("id"));
%>
<%
	String gender = (int) session.getAttribute("sex")==0 ? "男" : "女";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basepath%>">
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
			<table>
				<tr>
					<img src="<%=filename != null?filepath+filename:deafultImg %>" alt="pic" width="50%">
					<!-- 这里放照片 -->
				</tr>
				<tr>
					<td>
						<label for="username">用户名：</label>
					</td>
					<td>
						<p id="username"><%=(String)session.getAttribute("username") %></p>
					</td>
				</tr>
				<tr>
					<td>
						<label for="phone">电话号码：</label>
					</td>
					<td>
						<p id="phone"><%=(String)session.getAttribute("cell_number") %></p>
					</td>
				</tr>
				<tr>
					<td>
						<label for="gender">性别：</label>
					</td>
					<td>
						<p id="gender"><%= gender %></p>
					</td>
				</tr>
				<tr>
					<td>
						<label for="bio">个人简介：</label>
					</td>
					<td>
						<p id="bio"><%=(String)session.getAttribute("profile") %></p>
					</td>
				</tr>
				<tr>
					<td>
						<label for="contact">联系方式：</label>
					</td>
					<td>
						<p id="contact"><%=(String) session.getAttribute("contact") %></p>
					</td>
				</tr>
			</table><br>
			<tr>
				<td>
					<a href="profileUpdate.jsp" class="btn">修改信息</a>
				</td>
				<td>
					<a href="profile.jsp" class="btn">更换照片</a>
				</td>
			</tr><br><br>
			<tr>
				<td>
					<a href="index.jsp" class="link">返回</a>
				</td>
			</tr>
		</div>
	</div>
</body>
</html>
