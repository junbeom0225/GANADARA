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
#banner{background-image: url("resources/img/assets/studyvideo.png");}}

</style>

<title>동영상강의</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/basic.css" />
</head>
<body id="top" class="is-preload">
<%@ include file="../../resources/css/header.jsp"%>

	<section id="banner" data-video="resources/img/assets">
		<div class="inner">
			<div id="h">
				<h1>동영상강의</h1>
				<p>
					자음, 모음의 한글 기초부터 단어와 문법을 익히며 한국어 고수가 되어보세요. <br />
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
					<a href="eduDetail.do?edu_grade=입문" class="image fit"><img
						src="resources/img/assets/beginner.png" alt="" /></a>
					<div class="inner">
						<h3>입문</h3>
						<a href="eduDetail.do?edu_grade=입문" class="button fit">학습하기</a>
					</div>
				</div>

				<div class="box">
					<a href="eduDetail.do?edu_grade=초급" class="image fit"><img
						src="resources/img/assets/start01.png" alt="" /></a>
					<div class="inner">
						<h3>초급</h3>
						<a href="eduDetail.do?edu_grade=초급" class="button style2 fit">학습하기</a>
					</div>
				</div>

				<div class="box">
					<a href="eduDetail.do?edu_grade=중급" class="image fit"><img
						src="resources/img/assets/start02.png" alt="" /></a>
					<div class="inner">
						<h3>중급</h3>
						<a href="eduDetail.do?edu_grade=중급" class="button style3 fit">학습하기</a>
					</div>
				</div>
			</div>

		</div>
	</div>

<%@ include file="../../resources/css/footer.jsp"%>

</body>
</html>