<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#title{position: relative; margin-left:10px; padding:0;}
#play{position: absolute; width: 100px; margin-left: 20px; margin-top: 10%;}
#field{position: relative; width: 600px; height:700px;} 
#field #hanImg{position: absolute; top:0; left: 0; width: 100%; height: 100%;}
#img2{position: relative; width:100%l height:100%; }
#img2 #sunglasses{position: absolute; width:53%; left:27%; margin-top:30%;}
#content{position: relative; }
#num01, #num02{position:absolute; border-radius: 10%; border: 13px solid black; background: black; display: inline-block; 
padding-top:2%; padding-bottm:2%; font-size: xx-large; font-weight: bold;}
#num01{margin-left:30%; margin-top:50%;}
#num02{margin-left:60%; margin-top:50%;}
#next{position: absolute; margin-left:70%; margin-top:85%;}
button{margin:5px; text-align: center; background: #D31313; box-shadow: 4px 4px #840B0B; border: none; 
width: 150px; height:50px; border-radius: 10px; font-size: x-large; color:white;}

#play:hover{cursor: pointer;}
#num01:hover, #num02:hover{color: #D31313; cursor: pointer;}
button:hover{cursor: pointer;}
.num{color: white;}
.on{color:red;}
#explain{color:black;}
</style>

<title>단어연습</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/css/assets/basic.css" />
</head>
<body id="top" class="is-preload">
	<%@ include file="../../resources/css/header.jsp"%>

	

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">

				<fieldset id="field">
					<img id="hanImg" alt="hanImg"
						src="${pageContext.request.contextPath }/resources/img/hanImg.png">
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
				</fieldset>

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
									|| voices[i].lang.indexOf(lang.replace('-',
											'_')) >= 0) {
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
						utterThis.rate = 0.8; //속도
						window.speechSynthesis.speak(utterThis);
					}

					// onready 일반 
					$(document).ready(function() {
						//$("#field").hide();

						// nav
						$("#nav ul.sub").hide();
						$("#nav ul.menu li").click(function() {
							$("ul", this).slideToggle("fast");
						});

					});

					// onready a클릭 
					$(document)
							.ready(
									function(e) {
										/* a요소를 클릭 했을 시 */
										$('.detail').click(function() {
											//speech($(".voice").val());
											$('#title00').html($(this).html());
											//$("#field").show();
											$(".q").hide();
											$(".q:eq(" + idx + ")").show();

										});

										var num = document
												.getElementsByClassName('num');
										var clicked_id;
										for (var i = 0; i < num.length; i++) {
											num[i]
													.addEventListener(
															'click',
															function() {
																for (var j = 0; j < num.length; j++) {
																	num[j].style.color = 'white';
																}
																;
																clicked_id = this.id;
																this.style.color = '#D31313';
															});
										}
										;

										var idx = 0;
										$("#play")
												.click(
														function() {
															speech($(
																	"input[name=play]:eq("
																			+ idx
																			+ ")")
																	.val());
														});

										$("#next")
												.click(
														function() {
															var clicked = $(
																	'#'
																			+ clicked_id
																			+ '')
																	.text();
															var voice = $(
																	"input[name=play]:eq("
																			+ idx
																			+ ")")
																	.val();

															if ($('#num01')
																	.text() == voice
																	.charAt(0)) {
																$('#num01')
																		.css(
																				{
																					'border' : '13px solid #D31313'
																				});
															}
															if ($('#num02')
																	.text() == voice
																	.charAt(0)) {
																$('#num02')
																		.css(
																				{
																					'border' : '13px solid #D31313'
																				});
															}

															setTimeout(
																	function() {
																		idx++;
																		if (idx == 1) {
																			$(
																					"#num01")
																					.html(
																							"야");
																			$(
																					"#num02")
																					.html(
																							"여");
																		} else if (idx == 2) {
																			$(
																					"#num01")
																					.html(
																							"요");
																			$(
																					"#num02")
																					.html(
																							"유");
																		} else if (idx == 3) {
																			$(
																					"#num01")
																					.html(
																							"의");
																			$(
																					"#num02")
																					.html(
																							"이");
																		}
																		$(
																				".num")
																				.css(
																						{
																							'color' : 'white',
																							'border' : '13px solid black'
																						});
																	}, 2000);

														});
									});
				</script>


			</div>

		</div>
	</div>
	<%@ include file="../../resources/css/footer_pop.jsp"%>

</body>
</html>




























