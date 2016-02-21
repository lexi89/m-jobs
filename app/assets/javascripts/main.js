$(document).ready(function(){
	$(".sidebar-button").hover(function(){
		$(this).toggleClass("active");
	});

	$(".sidebar-button").click(function(){
		window.location = $(this).find("a").attr("href");
		return false;
	});
});
 