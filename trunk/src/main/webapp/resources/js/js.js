$(function() {
	$('.wrapper-home').hover(function() {
		$(this).children().stop().animate({
			marginTop : '80%',
			opacity : 0
		}, 600);
	}, function() {
		$(this).children().stop().animate({
			marginTop : '0%',
			opacity : 1
		}, 600);
	});
})