<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>가나다라</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/main.css" />
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
			<li><a href="eduhome.do">한국어학습</a></li>
			<li><a href="dailyBoard/list.do">글쓰기첨삭</a></li>
			<li><a href="#">타자연습</a></li>
			<li><a href="mypage.do">마이페이지</a></li>
			<c:if test="${empty login.member_email }">
				<li><a href="login.do">로그인</a></li>
			</c:if>
			<c:if test="${not empty login.member_email }">
				<li><a href="logout.do">로그아웃</a>
			</c:if>
		</ul>
	</nav>

	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
				<h1>가나다라</h1>
				<p>
					Hello. Welcome to GANADARA Korean Education Institute... <br />
					어서오세요. 가나다라 한국어 학습원입니다. 한국어 강의와 단어, 말하기, 타자연습을 통해 실력을 키우세요.
				</p>
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
					<a href="eduhome.do" class="image fit"><img
						src="resources/img/assets/korean.png" alt="" /></a>
					<div class="inner">
						<h3>한국어 학습</h3>
						<p>단계별 한국어 강의를 통해 한국어 기초를 다지고 단어학습, 말하기연습을 통해 실력을 향상합니다.</p>
						<a href="eduhome.do" class="button fit">학습하러 가기</a>
					</div>
				</div>
				
				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/speech.png" alt="" /></a>
					<div class="inner">
						<h3>말하기 연습</h3>
						<p>꾸준히 한국어 작문을 하고 튜터선생님을 통해 첨삭을 받으면 한국어 실력이 쑥쑥!</p>
						<a href="eduPractice.do" class="button style2 fit">글쓰러가기 </a>
					</div>
				</div>
				
				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/writing3.png" alt="" /></a>
					<div class="inner">
						<h3>글쓰기 첨삭</h3>
						<p>꾸준히 한국어 작문을 하고 튜터선생님을 통해 첨삭을 받으면 한국어 실력이 쑥쑥!</p>
						<a href="dailyBoard/list.do" class="button style2 fit">글쓰러가기 </a>
					</div>
				</div>

				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/writing3.png" alt="" /></a>
					<div class="inner">
						<h3>글쓰기 첨삭</h3>
						<p>꾸준히 한국어 작문을 하고 튜터선생님을 통해 첨삭을 받으면 한국어 실력이 쑥쑥!</p>
						<a href="" class="button style2 fit">글쓰러가기 </a>
					</div>
				</div>

				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/typing02.png" alt="" /></a>
					<div class="inner">
						<h3>타자연습</h3>
						<p>다양한 주제로 단문, 장문연습을 할 수 있어요. 재미있는 타자 게임과 함께 한국어 타이핑 실력을 늘려요.</p>
						<a href="" class="button style3 fit">타자연습하기</a>
					</div>
				</div>

				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/mypage02.png" alt="" /></a>
					<div class="inner">
						<h3>마이페이지</h3>
						<p>개인 정보를 수정하고 관련 자료들을 확인할 수 있어요. 결제서비스는 마이페이지에서 가능합니다.</p>
						<a href="mypage.do" class="button style2 fit">마이페이지</a>
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