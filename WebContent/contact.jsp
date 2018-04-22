<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet-联系方式";
	String deafultImg = "images/1.png";
	String filepath = "uploadDir/img/";

	String img = request.getParameter("img");
	String username = request.getParameter("username");
	String contact = request.getParameter("contact");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basepath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=title %></title>
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
					<img src="<%=img!="undefined"?filepath+img:deafultImg %>" alt="pic" width="50%">
					<!-- 这里放照片 -->
				</tr>
				<tr>
					<td>
						<label for="username">用户名：</label>
					</td>
					<td>
						<span id="username"><%=username%></span>
					</td>
				</tr>
				<tr>
					<td>
						<label for="contact">联系方式：</label>
					</td>
					<td>
						<span id="contact"><%=contact%></span>
					</td>
				</tr>
			</table><br>
	</div>
</div>
</body>
</html>
