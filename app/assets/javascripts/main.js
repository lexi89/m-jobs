$(document).ready(function(){
	
	setTimeout(function(){
		$(".notice-wrapper").fadeOut("slow", function() {
			$(this).remove();
		});
	}, 4000);

	$(".media").hover(function(){
		$(this).toggleClass("listing-hover");
	});

	$(".media").click(function(){
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
 