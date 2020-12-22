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

#boardview{position: relative; }
#field{background: #FBF2B0;}

#eduword01 a{margin-bottom:  10px;}
#num01{border-bottom: 1px solid black; border-top:1px solid black; border-left:1px solid black; margin-top: 10px;
	display:inline-block; height: 20px; width:20px;font-weight: bold; padding-top:20px; padding-bottom:20px; text-align: center; font-size: x-large;}
#num02, #num03{border-bottom: 1px solid black; border-top:1px solid black; border-left:1px solid black; margin-top: 10px;
	display:inline-block; width:20px; height: 20px; font-weight: bold; text-align: center; padding:20px; font-size: x-large;}
#num02:hover, #num03:hover{background: #F055C7; color:white;}
#num03{border-right: 1px solid black;}
.on{background: #F055C7; color:white;}


</style>

<title>Insert title here</title>
</head>
<body>

	<div id="nav">
		<ul class="menu">
		  	<li><a href="#">입문</a>
		   		<ul class="sub">
				    <li><a id="detail">입문_1차 한글소개</a>
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
		<input type="hidden" class="01" value="아아"/>
		<input type="hidden" class="02" value="여"/> 
		<input type="hidden" class="03" value="요"/> 
		<input type="hidden" class="04" value="의"/>  
		<div id="eduword01">
			<a>소리를 잘 듣고 다음 중 맞는 것을 고르세요.</a><br>
			<div id="num01" class="num">1</div><div id="num02" class="num">아</div><div id="num03" class="num">어</div><br>
			<div id="num01" class="num">2</div><div id="num02" class="num">야</div><div id="num03" class="num">여</div><br>
			<div id="num01" class="num">3</div><div id="num02" class="num">요</div><div id="num03" class="num">유</div><br>
			<div id="num01" class="num">4</div><div id="num02" class="num">의</div><div id="num03" class="num">이</div><br>
		</div>
	</div>
	</fieldset>
	
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
		/* a요소를 클릭 했을 시 */
		$('#detail').click(function(){
		    $('#title').html($(this).html());
		    $("#field").show();
		    //speech($(".voice").val());
		    speech($(".01").val());
		    speech($(".02").val());
		    speech($(".03").val());
		    speech($(".04").val());
		    });
		$(".num").click(function(){
			$(this).removeClass();
			$(this).addClass('on');
		});
		$(".num").click(function(){
			$(this).removeClass();
			$(this).addClass('on');
		});
	});
</script>



</body>
</html>