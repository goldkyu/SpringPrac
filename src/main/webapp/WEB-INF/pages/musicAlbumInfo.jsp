<%@page import="com.logo.model.Music"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	System.out.println("앨범페이지");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGO</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.album-info {
	display: flex;
	align-items: center;
	margin: 20px;
}

.album-image {
	width: 200px;
	height: 200px;
	margin-right: 20px;
}

.album-title {
	font-size: 36px;
	font-weight: bold;
	margin: 0;
	padding: 0;
}

.artist-name {
	font-size: 24px;
	margin: 0;
	padding: 0;
}

.release-date {
	font-size: 18px;
	margin: 0;
	padding: 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	font-size: 18px;
	font-weight: bold;
}

td {
	font-size: 16px;
}

.play-button {
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 4px;
}
.popup-container {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999;
}

.playlist-popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
}

.playlist-popup h3 {
	text-align: center;
}

.playlist-list {
	list-style: none;
	padding: 0;
}

.playlist-list li {
	margin-bottom: 10px;
}

.close-button {
	margin-top: 20px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<%
		ArrayList<Music> musicList = (ArrayList<Music>) request.getAttribute("musics");
	%>
	<jsp:include page="musicHead.jsp" />
	<section style="width: 1000px; margin: 0 auto; margin-top: 200px;">
		<div>
			<div class="album-info">
				<img alt="" src="../albums/<%=musicList.get(0).getAlbum_prof_photo()%>"
					class="album-image" style="object-fit: contain;">
				<div class="album-details">
					<h1 class="album-title"><%=musicList.get(0).getAlbum_name()%></h1>
					<h2 class="artist-name"><%=musicList.get(0).getA_name()%></h2>
					<p class="release-date"><%=musicList.get(0).getM_date()%></p>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th>Track Number</th>
						<th>Music Title</th>
						<th>Play Time</th>
						<th>Artist</th>
						<th>Play</th>
						<th>Down</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach items="${musics }" var="m">

						<tr>
							<td>${m.MUSIC_TRACK_NUM }</td>
							<td>${m.MUSIC_NAME }</td>
							<td>${m.MUSIC_PLAYTIME }</td>
							<td>${m.ARTIST_NAME }</td>
							<td><button class="play-button music-select"
									style="background-color: white;"
									data-src="../music/${m.MUSIC_NAME}.mp3">
									<img style="width: 30px; height: 30px;" class="download"
										src="../image/btn_right.png" alt="">
								</button></td>
							<td><button
									style="border: none; color: white; background-color: white; padding-left: 10px;"
									class="list-select">
									<img style="width: 30px; height: 30px;" class="download"
										src="../image/download.png" alt="">
								</button> <input type="hidden" value="${m.MUSIC_ID }" /></td>
						</tr>
					</c:forEach>





				</tbody>
			</table>
		</div>

		<div class="popup-container">
			<div class="playlist-popup">
				<c:if test="${sessionScope.userID != null }">

					<ul class="playlist-list">
						<c:forEach items="${pls }" var="p">
							<li class="pl-add"><a>${p.pl_name }</a><input class="pl-id"
								type="hidden" value="${p.pl_id }" /></li>

						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${sessionScope.userID eq null }">
					<p>로그인 해주세요.</p>
				</c:if>
				<button class="close-button">Close</button>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>
</body>
<script type="text/javascript">
	var list
	$(".list-select").on("click", function() {
		$(".popup-container").fadeIn();
		list = $(this);
	});

	$(".close-button").on("click", function() {
		$(".popup-container").fadeOut();
	});

	$(".pl-add").on("click", function() {
		var plname = $(this).find(".pl-id").val();
		var mId = list.closest("tr").find("input[type='hidden']").val();
		$.ajax({
			url : "plUpdate.mu",
			type : "POST",
			data : {
				"pl_id" : plname,
				"m_id" : mId
			}, // 전달할 데이터
			success : function(data) {
				// 서블릿에서 전달한 응답을 처리
				alert("추가되었습니다.");
			},
			error : function(xhr, status, error) {
				// 에러 발생 시 처리
				alert("실패하였습니다.");
			}
		})
	})
</script>
</html>