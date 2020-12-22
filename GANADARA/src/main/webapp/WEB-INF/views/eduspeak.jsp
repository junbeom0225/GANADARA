<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/recorderjs/audiodisplay.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/recorderjs/recorder.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/recorderjs/main.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<style type="text/css">

#field{position: relative; width: 1000px; height:500px;} 
#field #background{position: absolute; top:0; left: 0; width: 100%; height: 100%;}
#content{position: absolute; margin-left:10px; padding:0; margin-bottom: 0;}
#content h2{margin-left: 45%;}
#content span{margin: 0; padding:0;}
#content #box1{position:absolute; width: 148%; height:20%; margin-top: 20%; margin-left: 65%; background: white; opacity: 0.5; }
#content #box2{position:absolute; width: 148%; height:30%; margin-top: 40%; margin-left: 65%; background: gray; opacity: 0.3; }
#content p{position:relative; width: 100%; margin-top: 22%; margin-left: 83%; font-size: 25px; z-index: 1;}
#overlay{position: absolute; margin-top: 20%; margin-left: 67%;}
#volume{position: absolute; width: 40px;}
#stamp{position: absolute; z-index: 1;}
#stamp_great{position: absolute; width:15%; z-index: 1; margin-left: 70%;}
.para{position: absolute;}

#viz {
	position: relative;
	height: 80%;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}
canvas {
	position: absolute;
	display: inline-block;
	width: 45%;
	height: 10%;
}
#analyser {
	position: absolute;
	display:inline-block;
	margin-top: 42.5%;
	width: 60%;
	height: 15%;
}
#wavedisplay{
	position: relative;
	margin-top: 22%;
	margin-left: 24%;
	width: 50%;
	height: 15%;
	z-index: 1;
}
@media ( orientation : landscape) {
	body {
		flex-direction: row;
	}
	#controls {
		flex-direction: column;
		height: 100%;
		width: 10%;
	}
	#viz {
		height: 100%;
		width: 90%;
	}
}
#record {
	width: 70px;
	cursor: pointer;
}

#next{
	position: absolute;
	width: 70px;
	margin-left: 50px;
	cursor: pointer;
}

#record.recording {
	background: red;
	background: -webkit-radial-gradient(center, ellipse cover, #ff0000 0%, white 75%
		, white 100%, #7db9e8 100%);
	background: -moz-radial-gradient(center, ellipse cover, #ff0000 0%, white 75%,
		white 100%, #7db9e8 100%);
	background: radial-gradient(center, ellipse cover, #ff0000 0%, white 75%,
		white 100%, #7db9e8 100%);
}
#controls{position: absolute;}
#button{position: absolute; margin-left:400px; margin-top: 30px;}
#btn01{position:relative; width:50px; height:30px; margin-left: 300%; margin-top: 30%;}
#rec{position: absolute; background: #D31313; border-radius: 50%; width: 20px; height:20px; margin-left:10px;
background: -webkit-radial-gradient(center, ellipse cover, #D31313 20%, white 75%
		,  #D31313 100%);}
#start{color: #D31313; cursor: pointer; font-size: 12px; padding-top: 25px;} 
#moon{position: absolute;}
#scoreBox{position: absolute; margin-left: 75%; margin-top:18%; font-size: small; background:black; color: #EAC117; text-align: center; width: 5%;}
#score{position: absolute; margin-left: 76%; margin-top:20%; font-size: 40px; font-weight: bold; color: #D4A017; text-shadow: 2px 2px 2px #EAC117;}

</style>
</head>
<body>

	<div id="field">
		<img id="background" alt="background" src="${pageContext.request.contextPath }/resources/img/back.png">
		<div id="scoreBox"> 발음점수 </div>
		<p id="score">10</p>	
		<div id="content">
			<h2>학습단계</h2>
			<span>녹음버튼을 누르고 아래 문장을 따라 읽으며 연습합니다.</span>
			<div id="box1"></div>
			<div id="box2"></div>
			<div id="overlay">
				<img id="volume" alt="volume" src="${pageContext.request.contextPath }/resources/img/volume.png">
			</div>
			<p id="sentence">코끼리</p>		
		</div>		
			<canvas id="analyser" ></canvas>
			<canvas id="wavedisplay" width="1024" height="500"></canvas>
		<div id="controls">
			<!-- <div id="btn01">
				<div id="rec"></div>
				<p id="start">녹음하기</p>
			</div> -->
			<div id="button">
				<img id="record" src="${pageContext.request.contextPath }/resources//img/mic.png" onclick="toggleRecording(this);"> 
				<img id="next" src="${pageContext.request.contextPath }/resources//img/next.png">
			</div>
			<a id="save" href="#">
				<img src="${pageContext.request.contextPath }/resources//img/save.svg">
			</a>
		</div>
		<div id="moon">
		</div>
	</div>
	<%-- <img id="stamp_great" alt="" src="${pageContext.request.contextPath }/resources/img/stamp_great.png"> --%>
	<div class="words"></div>
	<script src="${pageContext.request.contextPath }/resources/js/app.js"></script>
	
</body>
</html>













