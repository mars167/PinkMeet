<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "java.util.*"
 %>
 
<%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "注册";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title%></title>
</head>
<body>
	<h1>注册</h1>
	
	<form action="MemberServlet" method ="post" name = "register">
		<div>
			<label>用户名</label>
			<input type="text" name = "username" required >
		</div>
		
		<div>
			<label>密码</label>
			<input type="text" name = "password" required>
		</div>
		
		<div>
			<label>电话号码</label>
		<input type="text" name = "cell_number" required>
		</div>
		
		<div>
			<label>性别</label>
			<input type = "radio" name = "sex" value="0" required>男
			<input type = "radio" name = "sex" value="1" required>女
		</div>
		
		<div>
			<label>个人简介</label>
			<textarea name = "profile" required></textarea>
		</div>
		<div>
			<input type="submit" value ="提交">
		</div>
	</form>
	
	<a href="<%=path%>/login.jsp">已有账号登录</a>

</body>
</html>