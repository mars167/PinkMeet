<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
 <%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "个人中心";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title%></title>
</head>
<body>
	<div>
		<h5>用户名：</h5>
		<%=(String)session.getAttribute("username") %>
		<h5>性别：</h5>
		<%=session.getAttribute("sex") %>
		<h5>电话号码：</h5>
		<%=(String)session.getAttribute("cell_number") %>
		<h5>个人简介：</h5>
		<%=(String)session.getAttribute("profile") %>
	</div>
	<a href="<%=path %>/profileUpdate.jsp">修改</a>
</body>
</html>