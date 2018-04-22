<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<%@ page import = "com.pinkmeet.dao.UserDAO,com.pinkmeet.dao.PictureDAO"%>
<%
	String deafultImg = "images/1.png";
	String filepath = "uploadDir/img/";
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String title = "PinkMeet";
	PictureDAO dao = new PictureDAO();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=title %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/mainPage.css">
	<link rel="stylesheet" href="css/chat.css">
	<link rel="icon" href="images/icon.png">
	<style>
		/*这里定义了默认两张图片的路径*/
		/*但是单从这里引入是不够的！*/
		/*还要从下边的#imgBox里再加以引入才可以，但是不用担心，我写了一个函数setImg(图片地址),可以很方便的引入图片*/
		[data-type="now"] .content__left {
			background-image: url("<%=deafultImg%>");
			background-position: center;
		}
		/*
		这一张是显示的一张，然后下一张是将要显示的（一共就有这么两个位置存图片）
		对于图片不断更新的逻辑是，不断的更换下一张图片，以达到显示所有图片的目的。
		*/

		[data-type="next"] .content__left {
			background-image: url("<%=deafultImg%>");
			background-position: center;
		}

		/*
			然后，不仅图片要换，右边信息展示区域的背景色以及这个区域的文字颜色也要跟着更换，
			当然还有用户名和个人简介也要随之更换。
			图片以及背景色文字颜色的更换等都封装在了setImg()里了，所以调用一次就自动跟着都换了。
			用户名和签名的更换封装在了setInfo($('.content__main').eq(3),用户名,简介)这个函数里了，只要调用一次就能更换。
			这个函数的第一个参数的值不要改，那是在哪里放这俩信息，经过测试，只能是这个值。
		*/
	</style>
</head>
<body>
<input type="text" style="display: none;" value="<%=deafultImg%>" id="defaultImg">
<span id="cuid" style="display: none"></span>
<div class="buttonBox carousel__control" id="centerBox">
	<div class="button bgRed" data-info="like"><i class="fa fa-heart"></i></div>
	<div class="button bgGray" data-info="dislike"><i class="fa fa-remove"></i></div>
</div>
<div class="buttonBox" id="rightBottomBox">
	<div class="button bgBlue" id="btn-setting"><i class="fa fa-cog"></i></div>
</div>
	<div class="carousel">
		<div class="carousel__stage">
			<div class="spinner spinner--left">
				<div class="spinner__face js-active">
					<div class="content" data-type="now">
						<div class="content__left">
						</div>
						<div class="content__right">
							<div class="content__main">
								<div class="info">
									<h3>#用户名</h3>
									<p>#个人简介</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="spinner__face">
					<div class="content" data-type="next">
						<div class="content__left">
						</div>
						<div class="content__right">
							<div class="content__main">
								<div class="info">
									<h3>#用户名</h3>
									<p>#个人简介</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  Poor man's preloader -->
	<div id="imgBox" style="height: 0; width: 0; overflow: hidden">
		<img src="<%=deafultImg%>">
		<img src="<%=deafultImg%>">
	</div>

	<div id="mask"><i class="fa fa-heart"></i></div>

	<div id="chatBox" style="display: none">
		<div id="contentBox">
			<div class="bar bar-title"></div>
			<div id="chatRecords">
			</div>
		</div>
		<div id="inputBox">
			<div class="bar">
				<button id="emojiBtn"><i class="fa fa-smile-o"></i></button>
				<button id="sendBtn">发送</button>
			</div>
			<textarea id="textarea" autofocus="autofocus"></textarea>
		</div>
	</div>

</body>

<script src="js/jquery.js"></script>
<script src="js/color-thief.min.js"></script>
<script src="js/getMainColor.js"></script>
<script src="js/animate.js"></script>
<script src="js/flush.js"></script>
<script src="js/chat.js"></script>
<script>
	$(document).ready(function(){
		initAnimate();//这个函数必须在DOM加载完成时调用，作用是初始化3D旋转的动画

		pullUser();
		spin(-1);
	});

	function pullUser(){
		$.ajax({
			url:"MeetServlet",
			type:'POST',
			async:true,
			data:{},
			dataType:'json',
			success:function(res){
				var count = 0;
				for( var i in res ){
					count++;
				}

				var i =  Math.round(Math.random()*count);

				if( res[i] && res[i]['sex']!=<%=(int)session.getAttribute("sex")%> && $('#cuid')!=res[i]['uid'] ){
						setImg(res[i]['img'] ? "<%=filepath%>" + res[i]['img'] : $('#defaultImg').val());
						setInfo($('.content__main').eq(3), res[i]['username'], res[i]['profile']);
						$('#cuid').text(res[i]['uid']);
				}else{
					setTimeout(pullUser,100);
				}
			},
			error:function(res){
				window.location.replace("login.jsp")
			}
		});
	}

	function like(){
			$.ajax({
				url:"LikeServlet",
				type:'POST',
				async:true,
				data:{
					cuid:$("#cuid").text(),
				},
				dataType:'json',
				success:function(res){
					if(res){
						showContact(res);
					}
					showLikeAnimation();
				},
				error:function(res){
					// alert("点赞失败。");
				}
			});
	}

	function showContact(res){
		window.open("contact.jsp?username="+res.username+"&img="+res.img+"&contact="+res.contact);
	}


	$('#centerBox').children('[data-info="like"]').click(function(){
		pullUser();
		setTimeout(like,100);
	});

	$('#centerBox').children('[data-info="dislike"]').click(function(){
		pullUser();
	});

	$('#btn-setting').click(function(){
		location.replace("profile.jsp");
	});
</script>
</html>