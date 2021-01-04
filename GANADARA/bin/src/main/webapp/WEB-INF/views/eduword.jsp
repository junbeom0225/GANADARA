<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
div{position: relative;}
#title {
	position: relative;
	margin-left: 2em;
	padding: 0;
}
h2{margind-bottom:0; padding-bottom:0;}
#title00{padding-top: 1em; margin-bottom:0; padding-bottom:0;}
#explain {color: white; margin:0; padding:0;}
#play {
	position: absolute;
	width: 4em;
	margin-left: 20em;
	margin-top: 6em;
}
button {margin-left: 50em; margin-top: 30em; width: 15em; }
#img2 {
	position: relative;
	width: 100% l height:100%;
}


#num01, #num02 {
	width:15%;
	position: absolute;
	border-radius: 10%;
	border: 13px solid #f5f5f5;
	background: #f5f5f5;
	color: black;
	display: inline-block;
	padding-top: 1%;
	padding-bottm: 2%;
	font-size: xxx-large;
	font-weight: 900;
	text-align: center;
}

#num01 {
	margin-left: 11em ;
	margin-top: 2em;
}

#num02 {
	margin-left: 17em;
	margin-top: 2em;
}

#play:hover {
	cursor: pointer;
}

#num01:hover, #num02:hover {
	color: #9d7ed0;
	cursor: pointer;
}

button:hover {
	cursor: pointer;
}

.num {
	color: white;
}

.on {
	color: red;
}

#thumbnails{width: 100%; height: 600px; margin-right:2em; margin-top: 2em; margin-bottom:1em; }
#box{position: relative; width:100%; height:100%; background: #2c2c32; border-radius: 2em;}
</style>

<title>단어연습</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/eduwords.css" />
</head>
<body id="top" class="is-preload">
	<%@ include file="../../resources/css/header.jsp"%>



	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div id="thumbnails">
			
			<div id="box">
				<c:choose>
					<c:when test="${empty eduWordList}">
						<p>연결 오류 입니다. 다시 시도해 주세요. </p>
					</c:when>
					<c:otherwise>
							
							<div id="title">
								<h2 id="title00">단어연습</h2>
								<a id="explain">소리를 잘 듣고 다음 중 맞는 것을 고르세요. </a>	
							</div>
							<div id="content">
								<a id="num01" class="num">아</a>
								<a id="num02" class="num">야</a>
							</div>
							<img id="play" alt="play" src="${pageContext.request.contextPath }/resources/img/volume.png">
							<button id="next">다 음</button>
							<input type="hidden" class="voice" value="지금부터 학습을 시작합니다. 소리를 잘 듣고 다음 중 맞는 것을 고르세요." /> 
							
							<c:forEach items="${eduWordList }" var="dto">
								<input type="hidden" id="edu_no" name="edu_no" value="${dto.edu_no }">
								<input type="hidden" id="edu_grade" name="edu_grade" value="${dto.edu_grade }">
								<input type="hidden" id="edu_level" name="edu_level" value="${dto.ew_level }">
								<input type="hidden" id="edu_content" name="play" value="${dto.ew_content }"  />
							
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
			
				
			</div>

				<%-- <fieldset id="field">
					
					<div id="img2">
						<img id="sunglasses" alt="sunglasses"
							src="${pageContext.request.contextPath }/resources/img/sun2.png">
					</div>
					<div id="content">
						<p id="num01" class="num">아</p>
						<p id="num02" class="num">야</p>
					</div>
					<div id="title">
						<h2 id="title00"></h2>
						<a id="explain">소리를 잘 듣고 <br> 다음 중 맞는 것을 고르세요.
						</a>
					</div>
					<img id="play" alt="play"
						src="${pageContext.request.contextPath }/resources/img/volume.png">
					<div id="next">
						<button>다 음</button>
					</div>
					<input type="hidden" class="voice"
						value="지금부터 학습을 시작합니다. 소리를 잘 듣고 다음 중 맞는 것을 고르세요." /> <input
						type="hidden" name="play" value="아" /> <input type="hidden"
						name="play" value="여" /> <input type="hidden" name="play"
						value="요" /> <input type="hidden" name="play" value="의" />
				</fieldset> --%>

				
			</div>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">

	// voice
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
		utterThis.pitch = 0.90;
		utterThis.rate = 0.7; //속도
		window.speechSynthesis.speak(utterThis);
	}
		
	
	$("#num01").html($("input[name=play]:eq(0)").val());
	$("#num02").html($("input[name=play]:eq(1)").val());

	
	// onready a클릭 
	$(document).ready(function(e) {
		/* a요소를 클릭 했을 시 */
		$('.detail').click(function(){
			//speech($(".voice").val());
		    $('#title00').html($(this).html());
		    //$("#field").show();
		    $(".q").hide();
		    $(".q:eq(" + idx + ")").show();
		   
		    });
		
		var num = document.getElementsByClassName('num');
		var clicked_id;
		for(var i = 0; i<num.length; i++){
			num[i].addEventListener('click', function(){
				for(var j = 0; j< num.length; j++){
					num[j].style.color='black';
				};
				clicked_id = this.id;
				this.style.color='#9d7ed0';
			});
		};
		
		var idx = 0;
		var ran_play = 0;
		$("#play").click(function(){
			var ran = Math.floor(Math.random()*2);
			ran_play = ran;
			//alert('idx: ' + idx + ', idx+ran: ' + (idx+ran));
			speech($("input[name=play]:eq(" + (idx+ran) + ")").val());
		});
		
		$("#next").click(function(){

			var clicked = $('#' + clicked_id +'').text();
			var voice = $("input[name=play]:eq(" + (idx+ran_play) + ")").val();
			//$edu_content = $("input[name=play]:eq(" + (idx+ran) + ")").val();
			
			if($('#num01').text() == voice){
				$('#num01').css({'border':'13px solid #9d7ed0'});
			}
			if($('#num02').text() == voice){
				$('#num02').css({'border':'13px solid #9d7ed0'});
			}
			
			setTimeout(function(){
				idx+=2;
				var ran = Math.floor(Math.random()*2);
				ran_play = ran;
				$("#num01").html($("input[name=play]:eq("+idx+")").val());
				$("#num02").html($("input[name=play]:eq("+(idx+1)+")").val());
				
				$(".num").css({'color':'black','border':'13px solid #f5f5f5'});
				
				setTimeout(function(){
					speech($("input[name=play]:eq(" + (idx+ran) + ")").val());
				}, 1000);
								
			}, 2000);
			
			$('button').click(function(){
				if(idx > $('input[name=play]').length) {
					$('p').hide();
					$('#thumbnails')
					.append('<p style="text-align:center; padding-top:20%; font-weight:bold; font-size:x-large">모든 학습을 마쳤습니다. 다음 단원으로 넘어가세요.</p>');
					$('button').html('다음 학습 하기');
						location.href = 'eduDetail.do?edu_grade=' + $('#edu_grade').val();
				}
			});
			
		});
		
	});
</script>
	
	
	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























