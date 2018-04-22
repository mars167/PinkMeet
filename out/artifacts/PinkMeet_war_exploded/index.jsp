<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
 
<%
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String title = "PinkMeet";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %></title>
</head>
<body>
	<button id="like">赞</button>
	<input type="hidden" id="cuid" value="3">
	<button id="getuser">获取用户</button>
    <button id="contact">获取联系方式</button>
	
	
	<script src="js/jquery.js"></script>
	<script>
		$("#like").click(function(){
			$.ajax({
				url:"LikeServlet",
				type:'POST',
				async:true,
				data:{
					cuid:$("#cuid").val(),
				},
				dataType:'json',
				success:function(res){
					alert("点赞成功！");
				},
				error:function(res){
					alert("点赞失败。");

				}
			});	
		});
        $("#getuser").click(function(){
            $.ajax({
                url:"MeetServlet",
                type:'POST',
                async:true,
                data:{
                    cuid:$("#cuid").val(),
                },
                dataType:'json',
                success:function(res){
                    alert("拉取用户成功！");
                },
                error:function(res){
                    alert("拉取用户失败。");

                }
            });
        });
        $("#contact").click(function(){
            $.ajax({
                url:"ContactServlet",
                type:'POST',
                async:true,
                data:{
                    uid:$("#cuid").val(),
                },
                dataType:'json',
                success:function(res){
                    alert("拉取用户成功！");
                },
                error:function(res){
                    alert("拉取用户失败。");

                }
            });
        });


	
	</script>
</body>
</html>