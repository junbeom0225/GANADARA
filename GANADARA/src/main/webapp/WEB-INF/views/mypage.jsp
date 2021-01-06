<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/mypage.css" />
<style type="text/css">
#banner{background-image: url("resources/img/assets/mypagebanner.png");}
</style>
</head>
<body id="top" class="is-preload">

	<!-- Banner -->
	<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
	<!-- Header -->
	<header id="header">
		<a class="logo" href="index.jsp">home</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="main.do">메인으로</a></li>
			<li><a href="updateview.do">회원정보수정</a></li>
			<li><a href="dailypay.do">데일리 서비스 결제</a></li>
			<li><a href="mypage.do">마이페이지</a></li>
			<li><a href="logout.do">로그아웃</a></li>
		</ul>
	</nav>

	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
				<h1>마이페이지</h1>
				<p>${login.member_nic }님 환영합니다.</p>
			</div>
			<a href="#main" class="more">Learn More</a>
		</div>
	</section>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">

				<div class="box">
					<a href="updateview.do" class="image fit"><img
						src="resources/img/assets/update.png" alt="" /></a>
					<div class="inner">
						<h3>회원 정보 수정</h3>
						<a href="updateview.do" class="button fit">수정하러 가기</a>
					</div>
				</div>
				
				<div class="box">
					<a href="updateview.do" class="image fit"><img
						src="resources/img/assets/update.png" alt="" /></a>
					<div class="inner">
						<h3>일정 관리</h3>
						<a href="calendar.do?member_no=${login.member_no }" class="button fit">일정 가기</a>
					</div>
				</div>

				<div class="box">
					<a href="dailypay.do" class="image fit"><img
						src="resources/img/assets/daily.png" alt="" /></a>
					<div class="inner">
						<h3>데일리 첨삭 결제</h3>
						<a href="dailypay.do" class="button style2 fit">첨삭 서비스 이용하기 </a>
					</div>
				</div>
			</div>
		</div>

	</div>

<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>가나다라마바사아자차카타파하</h2>
			<p>가나다라 한국어 학습은 최희선, 황다혜, 최소연, 황다혜, 박준범, 박건웅을 도움으로 제작되었습니다만, 제작물
				중 저작권은..아무것도 우리에게 없어요. 파이널 도대체 언제 끝날까요. 메리크리스마스...</p>

			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
				Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a
					href="http://coverr.co/">Coverr</a>.
			</p>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="resources/js/assets/breakpoints.min.js"></script>
	<script src="resources/js/assets/jquery.min.js"></script>
	<script src="resources/js/assets/jquery.scrolly.min.js"></script>
	<script src="resources/js/assets/jquery.poptrox.min.js"></script>
	<script src="resources/js/assets/skel.min.js"></script>
	<script src="resources/js/assets/util.js"></script>
	<script src="resources/js/assets/main.js"></script>
	<script src="resources/js/assets/browser.min.js"></script>

</body>
</html>

