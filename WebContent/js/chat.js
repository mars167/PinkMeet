// showChatBox("这是标题");
//这个函数完成初始化聊天窗口

// addServerMsg("对方的消息");
//这个函数向聊天窗口中添加对方发来的消息

// addClientMsg("我发出的消息");
//这个函数向聊天窗口中添加我放发出的消息
/*
	以上两个关于聊天信息发送的函数只能完成前端的显示，
	目前还不具备与后端交换信息的功能
*/
// function initStage(){
// 	return $('.content__right').eq(2);
// }
//这个函数是为聊天窗口初始化做准备工作的，不能修改,放在调用处最好
function showChatBox(title){
	var chatStage = initStage();
	chatStage.parents('.spinner__face').hide(100);
	chatStage.empty();
	chatStage.append($('#chatBox'));
	chatStage.parents('.spinner__face').show(100);

	var chatBox = chatStage.children('#chatBox');
    chatBox.find('.bar-title').text(title);
	chatBox.width($('body').width()/2-20);
    chatBox.height($('body').height()-40);
    chatBox.show(150);

    clearRecords();
}

function hideChatBox(name,bio){
	var stage = initStage();
	stage.remove('#chatBox');
	stage.html('<div class="info"><h3>'+name+'</h3><p>'+bio+'</p></div>');
}    

function scrollRecords(){
	$('#chatRecords').scrollTop(99999);
}
function clearRecords(){
	$('#chatRecords').html("");
}

function addClientMsg(msg){
	var msgHtml = '<div class="txtBubble"><div class="bubble bubble-me">'+msg+'</div><div class="holder"></div></div>';
	$('#chatRecords').html($('#chatRecords').html()+msgHtml);
	scrollRecords();
}
function addServerMsg(msg){
	var msgHtml = '<div class="txtBubble"><div class="bubble bubble-ta">'+msg+'</div></div>';
	$('#chatRecords').html($('#chatRecords').html()+msgHtml);
	scrollRecords();
}

$('#textarea').keyup(function(){
	if( event.ctrlKey && event.keyCode == 13 ){
		$('#sendBtn').click();
	}
});

$('#sendBtn').click(function(){
	var msg = $('#textarea').val().replace(/\n/g,'<br/>');

	if( msg != "" ){
		addClientMsg(msg);
		$('#textarea').val("");
	}

	$('#textarea').focus();
});