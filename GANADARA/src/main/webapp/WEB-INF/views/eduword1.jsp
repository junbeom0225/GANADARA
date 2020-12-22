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

#boardview{position: relative;}
#field{}

#eduword01 a{margin-bottom:  10px;}
#num01{border-bottom: 1px solid black; border-top:1px solid black; border-left:1px solid black; margin-top: 10px;
	display:inline-block; height: 20px; width:60px;font-weight: bold; padding-top:20px; padding-bottom:20px; text-align: center; font-size: x-large;}
#num02, #num03, #num04{border-bottom: 1px solid black; border-top:1px solid black; border-left:1px solid black; margin-top: 10px;
	display:inline-block; height: 20px; font-weight: bold; text-align: center; font-size: x-large;}
#num02, #num03{width:20px; padding:20px;}
#num01:hover, #num04:hover{background: black; color:white;}
#num02:hover, #num03:hover{background: #F055C7; color:white;}
#num04{border-right: 1px solid black; width:60px;  padding-top:20px; padding-bottom:20px;}
.on{background: #F055C7; color:white;}
.onplay{background: black; color:white;}


.q{position:relative; margin-left: 40%;}

img{margin-left: 47%;}
#play{background: black; color:white; font-size: large; width: 30px; padding: 10px;}

.circle{width:60px; height:60px; border-radius: 50%; border: 4px solid red; position: absolute; left: 100px; top: 100px;}


</style>

<title>Insert title here</title>
</head>
<body>

	<div id="nav">
		<ul class="menu">
		  	<li><a href="#">입문</a>
		   		<ul class="sub">
				    <li class=""><a id="detail">입문_1차 한글소개</a>
				    </li>
				    <li><a data-url="https://www.youtube.com/embed/7JZKxnVrt88">입문_2차 모음</a></li>
				    <li><a data-url="https://www.youtube.com/embed/r0gpBIsAF-c">입문_3차 자음</a></li>
				    <li><a data-url="https://www.youtube.com/embed/3mAXRZrWPeg">입문_4차 받침</a></li>
				    <li><a data-url="https://www.youtube.com/embed/950CBBcx7PY">입문_5차 띄어쓰기</a></li>
		   		</ul>
		  	</li>
	 	</ul>
	 	<ul class="menu">
		 	<li><a href="#">초급 1</a>
		 		<ul class="sub">
		 			<li><a data-url="https://www.youtube.com/embed/oVaZ5T-1c1Y">초급_1차 어휘학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/LHd2U9DWay0">초급_2차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/FodWMWpO2Ng">초급_3차 문법연습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/Y9k-CEy07Ig">초급_4차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/45ZmkAVUdF0">초급_5차 어휘학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/PB59yRn_7L0">초급_6차 문법학습</a></li>
		 		</ul>
		 	</li>
	 	</ul>
	 	<ul class="menu">
		 	<li><a href="#">초급 2</a>
		 		<ul class="sub">
		 			<li><a data-url="https://www.youtube.com/embed/5ehF2-awFm0">초급_1차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/4qYWjAaYtWw">초급_2차 문법연습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/nDdrO-CAdBA">초급_3차 문법학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/vMDN8AA9b-c">초급_4차 문법연습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/x8_2ju6LrEQ">초급_5차 어휘학습</a></li>
		 			<li><a data-url="https://www.youtube.com/embed/ssHzZso1n-8">초급_6차 문법연습</a></li>
		 		</ul>
		 	</li>
	 	</ul>
	</div>
	
	<fieldset id="field">
	<h2 id="title"></h2>
	<div id="boardview">
		<input type="hidden" class="voice" value="지금부터 학습을 시작합니다. 소리를 잘 듣고 다음 중 맞는 것을 고르세요."/> 
		<input type="hidden" name="play" value="아아"/>
		<input type="hidden" name="play" value="여"/> 
		<input type="hidden" name="play" value="요"/> 
		<input type="hidden" name="play" value="의"/>  
		<div id="eduword01">
			<a>1.</a><a>소리를 잘 듣고 다음 중 맞는 것을 고르세요.</a><br>
			<%-- <img alt="play" src="${pageContext.request.contextPath }/resources/img/pngwing.png" width="30" height=30" > --%>
			<div class="q">
				<div id="num01" class="play">듣기 </div><div id="num02" class="num">아</div><div id="num03" class="num">어</div><div id="num04" class="next">다음</div>
			</div>
		</div>
	</div>
	</fieldset>
	
	<div class="circle"></div>
	
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

	var voices = [];
	function setVoiceList() {
		voices = window.speechSynthesis.getVoices();
	}
	setVoiceList();
	if (window.speechSynthesis.onvoiceschanged !== undefined) {
		window.speechSynthesis.onvoiceschanged = setVoiceList;
	}
	function speech(txt) {
		if (!window.speechSynthesis) {
			alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
			return;
		}
		var lang = 'ko-KR';
		var utterThis = new SpeechSynthesisUtterance(txt);
		utterThis.onend = function(event) {
			console.log('end');
		};
		utterThis.onerror = function(event) {
			console.log('error', event);
		};
		var voiceFound = false;
		for (var i = 0; i < voices.length; i++) {
			if (voices[i].lang.indexOf(lang) >= 0
					|| voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
				utterThis.voice = voices[i];
				voiceFound = true;
			}
		}
		if (!voiceFound) {
			alert('voice not found');
			return;
		}
		utterThis.lang = lang;
		utterThis.pitch = 0.95;
		utterThis.rate = 0.9; //속도
		window.speechSynthesis.speak(utterThis);
	}

	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#field").hide();		
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
	
	$(document).ready(function(e) {
		var idx = 0;
		/* a요소를 클릭 했을 시 */
		$('#detail').click(function(){
			//$("#circle").hide();
			//speech($(".voice").val());
		    $('#title').html($(this).html());
		    $("#field").show();
		    $(".q").hide();
		    $(".q:eq(" + idx + ")").show();
		   
		    });
		$(".num").click(function(){
			$(this).removeClass();
			$(this).addClass('on');
		});
		$(".num").click(function(){
			$(this).removeClass();
			$(this).addClass('on');
		});
		$(".play").click(function(){
			$(this).removeClass();
			$(this).addClass('onplay');
			speech($("input[name=play]:eq(" + idx + ")").val());
		});
		$(".next").click(function(){
			idx++;
			if(idx==1){
				$("#num02").html("야");
				$("#num03").html("여");
			} else if(idx==2){
				$("#num02").html("요");
				$("#num03").html("유");
			} else if(idx==3){
				$("#num02").html("의");
				$("#num03").html("이");
			}
			$(".onplay").addClass(".play");
			$(".onnext").addClass(".next");
		});
	});
</script>



</body>
</html>