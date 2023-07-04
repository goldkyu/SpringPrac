<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<style>
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<jsp:include page="musicHead.jsp"></jsp:include>
	<section style="width: 1000px; margin: 0 auto; margin-top: 200px;">

		<div>
			<div class="album-info">
				<img alt="" src="../file/${pl.pl_prof_photo}"
					class="album-image" style="object-fit: contain;">
				<div class="album-details">
					<h1 class="album-title">
						<c:out value="${pl.pl_name }"></c:out>
					</h1>
					<h2 class="artist-name">
						<c:out value="${pl.u_id }"></c:out>
					</h2>
					<h2 class="artist-name">
						<c:out value="${pl.pl_prof_message }"></c:out>
					</h2>
				</div>
			</div>

			<table>
				<thead>
					<tr>
						<th>Music Title</th>
						<th>Play Time</th>
						<th>Artist</th>
						<th>Play</th>
					</tr>
				</thead>
				<tbody>

					<c:if test="${pl_ml != null }">
						<c:forEach items="${pl_ml }" var="ml">

							<tr>
								<td>${ml.MUSIC_NAME }</td>
								<td>${ml.MUSIC_PLAYTIME }</td>
								<td>${ml.ARTIST_NAME }</td>
								<td><button class="play-button music-select"
										style="background-color: white;"
										data-src="../music/${ml.MUSIC_NAME}.mp3">
										<img style="width: 30px; height: 30px;" class="download"
											src="../image/btn_right.png" alt="">
									</button></td>
							</tr>
						</c:forEach>
					</c:if>




				</tbody>
			</table>

		</div>
		<a href="musicAlbumList.mu"><button>음악 추가하기</button></a>
	</section>
	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>
</body>

<script type="text/javascript">
	$(".audio").on("ended", function() {

	})
</script>
</html>