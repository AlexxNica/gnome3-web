$(document).ready(function () {
  $("a[rel='fancybox']").fancybox({
 			 'zoomSpeedIn': 200, 
			 'zoomSpeedOut': 200, 
			 'overlayShow': true,
			 'padding': 0,
			 'overlayShow': true,
			 'overlayOpacity': 0.8,
			 'overlayColor': '#000000',
			 'hideOnContentClick': true,
			 'imageScale': true,
			 'titlePosition': 'over'
			 });
		$("#splash").click(function () {
		  $(this).empty()
		    .html("<iframe width='940' height='405' src='http://www.youtube.com/embed/Ip9Bgjaspjs?autoplay=1&html5=1' frameborder='0' allowfullscreen='true'></iframe>");
		});
});
