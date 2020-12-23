<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#nav { 
	font-family:'arial';
	width: 220px;
	height: 800px;		
	float: left; 
}
#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:20px;}
#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:50px; text-indent:10px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.menu li a:hover{ background:#eee; }
#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:#ccc; }
#nav ul.menu li .sub a:hover{ background:#444; color:#fff; }

#iframe{
	width: 915px;
	height: 515px;		
	padding: 0px 0px 300px 0px; 	
}
#banner{background-image: url("resources/img/assets/korean.png");}

</style>

<title>한국어학습</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/basic.css" />
</head>
<body id="top" class="is-preload">
<%@ include file="../../resources/css/header.jsp"%>

	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
				<h1>한국어학습</h1>
				<p>
					단계별 한국어 강의를 통해 한국어 기초를 다지고 단어학습, 말하기연습을 통해 실력을 향상합니다. <br />
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
					<a href="videostudy.do" class="image fit"><img
						src="resources/img/assets/videostudy01.png" alt="" /></a>
					<div class="inner">
						<h3>동영상강의</h3>
						<a href="videostudy.do" class="button fit">강의 듣기</a>
					</div>
				</div>

				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/word.png" alt="" /></a>
					<div class="inner">
						<h3>단어연습</h3>
						<a href="" class="button style2 fit">연습하기 </a>
					</div>
				</div>

				<div class="box">
					<a href="" class="image fit"><img
						src="resources/img/assets/speaking.png" alt="" /></a>
					<div class="inner">
						<h3>발음연습</h3>
						<a href="" class="button style3 fit">연습하기</a>
					</div>
				</div>
			</div>

		</div>
	</div>

<%@ include file="../../resources/css/footer.jsp"%>

</body>
</html>