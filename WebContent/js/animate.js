// 'use strict';

var activeIndex = 0;
var limit = 0;
var disabled = false;
var $stage = undefined;
var $controls = undefined;
var canvas = false;

var SPIN_FORWARD_CLASS = 'js-spin-fwd';
var SPIN_BACKWARD_CLASS = 'js-spin-bwd';
var DISABLE_TRANSITIONS_CLASS = 'js-transitions-disabled';
var SPIN_DUR = 1000;

var appendControls = function appendControls() {
	$controls = $('.carousel__control').children('.button');
};

var setIndexes = function setIndexes() {
	$('.spinner').children().each(function (i, el) {
		$(el).attr('data-index', i);
		limit++;
	});
};

var duplicateSpinner = function duplicateSpinner() {
	var $el = $('.spinner').parent();
	var html = $('.spinner').parent().html();
	$el.append(html);
	$('.spinner').last().addClass('spinner--right');
	$('.spinner--right').removeClass('spinner--left');
	$('.spinner--right').addClass('spinner--real');
};

var paintFaces = function paintFaces() {
	$('.spinner__face').each(function (i, el) {
		var $el = $(el);
		switch( i ){
			case 0:
			case 2:
			i = 1;
			break;
			case 1:
			case 3:
			i = 0;
			break;
		}
		var color = getMainColor($('#imgBox').children().eq(i));
		if( color ){
			$el.find('.content__main').css({'color':analyzeColor($('#imgBox').children().eq(i))});
			// $el.find('.content__main').attr('data-bg',color);
			color = RGB2Hex(color);
			$el.children().css('backgroundImage', 'url(' + getBase64PixelByColor(color) + ')');
		}
	});
};

var getBase64PixelByColor = function getBase64PixelByColor(hex) {
	if (!canvas) {
		canvas = document.createElement('canvas');
		canvas.height = 1;
		canvas.width = 1;
	}
	if (canvas.getContext) {
		var ctx = canvas.getContext('2d');
		ctx.fillStyle = hex;
		ctx.fillRect(0, 0, 1, 1);
		return canvas.toDataURL();
	}
	return false;
};

var prepareDom = function prepareDom() {
	setIndexes();
	setTimeout(paintFaces,10);
	duplicateSpinner();
	appendControls();
};

var spin = function spin() {
	var inc = arguments.length <= 0 || arguments[0] === undefined ? 1 : arguments[0];

	if (disabled) return;
	if (!inc) return;
	activeIndex += inc;
	disabled = true;

	if (activeIndex >= limit) {
		activeIndex = 0;
	}

	if (activeIndex < 0) {
		activeIndex = limit - 1;
	}

	var $activeEls = $('.spinner__face.js-active');
	var $nextEls = $('.spinner__face[data-index=' + activeIndex + ']');
	$nextEls.addClass('js-next');

	if (inc > 0) {
		$stage.addClass(SPIN_FORWARD_CLASS);
	} else {
		$stage.addClass(SPIN_BACKWARD_CLASS);
	}

	$controls.removeClass('active');
	$controls.eq(activeIndex).addClass('active');

	setTimeout(function () {
		spinCallback(inc);
	}, SPIN_DUR, inc);
};

var spinCallback = function spinCallback(inc) {

	$('.js-active').removeClass('js-active');
	$('.js-next').removeClass('js-next').addClass('js-active');
	$stage.addClass(DISABLE_TRANSITIONS_CLASS).removeClass(SPIN_FORWARD_CLASS).removeClass(SPIN_BACKWARD_CLASS);

	$('.js-active').each(function (i, el) {
		var $el = $(el);
		$el.prependTo($el.parent());
	});
	setTimeout(function () {
		$stage.removeClass(DISABLE_TRANSITIONS_CLASS);
		disabled = false;
	}, 100);
};

//my functions start

var showLikeAnimation = function showLikeAnimation(){
	$('#mask').show();	
	$('#mask').animate({'opacity':'1','font-size':'2000%'},200);
	$('#mask').animate({'opacity':'0','font-size':'0'},500);
	setTimeout(out,500)
	function out(){		
		$('#mask').hide();	
	}
}

var safelyGetButton = function safelyGetButton(obj){
	var judge = obj.attr('class');
	if( judge.search("button") < 0 ){
		return obj.parent();
	}else{
		return obj;
	}
}

var processButton = function processButton(obj){
	if( obj.attr("data-info") ){
		if( obj.attr("data-info") == "like" ){
			showLikeAnimation();
			// alert("like");
			spin(-1);
		}else{
			// alert("dislike");
			spin(1);
		}
	}
}



//my functions end

var attachListeners = function attachListeners() {

    // document.onkeyup = function (e) {
    //     switch (e.keyCode) {
    //         case 38:
    //             spin(-1);
    //             break;
    //         case 40:
    //             spin(1);
    //             break;
    //     }
    // };

    $controls.on('click', function (e) {
    	e.preventDefault();
    	if (disabled) return;

    	var $el = safelyGetButton($(e.target));
        // var $el = $(e.target);
        // alert($el.attr('class'));
        processButton($el);

        // spin(1);
    });
};

var assignEls = function assignEls() {
	$stage = $('.carousel__stage');
};

var buttonAnimation = function buttonAnimation(){
	$('#rightBottomBox').hover(function(){
		$(this).children('.button').animate({'bottom':'-12%','right':'-12%'},200);
	},function(){
		$(this).children('.button').animate({'bottom':'-30%','right':'-30%'},200);
	});
}

var initAnimate = function initAnimate() {
	assignEls();
	prepareDom();
	attachListeners();
	buttonAnimation();
};