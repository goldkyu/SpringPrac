$(function() {
	$("#gnb").hide();
	$("#stop-icon").hide();

	$("header nav").click(function() {
		$("#gnb").slideDown("1");
	});

	$("#gnb").mouseleave(function() {
		$("#gnb").slideUp("1");
	});

	$('.my-text').mouseenter(function() {
		$(this).animate({
			fontSize : '13px'
		}, 200);
	}).mouseleave(function() {
		$(this).animate({
			fontSize : '12px'
		}, 200);
	});

	
	$(".music-select").on("click", function() {
		var audioSrc = $(this).data("src"); // data-src 속성 값을 가져옴
		var audioElement = $(".audio").attr("src", audioSrc); // audio 엘리먼트 생성
		audioElement[0].play(); // 재생

	});
	
})
