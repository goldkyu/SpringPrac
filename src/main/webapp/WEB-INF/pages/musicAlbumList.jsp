<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
.album-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	margin-bottom: 200px
}

.album {
	text-align: center;
}

.album img {
	width: 200px;
	height: 200px;
	object-fit: contain;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<jsp:include page="musicHead.jsp"></jsp:include>
	<section style="width: 1000px; margin: 0 auto; margin-top: 200px;">
	
			<div class="album-container">
			
			<c:forEach items="${albums }" var="al">
				<div class="album">
					<a href="musicAlbumInfo.mu?album_id=${al.ALBUM_ID}">
					<img src="../albums/${al.ALBUM_PHOTO }" alt="Album">
					</a>
					<h3><c:out value="${al.ALBUM_NAME }"></c:out></h3>
					<p><c:out value="${al.ARTIST_NAME }"></c:out></p>
					<p><c:out value="${al.ALBUM_DATE }"></c:out></p>
					
				</div>
				</c:forEach>
			</div>
		
	</section>
		<jsp:include page="siteFooter.jsp" />
</body>

</html>