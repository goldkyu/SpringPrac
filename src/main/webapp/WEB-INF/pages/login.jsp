<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8" />
<title>LOGO</title>
<link rel="stylesheet" href="CSS/login.css" />
</head>

<body style="overflow-x: hidden; overflow-y: scroll;">
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<jsp:include page="siteHead.jsp" />
	<section>
		<div id="mainBox">
			<div id="login">LOGIN</div>

			<form action="loging?from=<%=request.getParameter("from")%>"
				method="post">
				<div>
					<input type="text" name="inputID" placeholder="아이디" class='box' /><br>
					<input type="password" name="inputPW" placeholder="비밀번호"
						class='box' /> <input type="checkbox" class='check'> <label
						style="font: 10px"> 아이디저장 </label>
				</div>
				<div>
					<button id="button" type="submit">로그인하기</button>
					<button id="button01" type="button">
						<a href="join">회원가입하기</a>
					</button>
				</div>
			</form>
			<div class="sns">
				<div class="sns_images">
					<a href="https://www.naver.com/"> <img
						src="image/login_naver.png"></a> <a
						href="https://accounts.kakao.com/"> <img
						src="image/login_kakao.png" style="margin-left: 20px"></a> <a
						href="https://www.facebook.com/login/"> <img
						src="image/login_facebook.png" style="margin-left: 20px"></a> <a
						href="https://www.google.com/"> <img src="image/login_goo.png"
						style="margin-left: 20px"></a>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="siteFooter.jsp" />
</body>

</html>