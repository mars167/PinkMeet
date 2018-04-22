<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet-登录";
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
			<form action="Login" method="post">
				<table>
					<tr>
						<td>
							<label for="phone">电话号码：</label>
						</td>
						<td>
							<input type="text" id="phone" class="text-field" name="cell_number">
						</td>
					</tr>
					<tr>
						<td>
							<label for="password">密码：</label>
						</td>
						<td>
							<input type="password" id="password" class="text-field" name="password">
						</td>
					</tr>
				</table><br>
				<tr>
					<td>
						<button id="login-btn" class="btn">登录</button>
					</td>
					<td>
						没有账号？<a href="register.jsp" class="link">注册</a>
					</td>
				</tr>
			</form>
		</div>
		<div id="error-board" class="part">
			<p>错误提示</p>
			<ol>
			</ol>
		</div>
	</div>
</body>
<script src="js/jquery.js"></script>
<script src="js/formCheck.js"></script>
<script>
	$('form').submit(signIn);
	function signIn(){
		var infoObjArr = [];
		infoObjArr['phone'] = $('#phone');
		infoObjArr['password'] = $('#password');

		return formCheck(infoObjArr);
	}

	function formCheck(infoObjArr){
		var alertInfoArr = [];

		for( var item in infoObjArr ){
			var obj = infoObjArr[item]
			var checkFunc = obj.attr("id") + "Check";

			var result = "";

			result = eval(checkFunc+"(getValue(obj))");

			if( result != "" ){
				alertInfoArr.push(result);
			}
		}

		if( alertInfoArr.length > 0 ){
			showAlert(alertInfoArr);

			return false;
		}else{
			return true;
		}
	}
</script>
</html>