function setCookie(c_name, value, expiredays) {
	document.cookie=c_name+ "=" +escape(value)+ ";path=/"+
	((expiredays==null) ? "" : ";expires="+exdate);
}

var url = window.location.toString();
if ( (end=url.indexOf('.html.')) != -1) {
	var lang = url.substring(end+6, end+9);
	setCookie('language', lang, 30);
}
