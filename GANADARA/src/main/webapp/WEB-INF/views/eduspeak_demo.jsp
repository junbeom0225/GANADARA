<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#banner {
	background-image: url("resources/img/assets/beginner_banner.png");
}
</style>

<title>발음연습</title>
<script src="${pageContext.request.contextPath }/resources/js/recorderjs/audiodisplay.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/recorderjs/recorder.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/recorderjs/main.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/eduspeak.css" />
<link rel="stylesheet" href="resources/css/assets/basic.css" />
</head>
<body id="top" class="is-preload">
	<%@ include file="../../resources/css/header.jsp"%>



	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">

				<div id="field">
					<img id="background" alt="background"
						src="${pageContext.request.contextPath }/resources/img/back.png">
					<div id="scoreBox">발음점수</div>
					<p id="score">10</p>
					<div id="content">
						<h2>학습단계</h2>
						<span>녹음버튼을 누르고 아래 문장을 따라 읽으며 연습합니다.</span>
						<div id="box1"></div>
						<div id="box2"></div>
						<div id="overlay">
							<img id="volume" alt="volume"
								src="${pageContext.request.contextPath }/resources/img/volume.png">
						</div>
						<p id="sentence">코끼리</p>
					</div>
					<canvas id="analyser"></canvas>
					<canvas id="wavedisplay" width="1024" height="500"></canvas>
					<div id="controls">
						<!-- <div id="btn01">
				<div id="rec"></div>
				<p id="start">녹음하기</p>
			</div> -->
						<div id="button">
							<img id="record"
								src="${pageContext.request.contextPath }/resources//img/mic.png"
								onclick="toggleRecording(this);"> <img id="next"
								src="${pageContext.request.contextPath }/resources//img/next.png">
						</div>
						<a id="save" href="#"> <img
							src="${pageContext.request.contextPath }/resources//img/save.svg">
						</a>
					</div>
					<div id="moon"></div>
				</div>
				<%-- <img id="stamp_great" alt="" src="${pageContext.request.contextPath }/resources/img/stamp_great.png"> --%>
				<div class="words"></div>
				<script
					src="${pageContext.request.contextPath }/resources/js/app.js"></script>




			</div>

		</div>
	</div>
	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























