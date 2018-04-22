<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "java.util.*"
 %>
 
<%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet-注册";
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
		<!-- PinkMeet -->
		<img src="images/logo.png" alt="PinkMeet" height="100%">
	</div>
	<div id="content" class="part">
		<form action="MemberServlet" method="post">
			<table>
				<tr>
					<td>
						<label for="username">用户名：</label>
					</td>
					<td>
						<input type="text" id="username"  class="text-field" name="username">
					</td>
				</tr>
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
				<tr>
					<td>
						<label for="rePassword">确认密码：</label>
					</td>
					<td>
						<input type="password" id="rePassword" class="text-field">
					</td>
				</tr>
				<tr>
					<td>
						<label for="gender">性别：</label>
					</td>
					<td id="gender">
						<input type="radio" name="sex" value="0"> 男
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="1"> 女
					</td>
				</tr>
				<tr>
					<td>
						<label for="bio">个人简介：</label>
					</td>
					<td>
						<textarea id="bio" name="profile"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="content">联系方式：</label>
					</td>
					<td>
						<textarea id="contact" name="contact"></textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<span class="tip">此联系方式将发送给互相 喜欢 的双方，请务必慎重填写</span>
					</td>
				</tr>
			</table><br>
			<tr>
				<td>
					<button id="signup-btn" class="btn">注册</button>
				</td>
				<td>
					已有账号？<a href="login.jsp" class="link">登录</a>
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
	$('form').submit(signUp);
	function signUp(){
		var infoObjArr = [];
		infoObjArr['username'] = $('#username');
		infoObjArr['phone'] = $('#phone');
		infoObjArr['password'] = $('#password');
		infoObjArr['rePassword'] = $('#rePassword');
		infoObjArr['gender'] = $('#gender');
		infoObjArr['contact'] = $('#contact');

		return formCheck(infoObjArr);
	}

	function formCheck(infoObjArr){
		var alertInfoArr = [];

		for( var item in infoObjArr ){
			var obj = infoObjArr[item]
			var checkFunc = obj.attr("id") + "Check";

			var result = "";

			if( obj.attr("id") == "rePassword" ){
				result = eval(checkFunc+"(getValue($('#password')),getValue(obj))");
			}else{
				result = eval(checkFunc+"(getValue(obj))");
			}

			if( result != "" ){
				alertInfoArr.push(result);
			}
		}

		if( alertInfoArr.length > 0 ){
			showAlert(alertInfoArr);

			return false;
		}else{
			$('#error-board').hide(100);

			return true;
		}
	}
</script>
</html>