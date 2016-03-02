$(document).ready(function(){

	setTimeout(function(){
		$(".notice-wrapper").fadeOut("slow", function() {
			$(this).remove();
		});
	}, 1000);

	$(".media").hover(function(){
		$(this).toggleClass("listing-hover");
	});

	$(".media").click(function(e){
		if(e.target.className == "silent") return;
		$(this).find(".details").toggle();
	});

	$(".sidebar-button").hover(function(){
		$(this).toggleClass("active");
	});


	$(".sidebar-button").click(function(){
		window.location = $(this).find("a").attr("href");
		return false;
	});
});
