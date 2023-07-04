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
/* Container styles */
.container {
	margin: 0 auto;
	width: 1000px;
	margin-top: 200px;
}

.playlist-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 20px;
	margin-bottom: 20px;
}

.playlist-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.playlist-item img {
	width: 200px;
	height: 200px;
	object-fit: cover;
	border-radius: 50%;
	margin-bottom: 10px;
}

.playlist-item .playlist-name {
	font-weight: bold;
}

.playlist-item .playlist-artist {
	font-size: 14px;
	color: #666;
	margin-bottom: 5px;
}

.playlist-item .playlist-date {
	font-size: 12px;
	color: #999;
}

/* Form styles */
.form-container {
	margin-bottom: 20px;
}

.form-container label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.form-container input[type="text"], .form-container textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 10px;
}

.form-container input[type="file"] {
	margin-bottom: 10px;
}

#pl-btn {
	background-color: #FACF1E;
	color: black;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#pl-btn:hover {
	background-color: #FACF1E;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<jsp:include page="musicHead.jsp"></jsp:include>
	<section
		style="width: 1000px; margin: 0 auto; margin-top: 200px; margin-bottom: 300px">
		<div class="container">
			<c:if test="${userID == null }">
				<p>로그인 해주세요~</p>
			</c:if>

			<c:if test="${pl != null }">
				<div class="playlist-container">
					<c:forEach items="${pl}" var="pls">
						<div class="playlist-item">
							<a href="mypl.mu?pl_id=${pls.pl_id}"><img
								src="../file/${pls.pl_prof_photo }" alt=""></a>
							<p class="playlist-name">${pls.pl_name}</p>
							<p class="playlist-artist">${pls.pl_prof_message }</p>
							<p class="playlist-date">${pls.pl_hash }</p>
						</div>
					</c:forEach>
				</div>
			</c:if>
			<div class="form-container">
				<form action="musicPlayListCreate.mu" method="post"
					enctype="multipart/form-data">
					<label for="pl_name">플레이리스트 이름:</label> <input id="pl_name"
						type="text" name="pl_name" placeholder="플레이리스트 이름" required /><br>
					<label for="pl_image">플레이리스트 사진:</label> <input id="pl_image"
						type="file" name="pl_image" accept="image/*" /><br> <label
						for="pl_description">플레이리스트 설명:</label>
					<textarea id="pl_description" name="pl_description"
						placeholder="플레이리스트 설명"></textarea>
					<br> <label for="pl_hashtags">해시태그:</label> <input
						id="pl_hashtags" type="text" name="pl_hashtags" placeholder="해시태그" /><br>
					<input id="pl-btn" type="submit" value="확인">
				</form>
			</div>


		</div>
	</section>
	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>
</body>

<script type="text/javascript">
	$("#pl-btn").attr("disabled", true);
	$("input[name=pl_name]").keyup(function() {
		$("#pl-btn").attr("disabled", false);
	});

	function nullCheck(val) {

		if (val === null)
			return true;
		if (typeof val === 'string' && val === '')
			return true;
		if (typeof val === 'undefined')
			return true;

		return false;

	}
</script>
</html>