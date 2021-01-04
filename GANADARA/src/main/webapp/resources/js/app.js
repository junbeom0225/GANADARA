window.SpeechRecognition =
	window.SpeechRecognition || window.webkitSpeechRecognition;


// 인스턴스 생성
const recognition = new SpeechRecognition();

// true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
recognition.interimResults = true;
// 값이 없으면 HTML의 <html lang="en">을 참고합니다. ko-KR, en-US
recognition.lang = "ko-KR";
// true means continuous, and false means not continuous (single result each time.)
// true면 음성 인식이 안 끝나고 계속 됩니다.
recognition.continuous = true;
// 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체합니다.
// maxAlternatives가 크면 이상한 단어도 문장에 적합하게 알아서 수정합니다.
recognition.maxAlternatives = 10000;

let p = document.createElement("p");
p.id = "para";

let words = document.querySelector(".words");
words.appendChild(p);

let speechToText = "";
var para = new Array();

recognition.addEventListener("result", (e) => {
	if (para.length > 0) {
		para = new Array();
	}
	let interimTranscript = "";
	for (let i = e.resultIndex, len = e.results.length; i < len; i++) {
		let transcript = e.results[i][0].transcript;
		console.log(transcript);
		if (e.results[i].isFinal) {
			speechToText += transcript;
		} else {
			interimTranscript += transcript;
		}
	}
	document.querySelector("#para").innerHTML = speechToText + interimTranscript;
	//alert(para.length);
	para = document.querySelector("#para").innerHTML.replace(/\s/gi, "").split("");
	speechToText = "";
	interimTranscript = "";
	//alert(document.querySelector("#para").innerText);
});

// 음성인식이 끝나면 자동으로 재시작합니다.
// recognition.addEventListener("end", recognition.start);

// 음성 인식 시작
//recognition.start();
var next = document.getElementById('next');
var btn01 = document.getElementById('btn01');
var record = document.getElementById('record');
var idx = 0;

$('#save').hide();
$('#scoreBox').hide();
$('#score').hide();
$('.words').hide();
recognition.start();

$(document).ready(function(){

	/* 단어넣기 */
	$("#sentence").html($("input[name=ew_content]:eq(0)").val());
	
	$('#next').click(function() {
		
		var sentence = $('#sentence').text().replace(/\s/gi, "").split("");
		//var voice = para.split("");
		var score = 0;
		//alert('sentence: ' + sentence);
		//alert('voice: ' + para);
	
		for (var i = 0; i < sentence.length; i++) {
			if (para[i] == null) {
				break;
			}
			else if (sentence[i] == para[i]) {
				score++;
			}
		}
		var total = Math.ceril(score / (sentence.length) * 10);
		//alert(sentence.length);
		//alert(score);
		//alert(total);
		$('#scoreBox').show();
		$('#score').text(total);
		$('#score').show();
		
		recognition.stop();
		document.querySelector("#para").innerHTML = "";
		
		setTimeout(function(){
			$('#save').hide();
			$('#scoreBox').hide();
			$('#score').hide();
			//$('#wavedisplay').hide();
			idx++;
			$("#sentence").html($("input[name=ew_content]:eq(" + idx + ")").val());
			if(idx > $("input[name=ew_content]").length){
				/*$('#box').hide();
				$('#thumbnails')
					.append('<p style="text-align:center; padding-top:20%; font-weight:bold; font-size:x-large">모든 학습을 마쳤습니다. 다음 단원으로 넘어가세요.</p>');*/
				setTimeout(function(){
					location.href = 'eduDetail.do?edu_grade=' + $('#edu_grade').val();
				}, 1500);
						
			}
		}, 2000);
		
	});

});
















