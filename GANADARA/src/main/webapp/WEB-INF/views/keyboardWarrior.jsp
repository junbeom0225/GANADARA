<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/assets/main.css" />
</head>
<body id="top" class="is-preload">
<%@ include file="../../resources/css/header.jsp"%>
	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
				<h1>타자연습</h1>
				<p>
					한국어 연습과 자신의 타자실력을 향상시켜보세요. <br />
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
					<a href="shortall.do" class="image fit"><img
						src="resources/img/assets/typing02.png" height="233px" alt="" /></a>
					<div class="inner">
						<h3>타자연습</h3>
						<a href="shortall.do" class="button style1 fit">모든문장</a>
					</div>
				</div>

				<div class="box">
					<a href="shorttitle.do?st_title=S" class="image fit"><img
						src="resources/img/taja4.jpg" height="233px" alt="" /></a>
					<div class="inner">
						<h3>타자연습</h3>
						<a href="shorttitle.do?st_title=S" class="button style3 fit">속담</a>
					</div>
				</div>
				
				<div class="box">
					<a href="shorttitle.do?st_title=M" class="image fit"><img
						src="resources/img/taja6.jpg" height="233px" alt="" /></a>
					<div class="inner">
						<h3>타자연습</h3>
						<a href="shorttitle.do?st_title=M" class="button style3 fit">명언</a>
					</div>
				</div>
				
				<div class="box">
					<a href="keygame.do" class="image fit"><img
						src="resources/img/taja5.jpg" height="233px" alt="" /></a>
					<div class="inner">
						<h3>타자게임</h3>
						<a href="keygame.do" class="button style2 fit">타자게임</a>
					</div>
				</div>
			</div>

		</div>
	</div>
	
<%@ include file="../../resources/css/footer.jsp"%>
</body>
</html>