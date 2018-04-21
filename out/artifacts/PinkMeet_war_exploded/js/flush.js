function getCurrent(){
	var current = [];
	current['index'] = $('.spinner__face').attr('data-index');
	if( current['index'] == 0 ){
		current['type'] = "next";
	}else{
		current['type'] = "now";
	}

	return current;
}
var paintBg = function paintBg(){
	var current = getCurrent();
	var imgObj = $('#imgBox').children().eq(current['index']);
	var color = getMainColor(imgObj);
	if( color ){
		color = RGB2Hex(color);
		var index = 3;
		if( current['index'] = 0 ){
			index = 2;
		}
		$('.spinner__face').eq(index).children().css({"background":color});
		$('.spinner__face').eq(index).find('.content__main').css({"color":analyzeColor(imgObj)});
	}
}
function setImg(src){
	var current = getCurrent();
	$('#imgBox').children().eq(current['index']).attr('src',src);
	$('.content__left','[data-type="'+current['type']+'"]').css({'background-image':'url("'+src+'")'});
	// setTimeout(paintFaces,10);
	setTimeout(paintBg,50);
}
function setInfo(obj,title,bio){
	obj.children('.info').children('h3').text(title);
	obj.children('.info').children('p').text(bio);
}