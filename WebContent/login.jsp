<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "登录";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %></title>
</head>
<body>
	<h1>登录</h1>
	<form action="Login" method="post" >
		<div>
			<label>手机号：</label>
			<input type="text"  name = "cell_number">
		</div>
			
		<div>
			<label>密码：</label>
			<input type="password" name ="password">
		</div>
		
		<div>
			<input type="submit" value ="登录">
		</div>
		<a href="<%=path%>/register.jsp">没有账号注册</a>
	</form>
</body>
</html>