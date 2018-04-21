
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