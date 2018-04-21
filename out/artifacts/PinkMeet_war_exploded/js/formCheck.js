var infoStage = $('#error-board');

function getValue(obj){
	if( obj.attr("id") == "gender" ){
		var value;
		var radio = obj.children();
		var value;
		for( var i = 0 ; i < radio.length ; i++ ){
			if( radio.eq(i).is(':checked') ){
				value = radio.eq(i).val();
			}
		}
		return value;
	}else{
		return obj.val();
	}
}
function addAlertInfo(alertInfoArr){
	for( i in alertInfoArr ){
		infoStage.children('ol').html(infoStage.children('ol').html()+"<li>"+alertInfoArr[i]+"</li>");
	}
}
function showAlert(alertInfoArr){
	infoStage.children('ol').html("");
	addAlertInfo(alertInfoArr);
	infoStage.show(100);
};

function usernameCheck(username){
	var blank = /\s/;	//匹配空白符正则表达式的模式变量

	if( username.length<1 || username.length>10 ){
		return "用户名长度出错：请输入1~10个字符";
	}else if( blank.test(username) ){
		return "用户名格式出错：用户名不能有空白符";
	}else{
		return "";
	}
}

function genderCheck(gender){
	if( !gender ){
		return "性别选择出错：未选择";
	}else{
		return "";
	}
}

function emailCheck(address){
	var blank = /\s/;	//匹配空白符正则表达式的模式变量

	if( address.length == 0 ){
		return "电子邮箱地址出错：未填写";
	}else if( blank.test(address) ){
		return "电子邮箱地址出错：地址中不能有空白符";
	}else{
		return "";
	}
}

function passwordCheck(password){
	if( password.length<1 || password.length>16 ){
		return "密码长度出错：请输入长度为1~16的密码";
	}else{
		return "";
	}
}

function rePasswordCheck(password,rePassword){
	if( rePassword != password ){
		return "确认密码出错：与密码不一致";
	}else{
		return "";
	}
}

function vfcodeCheck(vfcode){
	if( vfcode.length == 0 ){
		return "验证码出错：未填写";
	}else{
		return "";
	}
}

function phoneCheck(number){
	pattern = /[0-9]{11}/;
	if( !pattern.test(number) ){
		return "电话号码格式出错：请输入11位电话号码";
	}else{
		return "";
	}
}