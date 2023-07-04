<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet" />
<title>LOGO MUSIC</title>
<link rel="stylesheet" href="CSS/musicHead.css" />
<link rel="stylesheet" href="CSS/musicPlayer.css" />
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/musicHead.js"></script>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<header>
		<div id="mainHeader">
			<div id="leftNav">
				<ul>
					<li><a href="main">Music</a></li>
				</ul>
			</div>
			<div id="rightNav">
				<ul>
					<%
					if (session.getAttribute("userID") == null) {
					%>
					<li><a href="login">LogIn</a></li>
					<li><a href="join">Join</a></li>
					<%
					} else {
					%>
					<li><a href="#"><%=session.getAttribute("userID")%> </a></li>
					<li><a href="logOut.jsp">LogOut</a></li>
					<%
					}
					%>
				</ul>
			</div>

			<form>
				<div id="logo">
					<a href="index">LOGO</a>
				</div>
				<div class="search-bar">
					<input type="text" id="search" /> <a href="#"><img
						id="find-btn" src="image/find.png" alt="" /></a>
				</div>
			</form>
			<!-- 플레이어 -->
			<div class="audio-player">
				<audio src="" class="audio" controls controlsList="nodownload"></audio>

			</div>
			<!-- 플레이어 -->
		</div>
		<nav>
			<ul>
				<li>실시간 차트</li>
				<li>최신 음악</li>
				<li>장르 음악</li>
				<li>나만의 차트</li>
				<li>이벤트</li>
			</ul>
		</nav>

		<div id="gnb">
			<div id="gnbBox">
				<ul>
					<li><a href="" class="my-text"> Top 100</a></li>
					<li><a href="" class="my-text"> 일간</a></li>
					<li><a href="" class="my-text"> 월간</a></li>
					<li><a href="" class="my-text"> 주간</a></li>
				</ul>
				<ul>
					<li><a href="" class="my-text"> 최신곡</a></li>
					<li><a href="" class="my-text"> 최신 앨범</a></li>
				</ul>
				<ul>
					<li><a href="" class="my-text"> 국내</a></li>
					<li><a href="" class="my-text"> 국외</a></li>
					<li><a href="" class="my-text"> 그 외</a></li>
				</ul>
				<ul>
					<li><a href="musicOnlyMyChart.mu" class="my-text"> 나만의 차트</a></li>
					<li style="width: 120px"><a href="musicPlayList.mu"
						class="my-text"> 플레이리스트</a></li>
					<li><a href="" class="my-text"> 맞춤 추천</a></li>
				</ul>
				<ul>
					<li><a href="" class="my-text"> 이벤트 메인 </a></li>
					<li><a href="board.jsp" class="my-text"> 이벤트 참여</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>
<%
if (session.getAttribute("userID") != null) {
%>
<script>
	$(".audio").on("ended", function() {
		var songName = $(this).attr("src");
		songName = songName.replace(/^.*[\/]/, '');
		songName = songName.replace(/.[^/.]+$/, "");

		// Ajax 호출
		$.ajax({
			url : "listen", // 요청을 보낼 서블릿 경로
			type : "POST", // POST 방식으로 요청을 보냄
			data : {
				"songName" : songName
			}, // 전달할 데이터
			success : function(data) {
				// 서블릿에서 전달한 응답을 처리
			},
			error : function(xhr, status, error) {
				// 에러 발생 시 처리
				alert("ajax 실패");
			}
		});
	});
</script>
<%
}
%>
</html>
