<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet-修改信息";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			<form action="ProfileUpdate" method="post">
				<table>
					<tr>
						<td>
							<label for="username">用户名：</label>
						</td>
						<td>
							<input type="text" id="username" class="text-field" name="username" value="<%=session.getAttribute("username") %>">
						</td>
					</tr>
					<tr>
						<td>
							<label for="bio">个人简介：</label>
						</td>
						<td>
							<textarea id="bio" name="profile"><%=session.getAttribute("profile") %></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="contact">联系方式：</label>
						</td>
						<td>
							<textarea id="contact" name="contact"><%=session.getAttribute("contact") %></textarea>
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
						<button id="submit-btn" class="btn">修改</button>
					</td>
					<td>
						<a href="profile.jsp" class="btn btn-white">取消</a>
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
		infoObjArr['username'] = $('#username');
		infoObjArr['contact'] = $('#contact');

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