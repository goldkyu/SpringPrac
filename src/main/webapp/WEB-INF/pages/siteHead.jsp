<!-- JSP 코드블럭 -->
<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="CSS/header.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">

</head>

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
					<li><a href="logOut">LogOut</a></li>
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
					<input type="text" id="search" /> <a href=#><img id="find-btn"
						src="image/find.png" alt=""></a>
				</div>
			</form>

		<div id="slide-con">
			<div id="slideshow">
				<div>
					<img src="image/headslide1.jpg" alt="Slideshow Image">
				</div>
				<div>
					<img src="image/headslide2.jpg" alt="Slideshow Image">
				</div>
				<div>
					<img src="image/headslide3.jpg" alt="Slideshow Image">
				</div>
			</div>
		</div>


	</header>

</body>
<script>

var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementById("slideshow").getElementsByTagName("div");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}
    slides[slideIndex-1].style.display = "block";
    setTimeout(showSlides, 8000); // Change image every 5 seconds
}
</script>
</html>