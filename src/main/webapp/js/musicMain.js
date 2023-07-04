$(function() {

	$('.selAlbum').hide();
	$('.selRank').hide();

	$(".album-name").hide();

	$(document).ready(function() {
		$('th').hover(function() {
			$(this).closest('tr').find('.rankmName, .aName').stop().animate({
				fontSize : '19px'
			}, 'fast');
			$(this).closest('tr').find('.rankAl img').stop().animate({
				width : '55px',
				height : '55px'
			}, 'fast');
			$(this).closest('tr').find('th').stop().animate({
				height : '59px'
			}, 'fast');
			$(this).closest('tr').find('.download').stop().animate({
				width : '35px',
				height : '35px'
			}, 'fast');
		}, function() {
			$(this).closest('tr').find('.rankmName, .aName').stop().animate({
				fontSize : '16px'
			}, 'fast');
			$(this).closest('tr').find('.rankAl img').stop().animate({
				width : '46px',
				height : '46px'
			}, 'fast');
			$(this).closest('tr').find('th').stop().animate({
				height : '50px'
			}, 'fast');
			$(this).closest('tr').find('.download').stop().animate({
				width : '25px',
				height : '25px'
			}, 'fast');
		});
	});

	$(".rankup").each(function() {
		 value = parseFloat($(this).text());
		if (value < 0) {
			$(this).css("color", "blue");
		} else if (value > 0) {
			$(this).text("+" + $(this).text());
			$(this).css("color", "red");
		}
		
	});

	

	var slideText = [ 'Sam Smith <br>250만년만의 내한', 'NEW ALBUM <br>YOASOBI',
			'유튜브 채널 개설', 'NEW ALBUM <br>길구봉구' ]

	var slides = $('.slideshow .slide');
	var slideIndex = 0;
	var intervalId = setInterval(changeSlide, 5000); // 3초마다 슬라이드 변경

	document.getElementById('slidetext1').innerHTML = slideText[0];
	document.getElementById('slidetext2').innerHTML = slideText[1];
	document.getElementById('slidetext3').innerHTML = slideText[2];
	document.getElementById('slidetext4').innerHTML = slideText[3];

	function changeSlide() {

		// 현재 슬라이드 페이드아웃
		slides.eq(slideIndex).fadeOut(3000, function() {
			$(this).removeClass('active');
		});
		// 다음 슬라이드 페이드인
		slideIndex = (slideIndex + 1) % slides.length;
		slides.eq(slideIndex).fadeIn(3000, function() {
			$(this).addClass('active');
		});
	}
});
