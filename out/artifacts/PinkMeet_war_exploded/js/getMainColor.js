function getMainColor(imgObj){
	var colorThief = new ColorThief();
	var RGBArr = colorThief.getColor(imgObj.get(0));
	var color = "rgb("+RGBArr[0]+","+RGBArr[1]+","+RGBArr[2]+")";

	return color;
}

function RGB2Hex(color) {
	var rgb = color.split(',');
	var r = parseInt(rgb[0].split('(')[1]);
	var g = parseInt(rgb[1]);
	var b = parseInt(rgb[2].split(')')[0]);

	var hex = "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
	return hex;
}

function analyzeColor(imgObj){
	var colorThief = new ColorThief();
	var RGBArr = colorThief.getColor(imgObj.get(0));
	
	var lightness = RGBArr[0]*0.3 + RGBArr[1]*0.59 + RGBArr[2]*0.11;

	if( lightness > 128 ){
		return "#000";
	}else{
		return "#fff";
	}
}