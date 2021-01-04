<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#box{position: relative; width:100%; height:100%; background: #2c2c32; border-radius: 2em;}
#box span{color:white;}
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
				<div id="box">
				
					<input type="hidden" id="edu_no" name="edu_no" value="${dto.edu_no }">
					<input type="hidden" id="edu_grade" name="edu_grade" value="${dto.edu_grade }">
					
					<div id="scoreBox">발음점수</div>
					<p id="score">10</p>
					<div id="content">
						<h2 id="title">발음평가</h2>
						<span>녹음버튼을 누르고 아래 문장을 따라 읽으며 연습합니다.</span>
						<div id="box1"></div>
						<div id="box2"></div>
						<div id="overlay">
							<img id="volume" alt="volume"
								src="${pageContext.request.contextPath }/resources/img/volume.png">
						</div>
						<p id="sentence"></p>
					</div>
					<div id="button">
							<img id="record"
								src="${pageContext.request.contextPath }/resources//img/mic.png" onclick="toggleRecording(this);"> 
								<img id="next" src="${pageContext.request.contextPath }/resources//img/next.png">
						</div>
					<canvas id="analyser"></canvas>
					<canvas id="wavedisplay" width="1024" height="500"></canvas>
					<div id="controls">
						<!-- <div id="btn01">
				<div id="rec"></div>
				<p id="start">녹음하기</p>
			</div> -->
						
						<a id="save" href="#"> <img
							src="${pageContext.request.contextPath }/resources//img/save.svg">
						</a>
					</div>
				</div>
				<%-- <img id="stamp_great" alt="" src="${pageContext.request.contextPath }/resources/img/stamp_great.png"> --%>
				<div class="words"></div>
				<script src="${pageContext.request.contextPath }/resources/js/app.js"></script>

				<c:choose>
					<c:when test="${empty eduWordList }">
						<p>연결 오류 입니다. 다시 시도해주세요.</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${eduWordList }" var="dto">
							<input type="hidden" id="edu_level" name="edu_level" value="${dto.ew_level }">
							<input type="hidden" id="ew_content" name="ew_content" value="${dto.ew_content }"  />
						</c:forEach>
					</c:otherwise>
				</c:choose>


			</div>

		</div>
	</div>
	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























