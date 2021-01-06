<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/basic.css" />
<style type="text/css">
	.goog-te-gadget-simple {
 	margin: 0;
    padding: 0;
    border: 0;
    background-color: #111111;
    height: 52px;
    
 }
 	.goog-te-gadget-simple span {
 	background-color: white;
 	
 	}
 	.goog-te-gadget-simple img {
 	display: none;
 	}
</style>
</head>
<body id="top" class="is-preload">

	<header id="header">
		<a class="logo" href="index.jsp">home</a>
		<div id="google_translate_element" class="hd_lang" style="background: #111111; height: 52px;"></div>
		
		<!-- <a class="logo" href="">back</a> -->
		<nav>
			<a href="#menu">Menu</a>
			
		</nav>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="eduhome.do">한국어학습</a></li>
			<li><a href="list.do">글쓰기첨삭</a></li>
			<li><a href="keyboard.do">타자연습</a></li>
			<li><a href="mypage.do">마이페이지</a></li>
			<c:if test="${empty login.member_email }">
				<li><a href="login.do">로그인</a></li>
			</c:if>
			<c:if test="${not empty login.member_email }">
				<li><a href="logout.do">로그아웃</a>
			</c:if>
		</ul>
	</nav>
		
	<div id="me"></div>
		
	
	<script src="resources/js/assets/breakpoints.min.js"></script>
<!-- Google 번역 -->
<script>
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage: 'ko',
			includedLanguages: 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
			layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
			autoDisplay: false
		}, 'google_translate_element');
	}
</script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!-- //Google 번역 -->
</body>
</html>