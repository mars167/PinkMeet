<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
 <%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "修改";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %></title>
</head>
<body>
	<h1>修改信息</h1>
	<form action="ProfileUpdate" method ="post" >
		<div>
			<label>用户名</label>
			<input type="text" value ="<%=session.getAttribute("username") %>" name = "username">	
		</div>
		
		<div>
			<label>个人简介</label>
			<input type="text" value ="<%=session.getAttribute("profile") %>" name = "profile">	
		</div>
		<div>
			<input type="submit" value="提交" >
		</div>
	</form>
	
	
</body>
</html>